# Ejecución y Testing de Workflows

## 📋 Objetivos de Aprendizaje

Al finalizar este documento, serás capaz de:

1. ✅ Ejecutar workflows en diferentes modos (manual, automático, programado)
2. ✅ Realizar testing efectivo de workflows antes de producción
3. ✅ Debuggear problemas complejos usando técnicas avanzadas
4. ✅ Monitorear el estado y performance de tus workflows
5. ✅ Interpretar logs y mensajes de error correctamente
6. ✅ Optimizar workflows para mejor rendimiento
7. ✅ Preparar workflows para despliegue en producción
8. ✅ Implementar estrategias de retry y error handling
9. ✅ Validar datos en cada etapa del workflow

---

## 1. Modos de Ejecución

### 1.1 Ejecución Manual

**¿Cuándo usar?**

- Durante el desarrollo y testing
- Para workflows on-demand (bajo demanda)
- Para procesos administrativos esporádicos

**Cómo ejecutar:**

```
1. Abre tu workflow
2. Haz clic en "Execute Workflow" (botón superior derecho)
3. El workflow se ejecuta inmediatamente con los datos disponibles
4. Puedes ver los resultados en tiempo real
```

**Ventajas:**

- ✅ Control total sobre cuándo se ejecuta
- ✅ Perfecto para testing y desarrollo
- ✅ Puedes ejecutar con datos de prueba
- ✅ Ves resultados inmediatos

**Desventajas:**

- ❌ Requiere intervención humana
- ❌ No apto para procesos automáticos
- ❌ No escala para operaciones repetitivas

---

### 1.2 Ejecución Automática (Triggers)

**¿Cuándo usar?**

- Para workflows que responden a eventos externos
- Integraciones en tiempo real
- Procesos reactivos (webhook, email, etc.)

**Triggers disponibles:**

#### **Webhook Trigger**

```
Casos de uso:
- APIs públicas o privadas
- Integraciones con servicios externos
- Webhooks de GitHub, Stripe, etc.
```

**Configuración básica:**

```
1. Añade nodo "Webhook"
2. Elige método HTTP (GET, POST, PUT, DELETE)
3. Define path (ej: /mi-webhook)
4. Activa el workflow
5. Usa la URL generada en el servicio externo
```

**URL del webhook:**

```
http://localhost:5678/webhook/mi-webhook
```

#### **Schedule Trigger**

```
Casos de uso:
- Reportes diarios/semanales
- Backups programados
- Sincronizaciones periódicas
- Limpieza de datos
```

**Configuración básica:**

```
Expresiones Cron:
- Cada día a las 9:00 AM:    0 9 * * *
- Cada lunes a las 8:00 AM:  0 8 * * 1
- Cada hora:                 0 * * * *
- Cada 15 minutos:           */15 * * * *
- Primer día del mes:        0 0 1 * *
```

**Ejemplos prácticos:**

```javascript
// Reporte diario de ventas (9 AM)
Schedule: 0 9 * * *
↓
HTTP Request → Google Sheets API
↓
Set (formatear datos)
↓
Gmail (enviar reporte)

// Backup semanal (domingos 2 AM)
Schedule: 0 2 * * 0
↓
HTTP Request → Database Export
↓
Google Drive (upload)
↓
Slack (notificar completado)
```

#### **Email Trigger (IMAP)**

```
Casos de uso:
- Procesar facturas recibidas por email
- Responder automáticamente a solicitudes
- Extraer datos de emails
```

**Configuración:**

```
1. Añade nodo "Email Trigger (IMAP)"
2. Configura credenciales IMAP
3. Define carpeta a monitorear (INBOX, etc.)
4. Filtra por remitente o asunto si es necesario
5. Activa workflow
```

---

### 1.3 Ejecución por Polling

**¿Qué es polling?**

- n8n consulta periódicamente un servicio externo
- Detecta cambios o nuevos datos
- Ejecuta el workflow cuando hay actualizaciones

**Triggers de polling comunes:**

- **RSS Feed Trigger**: Nuevos artículos en blog
- **Google Sheets Trigger**: Nuevas filas en hoja
- **Airtable Trigger**: Nuevos registros
- **GitHub Trigger**: Nuevos issues o PRs

**Ejemplo: Monitorear nuevas filas en Google Sheets**

```
Google Sheets Trigger
├─ Sheet: "Ventas"
├─ Range: "A:E"
├─ Poll Interval: Cada 5 minutos
└─ Trigger on: "New rows"
↓
IF (validar datos)
├─ true → HTTP Request (enviar a CRM)
└─ false → Gmail (notificar error)
```

---

## 2. Testing de Workflows

### 2.1 Testing Básico: Ejecutar Nodo por Nodo

**Metodología:**

```
1. Ejecuta el primer nodo (trigger o manual)
2. Verifica los datos de salida
3. Ejecuta el siguiente nodo
4. Repite hasta completar el workflow
```

**Ventajas:**

- ✅ Identificas errores inmediatamente
- ✅ Ves exactamente qué datos pasan entre nodos
- ✅ Puedes ajustar sobre la marcha
- ✅ No ejecutas todo el workflow si hay un error temprano

**Cómo hacerlo:**

```
1. Ejecuta manualmente el workflow
2. Haz clic en cada nodo para ver su output
3. Si un nodo falla, ajusta configuración
4. Vuelve a ejecutar desde ese nodo
5. Continúa hasta el final
```

---

### 2.2 Testing con Datos de Prueba

**Crear datos de prueba consistentes:**

```javascript
// Nodo "Set" al inicio del workflow
{
  "usuarios": [
    {
      "id": 1,
      "nombre": "Juan Pérez",
      "email": "juan@test.com",
      "edad": 28,
      "activo": true
    },
    {
      "id": 2,
      "nombre": "María García",
      "email": "maria@test.com",
      "edad": 35,
      "activo": false
    },
    {
      "id": 3,
      "nombre": "Carlos López",
      "email": "carlos@test.com",
      "edad": 42,
      "activo": true
    }
  ]
}
```

**Casos de prueba a considerar:**

| Caso de Prueba            | Qué Validar              | Ejemplo                  |
| ------------------------- | ------------------------ | ------------------------ |
| **Happy path**            | Flujo normal sin errores | Todos los campos válidos |
| **Datos faltantes**       | Campos opcionales vacíos | email ausente            |
| **Datos inválidos**       | Formato incorrecto       | email sin @              |
| **Listas vacías**         | Arrays sin elementos     | `[]`                     |
| **Null/undefined**        | Valores nulos            | `null`, `undefined`      |
| **Caracteres especiales** | Ñ, acentos, emojis       | "José 😊"                |
| **Límites**               | Valores máximos/mínimos  | edad = 0, edad = 150     |

---

### 2.3 Testing de Branches (Ramas Condicionales)

**Asegúrate de probar TODAS las rutas posibles:**

```
IF (edad > 18)
├─ true → Enviar email adulto
└─ false → Enviar email menor

CASOS A PROBAR:
1. edad = 17 (menor) → debe ir por false
2. edad = 18 (borde) → debe ir por true
3. edad = 19 (adulto) → debe ir por true
4. edad = null (error) → ¿qué pasa?
5. edad = "texto" (inválido) → ¿qué pasa?
```

**Switch con múltiples outputs:**

```
Switch (categoría)
├─ Output 0: "A" → Process A
├─ Output 1: "B" → Process B
├─ Output 2: "C" → Process C
└─ Output 3: default → Error handling

CASOS A PROBAR:
1. categoría = "A"
2. categoría = "B"
3. categoría = "C"
4. categoría = "D" (no existe)
5. categoría = null
6. categoría = "" (vacío)
```

---

### 2.4 Testing de Error Handling

**Forzar errores para validar manejo:**

```javascript
// Ejemplo: Simular error de API

HTTP Request
├─ URL: https://api-invalida.com/endpoint
├─ Continue On Fail: true
└─ Expected: Error 404/500

→ Debe ir al nodo de error handling
```

**Checklist de testing de errores:**

- [ ] ¿El workflow captura el error?
- [ ] ¿Se ejecuta el nodo de error?
- [ ] ¿Se envía notificación de error?
- [ ] ¿Se registra en logs?
- [ ] ¿Se puede reintentar (retry)?
- [ ] ¿Se detiene el workflow o continúa?

---

## 3. Debugging Avanzado

### 3.1 Interpretación de Logs

**Dónde ver logs:**

```
1. Panel inferior del workflow (al ejecutar)
2. Pestaña "Executions" (menú lateral izquierdo)
3. Logs del servidor (si tienes acceso)
```

**Tipos de mensajes:**

| Tipo           | Significado                  | Ejemplo                  |
| -------------- | ---------------------------- | ------------------------ |
| ✅ **Success** | Nodo ejecutado correctamente | "HTTP Request completed" |
| ⚠️ **Warning** | Posible problema, no crítico | "Empty response"         |
| ❌ **Error**   | Ejecución falló              | "Connection timeout"     |
| ℹ️ **Info**    | Información general          | "3 items processed"      |

**Errores comunes y soluciones:**

#### **Error: "Cannot read property 'X' of undefined"**

```
Causa: Intentas acceder a un campo que no existe
Solución:
1. Verifica que el nodo anterior retorna datos
2. Usa expresiones seguras: {{ $json["campo"] || "default" }}
3. Añade validación con IF antes
```

#### **Error: "Unauthorized" o "401"**

```
Causa: Credenciales incorrectas o expiradas
Solución:
1. Verifica credenciales en Settings → Credentials
2. Re-autentica con el servicio
3. Verifica que el token no haya expirado
```

#### **Error: "Timeout"**

```
Causa: Servicio externo no responde a tiempo
Solución:
1. Aumenta timeout en nodo HTTP Request
2. Verifica conectividad de red
3. Implementa retry con Wait node
```

#### **Error: "Too Many Requests" o "429"**

```
Causa: Superaste rate limit del API
Solución:
1. Añade Wait nodes entre requests
2. Usa Split In Batches para procesar de a pocos
3. Implementa exponential backoff
```

---

### 3.2 Técnicas de Debugging

#### **Técnica 1: NoOp Breakpoints**

```
Workflow complejo:
Nodo A → Nodo B → NoOp → Nodo C → Nodo D

1. Añade NoOp después del nodo sospechoso
2. Ejecuta hasta NoOp
3. Inspecciona datos
4. Si ok, mueve NoOp más adelante
5. Repite hasta encontrar el problema
```

#### **Técnica 2: Logging Manual**

```javascript
// En nodo Code, añade logs

const inputData = $input.all();

console.log('=== DEBUG: Datos de entrada ===');
console.log(JSON.stringify(inputData, null, 2));

// Tu código aquí
const result = inputData.map((item) => {
  console.log(`Procesando item ${item.json.id}`);
  return {
    json: {
      ...item.json,
      procesado: true,
    },
  };
});

console.log('=== DEBUG: Resultado ===');
console.log(JSON.stringify(result, null, 2));

return result;
```

#### **Técnica 3: Comparación de Outputs**

```
Crea workflow paralelo:
Original: A → B → C
Testing:  A → B → Set (guardar output B) → C

Compara outputs:
- Si C falla, mira output de B guardado en Set
- Identifica exactamente qué datos causaron el error
```

#### **Técnica 4: Bisección (Binary Search)**

```
Workflow largo con error desconocido:
A → B → C → D → E → F → G → H (falla)

1. Ejecuta solo A → B → C → D (mitad)
   - Si falla: problema está en A-D
   - Si ok: problema está en E-H
2. Repite dividiendo por mitad
3. Encuentra nodo exacto con problema
```

---

### 3.3 Inspección de Datos

**Ver estructura completa de datos:**

```javascript
// Nodo Code para imprimir toda la estructura
return [
  {
    json: {
      estructura_completa: JSON.stringify($input.all(), null, 2),
      numero_items: $input.all().length,
      primer_item: $input.first().json,
      campos_disponibles: Object.keys($input.first().json),
    },
  },
];
```

**Validar tipos de datos:**

```javascript
// Verificar tipos antes de procesar
const item = $input.first().json;

console.log('Tipo de edad:', typeof item.edad);
console.log('Es array usuarios?', Array.isArray(item.usuarios));
console.log('Tiene campo email?', 'email' in item);
```

---

## 4. Monitoreo de Workflows

### 4.1 Historial de Ejecuciones

**Acceder al historial:**

```
1. Menú lateral → "Executions"
2. Filtra por workflow
3. Ve estado: Success / Error / Running
4. Haz clic para ver detalles
```

**Información disponible:**

- ✅ Fecha y hora de ejecución
- ✅ Duración total
- ✅ Estado de cada nodo
- ✅ Datos de entrada y salida
- ✅ Errores si los hubo

---

### 4.2 Notificaciones de Errores

**Implementar sistema de alertas:**

```
Cualquier nodo con error
↓
Error Trigger (nodo especial)
↓
Set (formatear mensaje de error)
↓
Slack / Email / Telegram
```

**Ejemplo: Notificar por Slack**

```javascript
// En nodo Set después de Error Trigger
{
  "error_message": "{{ $json.error.message }}",
  "workflow": "{{ $workflow.name }}",
  "nodo_fallido": "{{ $json.node.name }}",
  "timestamp": "{{ $now.format('YYYY-MM-DD HH:mm:ss') }}",
  "execution_id": "{{ $execution.id }}"
}

// Enviar a Slack
Slack: Send Message
Canal: #alertas-n8n
Mensaje:
🚨 *Error en Workflow*
Workflow: {{ $json.workflow }}
Nodo: {{ $json.nodo_fallido }}
Error: {{ $json.error_message }}
Hora: {{ $json.timestamp }}
```

---

### 4.3 Métricas de Performance

**Qué monitorear:**

| Métrica               | Qué Indica                   | Objetivo         |
| --------------------- | ---------------------------- | ---------------- |
| **Duración total**    | Tiempo de ejecución completo | < 30 segundos    |
| **Items procesados**  | Cantidad de datos            | Depende del caso |
| **Tasa de error**     | % de ejecuciones fallidas    | < 1%             |
| **Uso de memoria**    | Consumo de recursos          | < 512MB          |
| **Rate de ejecución** | Frecuencia de runs           | Consistente      |

**Identificar cuellos de botella:**

```
Workflow con tiempos:
HTTP Request A: 2s
Set: 0.1s
HTTP Request B: 15s ← CUELLO DE BOTELLA
Code: 0.5s
HTTP Request C: 3s

Solución: Optimizar o cachear Request B
```

---

## 5. Optimización de Performance

### 5.1 Reducir Tiempo de Ejecución

**Estrategia 1: Procesar en paralelo**

```javascript
// ❌ MAL: Secuencial (lento)
HTTP Request API 1 (3s)
↓
HTTP Request API 2 (3s)
↓
HTTP Request API 3 (3s)
Total: 9 segundos

// ✅ BIEN: Paralelo (rápido)
      ┌→ HTTP Request API 1 (3s) ┐
Split ─→ HTTP Request API 2 (3s) ─→ Merge
      └→ HTTP Request API 3 (3s) ┘
Total: 3 segundos
```

**Estrategia 2: Cachear resultados**

```javascript
// Si los datos no cambian frecuentemente, usa caché

// Nodo Code: Check cache
const cacheKey = 'usuarios_activos';
const cache = $execution.customData.get(cacheKey);

if (cache && Date.now() - cache.timestamp < 3600000) {
  // Cache válido (< 1 hora)
  return [{ json: cache.data }];
}

// Si no hay cache, fetch y guardar
// ... hacer request ...
$execution.customData.set(cacheKey, {
  data: result,
  timestamp: Date.now(),
});
```

**Estrategia 3: Filtrar temprano**

```javascript
// ❌ MAL: Procesar todo, filtrar después
HTTP Request (fetch 1000 items)
↓
Set (transformar 1000 items)
↓
Code (procesar 1000 items)
↓
IF (filtrar, quedan 10 items)

// ✅ BIEN: Filtrar primero
HTTP Request (fetch 1000 items)
↓
IF (filtrar, quedan 10 items)
↓
Set (transformar 10 items)
↓
Code (procesar 10 items)
```

---

### 5.2 Optimizar Uso de Memoria

**Problema: Procesar grandes volúmenes de datos**

```javascript
// ❌ MAL: Cargar todo en memoria
HTTP Request (fetch 100,000 registros)
↓
Code (procesar todos)
↓
Out of Memory Error

// ✅ BIEN: Procesar en lotes
HTTP Request (fetch 100,000 registros)
↓
Split In Batches (100 por lote)
↓
Code (procesar 100)
↓
Loop back hasta terminar
```

**Configuración de Split In Batches:**

```
Split In Batches
├─ Batch Size: 100 (ajustar según memoria)
├─ Options → Reset: false
└─ Conectar de vuelta al mismo nodo (loop)
```

---

### 5.3 Reducir Llamadas a APIs

**Usar bulk operations cuando sea posible:**

```javascript
// ❌ MAL: 100 requests individuales
Loop Over Items (100 usuarios)
├─ HTTP Request: POST /api/user (1 usuario)
└─ 100 requests = muy lento

// ✅ BIEN: 1 request bulk
HTTP Request: POST /api/users/bulk
Body: [100 usuarios]
1 request = rápido
```

**Implementar rate limiting:**

```javascript
// Respetar límites de API (ej: 10 req/segundo)

Split In Batches (10 por lote)
↓
HTTP Request (procesar lote)
↓
Wait (1 segundo)
↓
Loop back
```

---

## 6. Preparación para Producción

### 6.1 Checklist Pre-Producción

**Antes de activar tu workflow:**

#### **✅ Funcionalidad**

- [ ] Workflow ejecuta correctamente en desarrollo
- [ ] Probado con datos reales (no solo test)
- [ ] Todas las ramas condicionales testeadas
- [ ] Error handling implementado

#### **✅ Seguridad**

- [ ] Credenciales configuradas (no hardcoded)
- [ ] Webhooks con autenticación si son públicos
- [ ] Datos sensibles no en logs
- [ ] Permisos mínimos necesarios

#### **✅ Performance**

- [ ] Tiempo de ejecución aceptable
- [ ] No hay memory leaks
- [ ] Rate limits respetados
- [ ] Queries a DB optimizadas

#### **✅ Monitoreo**

- [ ] Notificaciones de error configuradas
- [ ] Logs habilitados
- [ ] Métricas definidas
- [ ] Alertas críticas configuradas

#### **✅ Documentación**

- [ ] Workflow tiene descripción clara
- [ ] Nodos críticos tienen notas
- [ ] Variables de entorno documentadas
- [ ] Procedimiento de rollback definido

---

### 6.2 Estrategias de Retry

**Implementar reintentos automáticos:**

```javascript
// Estrategia 1: Retry simple con Wait

HTTP Request (puede fallar)
├─ Continue On Fail: true
↓
IF (check if error)
├─ true → Wait (5 segundos) → HTTP Request (retry)
└─ false → Continue

// Estrategia 2: Exponential backoff
Intento 1: Inmediato
Intento 2: Wait 2s
Intento 3: Wait 4s
Intento 4: Wait 8s
Intento 5: Error final
```

**Configuración de retry en HTTP Request:**

```
HTTP Request
├─ Retry On Fail: true
├─ Max Retries: 3
├─ Wait Between Retries: 1000ms
└─ Continue On Fail: true (para manejar error final)
```

---

### 6.3 Versionado de Workflows

**Mejores prácticas:**

```
1. Exporta workflow antes de cambios importantes
   → Settings → Download

2. Nombra versiones claramente:
   - enviar-email-v1.json
   - enviar-email-v2-con-retry.json

3. Usa Git para versionar:
   - Guarda JSONs en repositorio
   - Commit con mensaje descriptivo
   - Tag para versiones estables

4. Mantén changelog:
   # Changelog Workflow: Enviar Email

   ## v2.1 (2025-11-06)
   - Añadido retry con exponential backoff
   - Mejorado error handling

   ## v2.0 (2025-10-15)
   - Migrado a nuevo API de email
   - Añadido template HTML
```

---

### 6.4 Backup y Recuperación

**Estrategia de backup:**

```
Opción 1: Backup manual
- Export workflow regularmente
- Guardar en repositorio Git
- Mantener últimas 5 versiones

Opción 2: Backup automático
- Workflow que exporta todos los workflows
- Schedule: Diario a las 3 AM
- Upload a Google Drive / S3
```

**Ejemplo workflow de backup automático:**

```
Schedule Trigger (0 3 * * *)
↓
HTTP Request → n8n API (GET /workflows)
↓
Code (formatear y comprimir)
↓
Google Drive (upload backup)
↓
Slack (notificar completado)
```

---

## 7. Ejercicios Prácticos

### **Ejercicio 1: Testing Completo de Workflow**

**Objetivo:** Crear y testear un workflow con todas las técnicas aprendidas

**Requisitos:**

1. Crea workflow que fetch datos de JSONPlaceholder
2. Implementa validación de datos
3. Añade error handling
4. Testea con datos válidos e inválidos
5. Documenta resultados

**API a usar:**

```
GET https://jsonplaceholder.typicode.com/users
```

**Estructura del workflow:**

```
Manual Trigger
↓
HTTP Request (fetch users)
↓
IF (validar que hay datos)
├─ true →
│   ├─ Code (validar cada usuario)
│   ├─ IF (todos válidos)
│   │   ├─ true → Set (success message)
│   │   └─ false → Set (validation errors)
│   └─ NoOp (para debugging)
└─ false → Stop and Error
```

**Casos de prueba:**

- [ ] Ejecutar con API correcta
- [ ] Cambiar URL a inválida (forzar error)
- [ ] Modificar respuesta simulando campos faltantes
- [ ] Verificar que error handling funciona

---

### **Ejercicio 2: Implementar Sistema de Monitoreo**

**Objetivo:** Crear workflow que monitorea otros workflows

**Requisitos:**

1. Schedule trigger que corre cada hora
2. Consulta executions de n8n API
3. Detecta workflows con errores
4. Envía notificación si hay problemas

**Estructura:**

```
Schedule Trigger (cada hora)
↓
HTTP Request → n8n API (/executions)
↓
Code (filtrar solo errors)
↓
IF (hay errores)
├─ true →
│   ├─ Set (formatear mensaje)
│   ├─ Slack (enviar alerta)
│   └─ Google Sheets (registrar en log)
└─ false → NoOp (todo ok)
```

**API de n8n:**

```
GET http://localhost:5678/api/v1/executions
Headers:
- X-N8N-API-KEY: tu_api_key
```

---

### **Ejercicio 3: Optimizar Workflow Lento**

**Objetivo:** Tomar un workflow ineficiente y optimizarlo

**Workflow inicial (ineficiente):**

```javascript
// Procesa 100 usuarios, haciendo 3 API calls por cada uno
// Tiempo total: ~300 segundos

Manual Trigger
↓
HTTP Request (fetch 100 users)
↓
Loop Over Items
├─ HTTP Request A (get details) - 1s
├─ HTTP Request B (get orders) - 1s
├─ HTTP Request C (get reviews) - 1s
└─ Set (combine data)
```

**Tareas:**

1. Identifica el cuello de botella
2. Implementa procesamiento paralelo
3. Añade caching si es posible
4. Usa bulk operations
5. Mide mejora de performance

**Meta:** Reducir tiempo de 300s a menos de 30s

---

### **Ejercicio 4: Deployment Workflow**

**Objetivo:** Preparar workflow para producción

**Workflow a preparar:**

```
Webhook recibe pedido de ecommerce
↓
Validar datos del pedido
↓
Guardar en base de datos
↓
Enviar email de confirmación
↓
Notificar a Slack
```

**Checklist a completar:**

- [ ] Añadir error handling en cada paso
- [ ] Implementar retry en llamadas externas
- [ ] Configurar notificaciones de error
- [ ] Añadir logging detallado
- [ ] Documentar workflow con notas
- [ ] Crear datos de prueba
- [ ] Testear todos los casos edge
- [ ] Exportar y versionar workflow

---

## 8. Mejores Prácticas de Testing

### 8.1 Principios Fundamentales

**1. Testea temprano y frecuentemente**

```
❌ No esperes a terminar todo el workflow
✅ Testea cada nodo al añadirlo
```

**2. Automatiza lo que puedas**

```
❌ Testing manual repetitivo
✅ Workflows de testing automático
```

**3. Documenta tus tests**

```
❌ "Ya lo probé, funciona"
✅ "Testeado con casos X, Y, Z - ver resultados"
```

**4. Mantén datos de prueba consistentes**

```
❌ Datos random cada vez
✅ Dataset fijo y versionado
```

---

### 8.2 Testing en Diferentes Ambientes

**Desarrollo (Local):**

```
- Usar datos de prueba
- Webhooks locales (localhost:5678)
- Credenciales de desarrollo/sandbox
- Logging verboso activado
```

**Staging (Pre-producción):**

```
- Datos similares a producción (anonimizados)
- URLs de staging de servicios externos
- Credenciales de staging
- Testing de integración completo
```

**Producción:**

```
- Datos reales
- URLs de producción
- Credenciales de producción
- Monitoring activo
- Backups automáticos
```

---

## 9. Troubleshooting: Problemas Comunes

### Problema 1: "Workflow no se activa"

**Síntomas:**

- Workflow marcado como "Active"
- Pero no se ejecuta cuando debería

**Soluciones:**

1. **Verifica el trigger:**

   - Schedule: ¿Expresión cron correcta?
   - Webhook: ¿URL correcta? ¿Método HTTP correcto?
   - Polling: ¿Intervalo configurado?

2. **Revisa logs del servidor:**

   ```bash
   docker logs n8n
   # o
   pm2 logs n8n
   ```

3. **Verifica configuración:**
   - ¿Timezone correcto? (importante para Schedule)
   - ¿Credenciales válidas? (para triggers de servicios)

---

### Problema 2: "Execution timed out"

**Síntomas:**

- Workflow se ejecuta pero nunca termina
- Error de timeout después de X minutos

**Soluciones:**

1. **Identifica nodo lento:**

   - Revisa duración de cada nodo en executions
   - Busca el que toma más tiempo

2. **Optimiza:**

   - Reduce tamaño de datos
   - Usa paginación en APIs
   - Implementa timeout en HTTP Request

3. **Configura timeout:**
   ```
   HTTP Request → Settings
   ├─ Timeout: 30000 (30 segundos)
   └─ Continue On Fail: true
   ```

---

### Problema 3: "Out of memory"

**Síntomas:**

- Workflow falla con error de memoria
- n8n se crashea al ejecutar

**Soluciones:**

1. **Procesa en lotes:**

   ```
   Split In Batches (100 por lote)
   ↓
   Procesar lote
   ↓
   Loop back
   ```

2. **Reduce carga:**

   - No cargues todos los datos de una vez
   - Usa streaming donde sea posible
   - Limpia datos innecesarios con Set

3. **Aumenta memoria (último recurso):**

   ```bash
   # Docker
   docker run -e NODE_OPTIONS="--max-old-space-size=4096" n8nio/n8n

   # npm
   NODE_OPTIONS="--max-old-space-size=4096" n8n start
   ```

---

### Problema 4: "Rate limit exceeded"

**Síntomas:**

- Error 429 de API externa
- "Too many requests"

**Soluciones:**

1. **Añade delays:**

   ```
   Split In Batches (10 por lote)
   ↓
   HTTP Request
   ↓
   Wait (1 segundo)
   ↓
   Loop back
   ```

2. **Respeta límites:**

   - Lee documentación del API
   - Implementa exponential backoff
   - Usa bulk endpoints si existen

3. **Cachea resultados:**
   - No hagas requests innecesarios
   - Guarda resultados temporalmente

---

### Problema 5: "Webhook not found"

**Síntomas:**

- Webhook retorna 404
- "Workflow not found"

**Soluciones:**

1. **Activa el workflow:**

   - Webhook debe estar en workflow activo

2. **Verifica path:**

   ```
   ❌ /webhook/mi-webhook (sin activar)
   ✅ /webhook/mi-webhook (workflow activo)
   ```

3. **Revisa método HTTP:**
   - GET vs POST vs PUT
   - Configura el correcto en nodo Webhook

---

## 10. Recursos Adicionales

### 📚 Documentación Oficial

- [n8n Execution Data](https://docs.n8n.io/workflows/executions/)
- [Error Handling](https://docs.n8n.io/workflows/error-handling/)
- [Workflow Settings](https://docs.n8n.io/workflows/settings/)

### 🎥 Tutoriales Recomendados

- n8n YouTube: "Testing Workflows"
- n8n YouTube: "Error Handling Best Practices"
- n8n YouTube: "Performance Optimization"

### 💬 Comunidad

- [n8n Community Forum](https://community.n8n.io/)
- [n8n Discord](https://discord.gg/n8n)
- Reddit: r/n8n

---

## 📝 Resumen del Documento

**Has aprendido:**

✅ **3 modos de ejecución:** Manual, automática (triggers), polling
✅ **Técnicas de testing:** Nodo por nodo, datos de prueba, branches, error handling
✅ **Debugging avanzado:** Logs, NoOp, logging manual, bisección
✅ **Monitoreo:** Historial, notificaciones, métricas de performance
✅ **Optimización:** Procesamiento paralelo, cache, filtrado temprano, batches
✅ **Preparación para producción:** Checklist, retry strategies, versionado, backup
✅ **4 ejercicios prácticos:** Testing completo, monitoreo, optimización, deployment

**Próximos pasos:**

1. ✅ Completa los 4 ejercicios prácticos
2. ✅ Aplica checklist de producción a tus workflows existentes
3. ✅ Implementa sistema de monitoreo básico
4. ✅ Continúa con **Módulo 1: Ejercicios** (2-ejercicios/)

---

## 🎯 ¡Felicidades!

Has completado la **sección de teoría del Módulo 1**. Ahora tienes los conocimientos fundamentales de n8n:

- ✅ Qué es n8n y casos de uso
- ✅ Instalación y configuración
- ✅ Navegación de la interfaz
- ✅ Creación de workflows básicos
- ✅ Nodos fundamentales
- ✅ Conexiones y flujos de datos
- ✅ **Ejecución y testing** ← Acabas de completar

**¡Es hora de practicar con ejercicios reales!** 🚀
