# 💻 Práctica 05: Workflow Multi-Trigger

![Práctica](https://img.shields.io/badge/Práctica-05-FF6D5A?style=flat-square)
![Dificultad](https://img.shields.io/badge/Dificultad-⭐⭐⭐-00D4FF?style=flat-square)
![Tiempo](https://img.shields.io/badge/Tiempo-30_min-00A86B?style=flat-square)

---

## 🎯 Objetivos

Al completar esta práctica, serás capaz de:

- Diseñar workflows con múltiples triggers
- Unificar datos de diferentes fuentes
- Implementar lógica que identifica el origen del trigger
- Crear workflows versátiles que responden a múltiples eventos

---

## 📋 Requisitos Previos

- [ ] Todas las prácticas anteriores completadas
- [ ] Comprensión de Manual, Schedule y Webhook triggers

---

## 📚 Contexto

En escenarios reales, a menudo necesitas que un mismo workflow pueda iniciarse de diferentes maneras: manualmente para testing, programado para ejecución automática, o via webhook para eventos externos. Esta práctica te enseña a manejar múltiples triggers en un solo workflow.

---

## 🔨 Ejercicio

### Escenario

Crearás un sistema de "Health Check" que puede ejecutarse:

1. **Manualmente** - Para verificaciones on-demand
2. **Programado** - Cada hora automáticamente
3. **Via Webhook** - Cuando un sistema externo lo solicita

El workflow debe identificar cómo fue iniciado y procesar acordemente.

### Arquitectura del Workflow

```
┌─────────────────────────────────────────────────────────────────┐
│              WORKFLOW MULTI-TRIGGER                              │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌──────────┐   ┌──────────┐   ┌──────────┐                     │
│  │ Manual   │   │ Schedule │   │ Webhook  │                     │
│  │ Trigger  │   │ Trigger  │   │ Trigger  │                     │
│  └────┬─────┘   └────┬─────┘   └────┬─────┘                     │
│       │              │              │                            │
│       └──────────────┼──────────────┘                            │
│                      │                                           │
│                      ▼                                           │
│              ┌──────────────┐                                    │
│              │   Merge /    │                                    │
│              │   Unificar   │                                    │
│              └──────┬───────┘                                    │
│                     │                                            │
│                     ▼                                            │
│              ┌──────────────┐                                    │
│              │  Identificar │                                    │
│              │    Origen    │                                    │
│              └──────┬───────┘                                    │
│                     │                                            │
│                     ▼                                            │
│              ┌──────────────┐                                    │
│              │   Procesar   │                                    │
│              │  Health Check│                                    │
│              └──────────────┘                                    │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Paso 1: Crear el Workflow Base

1. Crea un nuevo workflow: `practica-05-multi-trigger`
2. Guárdalo

### Paso 2: Agregar los Tres Triggers

#### Trigger 1: Manual Trigger

1. Agrega **"Manual Trigger"**
2. Renómbralo a: `Manual: Health Check On-Demand`

#### Trigger 2: Schedule Trigger

1. Agrega **"Schedule Trigger"**
2. Renómbralo a: `Schedule: Health Check Horario`
3. Configura:
   - Mode: `Cron`
   - Expression: `0 * * * *` (cada hora en punto)
   - Timezone: Tu zona horaria

#### Trigger 3: Webhook Trigger

1. Agrega **"Webhook"**
2. Renómbralo a: `Webhook: Health Check Externo`
3. Configura:
   - HTTP Method: `POST`
   - Path: `health-check`

### Paso 3: Agregar Nodos de Identificación

Cada trigger necesita un nodo que identifique su origen:

#### Después del Manual Trigger:

1. Conecta un **"Edit Fields (Set)"**
2. Renómbralo a: `Origen: Manual`
3. Configura campos:

| Campo           | Tipo   | Valor                |
| --------------- | ------ | -------------------- |
| `triggerType`   | String | `manual`             |
| `triggerSource` | String | `User initiated`     |
| `timestamp`     | String | `{{ $now.toISO() }}` |
| `priority`      | String | `high`               |

#### Después del Schedule Trigger:

1. Conecta un **"Edit Fields (Set)"**
2. Renómbralo a: `Origen: Schedule`
3. Configura campos:

| Campo           | Tipo   | Valor                   |
| --------------- | ------ | ----------------------- |
| `triggerType`   | String | `scheduled`             |
| `triggerSource` | String | `Cron: 0 * * * *`       |
| `timestamp`     | String | `{{ $json.timestamp }}` |
| `priority`      | String | `normal`                |

#### Después del Webhook Trigger:

1. Conecta un **"Edit Fields (Set)"**
2. Renómbralo a: `Origen: Webhook`
3. Configura campos:

| Campo           | Tipo   | Valor                                              |
| --------------- | ------ | -------------------------------------------------- |
| `triggerType`   | String | `webhook`                                          |
| `triggerSource` | String | `{{ $json.headers['user-agent'] \|\| 'Unknown' }}` |
| `timestamp`     | String | `{{ $now.toISO() }}`                               |
| `priority`      | String | `{{ $json.body.priority \|\| 'normal' }}`          |
| `requestData`   | String | `{{ JSON.stringify($json.body) }}`                 |

### Paso 4: Unificar los Flujos con Merge

1. Agrega un nodo **"Merge"**
2. Renómbralo a: `Unificar Triggers`
3. Configura:
   - Mode: `Append`
4. Conecta los tres nodos de "Origen" al Merge

```
┌─────────────────────────────────────────────────────────────────┐
│                    CONEXIÓN AL MERGE                             │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌─────────────────┐                                            │
│  │ Origen: Manual  │──────┐                                     │
│  └─────────────────┘      │                                     │
│                           │                                     │
│  ┌─────────────────┐      │     ┌──────────────────┐           │
│  │ Origen: Schedule│──────┼────►│ Unificar Triggers │           │
│  └─────────────────┘      │     │     (Merge)       │           │
│                           │     └──────────────────┘           │
│  ┌─────────────────┐      │                                     │
│  │ Origen: Webhook │──────┘                                     │
│  └─────────────────┘                                            │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Paso 5: Agregar Lógica de Health Check

1. Conecta un **"Edit Fields (Set)"** desde el Merge
2. Renómbralo a: `Ejecutar Health Check`
3. Configura campos:

| Campo           | Tipo   | Valor                                        |
| --------------- | ------ | -------------------------------------------- |
| `checkId`       | String | `{{ 'HC-' + Date.now() }}`                   |
| `triggerType`   | String | `{{ $json.triggerType }}`                    |
| `triggerSource` | String | `{{ $json.triggerSource }}`                  |
| `priority`      | String | `{{ $json.priority }}`                       |
| `systemStatus`  | String | `operational`                                |
| `responseTime`  | Number | `{{ Math.floor(Math.random() * 100) + 50 }}` |
| `memoryUsage`   | String | `{{ Math.floor(Math.random() * 30) + 40 }}%` |
| `cpuUsage`      | String | `{{ Math.floor(Math.random() * 20) + 10 }}%` |
| `checkedAt`     | String | `{{ $now.toISO() }}`                         |

### Paso 6: Agregar Evaluación de Salud

1. Conecta un nodo **"IF"**
2. Renómbralo a: `Sistema Saludable?`
3. Configura:
   - Value 1: `{{ $json.responseTime }}`
   - Operation: `Smaller`
   - Value 2: `100`

### Paso 7: Agregar Respuestas Finales

**Rama True (Sistema OK):**

1. Agrega **"Edit Fields (Set)"**
2. Renómbralo a: `Resultado: OK`
3. Campos:
   - `result`: `healthy`
   - `message`: `Sistema funcionando correctamente`
   - `alertLevel`: `none`

**Rama False (Sistema Lento):**

1. Agrega **"Edit Fields (Set)"**
2. Renómbralo a: `Resultado: Warning`
3. Campos:
   - `result`: `degraded`
   - `message`: `Sistema con respuesta lenta`
   - `alertLevel`: `warning`

---

## 🔄 Flujo Completo

```
┌─────────────────────────────────────────────────────────────────┐
│           WORKFLOW: practica-05-multi-trigger                    │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐           │
│  │🎯 Manual     │  │⏰ Schedule   │  │🌐 Webhook    │           │
│  │   Trigger    │  │   Trigger    │  │   Trigger    │           │
│  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘           │
│         │                 │                 │                    │
│         ▼                 ▼                 ▼                    │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐           │
│  │📝 Origen:    │  │📝 Origen:    │  │📝 Origen:    │           │
│  │   Manual     │  │   Schedule   │  │   Webhook    │           │
│  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘           │
│         │                 │                 │                    │
│         └─────────────────┼─────────────────┘                    │
│                           │                                      │
│                           ▼                                      │
│                    ┌──────────────┐                              │
│                    │🔀 Unificar   │                              │
│                    │   Triggers   │                              │
│                    └──────┬───────┘                              │
│                           │                                      │
│                           ▼                                      │
│                    ┌──────────────┐                              │
│                    │🏥 Ejecutar   │                              │
│                    │ Health Check │                              │
│                    └──────┬───────┘                              │
│                           │                                      │
│                           ▼                                      │
│                    ┌──────────────┐                              │
│                    │❓ Sistema    │                              │
│                    │  Saludable?  │                              │
│                    └──────┬───────┘                              │
│                           │                                      │
│                     ┌─────┴─────┐                                │
│                     │           │                                │
│                     ▼           ▼                                │
│               ┌──────────┐ ┌──────────┐                         │
│               │ ✅ OK    │ │ ⚠️ Warning│                         │
│               └──────────┘ └──────────┘                         │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 🧪 Pruebas

### Probar Manual Trigger

1. Haz clic en **"Test Workflow"**
2. Verifica que `triggerType` sea `manual`
3. Observa el flujo completo hasta el resultado

### Probar Schedule Trigger

Para testing del Schedule sin esperar:

1. Haz clic derecho en el nodo "Schedule Trigger"
2. Selecciona **"Execute Node"**
3. Verifica que `triggerType` sea `scheduled`

### Probar Webhook Trigger

1. Copia la Test URL del webhook
2. En terminal, ejecuta:

```bash
# Primero haz clic en "Listen for Test Event" en el webhook

# Luego envía la petición:
curl -X POST http://localhost:5678/webhook-test/health-check \
  -H "Content-Type: application/json" \
  -d '{"priority": "high", "requestedBy": "monitoring-system"}'
```

3. Verifica que `triggerType` sea `webhook`

---

## 🧪 Experimentos Adicionales

### Experimento 1: Agregar Lógica por Tipo de Trigger

Después del Merge, agrega un **Switch** que tome diferentes caminos según el `triggerType`:

```
┌─────────────────────────────────────────────────────────────────┐
│  Switch basado en triggerType:                                   │
│                                                                  │
│  • manual    → Log detallado + resultado inmediato              │
│  • scheduled → Log mínimo + métricas                            │
│  • webhook   → Respuesta HTTP + log                             │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Experimento 2: Priorización

Agrega lógica que procese de manera diferente según la prioridad:

- `high` → Proceso inmediato, notificación
- `normal` → Proceso estándar
- `low` → Proceso diferido (agregar a cola)

### Experimento 3: Rate Limiting Simple

Agrega un contador en el webhook para rechazar si hay demasiadas peticiones:

```javascript
// En un Code Node
const maxRequestsPerMinute = 10;
const currentTimestamp = Date.now();
// Implementar lógica de rate limiting
```

---

## ✅ Criterios de Éxito

Tu práctica está completa cuando:

- [ ] Los tres triggers están configurados y funcionando
- [ ] El Merge unifica correctamente los flujos
- [ ] Cada trigger produce datos que identifican su origen
- [ ] El Health Check se ejecuta independientemente del trigger
- [ ] Puedes probar cada trigger individualmente
- [ ] El workflow maneja correctamente los diferentes escenarios

---

## 💡 Tips y Mejores Prácticas

1. **Identifica siempre el origen**: Esto ayuda en debugging y auditoría
2. **Unifica la estructura de datos**: Después del Merge, todos los datos deben tener el mismo formato
3. **Considera las diferencias de cada trigger**:
   - Manual: Tiene poco contexto
   - Schedule: Tiene datos de tiempo
   - Webhook: Tiene datos de la petición HTTP
4. **No dupliques lógica**: El Merge permite compartir el procesamiento común

---

## 🔗 Recursos

- 📖 [Documentación Merge Node](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.merge/)
- 📖 [Patrones de Workflow](https://docs.n8n.io/workflows/patterns/)
- 📖 [Múltiples Triggers](https://docs.n8n.io/workflows/components/workflows/#multiple-triggers)

---

## 🏠 Navegación

| ⬅️ Anterior                                | 💻 Práctica Actual     | ➡️ Siguiente               |
| ------------------------------------------ | ---------------------- | -------------------------- |
| [04 - Debugging](practica-04-debugging.md) | **05 - Multi-Trigger** | [Proyecto](../3-proyecto/) |
