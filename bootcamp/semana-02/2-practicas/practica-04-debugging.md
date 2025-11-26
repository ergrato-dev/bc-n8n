# 💻 Práctica 04: Debugging de Workflows

![Práctica](https://img.shields.io/badge/Práctica-04-FF6D5A?style=flat-square)
![Dificultad](https://img.shields.io/badge/Dificultad-⭐⭐-00D4FF?style=flat-square)
![Tiempo](https://img.shields.io/badge/Tiempo-30_min-00A86B?style=flat-square)

---

## 🎯 Objetivos

Al completar esta práctica, serás capaz de:

- Identificar y diagnosticar errores en workflows
- Usar las herramientas de debugging de n8n
- Aplicar estrategias sistemáticas de resolución de problemas
- Interpretar mensajes de error correctamente

---

## 📋 Requisitos Previos

- [ ] Prácticas anteriores completadas
- [ ] Haber leído el módulo teórico de Debugging

---

## 📚 Contexto

El debugging es una habilidad esencial. En esta práctica trabajarás con un workflow intencionalmente roto y lo repararás usando las técnicas aprendidas.

---

## 🔨 Ejercicio

### Escenario

Se te proporciona un workflow con varios errores. Tu tarea es identificarlos y corregirlos usando las herramientas de debugging de n8n.

### Paso 1: Crear el Workflow con Errores

Crea un nuevo workflow llamado `practica-04-debugging` y configura los siguientes nodos **exactamente como se indica** (con errores incluidos):

#### Nodo 1: Manual Trigger

- Agregar Manual Trigger (sin configuración especial)

#### Nodo 2: Set Node "Datos Usuario"

- Conectar desde Manual Trigger
- Nombre: `Datos Usuario`
- Campos a agregar:

| Campo    | Tipo    | Valor              |
| -------- | ------- | ------------------ |
| `name`   | String  | `Juan Pérez`       |
| `email`  | String  | `juan@ejemplo.com` |
| `age`    | Number  | `25`               |
| `active` | Boolean | `true`             |

#### Nodo 3: Set Node "Procesar Datos" (CON ERROR)

- Conectar desde "Datos Usuario"
- Nombre: `Procesar Datos`
- Campos:

| Campo         | Tipo    | Valor (⚠️ CON ERROR)              |
| ------------- | ------- | --------------------------------- |
| `fullName`    | String  | `{{ $json.nombre }}`              |
| `emailDomain` | String  | `{{ $json.email.split('@')[1] }}` |
| `isAdult`     | Boolean | `{{ $json.age >= 18 }}`           |

> ⚠️ **Error intencional**: `$json.nombre` no existe, debería ser `$json.name`

#### Nodo 4: IF Node "Verificar Adulto" (CON ERROR)

- Conectar desde "Procesar Datos"
- Nombre: `Verificar Adulto`
- Condición:
  - Value 1: `{{ $json.isAdult }}`
  - Operation: `Equal`
  - Value 2: `true` (como string, no boolean)

> ⚠️ **Error intencional**: Comparando boolean con string

#### Nodo 5: Set Node "Usuario Adulto"

- Conectar desde rama True de "Verificar Adulto"
- Nombre: `Usuario Adulto`
- Campo: `status` = `Verificado como adulto`

#### Nodo 6: Set Node "Usuario Menor"

- Conectar desde rama False de "Verificar Adulto"
- Nombre: `Usuario Menor`
- Campo: `status` = `Requiere verificación parental`

---

## 🔍 Fase de Debugging

### Paso 2: Ejecutar y Observar Errores

1. Guarda el workflow
2. Haz clic en **"Test Workflow"**
3. Observa qué sucede - probablemente verás errores

### Paso 3: Analizar el Primer Error

```
┌─────────────────────────────────────────────────────────────────┐
│              PROCESO DE DEBUGGING                                │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  1. IDENTIFICAR: ¿En qué nodo ocurre el error?                  │
│     └── El nodo con error tendrá un indicador rojo              │
│                                                                  │
│  2. LEER: ¿Qué dice el mensaje de error?                        │
│     └── Haz clic en el nodo para ver detalles                   │
│                                                                  │
│  3. INSPECCIONAR: ¿Qué datos llegaron al nodo?                  │
│     └── Revisa el Input del nodo                                │
│                                                                  │
│  4. COMPARAR: ¿Qué esperaba el nodo vs qué recibió?             │
│     └── Compara la expresión con los datos reales               │
│                                                                  │
│  5. CORREGIR: Arregla el problema identificado                  │
│                                                                  │
│  6. VERIFICAR: Ejecuta de nuevo y confirma                      │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Paso 4: Debugging del Error 1 - Campo Inexistente

**Síntoma**: El nodo "Procesar Datos" falla o produce `undefined`

**Investigación**:

1. Haz clic en el nodo "Datos Usuario"
2. Ve a la pestaña **Output**
3. Observa los campos disponibles:

```json
{
  "name": "Juan Pérez", // ✅ Este es el campo correcto
  "email": "juan@ejemplo.com",
  "age": 25,
  "active": true
}
```

4. Ahora ve al nodo "Procesar Datos"
5. Observa que usa `$json.nombre` pero el campo se llama `name`

**Corrección**:

1. Edita el nodo "Procesar Datos"
2. Cambia `{{ $json.nombre }}` por `{{ $json.name }}`
3. Guarda y ejecuta de nuevo

### Paso 5: Debugging del Error 2 - Comparación de Tipos

**Síntoma**: El IF siempre va a la rama incorrecta

**Investigación**:

1. Ejecuta hasta el nodo "Procesar Datos"
2. Observa el output - `isAdult` es un boolean (`true` o `false`)
3. En el IF, estás comparando:
   - `$json.isAdult` (boolean: `true`)
   - Con `"true"` (string)
   - Boolean `true` ≠ String `"true"`

**Corrección**:

1. Edita el nodo "Verificar Adulto"
2. Cambia la condición a:
   - Value 1: `{{ $json.isAdult }}`
   - Operation: `Is True`
   - (Sin Value 2 necesario)

O alternativamente:

- Value 1: `{{ $json.isAdult }}`
- Operation: `Equal`
- Value 2: `{{ true }}` (como expresión, no string)

---

## 🧪 Ejercicio Adicional: Crear y Reparar

### Crear Errores Adicionales

Intenta introducir estos errores y luego repáralos:

#### Error 3: Array Index Out of Bounds

En "Procesar Datos", cambia `emailDomain` a:

```
{{ $json.email.split('@')[5] }}
```

- ¿Qué error produce?
- ¿Cómo lo identificas?
- ¿Cómo lo corriges?

#### Error 4: Referencia a Nodo Anterior Incorrecto

Agrega un nuevo nodo Set que intente acceder a:

```
{{ $('NodoQueNoExiste').item.json.campo }}
```

- ¿Qué error produce?
- ¿Cómo lo identificas?

#### Error 5: División por Cero

En un nuevo campo, intenta:

```
{{ 100 / $json.someValue }}
```

donde `someValue` no existe (será undefined/0)

---

## 📊 Herramientas de Debugging a Practicar

### Herramienta 1: Vista de Input/Output

```
┌─────────────────────────────────────────────────────────────────┐
│  Para cada nodo, practica:                                       │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  1. Ver INPUT: ¿Qué datos llegan al nodo?                       │
│     - Clic en el nodo → Panel derecho → Tab "Input"             │
│                                                                  │
│  2. Ver OUTPUT: ¿Qué datos produce el nodo?                     │
│     - Clic en el nodo → Panel derecho → Tab "Output"            │
│                                                                  │
│  3. Comparar INPUT vs OUTPUT                                    │
│     - ¿Se transformaron los datos como esperabas?               │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Herramienta 2: Vistas de Datos

Practica cambiar entre vistas para el mismo nodo:

| Vista  | Útil para                                     |
| ------ | --------------------------------------------- |
| Table  | Ver datos tabulares, comparar múltiples items |
| JSON   | Ver estructura exacta, copiar datos           |
| Schema | Ver tipos de datos, campos disponibles        |

### Herramienta 3: Ejecución Parcial

1. Haz clic derecho en un nodo intermedio
2. Selecciona **"Execute up to this node"**
3. Analiza los datos hasta ese punto
4. Continúa con el siguiente nodo

### Herramienta 4: Pinned Data

1. Ejecuta el workflow una vez
2. En el primer nodo (después del trigger), haz clic en Output
3. Haz clic en **"Pin Data"**
4. Ahora puedes modificar esos datos para probar diferentes escenarios
5. Ejecuta de nuevo - usará los datos pinned

---

## ✅ Criterios de Éxito

Tu práctica está completa cuando:

- [ ] Identificaste el error de `$json.nombre` vs `$json.name`
- [ ] Corregiste la comparación de tipos en el IF
- [ ] El workflow se ejecuta completamente sin errores
- [ ] Puedes explicar cómo encontraste cada error
- [ ] Sabes usar las vistas Table, JSON y Schema
- [ ] Has practicado la ejecución parcial

---

## 🔄 Workflow Corregido

```
┌─────────────────────────────────────────────────────────────────┐
│           WORKFLOW CORREGIDO                                     │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌────────────────┐                                              │
│  │ 🎯 Manual      │                                              │
│  │    Trigger     │                                              │
│  └───────┬────────┘                                              │
│          │                                                       │
│          ▼                                                       │
│  ┌────────────────┐                                              │
│  │ 📝 Datos       │  name, email, age, active                   │
│  │    Usuario     │                                              │
│  └───────┬────────┘                                              │
│          │                                                       │
│          ▼                                                       │
│  ┌────────────────┐                                              │
│  │ 📝 Procesar    │  ✅ $json.name (no .nombre)                 │
│  │    Datos       │                                              │
│  └───────┬────────┘                                              │
│          │                                                       │
│          ▼                                                       │
│  ┌────────────────┐                                              │
│  │ ❓ Verificar   │  ✅ Is True (no Equal "true")               │
│  │    Adulto      │                                              │
│  └───────┬────────┘                                              │
│          │                                                       │
│    ┌─────┴─────┐                                                 │
│    │           │                                                 │
│    ▼           ▼                                                 │
│  ┌──────┐   ┌──────┐                                            │
│  │ ✅   │   │ 👶   │                                            │
│  │Adulto│   │Menor │                                            │
│  └──────┘   └──────┘                                            │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 💡 Tips de Debugging

### Checklist Rápido de Debugging

```
□ ¿El nodo anterior produce los datos esperados?
□ ¿Los nombres de campo coinciden exactamente? (case-sensitive)
□ ¿Los tipos de datos son los esperados?
□ ¿La expresión está bien escrita? ({{ }})
□ ¿Estás accediendo al item correcto?
□ ¿El nodo referenciado existe?
```

### Errores Más Comunes

| Error                                   | Causa Probable                              | Solución                 |
| --------------------------------------- | ------------------------------------------- | ------------------------ |
| `Cannot read property 'X' of undefined` | El campo padre no existe                    | Verificar ruta del campo |
| `X is not a function`                   | Intentando llamar método en tipo incorrecto | Verificar tipo de dato   |
| `Invalid expression`                    | Sintaxis incorrecta                         | Revisar `{{ }}`          |
| `No input data`                         | Nodo anterior no produjo datos              | Verificar flujo          |

---

## 🔗 Recursos

- 📖 [n8n Troubleshooting](https://docs.n8n.io/workflows/troubleshooting/)
- 📖 [Expresiones en n8n](https://docs.n8n.io/code/expressions/)
- 📖 [Comunidad n8n - Troubleshooting](https://community.n8n.io/c/troubleshooting/12)

---

## 🏠 Navegación

| ⬅️ Anterior                                          | 💻 Práctica Actual | ➡️ Siguiente                                       |
| ---------------------------------------------------- | ------------------ | -------------------------------------------------- |
| [03 - Webhook Básico](practica-03-webhook-basico.md) | **04 - Debugging** | [05 - Multi-Trigger](practica-05-multi-trigger.md) |
