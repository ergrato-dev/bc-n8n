# 💻 Práctica 03: Explorar la Interfaz de n8n

![n8n](https://img.shields.io/badge/n8n-Interface-FF6D5A?style=flat-square&logo=n8n)
![Dificultad](https://img.shields.io/badge/Dificultad-⭐-00A86B?style=flat-square)
![Tiempo](https://img.shields.io/badge/Tiempo-25_min-00D4FF?style=flat-square)

---

## 📋 Información General

| Campo | Valor |
|-------|-------|
| **Dificultad** | ⭐ Principiante |
| **Tiempo estimado** | 25 minutos |
| **Conceptos** | UI, Navegación, Editor de Workflows |
| **Prerrequisitos** | Práctica 02 completada (n8n corriendo) |

---

## 🎯 Objetivos

Al completar esta práctica, serás capaz de:

- [ ] Identificar las secciones principales de la interfaz
- [ ] Navegar entre las diferentes vistas de n8n
- [ ] Conocer el editor de workflows
- [ ] Explorar las configuraciones disponibles

---

## 📝 Descripción

En esta práctica explorarás a fondo la interfaz de n8n. Conocer bien la UI te permitirá trabajar más eficientemente durante todo el bootcamp.

---

## 🔧 Requisitos Técnicos

- n8n corriendo localmente (Práctica 02)
- Navegador web moderno
- Conexión a http://localhost:5678

---

## 📋 Instrucciones

### Paso 1: Acceder a n8n

1. Abre http://localhost:5678
2. Inicia sesión con tus credenciales
3. Llegarás a la pantalla principal (Home)

---

### Paso 2: Explorar el Sidebar (Barra Lateral)

El sidebar izquierdo es tu centro de navegación:

```
┌──────────────────┐
│                  │
│  🏠 Home         │ ← Pantalla principal
│                  │
│  📁 Workflows    │ ← Lista de todos tus workflows
│                  │
│  📄 Templates    │ ← Plantillas predefinidas
│                  │
│  🔐 Credentials  │ ← Gestión de credenciales
│                  │
│  📊 Executions   │ ← Historial de ejecuciones
│                  │
│  ⚙️ Settings     │ ← Configuraciones
│                  │
└──────────────────┘
```

**Ejercicio**: Haz clic en cada sección y observa qué contiene.

---

### Paso 3: Sección Workflows

Haz clic en **Workflows** en el sidebar:

```
┌─────────────────────────────────────────────────────────────────┐
│  Workflows                              [+ Add Workflow]        │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  🔍 Search workflows...                                          │
│                                                                  │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │  📁 All workflows (0)                                     │   │
│  │                                                           │   │
│  │        No workflows yet                                   │   │
│  │                                                           │   │
│  │   Create your first workflow to get started               │   │
│  │                                                           │   │
│  │        [+ Create Workflow]                                │   │
│  │                                                           │   │
│  └──────────────────────────────────────────────────────────┘   │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

**Funcionalidades:**
- Crear nuevos workflows
- Buscar workflows existentes
- Organizar en carpetas
- Filtrar por estado (activo/inactivo)

---

### Paso 4: Sección Templates

Haz clic en **Templates**:

```
┌─────────────────────────────────────────────────────────────────┐
│  Templates                                                       │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  🔍 Search templates...                                          │
│                                                                  │
│  Categories:                                                     │
│  [All] [Marketing] [Sales] [DevOps] [HR] [Finance] ...          │
│                                                                  │
│  ┌────────────┐  ┌────────────┐  ┌────────────┐                │
│  │ Template 1 │  │ Template 2 │  │ Template 3 │                │
│  │ ⭐ 4.5     │  │ ⭐ 4.8     │  │ ⭐ 4.2     │                │
│  │ [Use]      │  │ [Use]      │  │ [Use]      │                │
│  └────────────┘  └────────────┘  └────────────┘                │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

**Ejercicio**: Explora algunas categorías y mira los templates disponibles. ¡No los uses aún, solo observa!

---

### Paso 5: Sección Credentials

Haz clic en **Credentials**:

```
┌─────────────────────────────────────────────────────────────────┐
│  Credentials                            [+ Add Credential]      │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ℹ️ Credentials are encrypted and stored securely               │
│                                                                  │
│  No credentials yet                                              │
│                                                                  │
│  Add credentials to connect to external services                 │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

**Importante**: Aquí guardarás las credenciales para conectar con servicios externos (Gmail, Slack, APIs, etc.)

---

### Paso 6: Sección Executions

Haz clic en **Executions**:

```
┌─────────────────────────────────────────────────────────────────┐
│  Executions                                                      │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  Filter: [All ▼] [All workflows ▼] [Date range ▼]              │
│                                                                  │
│  No executions yet                                               │
│                                                                  │
│  Run a workflow to see execution history here                    │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

**Funcionalidades:**
- Ver historial de todas las ejecuciones
- Filtrar por workflow, estado, fecha
- Debug de ejecuciones fallidas
- Re-ejecutar workflows

---

### Paso 7: Abrir el Editor de Workflows

1. Haz clic en **"+ Add Workflow"** o **"Create Workflow"**
2. Se abrirá el editor de workflows:

```
┌─────────────────────────────────────────────────────────────────┐
│  ← Back   My workflow ✏️            [Save] [Execute] [Share]    │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│                                                                  │
│                     ┌───────────────────┐                       │
│                     │                   │                       │
│                     │    Click to add   │                       │
│                     │    first step     │                       │
│                     │        +          │                       │
│                     │                   │                       │
│                     └───────────────────┘                       │
│                                                                  │
│                                                                  │
├─────────────────────────────────────────────────────────────────┤
│  [+] Add node                                      Zoom: 100%   │
└─────────────────────────────────────────────────────────────────┘
```

---

### Paso 8: Conocer el Editor de Workflows

#### Barra Superior

```
┌─────────────────────────────────────────────────────────────────┐
│  ← Back │ Workflow Name ✏️ │  [💾 Save] [▶️ Execute] [📤 Share] │
└─────────────────────────────────────────────────────────────────┘
```

| Elemento | Función |
|----------|---------|
| ← Back | Volver a la lista de workflows |
| Nombre ✏️ | Editar nombre del workflow |
| Save | Guardar cambios |
| Execute | Ejecutar el workflow |
| Share | Compartir workflow |

#### Área de Canvas

El área central donde construyes tu workflow:

- **Drag & drop**: Arrastra nodos al canvas
- **Zoom**: Rueda del ratón o controles de zoom
- **Pan**: Click y arrastra el fondo
- **Seleccionar**: Click en nodos
- **Conectar**: Arrastra desde los puntos de conexión

#### Panel de Nodos

Haz clic en **"+"** para ver los nodos disponibles:

```
┌─────────────────────────────────────────────────────────────────┐
│  Add node                                           [×]          │
├─────────────────────────────────────────────────────────────────┤
│  🔍 Search nodes...                                              │
│                                                                  │
│  ⚡ Triggers                                                     │
│     Manual Trigger, Schedule Trigger, Webhook...                │
│                                                                  │
│  🔧 Actions                                                      │
│     HTTP Request, Set, IF, Switch, Code...                      │
│                                                                  │
│  📱 Apps                                                         │
│     Gmail, Slack, Google Sheets, Notion...                      │
│                                                                  │
│  🔄 Flow                                                         │
│     Merge, Split Out, Loop Over Items...                        │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

### Paso 9: Explorar el Panel de Configuración de un Nodo

1. Haz clic en **"+"** en el canvas
2. Busca **"Manual Trigger"** y haz clic para agregarlo
3. Haz clic en el nodo para ver su configuración:

```
┌─────────────────────────────────────────────────────────────────┐
│  Manual Trigger                                     [×]          │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ℹ️ Start workflow manually                                     │
│                                                                  │
│  This node has no parameters to configure.                       │
│  Click "Execute" to run the workflow manually.                   │
│                                                                  │
│                                                                  │
│  [Execute Node]                                                  │
│                                                                  │
├─────────────────────────────────────────────────────────────────┤
│  Tabs: [Parameters] [Settings] [Input] [Output]                 │
└─────────────────────────────────────────────────────────────────┘
```

**Tabs del panel:**
- **Parameters**: Configuración del nodo
- **Settings**: Opciones avanzadas
- **Input**: Datos de entrada (del nodo anterior)
- **Output**: Datos de salida (al siguiente nodo)

---

### Paso 10: Guardar y Cerrar

1. Haz clic en **Save** para guardar el workflow
2. Haz clic en **← Back** para volver a la lista
3. Verifica que tu workflow aparece en la lista

---

## 🎨 Resultado Esperado

Al finalizar esta práctica, deberías:

1. ✅ Conocer las 5 secciones del sidebar
2. ✅ Saber cómo crear un nuevo workflow
3. ✅ Entender el editor de workflows
4. ✅ Conocer cómo agregar nodos
5. ✅ Tener un workflow guardado (aunque vacío)

---

## 💡 Pistas

<details>
<summary>Pista 1: No encuentro el botón de agregar nodo</summary>

Hay varias formas de agregar nodos:
- Clic en el botón **"+"** en el canvas
- Clic derecho en el canvas
- Arrastra desde el punto de conexión de un nodo

</details>

<details>
<summary>Pista 2: El canvas se ve muy pequeño</summary>

Usa la rueda del ratón para hacer zoom, o los controles de zoom en la esquina inferior derecha.

</details>

---

## ✅ Criterios de Evaluación

| Criterio | Puntos |
|----------|--------|
| Exploró todas las secciones del sidebar | 2 |
| Abrió el editor de workflows | 2 |
| Agregó un nodo Manual Trigger | 1 |
| Guardó el workflow | 1 |
| **Total** | **6** |

---

## 🚀 Desafío Extra (Opcional)

1. **Cambia el nombre del workflow** a "Mi Primer Workflow"
2. **Explora los Settings del workflow**:
   - Haz clic en los 3 puntos o engranaje
   - Observa las opciones disponibles
3. **Explora un template**:
   - Ve a Templates
   - Abre uno para ver cómo está estructurado
   - ¡No lo guardes, solo observa!

---

## 📚 Recursos Relacionados

- [n8n Editor UI Guide](https://docs.n8n.io/workflows/components/)
- [Creating Workflows](https://docs.n8n.io/workflows/create/)

---

<div align="center">

| ◀️ Anterior | 🏠 Volver | Siguiente ▶️ |
|-------------|-----------|--------------|
| [Práctica 02](practica-02-levantar-n8n.md) | [Índice Prácticas](README.md) | [Práctica 04: Primer Workflow](practica-04-primer-workflow.md) |

</div>
