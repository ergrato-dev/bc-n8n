# 💻 Práctica 04: Primer Workflow Manual

![n8n](https://img.shields.io/badge/n8n-First_Workflow-FF6D5A?style=flat-square&logo=n8n)
![Dificultad](https://img.shields.io/badge/Dificultad-⭐⭐-FFA500?style=flat-square)
![Tiempo](https://img.shields.io/badge/Tiempo-30_min-00D4FF?style=flat-square)

---

## 📋 Información General

| Campo | Valor |
|-------|-------|
| **Dificultad** | ⭐⭐ Principiante-Intermedio |
| **Tiempo estimado** | 30 minutos |
| **Conceptos** | Nodos, Conexiones, Ejecución, Debug |
| **Prerrequisitos** | Práctica 03 completada |

---

## 🎯 Objetivos

Al completar esta práctica, serás capaz de:

- [ ] Crear un workflow desde cero
- [ ] Usar el nodo Manual Trigger
- [ ] Agregar y conectar nodos
- [ ] Ejecutar un workflow
- [ ] Interpretar los resultados de una ejecución

---

## 📝 Descripción

En esta práctica crearás tu primer workflow funcional que combina varios nodos. Aprenderás el flujo básico de trabajo: trigger → proceso → resultado.

---

## 🔧 Requisitos Técnicos

- n8n corriendo localmente
- Navegador web
- Conocimiento básico de la interfaz (Práctica 03)

---

## 📋 Instrucciones

### Paso 1: Crear un nuevo workflow

1. Abre n8n en http://localhost:5678
2. Ve a **Workflows** en el sidebar
3. Haz clic en **"+ Add Workflow"**
4. Renombra el workflow a: **"Hola n8n"**

---

### Paso 2: Agregar el nodo Manual Trigger

1. Haz clic en el botón **"+"** en el centro del canvas
2. Busca **"Manual Trigger"**
3. Haz clic para agregarlo

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                  │
│                   ┌───────────────────┐                         │
│                   │ ⚡ Manual Trigger │                         │
│                   │                   │                         │
│                   │   Click execute   │                         │
│                   │   to start        │                         │
│                   └─────────●─────────┘                         │
│                             │                                    │
│                             ▼ (punto de conexión)               │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

> 📝 El **Manual Trigger** permite iniciar el workflow manualmente haciendo clic en "Execute".

---

### Paso 3: Agregar un nodo Set

1. Haz clic en el **punto de conexión** (●) del Manual Trigger
2. O haz clic en **"+"** que aparece al lado derecho del nodo
3. Busca **"Edit Fields (Set)"** o simplemente **"Set"**
4. Haz clic para agregarlo

El nodo **Set** se conectará automáticamente:

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                  │
│   ┌───────────────────┐         ┌───────────────────┐          │
│   │ ⚡ Manual Trigger │────────▶│ 📝 Edit Fields    │          │
│   └───────────────────┘         │    (Set)          │          │
│                                 └───────────────────┘          │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

### Paso 4: Configurar el nodo Set

1. Haz clic en el nodo **Edit Fields (Set)** para abrirlo
2. Haz clic en **"Add Field"**
3. Selecciona **"String"**
4. Configura:
   - **Name**: `mensaje`
   - **Value**: `¡Hola desde mi primer workflow!`

5. Agrega otro campo:
   - Haz clic en **"Add Field"** → **"String"**
   - **Name**: `autor`
   - **Value**: `Tu nombre aquí`

6. Agrega un campo numérico:
   - Haz clic en **"Add Field"** → **"Number"**
   - **Name**: `version`
   - **Value**: `1`

```
┌─────────────────────────────────────────────────────────────────┐
│  Edit Fields (Set)                                               │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  Fields to Set:                                                  │
│                                                                  │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │ 📝 mensaje (String)                                      │   │
│  │    Value: ¡Hola desde mi primer workflow!               │   │
│  └─────────────────────────────────────────────────────────┘   │
│                                                                  │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │ 📝 autor (String)                                        │   │
│  │    Value: Tu nombre aquí                                 │   │
│  └─────────────────────────────────────────────────────────┘   │
│                                                                  │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │ 🔢 version (Number)                                      │   │
│  │    Value: 1                                              │   │
│  └─────────────────────────────────────────────────────────┘   │
│                                                                  │
│  [+ Add Field]                                                  │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

### Paso 5: Agregar un segundo nodo Set

1. Desde el nodo Set actual, haz clic en **"+"** para agregar otro nodo
2. Busca **"Edit Fields (Set)"** y agrégalo
3. Configúralo:
   - Haz clic en **"Add Field"** → **"String"**
   - **Name**: `mensaje_procesado`
   - **Value**: `Workflow ejecutado exitosamente`

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                  │
│   ┌─────────────┐     ┌─────────────┐     ┌─────────────┐      │
│   │ ⚡ Manual   │────▶│ 📝 Set      │────▶│ 📝 Set1     │      │
│   │   Trigger   │     │ (datos)     │     │ (procesado) │      │
│   └─────────────┘     └─────────────┘     └─────────────┘      │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

### Paso 6: Renombrar los nodos

Es buena práctica dar nombres descriptivos a los nodos:

1. Haz doble clic en el nombre de cada nodo
2. Renómbralos:
   - "Edit Fields" → **"Crear Datos"**
   - "Edit Fields1" → **"Procesar Resultado"**

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                  │
│   ┌─────────────┐     ┌─────────────┐     ┌─────────────┐      │
│   │ ⚡ Manual   │────▶│ 📝 Crear    │────▶│ 📝 Procesar │      │
│   │   Trigger   │     │   Datos     │     │  Resultado  │      │
│   └─────────────┘     └─────────────┘     └─────────────┘      │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

### Paso 7: Guardar el workflow

1. Haz clic en el botón **"Save"** en la barra superior
2. Verifica que no hay errores

---

### Paso 8: Ejecutar el workflow

1. Haz clic en el botón **"Execute Workflow"** (▶️) en la barra superior
2. Observa cómo los nodos se ejecutan en secuencia
3. Los nodos exitosos muestran un check verde ✅

```
┌─────────────────────────────────────────────────────────────────┐
│                          EJECUTANDO...                           │
│                                                                  │
│   ┌─────────────┐     ┌─────────────┐     ┌─────────────┐      │
│   │ ⚡ Manual   │────▶│ 📝 Crear    │────▶│ 📝 Procesar │      │
│   │   Trigger   │     │   Datos     │     │  Resultado  │      │
│   │     ✅      │     │     ✅      │     │     ✅      │      │
│   └─────────────┘     └─────────────┘     └─────────────┘      │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

### Paso 9: Ver los resultados

1. Haz clic en el nodo **"Crear Datos"**
2. Ve a la pestaña **"Output"**
3. Deberías ver:

```json
{
  "mensaje": "¡Hola desde mi primer workflow!",
  "autor": "Tu nombre aquí",
  "version": 1
}
```

4. Ahora haz clic en **"Procesar Resultado"**
5. En **"Output"** verás los datos combinados:

```json
{
  "mensaje": "¡Hola desde mi primer workflow!",
  "autor": "Tu nombre aquí",
  "version": 1,
  "mensaje_procesado": "Workflow ejecutado exitosamente"
}
```

---

### Paso 10: Ver el historial de ejecuciones

1. Ve a **Executions** en el sidebar
2. Verás tu ejecución listada:

```
┌─────────────────────────────────────────────────────────────────┐
│  Executions                                                      │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ ✅ Hola n8n                                               │   │
│  │    Started: 2024-XX-XX XX:XX:XX                           │   │
│  │    Status: Success                                        │   │
│  │    Duration: 0.05s                                        │   │
│  │                                          [View Details]   │   │
│  └──────────────────────────────────────────────────────────┘   │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 🎨 Resultado Esperado

Al finalizar esta práctica:

1. ✅ Workflow "Hola n8n" creado
2. ✅ 3 nodos conectados: Trigger → Set → Set
3. ✅ Ejecución exitosa
4. ✅ Datos visibles en Output de cada nodo
5. ✅ Ejecución registrada en historial

**Output final esperado:**

```json
[
  {
    "mensaje": "¡Hola desde mi primer workflow!",
    "autor": "Tu nombre aquí",
    "version": 1,
    "mensaje_procesado": "Workflow ejecutado exitosamente"
  }
]
```

---

## 💡 Pistas

<details>
<summary>Pista 1: No veo la opción "Add Field"</summary>

Asegúrate de que:
1. Tienes el nodo Set seleccionado
2. Estás en la pestaña "Parameters"
3. Busca el botón "+ Add Field" debajo de los campos existentes

</details>

<details>
<summary>Pista 2: Los nodos no se conectan</summary>

Arrastra desde el punto de conexión (●) del primer nodo hasta el input del segundo nodo. También puedes usar el botón "+" que aparece al lado del nodo.

</details>

<details>
<summary>Pista 3: Error al ejecutar</summary>

- Verifica que todos los nodos tienen campos configurados
- Revisa que no hay campos vacíos
- Guarda el workflow antes de ejecutar

</details>

---

## ✅ Criterios de Evaluación

| Criterio | Puntos |
|----------|--------|
| Workflow creado con nombre correcto | 1 |
| Manual Trigger agregado | 1 |
| Primer Set configurado con 3 campos | 2 |
| Segundo Set configurado | 1 |
| Ejecución exitosa | 1 |
| **Total** | **6** |

---

## 🚀 Desafío Extra (Opcional)

1. **Agrega un cuarto nodo** que combine los mensajes en uno solo
2. **Usa expresiones**: En el segundo Set, usa la expresión `{{ $json.mensaje }}` para referenciar el campo del nodo anterior
3. **Agrega una nota** al workflow explicando qué hace

---

## 📚 Recursos Relacionados

- [n8n Set Node](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.set/)
- [Manual Trigger](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.manualTrigger/)
- [Working with Data](https://docs.n8n.io/data/)

---

<div align="center">

| ◀️ Anterior | 🏠 Volver | Siguiente ▶️ |
|-------------|-----------|--------------|
| [Práctica 03](practica-03-explorar-interfaz.md) | [Índice Prácticas](README.md) | [Práctica 05: Workflow con Datos](practica-05-workflow-datos.md) |

</div>
