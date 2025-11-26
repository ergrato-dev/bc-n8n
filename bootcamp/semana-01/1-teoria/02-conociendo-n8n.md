# 📚 Módulo 02: Conociendo n8n

![n8n](https://img.shields.io/badge/n8n-Workflow_Automation-FF6D5A?style=flat-square&logo=n8n)
![Tiempo](https://img.shields.io/badge/Tiempo-30_min-00D4FF?style=flat-square)
![Nivel](https://img.shields.io/badge/Nivel-Principiante-00A86B?style=flat-square)

---

## 🎯 Objetivos del Módulo

Al finalizar este módulo, serás capaz de:

- Explicar qué es n8n y su propuesta de valor
- Identificar las características clave de n8n
- Comparar n8n con otras herramientas (Zapier, Make)
- Comprender la arquitectura básica de n8n
- Reconocer los conceptos fundamentales (nodos, workflows, ejecuciones)

---

## 📚 Contenido

### 2.1 ¿Qué es n8n?

**n8n** (pronunciado "n-eight-n" o "nodemation") es una plataforma de automatización de workflows **open source** que permite conectar diferentes aplicaciones y servicios para automatizar tareas y procesos.

#### Características Definitorias

```
┌─────────────────────────────────────────────────────────────────┐
│                         n8n                                      │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│   🔓 Open Source        │   Código abierto, comunidad activa    │
│   🏠 Self-Hosted        │   Ejecuta en tu propia infraestructura│
│   👁️ Fair-Code          │   Modelo de licencia transparente     │
│   🎨 Visual Builder     │   Interfaz drag-and-drop intuitiva    │
│   🔧 Extensible         │   +400 integraciones + nodos custom   │
│   💻 Code Nodes         │   JavaScript cuando lo necesites      │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

#### Historia Breve

| Año  | Evento                                   |
| ---- | ---------------------------------------- |
| 2019 | Jan Oberhauser crea n8n en Berlín        |
| 2020 | Primera versión pública, comunidad crece |
| 2021 | Financiación Serie A ($12M)              |
| 2022 | n8n Cloud lanzado oficialmente           |
| 2023 | +400 integraciones, AI nodes             |
| 2024 | Serie B, +50K instalaciones activas      |

### 2.2 ¿Por Qué Elegir n8n?

#### Propuesta de Valor Única

```
          ┌─────────────────────────────────────────┐
          │                                         │
          │   "Automatización para técnicos         │
          │    que quieren control total"           │
          │                                         │
          └─────────────────────────────────────────┘
```

n8n ocupa un espacio único en el mercado:

> 📊 **Comparativa Visual:** Ver [04-comparativa-herramientas.svg](../0-assets/04-comparativa-herramientas.svg)

| Aspecto              | Zapier/Make   | Código Puro   | n8n           |
| -------------------- | ------------- | ------------- | ------------- |
| Curva de aprendizaje | Baja          | Alta          | Media         |
| Flexibilidad         | Media         | Alta          | Alta          |
| Control de datos     | ❌ Cloud only | ✅ Total      | ✅ Total      |
| Costo a escala       | 💰💰💰        | 💰 (dev time) | 💰            |
| Integraciones        | +5000         | Ilimitadas    | +400 + custom |
| Código custom        | Limitado      | Todo          | JavaScript    |
| Self-hosted          | ❌            | ✅            | ✅            |

#### Los 5 Pilares de n8n

1. **🔓 Open Source / Fair Code**

   - Código fuente disponible
   - Puedes auditar y contribuir
   - Comunidad activa de desarrolladores

2. **🏠 Self-Hosted**

   - Tus datos nunca salen de tu infraestructura
   - Cumplimiento regulatorio (GDPR, HIPAA)
   - Sin límites arbitrarios

3. **🎨 Visual + Código**

   - Interfaz visual para la mayoría de tareas
   - Code nodes para lógica compleja
   - Lo mejor de ambos mundos

4. **🔧 Extensibilidad**

   - Crear nodos personalizados
   - API completa
   - Webhooks ilimitados

5. **💰 Costo Predecible**
   - Self-hosted: Solo costo de servidor
   - Cloud: Precios transparentes
   - Sin sorpresas por volumen

### 2.3 Arquitectura de n8n

#### Visión General

> 📊 **Diagrama Interactivo:** Ver [01-arquitectura-n8n.svg](../0-assets/01-arquitectura-n8n.svg)

![Arquitectura de n8n](../0-assets/01-arquitectura-n8n.svg)

```
┌─────────────────────────────────────────────────────────────────────┐
│                          n8n ARCHITECTURE                            │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│   ┌─────────────┐     ┌─────────────┐     ┌─────────────┐          │
│   │   Editor    │     │   Engine    │     │  Database   │          │
│   │   (Vue.js)  │────▶│  (Node.js)  │────▶│  (SQLite/   │          │
│   │             │     │             │     │  PostgreSQL)│          │
│   └─────────────┘     └─────────────┘     └─────────────┘          │
│         │                   │                   │                   │
│         │                   ▼                   │                   │
│         │           ┌─────────────┐             │                   │
│         │           │  Workers    │             │                   │
│         │           │  (Opcional) │             │                   │
│         │           └─────────────┘             │                   │
│         │                   │                   │                   │
│         ▼                   ▼                   │                   │
│   ┌─────────────────────────────────────────────┘                   │
│   │                                                                  │
│   │              Integraciones (+400 nodos)                         │
│   │   ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐                │
│   │   │Slack │ │Google│ │HTTP  │ │MySQL │ │...   │                │
│   │   └──────┘ └──────┘ └──────┘ └──────┘ └──────┘                │
│   │                                                                  │
│   └──────────────────────────────────────────────────────────────── │
└─────────────────────────────────────────────────────────────────────┘
```

#### Componentes Principales

| Componente   | Tecnología        | Función                                       |
| ------------ | ----------------- | --------------------------------------------- |
| **Editor**   | Vue.js            | Interfaz visual para crear workflows          |
| **Engine**   | Node.js           | Ejecuta los workflows                         |
| **Database** | SQLite/PostgreSQL | Almacena workflows, credenciales, ejecuciones |
| **Workers**  | Node.js           | Procesamiento paralelo (opcional)             |

### 2.4 Conceptos Fundamentales

#### 🔷 Workflow

Un **workflow** es un flujo de trabajo automatizado compuesto por nodos conectados.

```
┌─────────────────────────────────────────────────────────────────┐
│                         WORKFLOW                                 │
│                                                                  │
│   ┌─────────┐     ┌─────────┐     ┌─────────┐     ┌─────────┐  │
│   │ Trigger │────▶│ Action  │────▶│ Action  │────▶│ Action  │  │
│   │  Node   │     │  Node   │     │  Node   │     │  Node   │  │
│   └─────────┘     └─────────┘     └─────────┘     └─────────┘  │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

**Características de un Workflow:**

- Tiene un nombre único
- Puede estar activo o inactivo
- Se puede exportar/importar como JSON
- Guarda historial de ejecuciones

#### 🔷 Nodo (Node)

Un **nodo** es la unidad básica de trabajo en n8n. Cada nodo realiza una operación específica.

**Tipos de Nodos:**

| Tipo            | Icono | Descripción           | Ejemplos                  |
| --------------- | ----- | --------------------- | ------------------------- |
| **Trigger**     | ⚡    | Inicia el workflow    | Webhook, Schedule, Manual |
| **Regular**     | 🔧    | Procesa datos         | HTTP Request, Set, IF     |
| **Integration** | 🔌    | Conecta con servicios | Gmail, Slack, Sheets      |

**Anatomía de un Nodo:**

```
┌─────────────────────────────────────────────┐
│              NODO: HTTP Request              │
├─────────────────────────────────────────────┤
│                                              │
│   📥 INPUT                                   │
│   └── Datos del nodo anterior               │
│                                              │
│   ⚙️ CONFIGURACIÓN                          │
│   ├── URL: https://api.example.com          │
│   ├── Method: GET                           │
│   └── Headers: {...}                        │
│                                              │
│   📤 OUTPUT                                  │
│   └── Respuesta de la API                   │
│                                              │
└─────────────────────────────────────────────┘
```

#### 🔷 Conexión

Las **conexiones** son las líneas que unen nodos y definen el flujo de datos.

```
      ┌─────────┐         ┌─────────┐
      │  Nodo A │─────────│  Nodo B │
      └─────────┘         └─────────┘
                  │
                  │
                  ▼
         Los datos fluyen de A → B
         (El output de A es el input de B)
```

#### 🔷 Ejecución

Una **ejecución** es una instancia de corrida de un workflow.

**Estados de Ejecución:**

| Estado     | Color    | Descripción               |
| ---------- | -------- | ------------------------- |
| ✅ Success | Verde    | Completó sin errores      |
| ❌ Error   | Rojo     | Falló en algún nodo       |
| ⏸️ Waiting | Amarillo | Esperando (webhook, etc.) |
| 🔄 Running | Azul     | En proceso                |

#### 🔷 Credenciales

Las **credenciales** almacenan de forma segura las claves API y tokens necesarios para conectar con servicios externos.

```
┌─────────────────────────────────────────────┐
│           CREDENCIALES (Encriptadas)         │
├─────────────────────────────────────────────┤
│                                              │
│   🔐 Google Sheets API                       │
│   └── OAuth2 tokens                         │
│                                              │
│   🔐 Slack Bot                               │
│   └── Bot Token                             │
│                                              │
│   🔐 OpenAI                                  │
│   └── API Key                               │
│                                              │
└─────────────────────────────────────────────┘
```

### 2.5 Comparativa con Otras Herramientas

#### n8n vs Zapier

| Característica        | n8n                                  | Zapier             |
| --------------------- | ------------------------------------ | ------------------ |
| **Precio**            | Self-hosted gratis / Cloud desde $20 | Desde $20/mes      |
| **Tareas/mes**        | Ilimitadas (self-hosted)             | Limitadas por plan |
| **Self-hosted**       | ✅ Sí                                | ❌ No              |
| **Open Source**       | ✅ Sí                                | ❌ No              |
| **Código custom**     | ✅ JavaScript completo               | ⚠️ Limitado        |
| **Integraciones**     | +400                                 | +5000              |
| **Complejidad**       | Workflows complejos                  | Mejor para simple  |
| **Curva aprendizaje** | Media                                | Baja               |

#### n8n vs Make (Integromat)

| Característica     | n8n                | Make         |
| ------------------ | ------------------ | ------------ |
| **Precio**         | Self-hosted gratis | Desde $9/mes |
| **Self-hosted**    | ✅ Sí              | ❌ No        |
| **Visual Builder** | ✅ Excelente       | ✅ Excelente |
| **Código custom**  | ✅ JavaScript      | ⚠️ Limitado  |
| **Documentación**  | Buena              | Muy buena    |
| **Comunidad**      | Creciente          | Establecida  |

#### ¿Cuándo Elegir n8n?

✅ **Elige n8n si:**

- Necesitas control total sobre tus datos
- Quieres evitar costos por volumen
- Requieres workflows complejos con código
- Tu organización requiere self-hosting
- Valoras el open source

❌ **Considera alternativas si:**

- Necesitas +400 integraciones nativas
- Tu equipo no es técnico
- Prefieres zero maintenance

### 2.6 Ecosistema n8n

#### Opciones de Despliegue

```
┌─────────────────────────────────────────────────────────────────┐
│                    OPCIONES DE DESPLIEGUE                        │
├──────────────────┬──────────────────┬───────────────────────────┤
│   n8n Cloud      │   Self-Hosted    │   Kubernetes/Enterprise   │
├──────────────────┼──────────────────┼───────────────────────────┤
│ • Más rápido     │ • Gratis         │ • Alta disponibilidad     │
│ • Sin mantenim.  │ • Control total  │ • Escalamiento            │
│ • Desde $20/mes  │ • Docker/npm     │ • Multi-tenant            │
└──────────────────┴──────────────────┴───────────────────────────┘
```

#### Recursos de la Comunidad

| Recurso           | URL                   | Descripción         |
| ----------------- | --------------------- | ------------------- |
| **Documentación** | docs.n8n.io           | Referencia oficial  |
| **Comunidad**     | community.n8n.io      | Foro de ayuda       |
| **Templates**     | n8n.io/workflows      | Workflows listos    |
| **GitHub**        | github.com/n8n-io/n8n | Código fuente       |
| **Discord**       | discord.gg/n8n        | Chat en tiempo real |

---

## 💡 Puntos Clave

- ✅ n8n es open source y puede ser self-hosted
- ✅ Combina interfaz visual con capacidad de código
- ✅ Los workflows se componen de nodos conectados
- ✅ Cada nodo tiene input, configuración y output
- ✅ n8n destaca por flexibilidad y control de datos

---

## ⚠️ Errores Comunes

| Error                          | Consecuencia          | Solución                         |
| ------------------------------ | --------------------- | -------------------------------- |
| Esperar que sea igual a Zapier | Frustración inicial   | Aprovechar sus fortalezas únicas |
| Ignorar las credenciales       | Workflows fallan      | Configurar credenciales primero  |
| No guardar workflows           | Pérdida de trabajo    | Guardar frecuentemente           |
| Workflows muy grandes          | Difícil mantenimiento | Dividir en sub-workflows         |

---

## 🔗 Referencias

- [n8n Official Documentation](https://docs.n8n.io/)
- [n8n GitHub Repository](https://github.com/n8n-io/n8n)
- [n8n Blog](https://n8n.io/blog/)
- [n8n Community Forum](https://community.n8n.io/)

---

## ✅ Autoevaluación

Antes de continuar, asegúrate de poder responder:

1. **¿Qué significa que n8n sea "fair-code"?**
   <details>
   <summary>Ver respuesta</summary>
   Es un modelo de licencia que permite ver y modificar el código fuente, pero con algunas restricciones para uso comercial. El código está disponible públicamente.
   </details>

2. **¿Cuáles son las 3 opciones de despliegue de n8n?**
   <details>
   <summary>Ver respuesta</summary>
   1) n8n Cloud (managed), 2) Self-hosted (Docker, npm), 3) Kubernetes/Enterprise
   </details>

3. **¿Qué es un nodo en n8n?**
   <details>
   <summary>Ver respuesta</summary>
   Es la unidad básica de trabajo que realiza una operación específica. Tiene input, configuración y output. Puede ser trigger, regular o de integración.
   </details>

4. **¿Cuál es la principal ventaja de n8n sobre Zapier?**
   <details>
   <summary>Ver respuesta</summary>
   Control total sobre los datos (self-hosted), sin límites de ejecución, código JavaScript completo, y es open source.
   </details>

---

<div align="center">

| ◀️ Anterior                                    | 🏠 Volver                  | Siguiente ▶️                                              |
| ---------------------------------------------- | -------------------------- | --------------------------------------------------------- |
| [Módulo 01](01-introduccion-automatizacion.md) | [Índice Teoría](README.md) | [Módulo 03: Instalación](03-instalacion-configuracion.md) |

</div>
