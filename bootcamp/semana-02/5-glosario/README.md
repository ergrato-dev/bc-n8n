# 📖 Glosario - Semana 02

## Triggers y Primeros Workflows

![Glosario](https://img.shields.io/badge/Tipo-Glosario-9B59B6?style=flat-square)
![Semana](https://img.shields.io/badge/Semana-02-00D4FF?style=flat-square)

---

## 📋 Términos de la Semana

Esta semana introducimos **15 nuevos términos** relacionados con triggers, webhooks y debugging.

---

## A

### Authentication (Autenticación)

> Proceso de verificar la identidad de quien envía una petición. En webhooks, puede ser Header Auth, Basic Auth, o ninguna.

```
Ejemplo: X-API-Key: mi-clave-secreta
```

---

## B

### Basic Auth

> Método de autenticación HTTP que usa usuario y contraseña codificados en Base64.

```
Header: Authorization: Basic dXN1YXJpbzpjb250cmFzZW5h
```

---

## C

### Content-Type

> Header HTTP que indica el tipo de datos enviados en el body de una petición.

```
Valores comunes:
- application/json
- application/x-www-form-urlencoded
- multipart/form-data
```

### Cron

> Sistema de programación de tareas basado en expresiones de tiempo. Originado en Unix, usado en Schedule Trigger de n8n.

```
Origen: "chronos" (tiempo en griego)
```

### Cron Expression

> Cadena de 5-6 campos que define cuándo ejecutar una tarea programada.

```
Formato: minuto hora día mes día-semana
Ejemplo: 0 9 * * 1-5 (9:00 AM, lunes a viernes)
```

### cURL

> Herramienta de línea de comandos para transferir datos con URLs. Útil para probar webhooks.

```bash
curl -X POST http://localhost:5678/webhook-test/mi-webhook \
  -H "Content-Type: application/json" \
  -d '{"nombre": "Juan"}'
```

---

## D

### Debugging

> Proceso sistemático de identificar, localizar y corregir errores en un workflow.

```
Herramientas en n8n:
- Execution Log
- Pinned Data
- Output Panel
```

---

## E

### Endpoint

> URL específica que acepta peticiones en una API o webhook.

```
Ejemplo: /webhook/procesar-pedido
```

### Execution Log

> Registro histórico de todas las ejecuciones de un workflow, incluyendo datos de entrada, salida y errores.

```
Acceso: Menú lateral > Executions
```

---

## H

### HTTP Method

> Verbo que indica la acción a realizar en una petición HTTP.

| Método | Acción     | Idempotente |
| ------ | ---------- | ----------- |
| GET    | Obtener    | Sí          |
| POST   | Crear      | No          |
| PUT    | Reemplazar | Sí          |
| PATCH  | Modificar  | No          |
| DELETE | Eliminar   | Sí          |

---

## M

### Manual Trigger

> Nodo trigger que inicia un workflow únicamente cuando el usuario lo ejecuta manualmente desde la interfaz de n8n.

```
Usos: Desarrollo, testing, tareas bajo demanda
```

### Merge Node

> Nodo que combina datos de múltiples ramas del workflow en una sola salida.

```
Modos: Append, Merge by Index, Merge by Key, etc.
```

### Multi-trigger

> Patrón de diseño donde un workflow tiene múltiples triggers que pueden iniciarlo independientemente.

```
Ejemplo: Webhook OR Schedule → mismo procesamiento
```

---

## P

### Payload

> Datos útiles enviados en el body de una petición HTTP, típicamente en formato JSON.

```json
{
  "nombre": "Juan",
  "email": "juan@email.com"
}
```

### Pinned Data

> Funcionalidad de n8n que permite fijar datos de prueba en un nodo para debugging sin ejecutar nodos anteriores.

```
Acceso: Click derecho en nodo > Pin Data
```

### Production URL

> URL del webhook que está siempre disponible cuando el workflow está activo.

```
Formato: https://dominio/webhook/path
Requiere: Workflow activado
```

---

## Q

### Query Parameters

> Parámetros enviados en la URL después del signo de interrogación.

```
URL: /webhook?param1=valor1&param2=valor2
Acceso en n8n: {{ $json.query.param1 }}
```

---

## R

### Response Mode

> Configuración del webhook que determina cuándo y cómo responder al cliente.

| Modo                    | Descripción                       |
| ----------------------- | --------------------------------- |
| When Last Node Finishes | Responde al terminar el workflow  |
| Respond to Webhook      | Respuesta inmediata personalizada |
| Do Not Respond          | No envía respuesta                |

---

## S

### Schedule Trigger

> Nodo trigger que ejecuta un workflow en intervalos de tiempo programados usando expresiones cron.

```
Parámetros clave:
- Cron Expression
- Timezone
```

### Status Code

> Código numérico HTTP que indica el resultado de una petición.

```
2xx: Éxito (200 OK, 201 Created)
4xx: Error del cliente (400, 401, 404)
5xx: Error del servidor (500, 503)
```

---

## T

### Test URL

> URL temporal del webhook disponible solo durante "Listen for Test Event".

```
Formato: https://dominio/webhook-test/path
Uso: Desarrollo y pruebas
```

### Timezone

> Zona horaria configurada para la ejecución de triggers programados.

```
Ejemplos: Europe/Madrid, America/New_York, UTC
Importante: Afecta cuándo se ejecuta el Schedule
```

### Trigger

> Nodo especial que inicia la ejecución de un workflow basado en un evento o condición.

```
Tipos principales:
- Manual Trigger
- Schedule Trigger
- Webhook Trigger
- App Triggers (Gmail, Slack, etc.)
```

---

## U

### UTC

> Tiempo Universal Coordinado. Estándar de tiempo global sin ajuste de horario de verano.

```
España: UTC+1 (invierno), UTC+2 (verano)
Recomendación: Usar UTC para sistemas globales
```

---

## W

### Webhook

> Mecanismo para recibir notificaciones automáticas cuando ocurre un evento en otro sistema.

```
También llamado: HTTP callback, reverse API
Dirección: El sistema externo LLAMA a n8n
```

### Webhook Trigger

> Nodo trigger que inicia un workflow cuando recibe una petición HTTP externa.

```
Configuraciones clave:
- Path
- HTTP Method
- Authentication
- Response Mode
```

---

## 📊 Resumen de Términos

| Categoría         | Términos                                             | Cantidad |
| ----------------- | ---------------------------------------------------- | -------- |
| **Triggers**      | Manual, Schedule, Webhook, Multi-trigger             | 4        |
| **HTTP/Webhooks** | Endpoint, Payload, Method, Status Code, Query Params | 5        |
| **Debugging**     | Debugging, Pinned Data, Execution Log                | 3        |
| **Tiempo**        | Cron, Cron Expression, Timezone, UTC                 | 4        |
| **Seguridad**     | Authentication, Basic Auth                           | 2        |
| **Herramientas**  | cURL, Merge Node                                     | 2        |

---

## 🔗 Referencias Cruzadas

### Términos de Semanas Anteriores

| Término   | Semana | Link                                          |
| --------- | ------ | --------------------------------------------- |
| Workflow  | 01     | [Ver](../../semana-01/5-glosario/README.md#w) |
| Nodo      | 01     | [Ver](../../semana-01/5-glosario/README.md#n) |
| Expresión | 01     | [Ver](../../semana-01/5-glosario/README.md#e) |
| JSON      | 01     | [Ver](../../semana-01/5-glosario/README.md#j) |

### Documentación Oficial

- 📖 [n8n Glossary](https://docs.n8n.io/glossary/)
- 📖 [Triggers Documentation](https://docs.n8n.io/workflows/triggers/)
- 📖 [Webhook Node](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.webhook/)

---

## 🏠 Navegación

| ⬅️ Anterior                | 📚 Sección Actual | ➡️ Siguiente                  |
| -------------------------- | ----------------- | ----------------------------- |
| [Recursos](../4-recursos/) | **Glosario**      | [Semana 03](../../semana-03/) |
