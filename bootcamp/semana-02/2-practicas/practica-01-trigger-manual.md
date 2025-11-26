# 💻 Práctica 01: Trigger Manual Avanzado

![Práctica](https://img.shields.io/badge/Práctica-01-FF6D5A?style=flat-square)
![Dificultad](https://img.shields.io/badge/Dificultad-⭐-00D4FF?style=flat-square)
![Tiempo](https://img.shields.io/badge/Tiempo-25_min-00A86B?style=flat-square)

---

## 🎯 Objetivos

Al completar esta práctica, serás capaz de:

- Configurar el Manual Trigger con parámetros personalizados
- Usar datos de entrada para testing
- Pasar datos del trigger a nodos posteriores
- Entender el flujo de datos desde el inicio

---

## 📋 Requisitos Previos

- [ ] n8n instalado y funcionando (Semana 01)
- [ ] Conocimiento básico de la interfaz de n8n
- [ ] Haber leído el módulo teórico de Triggers

---

## 📚 Contexto

El **Manual Trigger** es más poderoso de lo que parece. Aunque su uso principal es para desarrollo y testing, puede configurarse con parámetros de entrada que simulan datos reales, permitiendo probar workflows sin necesidad de activar triggers externos.

---

## 🔨 Ejercicio

### Escenario

Crearás un workflow que procesa información de usuarios. Usarás el Manual Trigger para simular diferentes tipos de datos de entrada y ver cómo fluyen a través del workflow.

### Paso 1: Crear Nuevo Workflow

1. Abre n8n en tu navegador
2. Haz clic en **"New Workflow"** o usa el atajo `Ctrl/Cmd + N`
3. Nombra el workflow: `practica-01-trigger-manual-avanzado`

### Paso 2: Agregar Manual Trigger

1. Haz clic en el botón **"+"** en el canvas
2. Busca **"Manual Trigger"** y selecciónalo
3. El nodo aparecerá en el canvas

```
┌─────────────────────────────────────────────────────────────────┐
│                    MANUAL TRIGGER                                │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│   ┌──────────────────┐                                          │
│   │  🎯 Manual       │                                          │
│   │     Trigger      │                                          │
│   │                  │                                          │
│   │  "When clicking  │                                          │
│   │   Test workflow" │                                          │
│   └──────────────────┘                                          │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Paso 3: Agregar Nodo Set para Procesar Datos

1. Desde el Manual Trigger, arrastra una conexión o haz clic en **"+"**
2. Busca **"Edit Fields (Set)"** y agrégalo
3. Renombra el nodo a: `Preparar Datos Usuario`

4. Configura el nodo Set:
   - Haz clic en **"Add Field"**
   - Agrega los siguientes campos:

| Campo        | Tipo    | Valor                                    |
| ------------ | ------- | ---------------------------------------- |
| `userId`     | Number  | `{{ Math.floor(Math.random() * 1000) }}` |
| `fullName`   | String  | `Usuario de Prueba`                      |
| `email`      | String  | `test@ejemplo.com`                       |
| `createdAt`  | String  | `{{ $now.toISO() }}`                     |
| `isTestMode` | Boolean | `true`                                   |

### Paso 4: Agregar Nodo IF para Validación

1. Conecta un nuevo nodo desde "Preparar Datos Usuario"
2. Busca **"IF"** y agrégalo
3. Renombra a: `Validar Email`

4. Configura la condición:
   - **Value 1**: `{{ $json.email }}`
   - **Operation**: `Contains`
   - **Value 2**: `@`

```
┌─────────────────────────────────────────────────────────────────┐
│                    FLUJO DEL WORKFLOW                            │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌────────────┐   ┌──────────────┐   ┌──────────────┐           │
│  │  Manual    │──►│   Preparar   │──►│   Validar    │           │
│  │  Trigger   │   │    Datos     │   │    Email     │           │
│  └────────────┘   └──────────────┘   └──────┬───────┘           │
│                                              │                   │
│                                    ┌─────────┴─────────┐        │
│                                    │                   │        │
│                                    ▼                   ▼        │
│                              ┌──────────┐       ┌──────────┐   │
│                              │   True   │       │   False  │   │
│                              │  (válido)│       │(inválido)│   │
│                              └──────────┘       └──────────┘   │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Paso 5: Agregar Nodos de Resultado

1. **Rama True** (email válido):

   - Agrega un nodo **"Edit Fields (Set)"**
   - Renómbralo a: `Email Válido`
   - Agrega campo `status` = `valid`
   - Agrega campo `message` = `Email validado correctamente`

2. **Rama False** (email inválido):
   - Agrega un nodo **"Edit Fields (Set)"**
   - Renómbralo a: `Email Inválido`
   - Agrega campo `status` = `invalid`
   - Agrega campo `message` = `El email no tiene formato válido`

### Paso 6: Ejecutar y Analizar

1. Haz clic en **"Test Workflow"** (o `Ctrl/Cmd + Enter`)
2. Observa cómo los datos fluyen por cada nodo
3. Haz clic en cada nodo para ver los datos de entrada y salida

---

## 🧪 Experimentos Adicionales

### Experimento 1: Cambiar Datos de Entrada

Modifica el nodo "Preparar Datos Usuario":

1. Cambia el email a: `usuariosinArroba`
2. Ejecuta de nuevo el workflow
3. Verifica que ahora toma la rama False

### Experimento 2: Usar Pinned Data

1. Ejecuta el workflow una vez
2. En el Manual Trigger, haz clic en los datos de salida
3. Haz clic en **"Pin Data"**
4. Modifica los datos manualmente:

```json
[
  {
    "json": {
      "testCase": "usuario_premium",
      "priority": "high"
    }
  }
]
```

5. Ejecuta de nuevo y observa cómo se usan los datos fijados

### Experimento 3: Múltiples Items

En el Manual Trigger con Pinned Data, prueba con múltiples items:

```json
[
  {
    "json": {
      "name": "Usuario 1",
      "email": "user1@test.com"
    }
  },
  {
    "json": {
      "name": "Usuario 2",
      "email": "invalido"
    }
  },
  {
    "json": {
      "name": "Usuario 3",
      "email": "user3@test.com"
    }
  }
]
```

Observa cómo cada item se procesa independientemente.

---

## ✅ Criterios de Éxito

Tu práctica está completa cuando:

- [ ] El workflow tiene Manual Trigger configurado
- [ ] Los datos fluyen correctamente a través de Set Node
- [ ] El nodo IF valida correctamente el email
- [ ] Las ramas True/False funcionan según lo esperado
- [ ] Puedes usar Pinned Data para probar diferentes escenarios
- [ ] Entiendes cómo inspeccionar datos en cada nodo

---

## 🎯 Workflow Final

```
┌─────────────────────────────────────────────────────────────────┐
│           WORKFLOW: practica-01-trigger-manual-avanzado          │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌────────────────┐                                              │
│  │ 🎯 Manual      │                                              │
│  │    Trigger     │                                              │
│  └───────┬────────┘                                              │
│          │                                                       │
│          ▼                                                       │
│  ┌────────────────┐                                              │
│  │ 📝 Preparar    │                                              │
│  │    Datos       │                                              │
│  │    Usuario     │                                              │
│  └───────┬────────┘                                              │
│          │                                                       │
│          ▼                                                       │
│  ┌────────────────┐                                              │
│  │ ❓ Validar     │                                              │
│  │    Email       │                                              │
│  └───────┬────────┘                                              │
│          │                                                       │
│    ┌─────┴─────┐                                                 │
│    │           │                                                 │
│    ▼           ▼                                                 │
│  ┌──────┐   ┌──────┐                                            │
│  │ ✅   │   │ ❌   │                                            │
│  │Email │   │Email │                                            │
│  │Válido│   │Inválido│                                          │
│  └──────┘   └──────┘                                            │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 💡 Tips y Mejores Prácticas

1. **Nombra descriptivamente**: Siempre renombra los nodos para que sea claro qué hacen
2. **Usa Pinned Data**: Es tu mejor amigo para testing rápido
3. **Inspecciona cada paso**: Haz clic en cada nodo después de ejecutar para ver los datos
4. **Guarda frecuentemente**: Usa `Ctrl/Cmd + S` para guardar tu progreso

---

## 🔗 Recursos

- 📖 [Documentación Manual Trigger](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.manualworkflowtrigger/)
- 📖 [Documentación Set Node](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.set/)
- 📖 [Documentación IF Node](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.if/)

---

## 🏠 Navegación

| ⬅️ Anterior            | 💻 Práctica Actual      | ➡️ Siguiente                                             |
| ---------------------- | ----------------------- | -------------------------------------------------------- |
| [Teoría](../1-teoria/) | **01 - Trigger Manual** | [02 - Schedule Trigger](practica-02-schedule-trigger.md) |
