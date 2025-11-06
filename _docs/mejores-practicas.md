# Mejores Prácticas en n8n

Esta guía documenta las mejores prácticas para crear workflows robustos, mantenibles y eficientes en n8n.

## 📋 Tabla de Contenidos

- [Nomenclatura](#nomenclatura)
- [Organización de Workflows](#organización-de-workflows)
- [Manejo de Errores](#manejo-de-errores)
- [Seguridad](#seguridad)
- [Performance](#performance)
- [Documentación](#documentación)

---

## Nomenclatura

### Nombres de Workflows

✅ **Buenas prácticas:**

```
enviar-email-bienvenida
sincronizar-contactos-crm
procesar-pedidos-diarios
notificar-errores-sistema
```

❌ **Evitar:**

```
workflow1
test
mi_workflow
WorkflowFinal
```

**Reglas:**

- Usar kebab-case (palabras separadas por guiones)
- Comenzar con verbo de acción
- Ser descriptivo pero conciso
- En español (consistencia del bootcamp)

### Nombres de Variables

✅ **Buenas prácticas:**

```javascript
datosUsuario;
emailDestino;
listaProductos;
fechaActual;
```

❌ **Evitar:**

```javascript
x
temp
data1
var
```

**Reglas:**

- Usar camelCase
- Nombres descriptivos
- En español
- Evitar abreviaturas ambiguas

---

## Organización de Workflows

### Estructura Clara

1. **Inicio:** Nodo trigger claramente identificado
2. **Validación:** Verificar datos de entrada
3. **Procesamiento:** Lógica principal del workflow
4. **Manejo de errores:** Try-catch o Error Trigger
5. **Salida:** Resultado o notificación

### Uso de Sticky Notes

```
💡 Usa Sticky Notes para:
- Documentar secciones del workflow
- Explicar lógica compleja
- Marcar TODOs o mejoras pendientes
- Indicar requisitos de credenciales
```

### Ejemplo de Organización Visual

```
[Trigger] → [Validar Entrada] → [Procesar] → [Guardar] → [Notificar]
                ↓ (error)
           [Error Handler] → [Log Error] → [Alertar Admin]
```

---

## Manejo de Errores

### 🎯 Principio: "Siempre planifica para el fracaso"

### Error Workflow vs Try-Catch

**Error Workflow (recomendado para producción):**

```
✓ Centraliza manejo de errores
✓ Más limpio visualmente
✓ Reutilizable
✓ Fácil de mantener
```

**Try-Catch en el mismo workflow:**

```
✓ Bueno para debugging
✓ Errores específicos por nodo
✓ Control granular
```

### Mejores Prácticas de Error Handling

1. **Nunca dejar workflows sin manejo de errores**
2. **Registrar errores (logs)**
3. **Notificar cuando sea crítico**
4. **Incluir contexto en los mensajes de error:**

   ```javascript
   {
     "error": "{{ $json.error.message }}",
     "workflow": "{{ $workflow.name }}",
     "node": "{{ $node.name }}",
     "timestamp": "{{ $now }}",
     "input": "{{ $json }}"
   }
   ```

5. **Implementar retry logic cuando sea apropiado:**
   - Fallos de red
   - APIs con rate limits
   - Timeouts temporales

---

## Seguridad

### 🔒 Reglas de Oro

#### 1. Credenciales

✅ **Hacer:**

- Usar el sistema de credenciales de n8n
- Nombrar credenciales descriptivamente
- Compartir solo las necesarias

❌ **NUNCA hacer:**

- Hardcodear API keys en workflows
- Compartir credenciales en capturas de pantalla
- Versionar archivos con credenciales

#### 2. Datos Sensibles

```javascript
// ❌ NUNCA
const apiKey = 'sk-1234567890abcdef';
const password = 'MiPassword123';

// ✅ SIEMPRE
const apiKey = '{{ $credentials.openai.apiKey }}';
```

#### 3. Validación de Entrada

```javascript
// Siempre validar datos de webhooks
if (!$input.item.json.email) {
  throw new Error('Email requerido');
}

if (!$input.item.json.email.includes('@')) {
  throw new Error('Email inválido');
}
```

#### 4. Webhooks

- Usar autenticación en webhooks públicos
- Validar headers y signatures
- Implementar rate limiting cuando sea posible
- No exponer información sensible en URLs

---

## Performance

### ⚡ Optimización de Workflows

#### 1. Split In Batches

Para procesar grandes volúmenes de datos:

```
✅ Procesar 1000 items en lotes de 100
❌ Procesar 1000 items uno por uno
```

#### 2. Usar Set Node Eficientemente

```javascript
// ✅ Transformar una vez
return {
  nombre: $json.name,
  email: $json.email,
  fecha: new Date().toISOString(),
};

// ❌ Múltiples Set nodes seguidos
```

#### 3. Caché y Almacenamiento Temporal

- Usar variables de workflow para datos que se usan múltiples veces
- Implementar caché para llamadas API repetitivas
- Considerar usar Function nodes para transformaciones complejas

#### 4. Límites de Tiempo

```javascript
// Configurar timeouts apropiados
// HTTP Request: 60 segundos (default)
// Code nodes: 10 segundos (default)
// Ajustar según necesidades
```

---

## Documentación

### 📝 Qué Documentar

1. **En el Workflow:**

   - Propósito general (Sticky Note al inicio)
   - Credenciales necesarias
   - Variables de entorno requeridas
   - Triggers y su configuración
   - Lógica compleja o no obvia

2. **En Code Nodes:**

   ```javascript
   /*
    * Función: Calcular precio con descuento
    * Input: { precio: number, descuento: number }
    * Output: { precioFinal: number }
    */
   const precioFinal = $json.precio * (1 - $json.descuento / 100);
   return { precioFinal };
   ```

3. **En el Repositorio:**
   - README.md con descripción del workflow
   - Casos de uso
   - Dependencias
   - Instrucciones de configuración

### Template de Documentación

```markdown
# Workflow: [Nombre]

## Descripción

[Breve descripción del propósito]

## Trigger

[Cómo se inicia el workflow]

## Requisitos

- Credenciales: [listar]
- Variables: [listar]
- Integraciones: [listar]

## Flujo

1. [Paso 1]
2. [Paso 2]
3. [Paso 3]

## Manejo de Errores

[Cómo se manejan errores]

## Notas

[Información adicional]
```

---

## 🎓 Checklist Pre-Producción

Antes de mover un workflow a producción:

- [ ] Nombre descriptivo y consistente
- [ ] Manejo de errores implementado
- [ ] Credenciales configuradas correctamente
- [ ] Sin datos sensibles hardcodeados
- [ ] Validación de entrada implementada
- [ ] Logging apropiado
- [ ] Documentación completa
- [ ] Probado con datos reales
- [ ] Timeouts configurados
- [ ] Notificaciones de error configuradas

---

## 🚀 Recursos Adicionales

- [Documentación Oficial de n8n](https://docs.n8n.io/)
- [n8n Community Forum](https://community.n8n.io/)
- [Best Practices (oficial)](https://docs.n8n.io/workflows/best-practices/)

---

**💡 Consejo Final:** Las mejores prácticas evolucionan. Revisa y actualiza tus workflows regularmente.
