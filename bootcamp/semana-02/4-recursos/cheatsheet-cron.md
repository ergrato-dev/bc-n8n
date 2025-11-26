# 📋 Cheatsheet: Expresiones Cron

## Referencia Rápida

![Cheatsheet](https://img.shields.io/badge/Tipo-Cheatsheet-FF6D5A?style=flat-square)
![Tema](https://img.shields.io/badge/Tema-Cron-00D4FF?style=flat-square)

---

## 🔢 Estructura de Cron

```
┌───────────── minuto (0-59)
│ ┌─────────── hora (0-23)
│ │ ┌───────── día del mes (1-31)
│ │ │ ┌─────── mes (1-12 o JAN-DEC)
│ │ │ │ ┌───── día de la semana (0-7 o SUN-SAT)
│ │ │ │ │
│ │ │ │ │
* * * * *
```

---

## 🔣 Caracteres Especiales

| Carácter | Significado | Ejemplo | Descripción |
|----------|-------------|---------|-------------|
| `*` | Cualquier valor | `* * * * *` | Cada minuto |
| `,` | Lista de valores | `0,30 * * * *` | Min 0 y 30 |
| `-` | Rango | `0 9-17 * * *` | 9 AM a 5 PM |
| `/` | Incremento | `*/15 * * * *` | Cada 15 min |

---

## ⏰ Expresiones Comunes

### Intervalos de Tiempo

| Expresión | Descripción |
|-----------|-------------|
| `* * * * *` | Cada minuto |
| `*/5 * * * *` | Cada 5 minutos |
| `*/10 * * * *` | Cada 10 minutos |
| `*/15 * * * *` | Cada 15 minutos |
| `*/30 * * * *` | Cada 30 minutos |
| `0 * * * *` | Cada hora (en punto) |
| `0 */2 * * *` | Cada 2 horas |
| `0 */4 * * *` | Cada 4 horas |
| `0 */6 * * *` | Cada 6 horas |
| `0 */12 * * *` | Cada 12 horas |

### Horarios Específicos

| Expresión | Descripción |
|-----------|-------------|
| `0 9 * * *` | 9:00 AM todos los días |
| `30 8 * * *` | 8:30 AM todos los días |
| `0 12 * * *` | Mediodía todos los días |
| `0 18 * * *` | 6:00 PM todos los días |
| `0 0 * * *` | Medianoche |
| `0 9,18 * * *` | 9 AM y 6 PM |
| `0 9,12,18 * * *` | 9 AM, 12 PM, 6 PM |

### Días de la Semana

| Expresión | Descripción |
|-----------|-------------|
| `0 9 * * 1` | Lunes 9 AM |
| `0 9 * * 1-5` | Lunes a Viernes 9 AM |
| `0 9 * * 0,6` | Sábado y Domingo 9 AM |
| `0 9 * * MON` | Lunes 9 AM |
| `0 9 * * MON-FRI` | Lunes a Viernes 9 AM |

### Días del Mes

| Expresión | Descripción |
|-----------|-------------|
| `0 9 1 * *` | Día 1 de cada mes, 9 AM |
| `0 9 15 * *` | Día 15 de cada mes, 9 AM |
| `0 9 1,15 * *` | Días 1 y 15, 9 AM |
| `0 0 1 1 *` | 1 de Enero, medianoche |

### Horario Laboral

| Expresión | Descripción |
|-----------|-------------|
| `0 9 * * 1-5` | L-V 9 AM |
| `0 8-18 * * 1-5` | L-V cada hora 8AM-6PM |
| `*/30 9-17 * * 1-5` | L-V cada 30min 9AM-5PM |
| `0 9-18/2 * * 1-5` | L-V cada 2h de 9AM-6PM |

---

## 📅 Días de la Semana

| Número | Nombre | Abreviatura |
|--------|--------|-------------|
| 0 | Domingo | SUN |
| 1 | Lunes | MON |
| 2 | Martes | TUE |
| 3 | Miércoles | WED |
| 4 | Jueves | THU |
| 5 | Viernes | FRI |
| 6 | Sábado | SAT |
| 7 | Domingo | SUN |

> **Nota**: Tanto 0 como 7 representan Domingo

---

## 📆 Meses

| Número | Nombre | Abreviatura |
|--------|--------|-------------|
| 1 | Enero | JAN |
| 2 | Febrero | FEB |
| 3 | Marzo | MAR |
| 4 | Abril | APR |
| 5 | Mayo | MAY |
| 6 | Junio | JUN |
| 7 | Julio | JUL |
| 8 | Agosto | AUG |
| 9 | Septiembre | SEP |
| 10 | Octubre | OCT |
| 11 | Noviembre | NOV |
| 12 | Diciembre | DEC |

---

## ⚠️ Errores Comunes

| ❌ Incorrecto | ✅ Correcto | Problema |
|--------------|-------------|----------|
| `9 * * * *` | `0 9 * * *` | 9 es el minuto, no la hora |
| `0 9 * * 7-1` | `0 9 * * 0,1-5,6` | Rango inválido |
| `60 * * * *` | `0 * * * *` | Minuto 60 no existe |
| `0 24 * * *` | `0 0 * * *` | Hora 24 no existe |

---

## 🔍 Validar tu Cron

Usa estas herramientas para verificar:

1. **[Crontab Guru](https://crontab.guru/)** - Explica en inglés simple
2. **[Cronitor](https://crontab.cronitor.io/)** - Genera desde descripción
3. **n8n Schedule Trigger** - Muestra próximas ejecuciones

---

## 📝 Ejercicios Rápidos

Escribe la expresión cron para:

| # | Descripción | Tu Respuesta |
|---|-------------|--------------|
| 1 | Cada hora en punto | |
| 2 | 9 AM todos los días | |
| 3 | Cada 15 minutos | |
| 4 | Lunes a Viernes 8 AM | |
| 5 | Primer día del mes a medianoche | |

<details>
<summary>Ver Respuestas</summary>

1. `0 * * * *`
2. `0 9 * * *`
3. `*/15 * * * *`
4. `0 8 * * 1-5`
5. `0 0 1 * *`

</details>

---

## 🏠 Navegación

| ⬅️ Anterior | 📚 Recurso Actual | ➡️ Siguiente |
|------------|-------------------|--------------|
| [Enlaces Útiles](enlaces-utiles.md) | **Cheatsheet Cron** | [Cheatsheet Webhooks](cheatsheet-webhooks.md) |
