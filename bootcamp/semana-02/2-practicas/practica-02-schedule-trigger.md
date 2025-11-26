# 💻 Práctica 02: Schedule Trigger

![Práctica](https://img.shields.io/badge/Práctica-02-FF6D5A?style=flat-square)
![Dificultad](https://img.shields.io/badge/Dificultad-⭐⭐-00D4FF?style=flat-square)
![Tiempo](https://img.shields.io/badge/Tiempo-25_min-00A86B?style=flat-square)

---

## 🎯 Objetivos

Al completar esta práctica, serás capaz de:

- Configurar Schedule Trigger con intervalos simples
- Usar expresiones cron para programar workflows
- Configurar la zona horaria correctamente
- Entender los datos que proporciona el Schedule Trigger

---

## 📋 Requisitos Previos

- [ ] n8n instalado y funcionando
- [ ] Práctica 01 completada
- [ ] Haber leído los módulos teóricos de Triggers y Cron

---

## 📚 Contexto

El **Schedule Trigger** es esencial para automatizaciones que deben ejecutarse en horarios específicos: reportes diarios, sincronizaciones periódicas, recordatorios, backups, etc. Esta práctica te enseñará a configurarlo correctamente.

---

## 🔨 Ejercicio

### Escenario

Crearás un workflow que simula un sistema de monitoreo que se ejecuta cada cierto tiempo, registra la hora de ejecución y genera un "reporte de estado".

### Paso 1: Crear Nuevo Workflow

1. Crea un nuevo workflow: `practica-02-schedule-trigger`
2. Guárdalo inmediatamente (`Ctrl/Cmd + S`)

### Paso 2: Agregar Schedule Trigger

1. Agrega el nodo **"Schedule Trigger"**
2. Observa las opciones de configuración

```
┌─────────────────────────────────────────────────────────────────┐
│              SCHEDULE TRIGGER - CONFIGURACIÓN                    │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  Trigger Interval                                                │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │  Rule                                                   │    │
│  │  ┌───────────────────────────────────────────────────┐  │    │
│  │  │ [Every X Minutes / Cron Expression]          ▼    │  │    │
│  │  └───────────────────────────────────────────────────┘  │    │
│  │                                                         │    │
│  │  ┌─────────────────────────────────┐                    │    │
│  │  │  + Add Rule                     │                    │    │
│  │  └─────────────────────────────────┘                    │    │
│  └─────────────────────────────────────────────────────────┘    │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Paso 3: Configurar Intervalo Simple

Primero, configuremos un intervalo simple:

1. En el Schedule Trigger, selecciona la regla por defecto
2. Configura:
   - **Trigger Interval**: `Minutes`
   - **Minutes Between Triggers**: `5`

Esto ejecutaría el workflow cada 5 minutos (no lo activaremos en producción todavía).

### Paso 4: Cambiar a Expresión Cron

Ahora cambiemos a una expresión cron más específica:

1. En "Rule", selecciona **"Cron"**
2. Ingresa la expresión: `0 9 * * 1-5`
3. Esta expresión significa: "A las 9:00 AM, de lunes a viernes"

```
┌─────────────────────────────────────────────────────────────────┐
│              EXPRESIÓN CRON CONFIGURADA                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  Cron Expression: 0 9 * * 1-5                                   │
│                                                                  │
│  Desglose:                                                      │
│  ┌─────┬─────┬─────┬─────┬─────┐                               │
│  │  0  │  9  │  *  │  *  │ 1-5 │                               │
│  └──┬──┴──┬──┴──┬──┴──┬──┴──┬──┘                               │
│     │     │     │     │     │                                   │
│     │     │     │     │     └─► Día de semana: Lunes a Viernes  │
│     │     │     │     └──────► Mes: Cualquiera                  │
│     │     │     └────────────► Día del mes: Cualquiera          │
│     │     └──────────────────► Hora: 9 AM                       │
│     └────────────────────────► Minuto: 0                        │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Paso 5: Configurar Zona Horaria

⚠️ **MUY IMPORTANTE**: Siempre configura la zona horaria

1. En el Schedule Trigger, busca **"Timezone"**
2. Selecciona tu zona horaria (por ejemplo: `America/Mexico_City`)

### Paso 6: Agregar Nodo de Registro

1. Conecta un nodo **"Edit Fields (Set)"** desde el Schedule Trigger
2. Renómbralo a: `Registrar Ejecución`
3. Configura los campos:

| Campo         | Tipo   | Valor/Expresión              |
| ------------- | ------ | ---------------------------- |
| `executionId` | String | `{{ $execution.id }}`        |
| `executedAt`  | String | `{{ $now.toISO() }}`         |
| `triggerTime` | String | `{{ $json.timestamp }}`      |
| `dayOfWeek`   | String | `{{ $json["Day of week"] }}` |
| `hour`        | String | `{{ $json.Hour }}`           |
| `minute`      | String | `{{ $json.Minute }}`         |
| `timezone`    | String | `{{ $json.Timezone }}`       |

### Paso 7: Agregar Lógica de Horario

1. Conecta un nodo **"IF"** desde "Registrar Ejecución"
2. Renómbralo a: `Es Horario Laboral?`
3. Configura:
   - **Value 1**: `{{ Number($json.hour) }}`
   - **Operation**: `Is Between`
   - **Value 2**: `8`
   - **Value 3**: `18`

### Paso 8: Agregar Respuestas Según Horario

**Rama True (Horario Laboral):**

1. Agrega **"Edit Fields (Set)"**
2. Renómbralo a: `Estado: Activo`
3. Campos:
   - `status`: `active`
   - `message`: `Sistema operando en horario laboral`
   - `priority`: `normal`

**Rama False (Fuera de Horario):**

1. Agrega **"Edit Fields (Set)"**
2. Renómbralo a: `Estado: Standby`
3. Campos:
   - `status`: `standby`
   - `message`: `Sistema en modo reducido fuera de horario`
   - `priority`: `low`

---

## 🔄 Flujo Completo

```
┌─────────────────────────────────────────────────────────────────┐
│           WORKFLOW: practica-02-schedule-trigger                 │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌────────────────┐                                              │
│  │ ⏰ Schedule    │  Cron: 0 9 * * 1-5                          │
│  │    Trigger     │  TZ: America/Mexico_City                    │
│  └───────┬────────┘                                              │
│          │                                                       │
│          ▼                                                       │
│  ┌────────────────┐                                              │
│  │ 📝 Registrar   │  Captura info de la ejecución               │
│  │    Ejecución   │                                              │
│  └───────┬────────┘                                              │
│          │                                                       │
│          ▼                                                       │
│  ┌────────────────┐                                              │
│  │ ❓ Es Horario  │  Hora entre 8 y 18?                         │
│  │    Laboral?    │                                              │
│  └───────┬────────┘                                              │
│          │                                                       │
│    ┌─────┴─────┐                                                 │
│    │           │                                                 │
│    ▼           ▼                                                 │
│  ┌──────┐   ┌──────┐                                            │
│  │ ✅   │   │ 🌙   │                                            │
│  │Estado│   │Estado│                                            │
│  │Activo│   │Standby                                            │
│  └──────┘   └──────┘                                            │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 🧪 Experimentos

### Experimento 1: Probar con Manual Trigger

Para probar sin esperar el schedule:

1. Agrega temporalmente un **Manual Trigger** en paralelo
2. Conecta el Manual Trigger al mismo flujo
3. Ejecuta manualmente para probar la lógica
4. Cuando todo funcione, elimina el Manual Trigger

### Experimento 2: Múltiples Schedules

Configura múltiples reglas de ejecución:

1. En el Schedule Trigger, haz clic en **"+ Add Rule"**
2. Agrega otra expresión cron: `0 12 * * *` (mediodía todos los días)
3. Agrega otra: `0 18 * * 1-5` (6 PM días laborales)

El workflow se ejecutará en todos los horarios configurados.

### Experimento 3: Expresiones Cron Avanzadas

Prueba estas expresiones y verifica qué hacen:

| Expresión         | Tu predicción | Verificación en crontab.guru |
| ----------------- | ------------- | ---------------------------- |
| `*/15 * * * *`    |               |                              |
| `0 9,12,18 * * *` |               |                              |
| `0 0 1 * *`       |               |                              |
| `30 8 * * 1`      |               |                              |

---

## ✅ Criterios de Éxito

Tu práctica está completa cuando:

- [ ] Schedule Trigger configurado con expresión cron
- [ ] Zona horaria correctamente establecida
- [ ] Workflow captura datos del trigger (timestamp, día, hora)
- [ ] Lógica condicional funciona según el horario
- [ ] Puedes explicar qué hace la expresión `0 9 * * 1-5`
- [ ] Has probado múltiples expresiones cron

---

## 📊 Datos del Schedule Trigger

El Schedule Trigger proporciona estos datos automáticamente:

```json
{
  "timestamp": "2024-01-15T15:00:00.000Z",
  "Readable date": "January 15, 2024 at 03:00 PM",
  "Readable time": "15:00:00",
  "Day of week": "Monday",
  "Year": "2024",
  "Month": "January",
  "Day of month": "15",
  "Hour": "15",
  "Minute": "00",
  "Second": "00",
  "Timezone": "America/Mexico_City"
}
```

---

## 💡 Tips y Mejores Prácticas

1. **Siempre configura timezone**: No confíes en el valor por defecto
2. **Prueba con Manual Trigger primero**: Desarrolla la lógica antes de activar el schedule
3. **Cuidado con DST**: El horario de verano puede afectar tus schedules
4. **Documenta las expresiones cron**: Agrega una nota al nodo explicando cuándo se ejecuta
5. **No actives schedules muy frecuentes**: Cada ejecución consume recursos

---

## ⚠️ Nota Importante

**NO actives este workflow en producción** (no hagas clic en "Active") durante la práctica. Solo usa "Test Workflow" para probar.

Si lo activas accidentalmente:

1. Ve al workflow
2. Haz clic en el toggle "Active" para desactivarlo
3. O usa el dashboard de ejecuciones para pausarlo

---

## 🔗 Recursos

- 📖 [Documentación Schedule Trigger](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.scheduletrigger/)
- 🔧 [Crontab Guru](https://crontab.guru/)
- 📖 [Lista de Zonas Horarias](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)

---

## 🏠 Navegación

| ⬅️ Anterior                                          | 💻 Práctica Actual        | ➡️ Siguiente                                         |
| ---------------------------------------------------- | ------------------------- | ---------------------------------------------------- |
| [01 - Trigger Manual](practica-01-trigger-manual.md) | **02 - Schedule Trigger** | [03 - Webhook Básico](practica-03-webhook-basico.md) |
