# 💻 Práctica 05: Workflow con Datos JSON

![n8n](https://img.shields.io/badge/n8n-JSON_Data-FF6D5A?style=flat-square&logo=n8n)
![Dificultad](https://img.shields.io/badge/Dificultad-⭐⭐-FFA500?style=flat-square)
![Tiempo](https://img.shields.io/badge/Tiempo-35_min-00D4FF?style=flat-square)

---

## 📋 Información General

| Campo | Valor |
|-------|-------|
| **Dificultad** | ⭐⭐ Principiante-Intermedio |
| **Tiempo estimado** | 35 minutos |
| **Conceptos** | JSON, Expresiones, Acceso a datos, Items |
| **Prerrequisitos** | Práctica 04 completada |

---

## 🎯 Objetivos

Al completar esta práctica, serás capaz de:

- [ ] Trabajar con datos JSON en n8n
- [ ] Usar expresiones para acceder a datos
- [ ] Entender el concepto de items
- [ ] Transformar datos entre nodos
- [ ] Usar el panel de Output para debug

---

## 📝 Descripción

En esta práctica trabajarás con datos JSON más complejos. Aprenderás a acceder a propiedades específicas usando expresiones y a transformar datos de un nodo a otro.

---

## 🔧 Requisitos Técnicos

- n8n corriendo localmente
- Navegador web
- Workflow de práctica anterior (opcional)

---

## 📋 Instrucciones

### Paso 1: Crear un nuevo workflow

1. Crea un nuevo workflow llamado **"Procesar Usuarios"**
2. Agrega un nodo **Manual Trigger**

---

### Paso 2: Crear datos de prueba con Code node

1. Agrega un nodo después del Manual Trigger
2. Busca **"Code"** y agrégalo
3. Renómbralo a **"Datos de Usuarios"**
4. Configura el código:

```javascript
/**
 * Generar datos de usuarios de prueba
 * 
 * Qué hace: Crea un array de usuarios ficticios
 * Para qué: Simular datos de entrada para el workflow
 * Cómo: Retorna objetos JSON con información de usuarios
 */

// Definimos nuestros usuarios de prueba
const usuarios = [
  {
    id: 1,
    nombre: "María García",
    email: "maria@example.com",
    edad: 28,
    activo: true,
    departamento: "Ventas"
  },
  {
    id: 2,
    nombre: "Carlos López",
    email: "carlos@example.com",
    edad: 35,
    activo: true,
    departamento: "Desarrollo"
  },
  {
    id: 3,
    nombre: "Ana Martínez",
    email: "ana@example.com",
    edad: 42,
    activo: false,
    departamento: "RRHH"
  }
];

// Retornamos los usuarios como items individuales
return usuarios.map(usuario => ({
  json: usuario
}));
```

> 📝 **Nota**: El nodo Code permite escribir JavaScript. Cada elemento del array se convierte en un "item" que fluye por el workflow.

---

### Paso 3: Ejecutar y ver los datos

1. Guarda el workflow
2. Haz clic en **Execute Workflow**
3. Haz clic en el nodo **"Datos de Usuarios"**
4. Ve a la pestaña **Output**

Deberías ver 3 items:

```
┌─────────────────────────────────────────────────────────────────┐
│  Output                                     Items: 3            │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  Item 0:                                                         │
│  {                                                               │
│    "id": 1,                                                      │
│    "nombre": "María García",                                     │
│    "email": "maria@example.com",                                 │
│    "edad": 28,                                                   │
│    "activo": true,                                               │
│    "departamento": "Ventas"                                      │
│  }                                                               │
│                                                                  │
│  Item 1:                                                         │
│  { ... Carlos ... }                                              │
│                                                                  │
│  Item 2:                                                         │
│  { ... Ana ... }                                                 │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

### Paso 4: Agregar nodo Set con expresiones

1. Agrega un nodo **"Edit Fields (Set)"** después del Code
2. Renómbralo a **"Transformar Usuario"**
3. Configura los siguientes campos:

#### Campo 1: Nombre completo (usando expresión)

1. Haz clic en **"Add Field"** → **"String"**
2. **Name**: `nombre_completo`
3. En **Value**, haz clic en el icono de **"Expression"** (fx)
4. Escribe: `{{ $json.nombre }}`

#### Campo 2: Email en mayúsculas

1. Agrega otro campo String
2. **Name**: `email_upper`
3. Activa Expression y escribe: `{{ $json.email.toUpperCase() }}`

#### Campo 3: Es mayor de 30

1. Agrega un campo **"Boolean"**
2. **Name**: `es_mayor_30`
3. Activa Expression y escribe: `{{ $json.edad > 30 }}`

#### Campo 4: Mensaje personalizado

1. Agrega un campo String
2. **Name**: `mensaje`
3. Activa Expression y escribe:
   ```
   {{ "Hola " + $json.nombre + " del departamento " + $json.departamento }}
   ```

```
┌─────────────────────────────────────────────────────────────────┐
│  Transformar Usuario                                             │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  Mode: Manual Mapping (Keep All Existing Fields)                │
│                                                                  │
│  Fields to Set:                                                  │
│                                                                  │
│  📝 nombre_completo: {{ $json.nombre }}                         │
│  📝 email_upper: {{ $json.email.toUpperCase() }}                │
│  ✅ es_mayor_30: {{ $json.edad > 30 }}                          │
│  📝 mensaje: {{ "Hola " + $json.nombre + " del..." }}           │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

### Paso 5: Entender las expresiones

Las expresiones en n8n usan la sintaxis `{{ }}`:

| Expresión | Descripción | Resultado (María) |
|-----------|-------------|-------------------|
| `{{ $json.nombre }}` | Accede a la propiedad "nombre" | "María García" |
| `{{ $json.edad }}` | Accede a la propiedad "edad" | 28 |
| `{{ $json.edad > 30 }}` | Comparación | false |
| `{{ $json.email.toUpperCase() }}` | Método JavaScript | "MARIA@EXAMPLE.COM" |
| `{{ "Hola " + $json.nombre }}` | Concatenación | "Hola María García" |

---

### Paso 6: Ejecutar y verificar transformación

1. Guarda el workflow
2. Ejecuta el workflow
3. Haz clic en **"Transformar Usuario"**
4. Verifica el Output:

Para el primer item (María):

```json
{
  "id": 1,
  "nombre": "María García",
  "email": "maria@example.com",
  "edad": 28,
  "activo": true,
  "departamento": "Ventas",
  "nombre_completo": "María García",
  "email_upper": "MARIA@EXAMPLE.COM",
  "es_mayor_30": false,
  "mensaje": "Hola María García del departamento Ventas"
}
```

---

### Paso 7: Agregar nodo IF para filtrar

1. Agrega un nodo **"IF"** después del Set
2. Renómbralo a **"¿Usuario Activo?"**
3. Configura la condición:
   - **Value 1**: `{{ $json.activo }}` (Expression)
   - **Operation**: `is true`

```
┌─────────────────────────────────────────────────────────────────┐
│  ¿Usuario Activo?                                                │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  Conditions:                                                     │
│                                                                  │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │  Value 1: {{ $json.activo }}                             │   │
│  │  Operation: is true                                      │   │
│  └─────────────────────────────────────────────────────────┘   │
│                                                                  │
│  ┌─────────┐                     ┌─────────┐                   │
│  │ ✅ True │                     │ ❌ False│                   │
│  └─────────┘                     └─────────┘                   │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

### Paso 8: Agregar nodos para cada rama

1. Desde la salida **True** del IF:
   - Agrega un nodo **Set** llamado **"Usuario Activo"**
   - Agrega un campo: `status` = `"Procesado - Activo"`

2. Desde la salida **False** del IF:
   - Agrega un nodo **Set** llamado **"Usuario Inactivo"**
   - Agrega un campo: `status` = `"Procesado - Inactivo"`

El workflow final:

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                  │
│   ┌──────────┐   ┌──────────┐   ┌──────────┐   ┌──────────┐    │
│   │⚡Manual  │──▶│💻 Datos  │──▶│📝Transform│──▶│❓IF      │    │
│   │ Trigger  │   │ Usuarios │   │ Usuario   │   │ Activo?  │    │
│   └──────────┘   └──────────┘   └──────────┘   └────┬─────┘    │
│                                                      │          │
│                                        ┌─────────────┴────────┐ │
│                                        │                      │ │
│                                        ▼                      ▼ │
│                                 ┌──────────┐          ┌──────────┐
│                                 │📝Usuario │          │📝Usuario │
│                                 │  Activo  │          │ Inactivo │
│                                 └──────────┘          └──────────┘
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

### Paso 9: Ejecutar el workflow completo

1. Guarda el workflow
2. Ejecuta el workflow
3. Observa los resultados:
   - **Usuario Activo**: 2 items (María y Carlos)
   - **Usuario Inactivo**: 1 item (Ana)

---

### Paso 10: Explorar el panel de datos

Haz clic en cada nodo y explora:

1. **Input**: Datos que recibe el nodo
2. **Output**: Datos que produce el nodo
3. **Schema**: Estructura de los datos

```
┌─────────────────────────────────────────────────────────────────┐
│  Tabs: [Parameters] [Input] [Output] [Schema]                   │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  Schema (estructura detectada):                                  │
│                                                                  │
│  ├── id (number)                                                │
│  ├── nombre (string)                                            │
│  ├── email (string)                                             │
│  ├── edad (number)                                              │
│  ├── activo (boolean)                                           │
│  ├── departamento (string)                                      │
│  ├── nombre_completo (string)                                   │
│  ├── email_upper (string)                                       │
│  ├── es_mayor_30 (boolean)                                      │
│  └── mensaje (string)                                           │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 🎨 Resultado Esperado

Al finalizar esta práctica:

1. ✅ Workflow "Procesar Usuarios" creado
2. ✅ 3 usuarios generados en Code node
3. ✅ Datos transformados con expresiones
4. ✅ Usuarios filtrados por estado activo
5. ✅ 2 ramas de salida funcionando

**Flujo de datos:**
- 3 items entran → Transformados → Filtrados → 2 activos + 1 inactivo

---

## 💡 Pistas

<details>
<summary>Pista 1: Error en expresión</summary>

Asegúrate de:
- Usar `{{ }}` para las expresiones
- Verificar que el nombre de la propiedad es exacto (case-sensitive)
- Que el nodo anterior tiene los datos esperados

</details>

<details>
<summary>Pista 2: El IF no filtra correctamente</summary>

Verifica que:
- El campo `activo` existe en los datos
- La condición usa Expression mode
- `$json.activo` retorna true/false (boolean)

</details>

<details>
<summary>Pista 3: Code node da error</summary>

Verifica:
- La sintaxis JavaScript es correcta
- El return está devolviendo un array de `{json: ...}`
- No hay errores de sintaxis (comas, llaves)

</details>

---

## ✅ Criterios de Evaluación

| Criterio | Puntos |
|----------|--------|
| Code node genera 3 usuarios | 1 |
| Set node usa expresiones correctamente | 2 |
| IF node filtra por activo | 2 |
| Ambas ramas tienen output correcto | 1 |
| **Total** | **6** |

---

## 🚀 Desafío Extra (Opcional)

1. **Agrega más usuarios** en el Code node (al menos 5)
2. **Crea otra condición IF** que filtre por edad > 30
3. **Usa el nodo Merge** para combinar los resultados de ambas ramas
4. **Agrega un campo calculado** que muestre "Junior" o "Senior" según la edad

---

## 📚 Recursos Relacionados

- [n8n Expressions](https://docs.n8n.io/code/expressions/)
- [JavaScript in n8n](https://docs.n8n.io/code/javascript/)
- [IF Node](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.if/)
- [Working with JSON](https://docs.n8n.io/data/data-structure/)

---

<div align="center">

| ◀️ Anterior | 🏠 Volver | ▶️ Ir al Proyecto |
|-------------|-----------|-------------------|
| [Práctica 04](practica-04-primer-workflow.md) | [Índice Prácticas](README.md) | [Proyecto Integrador](../3-proyecto/README.md) |

</div>
