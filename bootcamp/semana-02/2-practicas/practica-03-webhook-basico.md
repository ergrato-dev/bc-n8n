# 💻 Práctica 03: Webhook Básico

![Práctica](https://img.shields.io/badge/Práctica-03-FF6D5A?style=flat-square)
![Dificultad](https://img.shields.io/badge/Dificultad-⭐⭐-00D4FF?style=flat-square)
![Tiempo](https://img.shields.io/badge/Tiempo-30_min-00A86B?style=flat-square)

---

## 🎯 Objetivos

Al completar esta práctica, serás capaz de:

- Configurar un Webhook Trigger en n8n
- Entender las URLs de test y producción
- Enviar datos al webhook usando diferentes métodos
- Procesar y responder a peticiones HTTP

---

## 📋 Requisitos Previos

- [ ] n8n instalado y funcionando
- [ ] Prácticas anteriores completadas
- [ ] Acceso a una herramienta para enviar HTTP requests (usaremos el navegador y curl)

---

## 📚 Contexto

Los **Webhooks** son endpoints HTTP que permiten que sistemas externos inicien workflows en n8n. Son fundamentales para integraciones en tiempo real: formularios web, notificaciones de servicios, eventos de aplicaciones, etc.

---

## 🔨 Ejercicio

### Escenario

Crearás un webhook que recibe datos de un "formulario de contacto" ficticio, los valida y genera una respuesta apropiada.

### Paso 1: Crear Nuevo Workflow

1. Crea un nuevo workflow: `practica-03-webhook-basico`
2. Guárdalo inmediatamente

### Paso 2: Agregar Webhook Trigger

1. Agrega el nodo **"Webhook"**
2. Observa las opciones de configuración

```
┌─────────────────────────────────────────────────────────────────┐
│                 WEBHOOK TRIGGER - CONFIGURACIÓN                  │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  Webhook URLs                                                    │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │  Test URL:                                              │    │
│  │  https://tu-n8n/webhook-test/abc123                     │    │
│  │                                                         │    │
│  │  Production URL:                                        │    │
│  │  https://tu-n8n/webhook/abc123                          │    │
│  └─────────────────────────────────────────────────────────┘    │
│                                                                  │
│  HTTP Method: [POST ▼]                                          │
│                                                                  │
│  Path: [abc123           ]  (auto-generado o personalizable)    │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Paso 3: Configurar el Webhook

1. **HTTP Method**: Selecciona `POST`
2. **Path**: Cámbialo a `contacto` (más descriptivo)
3. **Response Mode**: Selecciona `When Last Node Finishes`
4. **Response Code**: `200`

Tu webhook ahora tendrá URLs como:

- Test: `http://localhost:5678/webhook-test/contacto`
- Producción: `http://localhost:5678/webhook/contacto`

### Paso 4: Obtener la URL del Webhook

1. Haz clic en el nodo Webhook
2. En el panel derecho, copia la **Test URL**
3. Guárdala - la necesitarás pronto

```
┌─────────────────────────────────────────────────────────────────┐
│                    TUS URLs DE WEBHOOK                           │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  Test URL (para desarrollo):                                    │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │  http://localhost:5678/webhook-test/contacto            │    │
│  └─────────────────────────────────────────────────────────┘    │
│                                                                  │
│  Production URL (cuando el workflow está activo):               │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │  http://localhost:5678/webhook/contacto                 │    │
│  └─────────────────────────────────────────────────────────┘    │
│                                                                  │
│  💡 Para testing, siempre usa la Test URL primero               │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Paso 5: Agregar Validación de Datos

1. Conecta un nodo **"IF"** desde el Webhook
2. Renómbralo a: `Datos Completos?`
3. Configura la condición:

Usaremos una condición compuesta. En n8n:

- **Condition 1**:

  - Value 1: `{{ $json.body.nombre }}`
  - Operation: `Is Not Empty`

- Haz clic en **"Add Condition"**

- **Condition 2**:

  - Value 1: `{{ $json.body.email }}`
  - Operation: `Is Not Empty`

- **Combine**: `All` (AND)

### Paso 6: Procesar Contacto Válido

**Rama True (datos completos):**

1. Agrega **"Edit Fields (Set)"**
2. Renómbralo a: `Procesar Contacto`
3. Configura campos:

| Campo        | Tipo    | Valor/Expresión                   |
| ------------ | ------- | --------------------------------- |
| `success`    | Boolean | `true`                            |
| `message`    | String  | `Contacto recibido correctamente` |
| `contactId`  | String  | `{{ 'CNT-' + Date.now() }}`       |
| `nombre`     | String  | `{{ $json.body.nombre }}`         |
| `email`      | String  | `{{ $json.body.email }}`          |
| `receivedAt` | String  | `{{ $now.toISO() }}`              |

### Paso 7: Manejar Datos Incompletos

**Rama False (datos faltantes):**

1. Agrega **"Edit Fields (Set)"**
2. Renómbralo a: `Error: Datos Faltantes`
3. Configura campos:

| Campo      | Tipo    | Valor                              |
| ---------- | ------- | ---------------------------------- |
| `success`  | Boolean | `false`                            |
| `error`    | String  | `Datos incompletos`                |
| `message`  | String  | `Se requiere nombre y email`       |
| `received` | String  | `{{ JSON.stringify($json.body) }}` |

### Paso 8: Configurar Respuesta

n8n responderá automáticamente con los datos del último nodo ejecutado.

Para personalizar la respuesta:

1. En el nodo Webhook, en **"Response Mode"**, asegúrate de que esté en `When Last Node Finishes`
2. Esto enviará como respuesta HTTP el output del último nodo

---

## 🧪 Probar el Webhook

### Método 1: Usando cURL (Terminal)

Abre tu terminal y ejecuta:

```bash
# Primero, "escucha" el webhook en n8n haciendo clic en "Listen for Test Event"

# Luego envía datos válidos:
curl -X POST http://localhost:5678/webhook-test/contacto \
  -H "Content-Type: application/json" \
  -d '{"nombre": "Juan Pérez", "email": "juan@ejemplo.com", "mensaje": "Hola, quiero información"}'
```

```bash
# Prueba con datos incompletos:
curl -X POST http://localhost:5678/webhook-test/contacto \
  -H "Content-Type: application/json" \
  -d '{"nombre": "Juan Pérez"}'
```

### Método 2: Usando el Navegador (solo GET)

Para probar con GET, primero cambia el método del webhook a GET, luego:

1. Abre tu navegador
2. Visita: `http://localhost:5678/webhook-test/contacto?nombre=Juan&email=juan@test.com`

### Método 3: Usando Webhook.site (para ver qué envías)

1. Ve a [webhook.site](https://webhook.site)
2. Copia tu URL única
3. Usa esa URL para probar qué datos enviarías
4. Útil para debugging

---

## 🔄 Flujo Completo

```
┌─────────────────────────────────────────────────────────────────┐
│           WORKFLOW: practica-03-webhook-basico                   │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│            Petición HTTP POST                                    │
│                  │                                               │
│                  ▼                                               │
│  ┌────────────────────┐                                         │
│  │ 🌐 Webhook         │  Path: /contacto                        │
│  │    Trigger         │  Method: POST                           │
│  └─────────┬──────────┘                                         │
│            │                                                     │
│            ▼                                                     │
│  ┌────────────────────┐                                         │
│  │ ❓ Datos           │  nombre && email                        │
│  │    Completos?      │  no están vacíos?                       │
│  └─────────┬──────────┘                                         │
│            │                                                     │
│      ┌─────┴─────┐                                               │
│      │           │                                               │
│      ▼           ▼                                               │
│  ┌──────────┐ ┌──────────┐                                      │
│  │ ✅       │ │ ❌       │                                      │
│  │ Procesar │ │ Error:   │                                      │
│  │ Contacto │ │ Datos    │                                      │
│  │          │ │ Faltantes│                                      │
│  └──────────┘ └──────────┘                                      │
│       │             │                                            │
│       └──────┬──────┘                                            │
│              │                                                   │
│              ▼                                                   │
│       Respuesta HTTP                                             │
│       (JSON del último nodo)                                     │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 🧪 Experimentos Adicionales

### Experimento 1: Agregar Autenticación

1. En el Webhook, busca **"Authentication"**
2. Selecciona **"Header Auth"**
3. Configura:

   - **Name**: `X-API-Key`
   - **Value**: `mi-clave-secreta-123`

4. Ahora prueba sin header (debe fallar):

```bash
curl -X POST http://localhost:5678/webhook-test/contacto \
  -H "Content-Type: application/json" \
  -d '{"nombre": "Juan", "email": "juan@test.com"}'
# Debe dar error de autenticación
```

5. Prueba con header (debe funcionar):

```bash
curl -X POST http://localhost:5678/webhook-test/contacto \
  -H "Content-Type: application/json" \
  -H "X-API-Key: mi-clave-secreta-123" \
  -d '{"nombre": "Juan", "email": "juan@test.com"}'
```

### Experimento 2: Diferentes Métodos HTTP

1. Configura el webhook para aceptar **GET**
2. Los parámetros vienen en `$json.query` en lugar de `$json.body`
3. Ajusta tu validación:
   - `{{ $json.query.nombre }}` para GET
   - `{{ $json.body.nombre }}` para POST

### Experimento 3: Respuesta Personalizada

1. En el Webhook, cambia **"Response Mode"** a `Respond to Webhook`
2. Agrega un nodo **"Respond to Webhook"** al final
3. Configura exactamente qué respuesta enviar:
   - Response Code: `201` (Created)
   - Response Body: JSON personalizado

---

## 📊 Estructura de Datos del Webhook

El Webhook proporciona esta información:

```json
{
  "headers": {
    "content-type": "application/json",
    "user-agent": "curl/7.68.0",
    "accept": "*/*",
    "host": "localhost:5678",
    "x-api-key": "mi-clave-secreta-123"
  },
  "params": {},
  "query": {
    "param1": "valor1"
  },
  "body": {
    "nombre": "Juan Pérez",
    "email": "juan@ejemplo.com",
    "mensaje": "Hola"
  }
}
```

| Propiedad | Contenido                               |
| --------- | --------------------------------------- |
| `headers` | Headers HTTP de la petición             |
| `params`  | Parámetros de ruta (si los hay)         |
| `query`   | Parámetros de query string (?key=value) |
| `body`    | Cuerpo de la petición (POST, PUT, etc.) |

---

## ✅ Criterios de Éxito

Tu práctica está completa cuando:

- [ ] Webhook configurado con path personalizado
- [ ] Puedes enviar datos con cURL o similar
- [ ] La validación distingue entre datos completos e incompletos
- [ ] El workflow responde con JSON apropiado
- [ ] Entiendes la diferencia entre Test URL y Production URL
- [ ] Has probado con autenticación (experimento)

---

## 💡 Tips y Mejores Prácticas

1. **Siempre usa Test URL durante desarrollo**: La Production URL solo funciona con workflow activo
2. **Valida datos de entrada**: Nunca confíes en datos externos sin validar
3. **Protege webhooks en producción**: Usa autenticación
4. **Usa paths descriptivos**: `/contacto`, `/pedidos`, `/notificaciones`
5. **Documenta tus webhooks**: Qué datos espera, qué responde

---

## ⚠️ Seguridad

```
┌─────────────────────────────────────────────────────────────────┐
│              ⚠️ CONSIDERACIONES DE SEGURIDAD                     │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  1. NUNCA expongas webhooks sin autenticación en producción     │
│                                                                  │
│  2. Valida TODOS los datos de entrada                           │
│                                                                  │
│  3. Usa HTTPS en producción (no http)                           │
│                                                                  │
│  4. Considera rate limiting para prevenir abusos                │
│                                                                  │
│  5. Registra las peticiones para auditoría                      │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 🔗 Recursos

- 📖 [Documentación Webhook Trigger](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.webhook/)
- 🔧 [Webhook.site - Testing](https://webhook.site/)
- 📖 [Postman - HTTP Client](https://www.postman.com/)
- 📖 [Códigos de Estado HTTP](https://developer.mozilla.org/es/docs/Web/HTTP/Status)

---

## 🏠 Navegación

| ⬅️ Anterior                                              | 💻 Práctica Actual      | ➡️ Siguiente                               |
| -------------------------------------------------------- | ----------------------- | ------------------------------------------ |
| [02 - Schedule Trigger](practica-02-schedule-trigger.md) | **03 - Webhook Básico** | [04 - Debugging](practica-04-debugging.md) |
