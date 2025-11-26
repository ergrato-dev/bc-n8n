# ❓ Preguntas Frecuentes - Semana 02

## FAQ sobre Triggers y Workflows

![FAQ](https://img.shields.io/badge/Tipo-FAQ-9B59B6?style=flat-square)
![Semana](https://img.shields.io/badge/Semana-02-00D4FF?style=flat-square)

---

## 📋 Índice

1. [Triggers](#-triggers)
2. [Schedule y Cron](#-schedule-y-cron)
3. [Webhooks](#-webhooks)
4. [Debugging](#-debugging)
5. [Errores Comunes](#-errores-comunes)

---

## 🎯 Triggers

### ¿Puedo tener múltiples triggers en un mismo workflow?

**Sí**, n8n permite múltiples triggers en un workflow. Cada trigger funciona de forma independiente y puede iniciar el workflow. Sin embargo:

- Cada trigger genera su propia ejecución
- Si necesitas combinar datos de diferentes fuentes, usa el nodo **Merge**
- Considera si realmente necesitas múltiples triggers o si es mejor separar en workflows

### ¿Cuál es la diferencia entre Test URL y Production URL en webhooks?

| Aspecto | Test URL | Production URL |
|---------|----------|----------------|
| Disponibilidad | Solo cuando escuchas | Siempre (workflow activo) |
| Uso | Desarrollo y pruebas | Producción |
| Path | `/webhook-test/...` | `/webhook/...` |
| Activación | Manual (Listen) | Automática |

### ¿Por qué mi Manual Trigger no aparece?

El Manual Trigger solo está disponible como **primer nodo** del workflow. Si ya tienes un trigger, no podrás agregarlo. Los pasos:

1. Elimina el trigger existente
2. Agrega Manual Trigger
3. Conecta al siguiente nodo

---

## ⏰ Schedule y Cron

### ¿Por qué mi Schedule Trigger no se ejecuta a la hora correcta?

Las causas más comunes son:

1. **Zona horaria incorrecta**: Verifica el parámetro `Timezone` en el nodo
2. **Workflow no activo**: El workflow debe estar activo (toggle verde)
3. **Sintaxis cron errónea**: Verifica la expresión en [crontab.guru](https://crontab.guru)

### ¿Cada cuánto tiempo como mínimo puedo ejecutar un Schedule?

- **n8n Cloud**: Cada 1 minuto
- **Self-hosted**: Sin límite técnico, pero considera:
  - Carga del servidor
  - Recursos disponibles
  - Sentido práctico

### ¿Cómo ejecuto algo el último día de cada mes?

Usa esta expresión que ejecuta los días 28-31:

```cron
0 9 28-31 * *
```

Y agrega un nodo **IF** para verificar:

```javascript
{{ $now.toFormat('dd') === $now.endOf('month').toFormat('dd') }}
```

### ¿Puedo pausar temporalmente un Schedule sin desactivar el workflow?

No directamente. Opciones:

1. **Desactivar el workflow** (más simple)
2. **Agregar un IF al inicio** con una condición de "pausa"
3. **Usar variables de entorno** para controlar la ejecución

---

## 🌐 Webhooks

### Mi webhook no recibe datos, ¿qué hago?

Checklist de troubleshooting:

1. ✅ ¿Estás usando la URL correcta (test vs production)?
2. ✅ ¿El workflow está escuchando (test) o activo (production)?
3. ✅ ¿El método HTTP coincide (GET, POST, etc.)?
4. ✅ ¿Estás enviando el Content-Type correcto?
5. ✅ ¿El firewall permite la conexión?
6. ✅ ¿El path coincide exactamente?

### ¿Cómo protejo mi webhook?

Opciones de seguridad:

1. **Header Authentication**: Valida un header secreto
2. **Basic Auth**: Usuario y contraseña
3. **IP Whitelist**: Permite solo ciertas IPs (a nivel servidor)
4. **Tokens en el path**: `/webhook/tu-token-secreto-aquí`

### ¿Por qué mi webhook funciona en test pero no en producción?

| Problema | Causa | Solución |
|----------|-------|----------|
| 404 en production | Workflow no activo | Activar el workflow |
| Timeout | Workflow muy lento | Usar "Respond to Webhook" antes |
| Auth error | Credenciales diferentes | Verificar configuración |

### ¿Cómo recibo archivos por webhook?

1. Configura el webhook con `Binary Data: ON`
2. El archivo estará disponible en `$binary`
3. Usa el nodo **Move Binary Data** si necesitas procesarlo

---

## 🔍 Debugging

### ¿Dónde veo los errores de mis ejecuciones?

1. **Durante desarrollo**: Panel derecho al ejecutar manualmente
2. **Histórico**: Menú Executions (ver todas las ejecuciones)
3. **En producción**: Settings > Execution Log

### ¿Por qué no veo mis ejecuciones pasadas?

Verifica la configuración:

1. `EXECUTIONS_DATA_SAVE_ON_SUCCESS=true` - Guardar exitosas
2. `EXECUTIONS_DATA_SAVE_ON_ERROR=true` - Guardar fallidas
3. `EXECUTIONS_DATA_PRUNE=true` + `EXECUTIONS_DATA_MAX_AGE=168` - Retención

### ¿Cómo debuggeo sin ejecutar todo el workflow?

1. **Pinned Data**: Fija datos en un nodo para usarlos sin ejecutar nodos anteriores
2. **Execute Node**: Click derecho > Execute Only This Node
3. **Test URL webhook**: Ejecuta solo cuando envías datos de prueba

### ¿Qué son los nodos rojos?

Indican errores. Haz click en el nodo para ver:

- **Error message**: Descripción del problema
- **Error stack**: Detalles técnicos
- **Input data**: Datos que causaron el error

---

## ⚠️ Errores Comunes

### "No items to loop over"

**Causa**: El nodo anterior no retornó datos.

**Solución**:
1. Verifica que el nodo anterior tenga output
2. Revisa si hay un filtro que elimina todos los items
3. Usa Pinned Data para pruebas

### "Cannot read property 'X' of undefined"

**Causa**: Intentas acceder a una propiedad que no existe.

**Solución**:
1. Verifica el nombre exacto de la propiedad (case sensitive)
2. Usa operador opcional: `{{ $json.campo?.subcampo }}`
3. Revisa la estructura de datos en el panel de output

### "Webhook path already exists"

**Causa**: Dos webhooks con el mismo path.

**Solución**:
1. Cambia el path de uno de los webhooks
2. Verifica que no haya workflows duplicados

### "The workflow was not activated"

**Causa**: Intentas llamar al Production URL con workflow inactivo.

**Solución**:
1. Activa el workflow (toggle en la esquina)
2. O usa Test URL durante desarrollo

### "ETIMEDOUT" o "ECONNREFUSED"

**Causa**: No se puede conectar al servicio externo.

**Solución**:
1. Verifica que la URL sea correcta
2. Comprueba que el servicio esté activo
3. Revisa configuración de firewall/proxy
4. Verifica credenciales

---

## 💡 Tips Adicionales

### ¿Cómo organizo workflows complejos?

1. **Sticky Notes**: Documenta secciones del workflow
2. **Colores**: Usa colores en nodos para categorizar
3. **Sub-workflows**: Divide en workflows más pequeños
4. **Naming conventions**: Nombres descriptivos en nodos

### ¿Puedo versionar mis workflows?

Opciones:

1. **Exportar JSON**: Guarda versiones en Git
2. **n8n Cloud**: Tiene versionado básico
3. **API de n8n**: Automatiza backups

### ¿Cómo comparto un workflow?

1. Click en los tres puntos (menú)
2. Selecciona "Download"
3. Guarda el archivo JSON
4. Comparte (sin credenciales incluidas)

---

## 🏠 Navegación

| ⬅️ Anterior | 📚 Recurso Actual | ➡️ Siguiente |
|------------|-------------------|--------------|
| [Cheatsheet Webhooks](cheatsheet-webhooks.md) | **FAQ** | [Videos Recomendados](videos-recomendados.md) |
