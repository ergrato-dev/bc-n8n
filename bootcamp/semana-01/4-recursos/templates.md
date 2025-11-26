# 📦 Templates de n8n - Semana 01

## 🎨 Plantillas Recomendadas

Templates oficiales y de la comunidad para aprender y reutilizar.

---

## 🌟 Templates Oficiales de n8n

### Para Principiantes

| Template                | URL                                          | Descripción            |
| ----------------------- | -------------------------------------------- | ---------------------- |
| **Hello World**         | https://n8n.io/workflows/1-hello-world       | Primer workflow básico |
| **Schedule a Workflow** | https://n8n.io/workflows/4-schedule-workflow | Usar Schedule Trigger  |
| **HTTP Request Basics** | https://n8n.io/workflows/17-http-request     | Consumir APIs          |
| **Working with Data**   | https://n8n.io/workflows/12-working-data     | Transformar datos      |

### Notificaciones

| Template               | URL                                            | Descripción             |
| ---------------------- | ---------------------------------------------- | ----------------------- |
| **Slack Notification** | https://n8n.io/workflows/29-slack-notification | Enviar mensajes a Slack |
| **Email Notification** | https://n8n.io/workflows/22-email-notification | Enviar emails           |
| **Telegram Bot**       | https://n8n.io/workflows/45-telegram-bot       | Bot de Telegram         |

---

## 📚 Templates por Categoría

### 📊 Productividad

| Template                | Complejidad | Descripción               |
| ----------------------- | ----------- | ------------------------- |
| Google Sheets to Notion | ⭐⭐        | Sincronizar datos         |
| Airtable Automations    | ⭐⭐        | Automatizar base de datos |
| Todo List Manager       | ⭐          | Gestión de tareas         |

### 📧 Marketing

| Template               | Complejidad | Descripción             |
| ---------------------- | ----------- | ----------------------- |
| Lead Capture to CRM    | ⭐⭐        | Captura de leads        |
| Email List Sync        | ⭐⭐        | Sincronizar listas      |
| Social Media Scheduler | ⭐⭐⭐      | Programar publicaciones |

### 🔔 Alertas

| Template           | Complejidad | Descripción        |
| ------------------ | ----------- | ------------------ |
| Website Monitoring | ⭐⭐        | Monitorear uptime  |
| Error Notification | ⭐⭐        | Alertas de errores |
| Price Drop Alert   | ⭐⭐⭐      | Monitorear precios |

---

## 🎯 Templates Ideales para Semana 01

### Template 1: Workflow de Bienvenida Básico

```json
{
  "name": "Template - Bienvenida Simple",
  "nodes": [
    {
      "parameters": {},
      "name": "Manual Trigger",
      "type": "n8n-nodes-base.manualTrigger",
      "typeVersion": 1,
      "position": [250, 300]
    },
    {
      "parameters": {
        "mode": "manual",
        "duplicateItem": false,
        "assignments": {
          "assignments": [
            {
              "name": "mensaje",
              "value": "¡Hola Mundo desde n8n!",
              "type": "string"
            },
            {
              "name": "fecha",
              "value": "={{ $now.format('DD/MM/YYYY HH:mm') }}",
              "type": "string"
            }
          ]
        }
      },
      "name": "Set - Mensaje",
      "type": "n8n-nodes-base.set",
      "typeVersion": 3.3,
      "position": [450, 300]
    }
  ],
  "connections": {
    "Manual Trigger": {
      "main": [[{ "node": "Set - Mensaje", "type": "main", "index": 0 }]]
    }
  }
}
```

**Cómo usar:**

1. Copia el JSON
2. En n8n, ve a Workflows > Import
3. Pega el JSON
4. Ejecuta el workflow

---

### Template 2: Datos de Usuario

```json
{
  "name": "Template - Datos Usuario",
  "nodes": [
    {
      "parameters": {},
      "name": "Manual Trigger",
      "type": "n8n-nodes-base.manualTrigger",
      "typeVersion": 1,
      "position": [250, 300]
    },
    {
      "parameters": {
        "mode": "manual",
        "duplicateItem": false,
        "assignments": {
          "assignments": [
            {
              "name": "nombre",
              "value": "juan pérez",
              "type": "string"
            },
            {
              "name": "email",
              "value": "juan@example.com",
              "type": "string"
            },
            {
              "name": "plan",
              "value": "Pro",
              "type": "string"
            }
          ]
        }
      },
      "name": "Set - Datos Usuario",
      "type": "n8n-nodes-base.set",
      "typeVersion": 3.3,
      "position": [450, 300]
    },
    {
      "parameters": {
        "mode": "manual",
        "duplicateItem": false,
        "assignments": {
          "assignments": [
            {
              "name": "nombreFormateado",
              "value": "={{ $json.nombre.split(' ').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ') }}",
              "type": "string"
            },
            {
              "name": "email",
              "value": "={{ $json.email }}",
              "type": "string"
            },
            {
              "name": "plan",
              "value": "={{ $json.plan }}",
              "type": "string"
            },
            {
              "name": "fechaRegistro",
              "value": "={{ $now.toISO() }}",
              "type": "string"
            }
          ]
        }
      },
      "name": "Set - Formatear",
      "type": "n8n-nodes-base.set",
      "typeVersion": 3.3,
      "position": [650, 300]
    }
  ],
  "connections": {
    "Manual Trigger": {
      "main": [[{ "node": "Set - Datos Usuario", "type": "main", "index": 0 }]]
    },
    "Set - Datos Usuario": {
      "main": [[{ "node": "Set - Formatear", "type": "main", "index": 0 }]]
    }
  }
}
```

---

### Template 3: Condicional IF

```json
{
  "name": "Template - Condicional IF",
  "nodes": [
    {
      "parameters": {},
      "name": "Manual Trigger",
      "type": "n8n-nodes-base.manualTrigger",
      "typeVersion": 1,
      "position": [250, 300]
    },
    {
      "parameters": {
        "mode": "manual",
        "duplicateItem": false,
        "assignments": {
          "assignments": [
            {
              "name": "score",
              "value": "85",
              "type": "number"
            }
          ]
        }
      },
      "name": "Set - Score",
      "type": "n8n-nodes-base.set",
      "typeVersion": 3.3,
      "position": [450, 300]
    },
    {
      "parameters": {
        "conditions": {
          "options": {
            "caseSensitive": true,
            "leftValue": ""
          },
          "conditions": [
            {
              "leftValue": "={{ $json.score }}",
              "rightValue": 70,
              "operator": {
                "type": "number",
                "operation": "gte"
              }
            }
          ]
        }
      },
      "name": "IF - Aprobado",
      "type": "n8n-nodes-base.if",
      "typeVersion": 2,
      "position": [650, 300]
    },
    {
      "parameters": {
        "mode": "manual",
        "assignments": {
          "assignments": [
            {
              "name": "resultado",
              "value": "✅ Aprobado",
              "type": "string"
            }
          ]
        }
      },
      "name": "Set - Aprobado",
      "type": "n8n-nodes-base.set",
      "typeVersion": 3.3,
      "position": [850, 200]
    },
    {
      "parameters": {
        "mode": "manual",
        "assignments": {
          "assignments": [
            {
              "name": "resultado",
              "value": "❌ Reprobado",
              "type": "string"
            }
          ]
        }
      },
      "name": "Set - Reprobado",
      "type": "n8n-nodes-base.set",
      "typeVersion": 3.3,
      "position": [850, 400]
    }
  ],
  "connections": {
    "Manual Trigger": {
      "main": [[{ "node": "Set - Score", "type": "main", "index": 0 }]]
    },
    "Set - Score": {
      "main": [[{ "node": "IF - Aprobado", "type": "main", "index": 0 }]]
    },
    "IF - Aprobado": {
      "main": [
        [{ "node": "Set - Aprobado", "type": "main", "index": 0 }],
        [{ "node": "Set - Reprobado", "type": "main", "index": 0 }]
      ]
    }
  }
}
```

---

## 🔍 Dónde Encontrar Más Templates

### Fuentes Oficiales

| Fuente                   | URL                                                              |
| ------------------------ | ---------------------------------------------------------------- |
| **n8n Template Library** | https://n8n.io/workflows/                                        |
| **n8n Community**        | https://community.n8n.io/c/workflow-templates/                   |
| **n8n GitHub**           | https://github.com/n8n-io/n8n/tree/master/packages/cli/templates |

### Fuentes de la Comunidad

| Fuente              | URL                                |
| ------------------- | ---------------------------------- |
| **n8n.io/creators** | Workflows de creadores verificados |
| **Dev.to #n8n**     | https://dev.to/t/n8n               |
| **Reddit r/n8n**    | https://reddit.com/r/n8n           |

---

## 💡 Cómo Usar Templates Efectivamente

### 1. Importar Template

```
Menú > Import from File/URL > Pegar JSON
```

### 2. Estudiar la Estructura

- Revisa cada nodo individualmente
- Lee las notas si las tiene
- Ejecuta paso a paso (Execute Node)

### 3. Modificar y Experimentar

- Cambia valores
- Agrega nodos
- Crea variaciones

### 4. Documentar lo Aprendido

- Anota patrones útiles
- Guarda tus propios templates
- Comparte con la comunidad

---

## 📤 Crear tus Propios Templates

### Estructura Recomendada

```json
{
  "name": "Mi Template - Descriptivo",
  "nodes": [...],
  "connections": {...},
  "settings": {
    "saveExecutionProgress": true,
    "saveManualExecutions": true
  }
}
```

### Buenas Prácticas

1. ✅ Nombres descriptivos en nodos
2. ✅ Notas explicativas
3. ✅ Sin credenciales hardcodeadas
4. ✅ Valores de ejemplo en Set nodes
5. ✅ README con instrucciones

---

## 🎓 Templates del Bootcamp

A medida que avances, encontrarás templates en:

```
workflows/
├── basicos/
│   ├── 01-hola-mundo.json
│   ├── 02-webhook-simple.json
│   └── 03-schedule-basico.json
├── intermedios/
│   └── ...
└── avanzados/
    └── ...
```
