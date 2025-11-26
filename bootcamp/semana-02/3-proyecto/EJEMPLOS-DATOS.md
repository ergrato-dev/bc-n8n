# 📊 Ejemplos de Datos - Sistema de Recordatorios

## Datos de Prueba para el Proyecto

![Datos](https://img.shields.io/badge/Tipo-Ejemplos_de_Datos-FF6D5A?style=flat-square)
![Proyecto](https://img.shields.io/badge/Proyecto-Semana_02-00D4FF?style=flat-square)

---

## 📥 Datos de Entrada

### Manual Trigger

El Manual Trigger no recibe datos externos, pero el nodo "Origen: Manual" debe generar:

```json
{
  "triggerType": "manual",
  "triggerSource": "User initiated",
  "timestamp": "2024-01-15T14:30:00.000Z",
  "title": "Recordatorio de prueba",
  "message": "Este es un recordatorio generado manualmente para testing",
  "priority": "normal",
  "recipient": "test@ejemplo.com"
}
```

### Schedule Trigger

El Schedule Trigger genera automáticamente:

```json
{
  "timestamp": "2024-01-15T09:00:00.000Z",
  "Readable date": "January 15, 2024 at 09:00 AM",
  "Readable time": "09:00:00",
  "Day of week": "Monday",
  "Year": "2024",
  "Month": "January",
  "Day of month": "15",
  "Hour": "09",
  "Minute": "00",
  "Second": "00",
  "Timezone": "America/Mexico_City"
}
```

El nodo "Origen: Schedule" debe transformarlo a:

```json
{
  "triggerType": "scheduled",
  "triggerSource": "09:00 Cron",
  "timestamp": "2024-01-15T09:00:00.000Z",
  "title": "🌅 Recordatorio Matutino",
  "message": "Buenos días. Revisa tu agenda del día y prioriza tus tareas.",
  "priority": "normal",
  "recipient": "equipo@empresa.com"
}
```

### Webhook Trigger

#### Petición HTTP Exitosa

```bash
curl -X POST http://localhost:5678/webhook-test/recordatorios \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Reunión de Sprint Planning",
    "message": "No olvides preparar tus puntos para la reunión de planning a las 10 AM",
    "priority": "high",
    "recipient": "dev-team@empresa.com"
  }'
```

El Webhook recibe:

```json
{
  "headers": {
    "host": "localhost:5678",
    "user-agent": "curl/7.68.0",
    "accept": "*/*",
    "content-type": "application/json",
    "content-length": "165"
  },
  "params": {},
  "query": {},
  "body": {
    "title": "Reunión de Sprint Planning",
    "message": "No olvides preparar tus puntos para la reunión de planning a las 10 AM",
    "priority": "high",
    "recipient": "dev-team@empresa.com"
  }
}
```

El nodo "Origen: Webhook" debe transformarlo a:

```json
{
  "triggerType": "webhook",
  "triggerSource": "External API",
  "timestamp": "2024-01-15T14:35:22.000Z",
  "title": "Reunión de Sprint Planning",
  "message": "No olvides preparar tus puntos para la reunión de planning a las 10 AM",
  "priority": "high",
  "recipient": "dev-team@empresa.com"
}
```

---

## 🧪 Casos de Prueba con cURL

### Caso 1: Recordatorio Básico

```bash
curl -X POST http://localhost:5678/webhook-test/recordatorios \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Llamar al cliente",
    "message": "Recordatorio: llamar a Cliente ABC para seguimiento del proyecto",
    "priority": "normal",
    "recipient": "ventas@empresa.com"
  }'
```

### Caso 2: Recordatorio Urgente

```bash
curl -X POST http://localhost:5678/webhook-test/recordatorios \
  -H "Content-Type: application/json" \
  -d '{
    "title": "⚠️ URGENTE: Vencimiento de contrato",
    "message": "El contrato con Proveedor XYZ vence mañana. Necesita renovación inmediata.",
    "priority": "high",
    "recipient": "legal@empresa.com"
  }'
```

### Caso 3: Recordatorio de Baja Prioridad

```bash
curl -X POST http://localhost:5678/webhook-test/recordatorios \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Actualizar documentación",
    "message": "Cuando tengas tiempo, actualiza la documentación del proyecto",
    "priority": "low",
    "recipient": "docs@empresa.com"
  }'
```

### Caso 4: Datos Incompletos (Para Probar Error)

```bash
# Falta el campo "message"
curl -X POST http://localhost:5678/webhook-test/recordatorios \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Recordatorio sin mensaje"
  }'
```

### Caso 5: Datos Mínimos Válidos

```bash
curl -X POST http://localhost:5678/webhook-test/recordatorios \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Título mínimo",
    "message": "Mensaje mínimo"
  }'
```

---

## 📤 Datos de Salida Esperados

### Salida Exitosa (status: "sent")

```json
{
  "reminderId": "REM-1705323322000",
  "triggerType": "webhook",
  "triggerSource": "External API",
  "timestamp": "2024-01-15T14:35:22.000Z",
  "title": "Reunión de Sprint Planning",
  "message": "No olvides preparar tus puntos para la reunión de planning a las 10 AM",
  "priority": "high",
  "recipient": "dev-team@empresa.com",
  "processedAt": "2024-01-15T14:35:22.500Z",
  "status": "sent",
  "sentAt": "2024-01-15T14:35:22.600Z",
  "responseMessage": "Recordatorio enviado correctamente"
}
```

### Salida de Error (status: "failed")

```json
{
  "status": "failed",
  "error": "Datos incompletos",
  "errorDetails": "Se requiere title y message para procesar el recordatorio",
  "receivedData": "{\"title\":\"Recordatorio sin mensaje\"}",
  "failedAt": "2024-01-15T14:36:00.000Z",
  "triggerType": "webhook"
}
```

---

## 📅 Datos de Schedule por Horario

### 9:00 AM - Recordatorio Matutino

```json
{
  "reminderId": "REM-1705309200000",
  "triggerType": "scheduled",
  "triggerSource": "09:00 Cron",
  "timestamp": "2024-01-15T15:00:00.000Z",
  "title": "🌅 Recordatorio Matutino",
  "message": "Buenos días. Revisa tu agenda del día y prioriza tus tareas.",
  "priority": "normal",
  "recipient": "equipo@empresa.com",
  "processedAt": "2024-01-15T15:00:00.100Z",
  "status": "sent",
  "sentAt": "2024-01-15T15:00:00.200Z"
}
```

### 12:00 PM - Recordatorio de Mediodía

```json
{
  "reminderId": "REM-1705320000000",
  "triggerType": "scheduled",
  "triggerSource": "12:00 Cron",
  "timestamp": "2024-01-15T18:00:00.000Z",
  "title": "☀️ Recordatorio de Mediodía",
  "message": "Es mediodía. Toma un descanso y recuerda hidratarte.",
  "priority": "normal",
  "recipient": "equipo@empresa.com",
  "processedAt": "2024-01-15T18:00:00.100Z",
  "status": "sent",
  "sentAt": "2024-01-15T18:00:00.200Z"
}
```

### 6:00 PM - Recordatorio Vespertino

```json
{
  "reminderId": "REM-1705341600000",
  "triggerType": "scheduled",
  "triggerSource": "18:00 Cron",
  "timestamp": "2024-01-16T00:00:00.000Z",
  "title": "🌆 Recordatorio Vespertino",
  "message": "Fin de la jornada. Cierra tus tareas pendientes y prepara el día siguiente.",
  "priority": "normal",
  "recipient": "equipo@empresa.com",
  "processedAt": "2024-01-16T00:00:00.100Z",
  "status": "sent",
  "sentAt": "2024-01-16T00:00:00.200Z"
}
```

---

## 🔧 Pinned Data para Testing

### Pinned Data: Después del Merge

Puedes fijar estos datos después del nodo Merge para probar el flujo de procesamiento:

```json
[
  {
    "json": {
      "triggerType": "webhook",
      "triggerSource": "External API",
      "timestamp": "2024-01-15T14:35:22.000Z",
      "title": "Test con Pinned Data",
      "message": "Este es un mensaje de prueba usando datos fijados",
      "priority": "high",
      "recipient": "test@test.com"
    }
  }
]
```

### Pinned Data: Para Probar Error

```json
[
  {
    "json": {
      "triggerType": "webhook",
      "triggerSource": "External API",
      "timestamp": "2024-01-15T14:35:22.000Z",
      "title": "",
      "message": "",
      "priority": "normal",
      "recipient": "test@test.com"
    }
  }
]
```

### Pinned Data: Múltiples Recordatorios

```json
[
  {
    "json": {
      "triggerType": "webhook",
      "title": "Recordatorio 1",
      "message": "Primer recordatorio",
      "priority": "high",
      "recipient": "user1@test.com"
    }
  },
  {
    "json": {
      "triggerType": "webhook",
      "title": "Recordatorio 2",
      "message": "Segundo recordatorio",
      "priority": "normal",
      "recipient": "user2@test.com"
    }
  },
  {
    "json": {
      "triggerType": "webhook",
      "title": "",
      "message": "Este debería fallar",
      "priority": "low",
      "recipient": "user3@test.com"
    }
  }
]
```

---

## 📋 Matriz de Validación

| Campo       | Requerido | Valor por Defecto       | Validación           |
| ----------- | --------- | ----------------------- | -------------------- |
| `title`     | ✅ Sí     | N/A                     | No puede estar vacío |
| `message`   | ✅ Sí     | N/A                     | No puede estar vacío |
| `priority`  | ❌ No     | `"normal"`              | high, normal, low    |
| `recipient` | ❌ No     | `"default@empresa.com"` | Email válido         |

---

## 🎯 Escenarios de Prueba Completos

### Escenario A: Flujo Completo Manual

1. Ejecutar workflow con Manual Trigger
2. Verificar que `triggerType` = `"manual"`
3. Verificar que se generó `reminderId`
4. Verificar que `status` = `"sent"`

### Escenario B: Flujo Completo Webhook

1. Enviar petición cURL con todos los campos
2. Verificar respuesta HTTP 200
3. Verificar que los datos del body se procesaron
4. Verificar `status` = `"sent"`

### Escenario C: Manejo de Error

1. Enviar petición cURL sin campo `message`
2. Verificar que workflow no falla completamente
3. Verificar que se toma rama de error
4. Verificar `status` = `"failed"` con detalles del error

### Escenario D: Valores por Defecto

1. Enviar petición con solo `title` y `message`
2. Verificar que `priority` = `"normal"` (default)
3. Verificar que `recipient` = `"default@empresa.com"` (default)

---

## 🏠 Navegación

| ⬅️ Anterior                      | 📚 Documento Actual   | ➡️ Siguiente               |
| -------------------------------- | --------------------- | -------------------------- |
| [Guía de Diseño](GUIA-DISENO.md) | **Ejemplos de Datos** | [Recursos](../4-recursos/) |
