# 📚 Módulo 02: Expresiones Cron

![Cron](https://img.shields.io/badge/Tema-Expresiones_Cron-FF6D5A?style=flat-square)
![Tiempo](https://img.shields.io/badge/Tiempo-30_min-00D4FF?style=flat-square)
![Nivel](https://img.shields.io/badge/Nivel-Principiante-00A86B?style=flat-square)

---

## 🎯 Objetivos del Módulo

Al finalizar este módulo, serás capaz de:

- Comprender la sintaxis de las expresiones cron
- Crear expresiones cron para diferentes horarios
- Usar herramientas para validar expresiones cron
- Aplicar expresiones cron en Schedule Trigger de n8n

---

## 📚 Contenido

### 2.1 ¿Qué es Cron?

**Cron** es un sistema de programación de tareas que se originó en sistemas Unix/Linux. Las **expresiones cron** son cadenas de texto que definen cuándo debe ejecutarse una tarea.

#### Historia Breve

> El nombre "cron" viene del griego "χρόνος" (chronos), que significa tiempo. Fue creado en los años 70 para sistemas Unix y se ha convertido en el estándar para programar tareas en todo tipo de sistemas.

#### ¿Por qué Aprender Cron?

Las expresiones cron son universales:

| Sistema/Herramienta | Usa Cron |
| ------------------- | -------- |
| n8n                 | ✅       |
| Linux/Unix          | ✅       |
| GitHub Actions      | ✅       |
| AWS CloudWatch      | ✅       |
| Google Cloud        | ✅       |
| Kubernetes          | ✅       |

### 2.2 Anatomía de una Expresión Cron

Una expresión cron estándar tiene **5 campos** (algunas implementaciones tienen 6 o 7):

![Expresión Cron](../0-assets/02-expresion-cron.svg)

> 📊 **Diagrama**: Anatomía visual de una expresión cron con ejemplo explicado.

```
┌─────────────────────────────────────────────────────────────────┐
│                  ESTRUCTURA DE EXPRESIÓN CRON                    │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│   ┌───────────── minuto (0-59)                                  │
│   │ ┌─────────── hora (0-23)                                    │
│   │ │ ┌───────── día del mes (1-31)                             │
│   │ │ │ ┌─────── mes (1-12)                                     │
│   │ │ │ │ ┌───── día de la semana (0-7, donde 0 y 7 = domingo)  │
│   │ │ │ │ │                                                     │
│   │ │ │ │ │                                                     │
│   * * * * *                                                      │
│                                                                  │
│   Ejemplo: 0 9 * * 1-5                                          │
│   = "A las 9:00 AM, de lunes a viernes"                         │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

#### Tabla de Campos

| Campo            | Valores Permitidos | Caracteres Especiales |
| ---------------- | ------------------ | --------------------- |
| Minuto           | 0-59               | \* , - /              |
| Hora             | 0-23               | \* , - /              |
| Día del mes      | 1-31               | \* , - / L W          |
| Mes              | 1-12 o JAN-DEC     | \* , - /              |
| Día de la semana | 0-7 o SUN-SAT      | \* , - / L #          |

### 2.3 Caracteres Especiales

Comprender los caracteres especiales es clave para crear expresiones cron flexibles:

#### El Asterisco `*` (Cualquier valor)

```
┌─────────────────────────────────────────────────────────────────┐
│  * = "cualquier valor" o "todos los valores"                     │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  * * * * *  = Cada minuto, de cada hora, de cada día,           │
│               de cada mes, cualquier día de la semana            │
│                                                                  │
│  0 * * * *  = Minuto 0 de cada hora                             │
│               (cada hora en punto)                               │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

#### La Coma `,` (Lista de valores)

```
┌─────────────────────────────────────────────────────────────────┐
│  , = lista de valores específicos                                │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  0 9,12,18 * * *  = A las 9:00, 12:00 y 18:00                   │
│                                                                  │
│  0 0 1,15 * *     = El día 1 y 15 de cada mes a medianoche      │
│                                                                  │
│  0 8 * * 1,3,5    = Lunes, miércoles y viernes a las 8:00       │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

#### El Guión `-` (Rango de valores)

```
┌─────────────────────────────────────────────────────────────────┐
│  - = rango de valores (desde-hasta)                              │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  0 9-17 * * *     = Cada hora de 9:00 a 17:00                   │
│                     (horario laboral)                            │
│                                                                  │
│  0 8 * * 1-5      = Lunes a viernes a las 8:00                  │
│                                                                  │
│  */5 8-18 * * *   = Cada 5 min de 8:00 a 18:00                  │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

#### La Barra `/` (Incrementos)

```
┌─────────────────────────────────────────────────────────────────┐
│  / = incrementos o "cada X"                                      │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  */5 * * * *      = Cada 5 minutos                              │
│                                                                  │
│  0 */2 * * *      = Cada 2 horas (en punto)                     │
│                                                                  │
│  */15 9-17 * * *  = Cada 15 min, de 9 AM a 5 PM                 │
│                                                                  │
│  0 0 */3 * *      = Cada 3 días a medianoche                    │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### 2.4 Expresiones Cron Comunes

Aquí tienes una biblioteca de expresiones cron para casos de uso frecuentes:

#### Intervalos de Tiempo

| Expresión      | Descripción          |
| -------------- | -------------------- |
| `* * * * *`    | Cada minuto          |
| `*/5 * * * *`  | Cada 5 minutos       |
| `*/15 * * * *` | Cada 15 minutos      |
| `*/30 * * * *` | Cada 30 minutos      |
| `0 * * * *`    | Cada hora (en punto) |
| `0 */2 * * *`  | Cada 2 horas         |
| `0 */6 * * *`  | Cada 6 horas         |

#### Horarios Específicos

| Expresión      | Descripción                  |
| -------------- | ---------------------------- |
| `0 9 * * *`    | Todos los días a las 9:00 AM |
| `0 0 * * *`    | Todos los días a medianoche  |
| `0 12 * * *`   | Todos los días a mediodía    |
| `30 8 * * *`   | Todos los días a las 8:30 AM |
| `0 9,18 * * *` | A las 9:00 AM y 6:00 PM      |

#### Días de la Semana

| Expresión       | Descripción                       |
| --------------- | --------------------------------- |
| `0 9 * * 1-5`   | Lunes a Viernes a las 9:00 AM     |
| `0 9 * * 1`     | Todos los Lunes a las 9:00 AM     |
| `0 10 * * 6,0`  | Sábados y Domingos a las 10:00 AM |
| `0 8 * * 1,3,5` | Lunes, Miércoles, Viernes 8:00 AM |

#### Días del Mes

| Expresión      | Descripción                      |
| -------------- | -------------------------------- |
| `0 9 1 * *`    | Primer día del mes a las 9:00 AM |
| `0 9 15 * *`   | Día 15 de cada mes a las 9:00 AM |
| `0 0 1,15 * *` | Días 1 y 15 a medianoche         |
| `0 9 L * *`    | Último día del mes a las 9:00 AM |

#### Combinaciones Empresariales

| Expresión           | Descripción                     |
| ------------------- | ------------------------------- |
| `0 9 * * 1-5`       | Horario laboral: L-V 9 AM       |
| `0 8-18 * * 1-5`    | Cada hora de 8 AM a 6 PM, L-V   |
| `*/30 9-17 * * 1-5` | Cada 30 min horario laboral     |
| `0 0 1 * *`         | Inicio de cada mes              |
| `0 0 1 1 *`         | Inicio de cada año (1 de enero) |

### 2.5 Expresiones Cron en n8n

n8n utiliza la biblioteca `cron-parser` que soporta la sintaxis estándar de 5 campos.

#### Configuración en Schedule Trigger

```
┌─────────────────────────────────────────────────────────────────┐
│                 n8n Schedule Trigger                             │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌───────────────────────────────────────────────────────────┐  │
│  │  Trigger Mode: [Cron Expression v]                        │  │
│  └───────────────────────────────────────────────────────────┘  │
│                                                                  │
│  ┌───────────────────────────────────────────────────────────┐  │
│  │  Cron Expression: [ 0 9 * * 1-5                        ]  │  │
│  └───────────────────────────────────────────────────────────┘  │
│                                                                  │
│  ┌───────────────────────────────────────────────────────────┐  │
│  │  Timezone: [ America/Mexico_City                    v ]   │  │
│  └───────────────────────────────────────────────────────────┘  │
│                                                                  │
│  Próximas ejecuciones:                                          │
│  • Mon, Jan 15 2024 09:00:00 AM                                 │
│  • Tue, Jan 16 2024 09:00:00 AM                                 │
│  • Wed, Jan 17 2024 09:00:00 AM                                 │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

#### Múltiples Cron en un Workflow

Puedes configurar múltiples expresiones cron en el mismo Schedule Trigger:

```json
// Configuración de múltiples schedules
{
  "trigger": "schedule",
  "schedules": [
    {
      "mode": "cron",
      "expression": "0 9 * * 1-5", // 9 AM Lunes-Viernes
      "timezone": "America/Mexico_City"
    },
    {
      "mode": "cron",
      "expression": "0 12 * * 6", // 12 PM Sábados
      "timezone": "America/Mexico_City"
    }
  ]
}
```

### 2.6 Zona Horaria (Timezone)

#### Importancia de la Zona Horaria

⚠️ **MUY IMPORTANTE**: La zona horaria determina cuándo realmente se ejecuta el workflow.

```
┌─────────────────────────────────────────────────────────────────┐
│              CRON + ZONA HORARIA                                 │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  Expresión: 0 9 * * *  (9:00 AM)                                │
│                                                                  │
│  Con Timezone America/Mexico_City:                              │
│  └─► Se ejecuta a las 9:00 AM hora de México                    │
│                                                                  │
│  Con Timezone Europe/Madrid:                                    │
│  └─► Se ejecuta a las 9:00 AM hora de España                    │
│                                                                  │
│  Con Timezone UTC:                                              │
│  └─► Se ejecuta a las 9:00 AM UTC                               │
│      (3:00 AM en México, 10:00 AM en España)                    │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

#### Zonas Horarias Comunes

| Zona Horaria           | Región           | UTC Offset    |
| ---------------------- | ---------------- | ------------- |
| `America/Mexico_City`  | México Central   | UTC-6 / UTC-5 |
| `America/Bogota`       | Colombia         | UTC-5         |
| `America/Santiago`     | Chile            | UTC-4 / UTC-3 |
| `America/Buenos_Aires` | Argentina        | UTC-3         |
| `Europe/Madrid`        | España           | UTC+1 / UTC+2 |
| `UTC`                  | Tiempo Universal | UTC           |

#### Consideraciones de DST (Horario de Verano)

```
┌─────────────────────────────────────────────────────────────────┐
│  ⚠️ ADVERTENCIA: Horario de Verano (DST)                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  En países con cambio de horario:                               │
│                                                                  │
│  • Una hora puede ejecutarse 2 veces (cuando se atrasa)         │
│  • Una hora puede no ejecutarse (cuando se adelanta)            │
│                                                                  │
│  Ejemplo: Si tu workflow se ejecuta a las 2:30 AM               │
│  y el cambio de horario ocurre a las 2:00 AM:                   │
│                                                                  │
│  Primavera (adelantar): 2:30 AM no existe ese día               │
│  Otoño (atrasar): 2:30 AM ocurre dos veces                      │
│                                                                  │
│  💡 RECOMENDACIÓN: Evita horas cercanas al cambio de horario    │
│     o usa zonas sin DST (como UTC)                              │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### 2.7 Herramientas para Validar Cron

#### Herramientas Online Recomendadas

| Herramienta   | URL                       | Características                |
| ------------- | ------------------------- | ------------------------------ |
| Crontab Guru  | crontab.guru              | Explicaciones en inglés simple |
| Cronitor      | crontab.cronitor.io       | Genera cron desde descripción  |
| FreeFormatter | freeformatter.com/cron... | Múltiples formatos             |

#### Crontab Guru (Recomendado)

```
┌─────────────────────────────────────────────────────────────────┐
│                    crontab.guru                                  │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  Expresión: 0 9 * * 1-5                                         │
│                                                                  │
│  "At 09:00 on every day-of-week from Monday through Friday."    │
│                                                                  │
│  Próximas ejecuciones:                                          │
│  2024-01-15 09:00:00                                            │
│  2024-01-16 09:00:00                                            │
│  2024-01-17 09:00:00                                            │
│  2024-01-18 09:00:00                                            │
│  2024-01-19 09:00:00                                            │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### 2.8 Errores Comunes y Cómo Evitarlos

#### ❌ Error 1: Olvidar la Zona Horaria

```javascript
// ❌ MAL: No especificar timezone
// El cron usa la zona horaria del servidor (puede variar)
cron: '0 9 * * *';

// ✅ BIEN: Especificar timezone explícitamente
cron: '0 9 * * *';
timezone: 'America/Mexico_City';
```

#### ❌ Error 2: Frecuencia Excesiva

```javascript
// ❌ MAL: Ejecutar cada segundo (consume recursos)
cron: '* * * * * *'; // Si se soportan 6 campos

// ✅ BIEN: Evaluar si realmente necesitas tanta frecuencia
cron: '*/5 * * * *'; // Cada 5 minutos suele ser suficiente
```

#### ❌ Error 3: Confundir Día de Semana

```javascript
// ❌ MAL: Pensar que 1 = domingo
// En la mayoría de implementaciones: 0 = domingo, 1 = lunes

// ✅ BIEN: Usar nombres o verificar
cron: '0 9 * * MON-FRI'; // Más claro
cron: '0 9 * * 1-5'; // 1=lunes, 5=viernes
```

#### ❌ Error 4: Expresiones Ambiguas

```javascript
// ❌ MAL: Día del mes Y día de semana
// "El día 15 Y los lunes" - comportamiento confuso
cron: '0 9 15 * 1';

// ✅ BIEN: Usar solo uno de los dos campos
cron: '0 9 15 * *'; // Solo día 15
cron: '0 9 * * 1'; // Solo lunes
```

---

## 📝 Cheatsheet de Cron

```
┌─────────────────────────────────────────────────────────────────┐
│                   CRON CHEATSHEET                                │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ESTRUCTURA:  minuto hora día-mes mes día-semana                │
│               (0-59) (0-23) (1-31) (1-12) (0-7)                  │
│                                                                  │
│  CARACTERES ESPECIALES:                                         │
│  ─────────────────────                                          │
│  *     Cualquier valor                                          │
│  ,     Lista: 1,3,5                                             │
│  -     Rango: 1-5                                               │
│  /     Incremento: */15                                         │
│                                                                  │
│  EJEMPLOS RÁPIDOS:                                              │
│  ─────────────────                                              │
│  */5 * * * *     Cada 5 minutos                                 │
│  0 * * * *       Cada hora                                      │
│  0 9 * * *       9 AM diario                                    │
│  0 9 * * 1-5     9 AM L-V                                       │
│  0 0 1 * *       Medianoche, día 1                              │
│  0 9,18 * * *    9 AM y 6 PM                                    │
│                                                                  │
│  DÍAS DE SEMANA:                                                │
│  ────────────────                                               │
│  0 = Domingo (también 7)                                        │
│  1 = Lunes                                                      │
│  2 = Martes                                                     │
│  3 = Miércoles                                                  │
│  4 = Jueves                                                     │
│  5 = Viernes                                                    │
│  6 = Sábado                                                     │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 💡 Ejercicios de Práctica

Intenta crear la expresión cron para cada caso:

| #   | Descripción                                    | Tu Respuesta |
| --- | ---------------------------------------------- | ------------ |
| 1   | Cada hora en punto                             |              |
| 2   | Todos los días a las 6:30 PM                   |              |
| 3   | Cada 10 minutos                                |              |
| 4   | Lunes y Jueves a las 10:00 AM                  |              |
| 5   | Primer día de cada mes a medianoche            |              |
| 6   | De Lunes a Viernes cada 2 horas de 8 AM a 6 PM |              |

<details>
<summary>Ver Respuestas</summary>

1. `0 * * * *`
2. `30 18 * * *`
3. `*/10 * * * *`
4. `0 10 * * 1,4`
5. `0 0 1 * *`
6. `0 8-18/2 * * 1-5`

</details>

---

## 🔗 Recursos Adicionales

- 📖 [Documentación n8n - Schedule Trigger](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.scheduletrigger/)
- 🔧 [Crontab Guru - Editor de Cron](https://crontab.guru/)
- 📝 [Módulo anterior: Tipos de Triggers](01-tipos-triggers.md)
- 📝 [Módulo siguiente: Debugging en n8n](03-debugging-n8n.md)

---

## ❓ Preguntas de Reflexión

1. ¿Por qué es importante especificar la zona horaria en expresiones cron?
2. ¿Qué problemas pueden surgir con el horario de verano (DST)?
3. ¿Cuándo usarías un intervalo simple vs una expresión cron compleja?
4. ¿Cómo validarías que tu expresión cron hace lo que esperas?

---

## 🏠 Navegación

| ⬅️ Anterior                                    | 📚 Módulo Actual          | ➡️ Siguiente                                 |
| ---------------------------------------------- | ------------------------- | -------------------------------------------- |
| [01 - Tipos de Triggers](01-tipos-triggers.md) | **02 - Expresiones Cron** | [03 - Debugging en n8n](03-debugging-n8n.md) |
