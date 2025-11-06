# Interfaz y Navegación en n8n

## 🎯 Objetivos de Aprendizaje

Al completar este documento, serás capaz de:

1. **Navegar** con confianza por todas las secciones de la interfaz de n8n
2. **Identificar** y usar las herramientas del canvas de workflows
3. **Gestionar** workflows, credenciales y ejecuciones eficientemente
4. **Utilizar** atajos de teclado para trabajar más rápido
5. **Personalizar** la interfaz según tus preferencias
6. **Entender** la anatomía de un workflow en el editor visual

**⏱️ Tiempo estimado:** 25-30 minutos  
**📚 Nivel:** Principiante  
**💻 Prerrequisitos:**

- n8n instalado y corriendo (documento 02)
- Acceso a la interfaz web en `http://localhost:5678`

---

## 📋 Introducción

La interfaz de n8n está diseñada para ser **intuitiva y visual**, permitiendo crear automatizaciones complejas sin escribir código. Dominar la navegación te hará más productivo y te ayudará a aprovechar al máximo todas las funcionalidades.

### Filosofía de Diseño de n8n

- **Visual-first:** Todo se representa gráficamente
- **Drag & drop:** Arrastrar y soltar nodos
- **Feedback inmediato:** Ver resultados en tiempo real
- **Context-aware:** Herramientas relevantes según contexto

---

## 🏠 Vista General: Estructura de la Interfaz

### Anatomía de la Pantalla Principal

```
┌─────────────────────────────────────────────────────────────────┐
│  [Logo] Workflows  Credentials  Executions  [User] [Settings]  │  ← Header
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Sidebar          │                                             │
│  (izquierda)      │         Canvas Principal                    │
│                   │         (área de trabajo)                   │
│  • Templates      │                                             │
│  • Help           │                                             │
│  • Community      │                                             │
│                   │                                             │
│                   │                                             │
├─────────────────────────────────────────────────────────────────┤
│  Status bar: [Saved] [Version] [Last execution: 2 min ago]     │  ← Footer
└─────────────────────────────────────────────────────────────────┘
```

![Anatomía de la interfaz de n8n](../../../assets/diagrams/modulo-01/interfaz-anatomia.svg)

> **💡 Mapa visual completo:** El diagrama muestra las 5 áreas principales de la interfaz. Familiarízate con cada sección para navegar con confianza. Observa el código de colores de los nodos: azul para triggers, naranja para transformaciones, rojo para acciones externas.

---

## 🧭 Sección 1: Header (Barra Superior)

### 1.1 Logo y Menú Principal

**Logo de n8n (esquina superior izquierda):**

- Click → Volver al dashboard principal
- Siempre visible desde cualquier vista

### 1.2 Navegación Principal

#### **Workflows** 📋

- Lista de todos tus workflows
- Crear nuevo workflow: botón `+ New Workflow`
- Buscar workflows: barra de búsqueda
- Filtros rápidos:
  - Activos (running)
  - Inactivos (paused)
  - Mis workflows
  - Compartidos conmigo

**Vista de lista:**

```
┌────────────────────────────────────────────────────┐
│  🔍 Search workflows...                [+ New]     │
├────────────────────────────────────────────────────┤
│  ✅ Marketing Automation        [Active]  [Edit]   │
│     Last run: 5 min ago • 12 executions today      │
├────────────────────────────────────────────────────┤
│  ⏸️  Data Sync                  [Inactive] [Edit]   │
│     Last run: 2 hours ago • 45 executions today    │
├────────────────────────────────────────────────────┤
│  ✅ Email Processor             [Active]  [Edit]   │
│     Last run: Just now • 3 executions today        │
└────────────────────────────────────────────────────┘
```

**Acciones disponibles:**

- **Editar** (lápiz): Abrir en editor
- **Duplicar** (copiar): Crear copia
- **Activar/Desactivar** (toggle): Encender/apagar workflow
- **Eliminar** (papelera): Borrar permanentemente
- **Exportar** (download): Descargar JSON
- **Compartir** (share): Compartir con equipo

#### **Credentials** 🔑

- Gestión centralizada de todas las credenciales
- Tipos disponibles:
  - OAuth2
  - API Key
  - Basic Auth
  - Header Auth
  - JWT
  - Token Auth
  - Custom

**Vista de credenciales:**

```
┌────────────────────────────────────────────────────┐
│  🔍 Search credentials...          [+ Add]         │
├────────────────────────────────────────────────────┤
│  🔑 Google Sheets API                              │
│     Type: OAuth2 • Used in 3 workflows             │
├────────────────────────────────────────────────────┤
│  🔑 Slack Webhook                                  │
│     Type: Webhook • Used in 5 workflows            │
├────────────────────────────────────────────────────┤
│  🔑 PostgreSQL Database                            │
│     Type: Postgres • Used in 2 workflows           │
└────────────────────────────────────────────────────┘
```

**⚠️ Importante:**

- Las credenciales se encriptan automáticamente
- Una credencial puede usarse en múltiples workflows
- Nunca exportes workflows con credenciales embebidas

#### **Executions** 📊

- Historial completo de ejecuciones
- Ver detalles de cada ejecución:
  - Input/Output de cada nodo
  - Tiempo de ejecución
  - Errores y logs
  - Datos procesados

**Vista de ejecuciones:**

```
┌────────────────────────────────────────────────────────────┐
│  Filters: [All] [Success] [Error] [Running] [Waiting]     │
├────────────────────────────────────────────────────────────┤
│  ✅ Marketing Automation                                   │
│     Nov 6, 2025 10:45 AM • Duration: 2.3s • Success       │
├────────────────────────────────────────────────────────────┤
│  ❌ Email Processor                                        │
│     Nov 6, 2025 10:42 AM • Duration: 5.1s • Error         │
│     Error: Connection timeout to SMTP server               │
├────────────────────────────────────────────────────────────┤
│  ✅ Data Sync                                              │
│     Nov 6, 2025 10:40 AM • Duration: 8.7s • Success       │
└────────────────────────────────────────────────────────────┘
```

**Filtros útiles:**

- Por workflow específico
- Por rango de fechas
- Por estado (success/error/running)
- Por modo (manual/trigger/webhook)

### 1.3 Menú de Usuario (esquina superior derecha)

**Click en avatar → Menú desplegable:**

```
┌──────────────────────────────┐
│  👤 admin                    │
│  ✉️  admin@example.com       │
├──────────────────────────────┤
│  ⚙️  Settings                │
│  🔑 Personal API Keys        │
│  📚 Documentation            │
│  💬 Community                │
│  ℹ️  About n8n               │
├──────────────────────────────┤
│  🚪 Logout                   │
└──────────────────────────────┘
```

---

## 🎨 Sección 2: Canvas del Workflow (Editor Visual)

### 2.1 Barra de Herramientas del Canvas

Cuando abres un workflow, verás estas herramientas:

```
┌─────────────────────────────────────────────────────────────┐
│  [← Back] My Workflow            [Save] [Execute] [Active]  │
├─────────────────────────────────────────────────────────────┤
│  [+] Add Node  [🎨] Settings  [📋] Versions  [🔗] Share    │
└─────────────────────────────────────────────────────────────┘
```

#### **Botón "Add Node" (+)**

- Abre panel lateral con todos los nodos disponibles
- Búsqueda inteligente
- Categorías:
  - Triggers
  - Actions
  - Core nodes
  - Transform
  - Files
  - Popular

**Panel de nodos:**

```
┌───────────────────────────┐
│  🔍 Search nodes...       │
├───────────────────────────┤
│  📌 POPULAR               │
│    • HTTP Request         │
│    • Set                  │
│    • IF                   │
│    • Code                 │
├───────────────────────────┤
│  ⚡ TRIGGERS              │
│    • Webhook              │
│    • Schedule             │
│    • Manual               │
├───────────────────────────┤
│  🔧 ACTIONS               │
│    • Gmail                │
│    • Slack                │
│    • Google Sheets        │
└───────────────────────────┘
```

#### **Botón "Execute Workflow"**

- Ejecutar todo el workflow manualmente
- Ver resultados en tiempo real
- Depurar paso a paso

**Estados de ejecución:**

- 🟢 Running (ejecutando)
- ✅ Success (exitoso)
- ❌ Error (con error)
- ⏸️ Waiting (esperando input)

#### **Toggle "Active/Inactive"**

- Activar: Workflow responde a triggers automáticamente
- Desactivar: Workflow solo se ejecuta manualmente

**⚠️ Importante:**

- Solo workflows activos responden a webhooks
- Solo workflows activos ejecutan schedules
- Desactiva workflows en desarrollo para evitar ejecuciones no deseadas

### 2.2 Canvas: Área de Trabajo

**Interacciones del canvas:**

1. **Zoom:**

   - Scroll con rueda del mouse
   - `Ctrl/Cmd + Scroll` para zoom fino
   - Botones `+` / `-` en esquina inferior derecha
   - `Ctrl/Cmd + 0` para resetear zoom

2. **Pan (mover vista):**

   - Click y arrastrar en área vacía
   - `Space + Click y arrastrar`
   - Botón derecho + arrastrar

3. **Selección múltiple:**

   - `Shift + Click` en nodos
   - Click y arrastrar para crear rectángulo de selección
   - `Ctrl/Cmd + A` para seleccionar todos

4. **Mini-mapa:**
   - Esquina inferior derecha
   - Vista general del workflow completo
   - Click para navegar a áreas específicas

### 2.3 Anatomía de un Nodo en el Canvas

```
┌────────────────────────────────┐
│  📧 Send Email                 │ ← Nombre del nodo
│                                │
│  🟢 Ready                      │ ← Estado
│                                │
│  ⚙️ [Settings]  🗑️ [Delete]   │ ← Acciones
│                                │
│  ○ Input         Output ○     │ ← Conectores
└────────────────────────────────┘
```

**Elementos del nodo:**

1. **Icono:** Identifica visualmente el tipo de nodo
2. **Nombre:** Editable, describe la función
3. **Estado:**

   - 🔵 Configurando (sin ejecutar)
   - 🟢 Listo (configurado correctamente)
   - ✅ Ejecutado exitosamente
   - ❌ Error en ejecución
   - ⏸️ Deshabilitado

4. **Conectores:**
   - Izquierda: Input (recibe datos)
   - Derecha: Output (envía datos)
   - Algunos nodos tienen múltiples outputs (ej: IF → true/false)

**Click en un nodo → Panel lateral derecho se abre:**

```
┌────────────────────────────────────┐
│  📧 Send Email                     │
├────────────────────────────────────┤
│  Parameters                        │
│                                    │
│  From Email:                       │
│  ┌──────────────────────────────┐ │
│  │ noreply@example.com          │ │
│  └──────────────────────────────┘ │
│                                    │
│  To Email:                         │
│  ┌──────────────────────────────┐ │
│  │ {{ $json.email }}            │ │ ← Expresiones
│  └──────────────────────────────┘ │
│                                    │
│  Subject:                          │
│  ┌──────────────────────────────┐ │
│  │ Welcome!                     │ │
│  └──────────────────────────────┘ │
│                                    │
│  [Execute Node] [Settings]         │
└────────────────────────────────────┘
```

### 2.4 Conexiones entre Nodos

**Crear conexión:**

1. Hover sobre el conector de output (derecha del nodo)
2. Aparece círculo verde
3. Click y arrastra hasta input de otro nodo
4. Suelta para crear conexión

**Tipos de conexiones:**

- **Línea sólida:** Conexión activa y configurada
- **Línea punteada:** Conexión con error/warning
- **Línea verde:** Última ejecución exitosa
- **Línea roja:** Última ejecución con error

**Eliminar conexión:**

- Click en la línea → Press `Delete`
- O click derecho → "Delete connection"

---

## 📂 Sección 3: Gestión de Workflows

### 3.1 Crear Nuevo Workflow

**Opción 1: Desde Dashboard**

```
Dashboard → Click "New Workflow" → Editor se abre
```

**Opción 2: Desde Template**

```
Dashboard → Templates → Buscar → "Use Template"
```

**Opción 3: Duplicar Existente**

```
Lista workflows → Click "Duplicate" → Copia se crea
```

### 3.2 Guardar y Nombrar Workflows

**Guardar:**

- **Auto-save:** n8n guarda automáticamente cada cambio
- **Manual:** `Ctrl/Cmd + S`
- Indicador de estado: "Saving..." o "Saved" en footer

**Nombrar:**

```
Click en nombre "My Workflow" (top) → Editar → Enter
```

**Convenciones de nomenclatura recomendadas:**

- Descriptivo y específico
- Usa guiones o camelCase
- Incluye contexto: `marketing-lead-automation`
- Evita nombres genéricos: ❌ "workflow1", ❌ "test"

**Ejemplos buenos:**

- ✅ `email-nuevos-usuarios-bienvenida`
- ✅ `sincronizar-ventas-shopify-sheets`
- ✅ `monitoreo-servidor-alertas-slack`

### 3.3 Versionado de Workflows

n8n guarda historial de cambios automáticamente:

**Acceder a versiones:**

```
Editor → Click "Versions" → Lista de versiones
```

**Vista de versiones:**

```
┌──────────────────────────────────────────┐
│  Version History                         │
├──────────────────────────────────────────┤
│  📅 Nov 6, 2025 10:45 AM (Current)      │
│     Added error handling                 │
│                                          │
│  📅 Nov 6, 2025 09:30 AM                │
│     Updated email template               │
│                                          │
│  📅 Nov 5, 2025 16:20 PM                │
│     Initial creation                     │
└──────────────────────────────────────────┘
```

**Restaurar versión anterior:**

1. Click en versión deseada
2. Preview del workflow en esa versión
3. Click "Restore this version"
4. Confirmar

### 3.4 Exportar e Importar Workflows

#### **Exportar:**

**Opción 1: Desde lista**

```
Lista workflows → Click "..." → "Export" → Download JSON
```

**Opción 2: Desde editor**

```
Editor → Settings → "Export Workflow" → JSON descargado
```

**Formato del archivo:**

```json
{
  "name": "Marketing Automation",
  "nodes": [
    {
      "name": "Webhook",
      "type": "n8n-nodes-base.webhook",
      "parameters": { ... }
    },
    ...
  ],
  "connections": { ... }
}
```

⚠️ **Antes de exportar:**

- Verifica que no haya credenciales embebidas
- Revisa datos sensibles en parámetros
- Documenta dependencias externas

#### **Importar:**

**Método 1: Drag & Drop**

```
Dashboard → Arrastrar archivo .json → Workflow importado
```

**Método 2: Botón de importación**

```
Dashboard → "..." → "Import" → Seleccionar archivo
```

**Después de importar:**

- [ ] Renombrar workflow si es necesario
- [ ] Configurar credenciales (no se importan)
- [ ] Ajustar URLs/endpoints específicos
- [ ] Probar ejecución

---

## ⚡ Sección 4: Atajos de Teclado

### 4.1 Atajos Generales

| Atajo                  | Acción                         |
| ---------------------- | ------------------------------ |
| `Ctrl/Cmd + S`         | Guardar workflow               |
| `Ctrl/Cmd + Z`         | Deshacer                       |
| `Ctrl/Cmd + Shift + Z` | Rehacer                        |
| `Ctrl/Cmd + C`         | Copiar nodo(s) seleccionado(s) |
| `Ctrl/Cmd + V`         | Pegar nodo(s)                  |
| `Ctrl/Cmd + X`         | Cortar nodo(s)                 |
| `Delete`               | Eliminar nodo(s) o conexión    |
| `Ctrl/Cmd + A`         | Seleccionar todos los nodos    |

### 4.2 Atajos del Canvas

| Atajo               | Acción                 |
| ------------------- | ---------------------- |
| `Space + Drag`      | Pan (mover vista)      |
| `Ctrl/Cmd + 0`      | Reset zoom (100%)      |
| `Ctrl/Cmd + Scroll` | Zoom in/out            |
| `Shift + Click`     | Selección múltiple     |
| `Tab`               | Abrir panel "Add Node" |
| `Escape`            | Cerrar panel/modal     |

### 4.3 Atajos de Ejecución

| Atajo                | Acción                     |
| -------------------- | -------------------------- |
| `Ctrl/Cmd + Enter`   | Ejecutar workflow completo |
| `Alt/Option + Click` | Ejecutar solo ese nodo     |
| `Ctrl/Cmd + D`       | Duplicar nodo seleccionado |

### 4.4 Atajos de Navegación

| Atajo          | Acción                                 |
| -------------- | -------------------------------------- |
| `Ctrl/Cmd + K` | Búsqueda global (workflows, nodos)     |
| `Ctrl/Cmd + /` | Abrir panel de ayuda                   |
| `F`            | Ajustar zoom para ver todo el workflow |

**💡 Tip:** Memoriza los 5 atajos más útiles primero:

1. `Tab` (agregar nodo)
2. `Ctrl/Cmd + Enter` (ejecutar)
3. `Ctrl/Cmd + S` (guardar)
4. `Ctrl/Cmd + Z` (deshacer)
5. `F` (zoom a todo)

---

## 🎛️ Sección 5: Configuración y Personalización

### 5.1 Settings del Workflow

**Acceder:**

```
Editor → Click "Settings" (⚙️) → Panel se abre
```

**Opciones disponibles:**

#### **General**

- **Name:** Nombre del workflow
- **Tags:** Etiquetas para organización
- **Notes:** Descripción/documentación

#### **Error Workflow**

- Configurar workflow secundario que se ejecuta si hay error
- Útil para logging centralizado o alertas

#### **Timezone**

- Zona horaria para Schedule Triggers
- Importante para tareas programadas

#### **Save Data Executions**

```
Options:
☑ Save manually executed data
☑ Save data on error
☑ Save data on success
```

**⚠️ Consideración de almacenamiento:**

- Guardar todas las ejecuciones consume espacio
- Para workflows de alto volumen, considera guardar solo errores

#### **Timeout Settings**

```
Workflow Timeout: 120 seconds
Node Timeout: 60 seconds
```

### 5.2 Settings Globales de n8n

**Acceder:**

```
Usuario (top right) → Settings → Global settings
```

**Secciones importantes:**

#### **API**

```
API Endpoint: http://localhost:5678/api
API Keys: [Manage API Keys]
```

- Generar API keys para acceso programático
- Usadas para integración con CI/CD

#### **Community Nodes**

```
☑ Allow installation of community nodes
```

- Habilitar nodos creados por la comunidad
- Expandir funcionalidad más allá de nodos oficiales

#### **Execution Data**

```
Data pruning:
  Keep executions for: 14 days
  Prune executions older than: Yes
```

- Configurar limpieza automática de ejecuciones antiguas
- Evita que la base de datos crezca indefinidamente

---

## 🔍 Sección 6: Búsqueda y Filtros

### 6.1 Búsqueda Global

**Atajo:** `Ctrl/Cmd + K`

**Buscar:**

- Workflows por nombre
- Nodos dentro de workflows
- Credenciales
- Templates

```
┌─────────────────────────────────────┐
│  🔍 Search everything...            │
├─────────────────────────────────────┤
│  WORKFLOWS                          │
│    📋 Marketing Automation          │
│    📋 Email Processor               │
├─────────────────────────────────────┤
│  CREDENTIALS                        │
│    🔑 Google Sheets API             │
├─────────────────────────────────────┤
│  NODES (in current workflow)        │
│    📧 Send Welcome Email            │
└─────────────────────────────────────┘
```

### 6.2 Filtros en Lista de Workflows

**Filtros disponibles:**

- Estado: Active / Inactive
- Owner: Created by me / Shared with me
- Tags: Marketing, Sales, IT, etc.
- Last modified: Today, This week, This month

**Búsqueda avanzada:**

```
name:marketing status:active tag:important
```

---

## 💡 Tips y Mejores Prácticas de Navegación

### 1. Organización de Workflows

✅ **Usa tags consistentemente:**

```
Tags: marketing, automated, production
```

✅ **Nombra nodos descriptivamente:**

- ❌ "HTTP Request"
- ✅ "Obtener datos de API Stripe"

✅ **Agrupa workflows relacionados:**

```
Prefijos por departamento:
- mkt-lead-capture
- mkt-email-drip
- sales-crm-sync
- sales-quote-generator
```

### 2. Navegación Eficiente

✅ **Memoriza atajos clave:**

- Agiliza trabajo en 50%+
- Menos clicks, más productividad

✅ **Usa mini-mapa en workflows grandes:**

- Orientación rápida
- Click para navegar

✅ **Aprovecha búsqueda global:**

- Encuentra cualquier cosa en segundos
- No navegues manualmente

### 3. Debugging Visual

✅ **Colorea nodos según función:**

```
Convención de colores:
- 🟢 Triggers y entradas
- 🔵 Procesamiento/transformación
- 🟡 Decisiones/condiciones
- 🟠 Acciones externas
- 🔴 Error handling
```

✅ **Usa nombres descriptivos en conexiones:**

- n8n muestra condiciones en las líneas
- Ej: "IF true" vs "IF false"

### 4. Workspace Limpio

✅ **Elimina workflows de prueba regularmente**
✅ **Exporta workflows importantes a Git**
✅ **Documenta workflows complejos en Notes**
✅ **Limpia ejecuciones antiguas periódicamente**

---

## ✅ Checklist de Dominio de la Interfaz

Verifica que puedes hacer lo siguiente sin ayuda:

- [ ] Navegar entre Workflows, Credentials y Executions
- [ ] Crear un nuevo workflow desde cero
- [ ] Agregar nodos al canvas con búsqueda
- [ ] Conectar nodos entre sí
- [ ] Ejecutar un workflow manualmente
- [ ] Ver detalles de una ejecución pasada
- [ ] Activar/desactivar un workflow
- [ ] Exportar un workflow a JSON
- [ ] Importar un workflow desde archivo
- [ ] Usar al menos 5 atajos de teclado
- [ ] Configurar settings de un workflow
- [ ] Buscar workflows con búsqueda global
- [ ] Navegar con zoom y pan en workflows grandes
- [ ] Acceder al historial de versiones

**¿Completaste todos?** ¡Felicidades! Dominas la interfaz de n8n. 🎉

---

## 📚 Recursos Adicionales

### Documentación Oficial

- **UI Overview:** https://docs.n8n.io/workflows/
- **Keyboard Shortcuts:** https://docs.n8n.io/workflows/keyboard-shortcuts/
- **Best Practices:** https://docs.n8n.io/workflows/best-practices/

### Videos Recomendados

- "n8n Interface Tour" (Canal oficial)
- "Mastering n8n Canvas" (Community)

### Comunidad

- **Forum:** Comparte tips de navegación
- **Discord:** Pregunta sobre features específicas

---

## 🎓 Resumen y Próximos Pasos

### Lo que Aprendiste

En este documento cubrimos:

✅ **Estructura de la interfaz:**

- Header con navegación principal
- Canvas del workflow (editor visual)
- Anatomía de nodos y conexiones

✅ **Gestión de workflows:**

- Crear, guardar, nombrar
- Exportar e importar
- Versionado automático

✅ **Navegación eficiente:**

- Atajos de teclado más importantes
- Búsqueda global
- Filtros y organización

✅ **Personalización:**

- Settings de workflows
- Configuración global
- Tips de organización

### Siguiente Paso

📖 **Próximo documento:** [04-primer-workflow.md](./04-primer-workflow.md)

En el siguiente módulo aprenderás:

- Crear tu primer workflow completo paso a paso
- Usar triggers manuales y automáticos
- Transformar datos entre nodos
- Ejecutar y depurar workflows
- Guardar y activar tu primera automatización

---

## 🤔 Preguntas de Reflexión

1. **¿Cuál es la diferencia entre un workflow activo e inactivo?**

   - ¿Cuándo activarías un workflow?

2. **¿Por qué es importante nombrar nodos descriptivamente?**

   - ¿Cómo ayuda en debugging?

3. **¿Qué pasa con las credenciales cuando exportas un workflow?**

   - ¿Cómo proteger datos sensibles?

4. **¿Cuáles son los 3 atajos de teclado que usarás más?**

   - Practica hasta que sean automáticos

5. **¿Cómo organizarías 50+ workflows en tu workspace?**
   - Piensa en sistema de tags y nombres

---

## 📝 Ejercicio Práctico

**Desafío de Navegación:**

1. **Crea 3 workflows vacíos** con estos nombres:

   - `test-navegacion-01`
   - `test-navegacion-02`
   - `test-navegacion-03`

2. **Agrega tags diferentes a cada uno:**

   - Workflow 1: `test`, `principiante`
   - Workflow 2: `test`, `intermedio`
   - Workflow 3: `test`, `avanzado`

3. **Usa búsqueda global** para encontrar workflow con tag `intermedio`

4. **Exporta los 3 workflows** a archivos JSON

5. **Elimina los workflows** de la interfaz

6. **Importa solo el workflow 2** nuevamente

7. **Usa atajos de teclado** para:
   - Abrir panel de agregar nodo (`Tab`)
   - Cerrar panel (`Escape`)
   - Buscar global (`Ctrl/Cmd + K`)

**Tiempo estimado:** 10 minutos

**Validación:**

- ✅ Completaste todos los pasos sin consultar documentación
- ✅ Usaste al menos 3 atajos de teclado
- ✅ Pudiste exportar e importar correctamente

---

**🎉 ¡Excelente trabajo!** Ahora dominas la interfaz de n8n y estás listo para crear tu primer workflow funcional.

**Siguiente:** [04-primer-workflow.md](./04-primer-workflow.md) →
