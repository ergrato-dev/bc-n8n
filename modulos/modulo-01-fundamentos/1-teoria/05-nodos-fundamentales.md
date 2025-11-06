# Nodos Fundamentales de n8n

## 📋 Objetivos de Aprendizaje

Al finalizar este documento, serás capaz de:

- ✅ Identificar y usar los 10 nodos más importantes de n8n
- ✅ Implementar lógica condicional con IF y Switch
- ✅ Combinar datos de múltiples fuentes con Merge
- ✅ Procesar grandes volúmenes de datos con Split In Batches
- ✅ Transformar datos con Set y Code
- ✅ Manejar errores con Error Trigger
- ✅ Crear loops y bucles con Loop Over Items
- ✅ Elegir el nodo correcto para cada situación
- ✅ Optimizar workflows usando los nodos adecuados

---

## 🎯 ¿Por Qué Son "Fundamentales"?

Estos nodos representan el **80% de los workflows** que construirás. Son los bloques de construcción básicos que, combinados correctamente, te permiten crear automatizaciones complejas.

**Categorías de nodos fundamentales:**

1. **Lógica** → IF, Switch
2. **Datos** → Set, Code, Merge
3. **Control de flujo** → Split In Batches, Loop Over Items
4. **Utilidades** → No Operation, Stop and Error
5. **Manejo de errores** → Error Trigger

---

## 📊 Mapa de Nodos Fundamentales

![Nodos Fundamentales](../../../assets/diagrams/modulo-01/nodos-fundamentales.svg)

---

## 1️⃣ IF Node - Lógica Condicional Simple

### 🎯 ¿Cuándo usarlo?

- Necesitas dividir el flujo en **2 caminos**: verdadero o falso
- Quieres validar condiciones simples
- Necesitas filtrar datos basándote en una regla

### 🔧 Configuración

**Campos principales:**

| Campo         | Descripción             | Ejemplo                       |
| ------------- | ----------------------- | ----------------------------- |
| **Value 1**   | Primer valor a comparar | `{{ $json.age }}`             |
| **Operation** | Tipo de comparación     | `Greater than`, `Equal`, etc. |
| **Value 2**   | Segundo valor           | `18`                          |

### 📝 Ejemplo Práctico: Filtrar Usuarios Mayores de Edad

```
Workflow: Validar Edad de Usuarios

HTTP Request (obtener usuarios)
    ↓
IF (age > 18)
    ↓ true  → Set (usuarios válidos)
    ↓ false → Stop and Error (usuario rechazado)
```

**Configuración del IF:**

- **Value 1:** `{{ $json.age }}`
- **Operation:** `Larger`
- **Value 2:** `18`

### 💡 Tips

- ✅ El nodo IF procesa **todos los items** individualmente
- ✅ Items que cumplen la condición salen por "true"
- ✅ Items que NO cumplen salen por "false"
- ✅ Puedes tener **múltiples condiciones** (AND/OR)

### 🎨 Mejores Prácticas

**❌ Evita:**

```javascript
// Comparar textos sin normalizar
{{ $json.status }} equals "Active"  // Falla si es "active" o "ACTIVE"
```

**✅ Hazlo bien:**

```javascript
// Normaliza antes de comparar
{{ $json.status.toLowerCase() }} equals "active"
```

---

## 2️⃣ Switch Node - Lógica Condicional Múltiple

### 🎯 ¿Cuándo usarlo?

- Necesitas más de **2 caminos** de salida
- Quieres clasificar datos en múltiples categorías
- Necesitas routing complejo basado en valores

### 🔧 Configuración

**Modos disponibles:**

1. **Rules** → Define condiciones específicas (como múltiples IF)
2. **Expression** → Usa una expresión que devuelve el índice de salida

### 📝 Ejemplo Práctico: Clasificar Productos por Precio

```
Workflow: Categorizar Productos

HTTP Request (obtener productos)
    ↓
Switch (clasificar por precio)
    ↓ Output 0 → Económico (< $50)
    ↓ Output 1 → Medio ($50 - $200)
    ↓ Output 2 → Premium (> $200)
    ↓ Output 3 → Sin clasificar (default)
```

**Configuración del Switch (modo Rules):**

```
Rule 1: {{ $json.price }} < 50       → Output 0
Rule 2: {{ $json.price }} < 200      → Output 1
Rule 3: {{ $json.price }} >= 200     → Output 2
Default: Fallback                     → Output 3
```

### 💡 Tips

- ✅ Las reglas se evalúan en **orden secuencial**
- ✅ La primera regla que cumple determina la salida
- ✅ El **Fallback** captura todo lo que no cumplió ninguna regla
- ✅ Más eficiente que múltiples nodos IF encadenados

### 🎨 Uso con Expression

Para casos más complejos, usa el modo **Expression**:

```javascript
// Devuelve 0, 1, 2, o 3 según el tipo
{
  {
    $json.type === 'urgent'
      ? 0
      : $json.type === 'normal'
      ? 1
      : $json.type === 'low'
      ? 2
      : 3;
  }
}
```

---

## 3️⃣ Set Node - Transformación de Datos

### 🎯 ¿Cuándo usarlo?

- Necesitas renombrar campos
- Quieres extraer solo algunos campos
- Necesitas añadir campos calculados
- Quieres limpiar/simplificar datos

### 🔧 Modos de Operación

**1. Keep Only Set (Mantener solo lo definido)**

- Elimina todos los campos excepto los que especifiques
- **Uso:** Limpiar datos, extraer campos específicos

**2. Include All Other Fields (Incluir todo + añadir)**

- Mantiene todos los campos originales + añade nuevos
- **Uso:** Enriquecer datos, añadir campos calculados

### 📝 Ejemplo Práctico: Normalizar Datos de Usuario

```
Workflow: Limpiar Datos de CRM

HTTP Request (obtener usuarios de CRM)
    ↓
Set (normalizar campos)
    ↓
Output: Datos limpios y consistentes
```

**Configuración del Set:**

| Nombre Campo       | Tipo    | Valor                                          |
| ------------------ | ------- | ---------------------------------------------- |
| `id`               | Number  | `{{ $json.user_id }}`                          |
| `nombreCompleto`   | String  | `{{ $json.first_name }} {{ $json.last_name }}` |
| `emailNormalizado` | String  | `{{ $json.email.toLowerCase().trim() }}`       |
| `registradoEn`     | String  | `{{ $json.created_at.split('T')[0] }}`         |
| `esActivo`         | Boolean | `{{ $json.status === 'active' }}`              |

**Activar:** Keep Only Set ✅

### 💡 Tips Avanzados

**Operaciones comunes:**

```javascript
// Concatenar strings
{
  {
    $json.firstName + ' ' + $json.lastName;
  }
}

// Extraer fecha de timestamp
{
  {
    $json.timestamp.split('T')[0];
  }
}

// Convertir a mayúsculas
{
  {
    $json.name.toUpperCase();
  }
}

// Formatear números
{
  {
    Number($json.price).toFixed(2);
  }
}

// Valor por defecto
{
  {
    $json.optional || 'N/A';
  }
}
```

---

## 4️⃣ Code Node - JavaScript Personalizado

### 🎯 ¿Cuándo usarlo?

- Necesitas lógica compleja que no puedes hacer con otros nodos
- Quieres usar librerías de JavaScript
- Necesitas transformaciones avanzadas
- Requieres cálculos matemáticos complejos

### 🔧 Dos Variantes

**1. Code (Run Once for All Items)**

- Procesa **todos los items** en un solo script
- Más eficiente para operaciones masivas
- Acceso a: `items` (array completo)

**2. Code (Run Once for Each Item)**

- Procesa **cada item individualmente**
- Más simple para transformaciones item por item
- Acceso a: `item` (item actual)

### 📝 Ejemplo Práctico: Calcular Estadísticas

**Escenario:** Tienes ventas diarias y quieres calcular totales y promedios.

```javascript
// Code (Run Once for All Items)

// Acceder a todos los items
const ventas = items.map((item) => item.json);

// Calcular estadísticas
const total = ventas.reduce((sum, v) => sum + v.monto, 0);
const promedio = total / ventas.length;
const maximo = Math.max(...ventas.map((v) => v.monto));
const minimo = Math.min(...ventas.map((v) => v.monto));

// Devolver resultado
return [
  {
    json: {
      totalVentas: total,
      promedioVentas: promedio,
      ventaMaxima: maximo,
      ventaMinima: minimo,
      cantidadVentas: ventas.length,
    },
  },
];
```

### 📝 Ejemplo Práctico: Transformar Item por Item

**Escenario:** Enriquecer cada producto con campos calculados.

```javascript
// Code (Run Once for Each Item)

// Acceder al item actual
const producto = item.json;

// Calcular descuento
const precioOriginal = producto.precio;
const descuento = producto.descuento || 0;
const precioFinal = precioOriginal * (1 - descuento / 100);

// Calcular categoría de precio
let categoria;
if (precioFinal < 50) {
  categoria = 'Económico';
} else if (precioFinal < 200) {
  categoria = 'Medio';
} else {
  categoria = 'Premium';
}

// Devolver item transformado
return {
  json: {
    id: producto.id,
    nombre: producto.nombre,
    precioOriginal: precioOriginal,
    descuento: descuento,
    precioFinal: precioFinal.toFixed(2),
    categoria: categoria,
    ahorras: (precioOriginal - precioFinal).toFixed(2),
  },
};
```

### 💡 Tips del Code Node

**Variables disponibles:**

```javascript
// Run Once for All Items
items; // Array de todos los items
$item(0); // Acceder a item específico por índice
$node; // Información del nodo actual
$workflow; // Información del workflow

// Run Once for Each Item
item; // Item actual siendo procesado
$input; // Alias de item
$itemIndex; // Índice del item actual
```

**Librerías disponibles:**

```javascript
// Moment.js para fechas
const moment = require('moment');
const fecha = moment().format('YYYY-MM-DD');

// Lodash para utilidades
const _ = require('lodash');
const unicos = _.uniq([1, 2, 2, 3]);

// Axios para HTTP (en algunos casos)
const axios = require('axios');
```

### 🎨 Mejores Prácticas

**❌ Evita:**

```javascript
// Modificar el item directamente
item.json.nuevocampo = 'valor'; // NO hacer esto
```

**✅ Hazlo bien:**

```javascript
// Devolver un nuevo objeto
return {
  json: {
    ...item.json,
    nuevocampo: 'valor',
  },
};
```

---

## 5️⃣ Merge Node - Combinar Datos

### 🎯 ¿Cuándo usarlo?

- Necesitas combinar datos de **2 o más fuentes**
- Quieres hacer joins tipo SQL
- Necesitas enriquecer datos con información adicional

### 🔧 Modos de Merge

**1. Append (Concatenar)**

- Une todos los items en un solo output
- **Uso:** Combinar listas de diferentes fuentes

**2. Merge By Fields (Join)**

- Une items que coincidan en un campo específico
- **Uso:** Equivalent a SQL JOIN

**3. Merge By Position**

- Une items según su posición en el array
- **Uso:** Cuando el orden es importante

### 📝 Ejemplo Práctico: Enriquecer Pedidos con Datos de Clientes

```
Workflow: Completar Información de Pedidos

┌─ HTTP Request (pedidos)
│       ↓
├─ HTTP Request (clientes)
│       ↓
└───→ Merge (by customer_id)
          ↓
    Set (formatear datos finales)
```

**Configuración del Merge:**

- **Mode:** Merge By Fields
- **Join:** Inner Join (solo items que coincidan)
- **Input 1 Field:** `customer_id`
- **Input 2 Field:** `id`
- **Output Data:** Input 1 + Input 2

**Resultado:**

```json
// Input 1 (pedidos)
{ "order_id": 1, "customer_id": 101, "total": 250 }

// Input 2 (clientes)
{ "id": 101, "name": "Juan Pérez", "email": "juan@example.com" }

// Output (merged)
{
  "order_id": 1,
  "customer_id": 101,
  "total": 250,
  "name": "Juan Pérez",
  "email": "juan@example.com"
}
```

### 💡 Tips del Merge

**Tipos de Join disponibles:**

| Join Type      | Comportamiento                             |
| -------------- | ------------------------------------------ |
| **Inner Join** | Solo items que coincidan en ambas fuentes  |
| **Left Join**  | Todos de Input 1 + coincidentes de Input 2 |
| **Outer Join** | Todos de ambas fuentes                     |

**⚠️ Importante:**

- El Merge tiene **2 inputs** (Input 1 e Input 2)
- Define cuál es cuál según el orden de conexión
- El orden importa en Left/Right Joins

---

## 6️⃣ Split In Batches - Procesar en Lotes

### 🎯 ¿Cuándo usarlo?

- Necesitas procesar **grandes volúmenes** de datos
- La API externa tiene **límites de rate**
- Quieres **optimizar performance**
- Necesitas procesar datos de forma incremental

### 🔧 Configuración

| Campo          | Descripción                | Ejemplo |
| -------------- | -------------------------- | ------- |
| **Batch Size** | Cantidad de items por lote | `10`    |
| **Options**    | Reset, pausa entre lotes   | -       |

### 📝 Ejemplo Práctico: Enviar 100 Emails Respetando Rate Limits

```
Workflow: Email Marketing (100 destinatarios)

HTTP Request (obtener contactos) → 100 items
    ↓
Split In Batches (10 items por lote)
    ↓
Nodo de Email (enviar a 10 destinatarios)
    ↓
Loop (regresa al Split) → Procesa siguiente lote
```

**Configuración:**

- **Batch Size:** 10
- **Options > Pause:** 1000ms (1 segundo entre lotes)

**Flujo de ejecución:**

```
Lote 1: Items 1-10   → Envía emails → Espera 1s
Lote 2: Items 11-20  → Envía emails → Espera 1s
Lote 3: Items 21-30  → Envía emails → Espera 1s
...
Lote 10: Items 91-100 → Envía emails → Fin
```

### 💡 Cómo Funciona el Loop

El **Split In Batches** tiene una salida especial que:

1. Procesa el primer lote
2. Envía items al siguiente nodo
3. Al final del procesamiento, **regresa** al Split In Batches
4. Procesa el siguiente lote
5. Repite hasta procesar todos los items

**Conexión del loop:**

- Conecta el **último nodo** de tu lote de regreso al **Split In Batches**

### 🎨 Mejores Prácticas

**Rate Limiting:**

```
Split In Batches (batch: 50)
  ↓
  Options:
    - Reset: false
    - Pause: 2000ms (2 segundos)
```

**Monitoreo de progreso:**

```javascript
// En un Code Node dentro del loop
const totalItems = $node['Split In Batches'].json.totalItems;
const currentBatch = $node['Split In Batches'].json.batchNumber;
const progress = (currentBatch / Math.ceil(totalItems / batchSize)) * 100;

console.log(`Progreso: ${progress.toFixed(2)}%`);
```

---

## 7️⃣ Loop Over Items - Iterar Sobre Datos

### 🎯 ¿Cuándo usarlo?

- Necesitas procesar items **uno por uno** con delay
- Cada item requiere múltiples pasos secuenciales
- Necesitas control fino sobre la iteración

### 🔧 Diferencia con Split In Batches

| Característica    | Split In Batches | Loop Over Items    |
| ----------------- | ---------------- | ------------------ |
| **Procesamiento** | Por lotes        | Item por item      |
| **Velocidad**     | Más rápido       | Más lento          |
| **Control**       | Menos granular   | Más granular       |
| **Uso común**     | Volumen masivo   | Procesos complejos |

### 📝 Ejemplo Práctico: Scraping con Delays

```
Workflow: Extraer Datos de Múltiples URLs

Set (crear lista de URLs) → 20 URLs
    ↓
Loop Over Items
    ↓
HTTP Request (obtener HTML de URL actual)
    ↓
Code (extraer datos del HTML)
    ↓
Wait (esperar 2 segundos)
    ↓
Webhook (enviar datos extraídos)
    ↓
Loop (volver al Loop Over Items)
```

### 💡 Tips

- Cada iteración procesa **1 item**
- Útil para **respetar rate limits estrictos**
- Puedes añadir **Wait nodes** entre iteraciones
- Más lento pero más controlable que Split In Batches

---

## 8️⃣ No Operation (NoOp) - Nodo Placeholder

### 🎯 ¿Cuándo usarlo?

- Testing: quieres **deshabilitar temporalmente** una rama
- Debugging: necesitas **puntos de parada**
- Organización: quieres **documentar** el flujo visualmente

### 📝 Uso Común

```
IF (condición)
  ↓ true  → Procesar
  ↓ false → NoOp (todavía no implementado)
```

### 💡 Tips

- **No hace nada**: simplemente pasa los datos sin modificar
- Útil para **desarrollo incremental**
- Puedes añadir **notas** para recordar qué implementar después

---

## 9️⃣ Stop and Error - Detener Ejecución

### 🎯 ¿Cuándo usarlo?

- Necesitas **detener el workflow** bajo ciertas condiciones
- Quieres marcar un error **explícitamente**
- Validaciones que deben interrumpir el proceso

### 🔧 Configuración

| Campo             | Descripción                   |
| ----------------- | ----------------------------- |
| **Error Message** | Mensaje descriptivo del error |

### 📝 Ejemplo Práctico: Validación de Datos

```
Workflow: Procesar Pedido

HTTP Request (obtener pedido)
    ↓
IF (stock disponible?)
    ↓ true  → Procesar pedido
    ↓ false → Stop and Error ("Stock insuficiente")
```

### 💡 Comportamiento

- Detiene la ejecución **inmediatamente**
- Marca el workflow como **error**
- Aparece en el **error log**
- Puede disparar un **Error Trigger** en otro workflow

---

## 🔟 Error Trigger - Manejo de Errores

### 🎯 ¿Cuándo usarlo?

- Quieres **notificar** cuando un workflow falla
- Necesitas **recuperación automática** de errores
- Quieres **registrar** errores en una base de datos

### 📝 Ejemplo Práctico: Sistema de Alertas

```
Workflow A: Procesar Pagos
  (si falla, dispara Error Trigger)

Workflow B: Manejo de Errores de Pagos
  ↓
Error Trigger (escucha errores de Workflow A)
  ↓
Set (extraer info del error)
  ↓
Slack (enviar alerta al equipo)
  ↓
Google Sheets (registrar error)
```

### 🔧 Configuración

**En el Error Trigger:**

- **Workflows to Listen To:** Selecciona el workflow a monitorear

**Datos disponibles:**

```json
{
  "execution": {
    "id": "12345",
    "mode": "manual",
    "startedAt": "2025-11-06T10:00:00.000Z"
  },
  "workflow": {
    "id": "67890",
    "name": "Procesar Pagos"
  },
  "error": {
    "message": "API connection failed",
    "node": "HTTP Request"
  }
}
```

---

## 📊 Tabla Comparativa: ¿Qué Nodo Usar?

| Necesito...                             | Usa este nodo        |
| --------------------------------------- | -------------------- |
| Dividir en 2 caminos (si/no)            | **IF**               |
| Dividir en 3+ caminos                   | **Switch**           |
| Renombrar/extraer campos                | **Set**              |
| Lógica compleja en JavaScript           | **Code**             |
| Combinar 2 fuentes de datos             | **Merge**            |
| Procesar 1000+ items eficientemente     | **Split In Batches** |
| Procesar items uno por uno con delay    | **Loop Over Items**  |
| Detener workflow con error              | **Stop and Error**   |
| Reaccionar a errores de otros workflows | **Error Trigger**    |

---

## 🎯 Ejercicios Prácticos

### Ejercicio 1: Sistema de Clasificación

**Objetivo:** Usar Switch para clasificar productos.

**Requisitos:**

1. Obtén productos de: `https://jsonplaceholder.typicode.com/posts`
2. Usa Switch para clasificar por `userId`:
   - userId 1-3: "Categoría A"
   - userId 4-7: "Categoría B"
   - userId 8-10: "Categoría C"
3. Usa Set para añadir el campo `categoria`

### Ejercicio 2: Enriquecimiento de Datos

**Objetivo:** Usar Merge para combinar datos.

**Requisitos:**

1. Obtén users: `https://jsonplaceholder.typicode.com/users`
2. Obtén posts: `https://jsonplaceholder.typicode.com/posts`
3. Usa Merge para combinar posts con info del autor
4. Output final: `{ postTitle, postBody, authorName, authorEmail }`

### Ejercicio 3: Procesamiento en Lotes

**Objetivo:** Usar Split In Batches para optimizar.

**Requisitos:**

1. Obtén 100 photos: `https://jsonplaceholder.typicode.com/photos`
2. Usa Split In Batches (10 items por lote)
3. Añade un Wait de 1 segundo entre lotes
4. Transforma cada lote con Set
5. Conecta el loop correctamente

---

## 💡 Mejores Prácticas Generales

### 1. Elegir el Nodo Correcto

**❌ Evita:**

```
Usar múltiples IF encadenados cuando puedes usar Switch
Usar Code cuando Set es suficiente
Procesar 10,000 items sin Split In Batches
```

**✅ Hazlo bien:**

```
Switch para múltiples condiciones
Set para transformaciones simples
Split In Batches para grandes volúmenes
Code solo para lógica compleja
```

### 2. Optimización de Performance

**Orden de eficiencia (más rápido a más lento):**

1. Set Node (más rápido)
2. IF / Switch
3. Merge
4. Code (Run Once for All Items)
5. Split In Batches
6. Code (Run Once for Each Item)
7. Loop Over Items (más lento)

### 3. Debugging

**Técnicas útiles:**

```javascript
// En Code Node - log para debugging
console.log('Items recibidos:', items.length);
console.log('Primer item:', JSON.stringify(items[0], null, 2));

// En expresiones - valor por defecto para debugging
{
  {
    $json.campo || 'CAMPO_NO_ENCONTRADO';
  }
}
```

### 4. Documentación

**Siempre documenta nodos complejos:**

- Añade **notas** explicando la lógica
- Usa **nombres descriptivos**: "Filtrar usuarios activos" en vez de "IF"
- Añade **comentarios** en Code Nodes

---

## 🐛 Troubleshooting

### Error: "Item X doesn't exist"

**Causa:** Intentas acceder a un item que no existe.

**Solución:**

```javascript
// Verifica que el item existe
{
  {
    $json.campo !== undefined ? $json.campo : 'default';
  }
}
```

### Error: "Cannot read property of undefined"

**Causa:** Campo anidado no existe.

**Solución:**

```javascript
// Usa optional chaining
{
  {
    $json.user?.profile?.name || 'Sin nombre';
  }
}
```

### Merge devuelve 0 items

**Causa:** Los campos de join no coinciden.

**Solución:**

1. Ejecuta ambos inputs por separado
2. Verifica los nombres de campos exactos
3. Asegúrate de que los tipos de datos coincidan (string vs number)

### Split In Batches no hace loop

**Causa:** No conectaste el último nodo de regreso al Split.

**Solución:**

1. Conecta el último nodo del flujo al **input** del Split In Batches
2. Verifica que la conexión forme un loop

---

## 📚 Recursos Adicionales

### Documentación Oficial

- [IF Node](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.if/)
- [Switch Node](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.switch/)
- [Set Node](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.set/)
- [Code Node](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.code/)
- [Merge Node](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.merge/)
- [Split In Batches](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.splitinbatches/)

### Templates de la Comunidad

- [n8n Templates](https://n8n.io/workflows/) - Workflows de ejemplo
- [Community Workflows](https://community.n8n.io/c/workflows/10) - Compartidos por usuarios

---

## 🔜 Siguiente Paso

En el siguiente documento, **"Conexiones y Flujos de Datos"**, aprenderás:

- Cómo conectar nodos correctamente
- Flujos condicionales complejos
- Múltiples ramas y convergencias
- Patrones de diseño de workflows
- Optimización de flujos de datos

**📝 Prepárate:** Practica los ejercicios de este documento. Los conceptos de nodos fundamentales son la base para workflows complejos.

---

## 🎓 Lo Que Has Aprendido

¡Felicidades! Ahora dominas los nodos fundamentales de n8n:

✅ **Lógica:** IF y Switch para decisiones
✅ **Datos:** Set y Code para transformaciones
✅ **Control:** Split In Batches y Loop Over Items
✅ **Utilidades:** NoOp, Stop and Error, Error Trigger
✅ **Optimización:** Elegir el nodo correcto
✅ **Debugging:** Técnicas de troubleshooting

**🎯 Próximo hito:** Combinar estos nodos en workflows complejos con múltiples ramas y flujos de datos avanzados.
