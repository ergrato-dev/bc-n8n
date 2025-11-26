# 📋 Cheatsheet: Webhooks en n8n

## Referencia Rápida

![Cheatsheet](https://img.shields.io/badge/Tipo-Cheatsheet-FF6D5A?style=flat-square)
![Tema](https://img.shields.io/badge/Tema-Webhooks-00D4FF?style=flat-square)

---

## 🌐 URLs del Webhook

### Estructura de URLs

```
Test URL:
https://[tu-dominio]/webhook-test/[path]

Production URL:
https://[tu-dominio]/webhook/[path]
```

### Ejemplo Local

```
Test:       http://localhost:5678/webhook-test/mi-webhook
Production: http://localhost:5678/webhook/mi-webhook
```

---

## 🔀 Métodos HTTP

| Método | Uso | Tiene Body |
|--------|-----|------------|
| `GET` | Obtener datos | ❌ No |
| `POST` | Crear/enviar datos | ✅ Sí |
| `PUT` | Actualizar (completo) | ✅ Sí |
| `PATCH` | Actualizar (parcial) | ✅ Sí |
| `DELETE` | Eliminar | ❌ Opcional |

---

## 📊 Estructura de Datos Recibidos

```json
{
  "headers": {
    "content-type": "application/json",
    "user-agent": "...",
    "authorization": "Bearer xxx"
  },
  "params": {},
  "query": {
    "param1": "valor1"
  },
  "body": {
    "campo1": "valor1",
    "campo2": "valor2"
  }
}
```

### Acceso a Datos

| Dato | Expresión n8n |
|------|---------------|
| Body completo | `{{ $json.body }}` |
| Campo del body | `{{ $json.body.campo }}` |
| Query param | `{{ $json.query.param }}` |
| Header | `{{ $json.headers['header-name'] }}` |
| User Agent | `{{ $json.headers['user-agent'] }}` |
| Content Type | `{{ $json.headers['content-type'] }}` |

---

## 🔐 Autenticación

### Header Auth

```
Header Name: X-API-Key
Header Value: mi-clave-secreta
```

Verificar en el cliente:
```bash
curl -H "X-API-Key: mi-clave-secreta" ...
```

### Basic Auth

```
Username: usuario
Password: contraseña
```

Verificar en el cliente:
```bash
curl -u usuario:contraseña ...
```

---

## 📤 Response Mode

| Modo | Cuándo Responde | Uso |
|------|-----------------|-----|
| When Last Node Finishes | Al terminar todo el workflow | Resultado del procesamiento |
| Respond to Webhook | Inmediatamente | Respuesta personalizada |
| Do Not Respond | Nunca | Fire and forget |

---

## 📋 Códigos HTTP Comunes

### Éxito (2xx)

| Código | Nombre | Uso |
|--------|--------|-----|
| `200` | OK | Éxito general |
| `201` | Created | Recurso creado |
| `204` | No Content | Éxito sin contenido |

### Errores Cliente (4xx)

| Código | Nombre | Causa |
|--------|--------|-------|
| `400` | Bad Request | Datos inválidos |
| `401` | Unauthorized | Sin autenticación |
| `403` | Forbidden | Sin permisos |
| `404` | Not Found | No existe |
| `422` | Unprocessable | Validación fallida |

### Errores Servidor (5xx)

| Código | Nombre | Causa |
|--------|--------|-------|
| `500` | Internal Error | Error del servidor |
| `502` | Bad Gateway | Proxy error |
| `503` | Service Unavailable | Servicio caído |

---

## 🧪 Testing con cURL

### GET Simple

```bash
curl http://localhost:5678/webhook-test/mi-webhook
```

### GET con Query Params

```bash
curl "http://localhost:5678/webhook-test/mi-webhook?param1=valor1&param2=valor2"
```

### POST con JSON

```bash
curl -X POST http://localhost:5678/webhook-test/mi-webhook \
  -H "Content-Type: application/json" \
  -d '{"campo": "valor"}'
```

### POST con Headers Custom

```bash
curl -X POST http://localhost:5678/webhook-test/mi-webhook \
  -H "Content-Type: application/json" \
  -H "X-API-Key: mi-clave" \
  -d '{"campo": "valor"}'
```

### POST desde Archivo

```bash
curl -X POST http://localhost:5678/webhook-test/mi-webhook \
  -H "Content-Type: application/json" \
  -d @datos.json
```

---

## 🔍 Debug de Webhooks

### Ver Request Completo

1. Agrega un Set Node después del Webhook
2. Agrega estos campos para ver todo:
   - `allData`: `{{ JSON.stringify($json) }}`
   - `headers`: `{{ JSON.stringify($json.headers) }}`
   - `body`: `{{ JSON.stringify($json.body) }}`

### Usar Webhook.site

1. Ve a [webhook.site](https://webhook.site)
2. Copia tu URL única
3. Envía requests a esa URL
4. Ve exactamente qué se recibe

---

## ⚠️ Errores Comunes

| Error | Causa | Solución |
|-------|-------|----------|
| 404 Not Found | Path incorrecto | Verificar URL y path |
| 401 Unauthorized | Auth faltante | Agregar header de auth |
| Test URL no funciona | Workflow no ejecutándose | Click "Listen for Test Event" |
| Production URL no funciona | Workflow no activo | Activar el workflow |
| Body vacío | Content-Type faltante | Agregar `Content-Type: application/json` |

---

## 📝 Plantilla de Petición

### Template cURL

```bash
curl -X POST \
  'http://localhost:5678/webhook-test/[PATH]' \
  -H 'Content-Type: application/json' \
  -H 'X-API-Key: [TU-KEY]' \
  -d '{
    "field1": "value1",
    "field2": "value2"
  }'
```

### Template JavaScript (fetch)

```javascript
fetch('http://localhost:5678/webhook-test/[PATH]', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'X-API-Key': '[TU-KEY]'
  },
  body: JSON.stringify({
    field1: 'value1',
    field2: 'value2'
  })
});
```

---

## 🏠 Navegación

| ⬅️ Anterior | 📚 Recurso Actual | ➡️ Siguiente |
|------------|-------------------|--------------|
| [Cheatsheet Cron](cheatsheet-cron.md) | **Cheatsheet Webhooks** | [FAQ](faq.md) |
