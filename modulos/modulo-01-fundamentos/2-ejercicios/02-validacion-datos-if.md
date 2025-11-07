# Ejercicio 2: Validación de Datos con IF

## 📋 Información del Ejercicio

| Propiedad           | Detalle                                                        |
| ------------------- | -------------------------------------------------------------- |
| **Nivel**           | 🟢 Básico                                                      |
| **Tiempo estimado** | ⏱️ 35 minutos                                                  |
| **Prerequisitos**   | Ejercicio 01, Documentos 05-06 de teoría                       |
| **Conceptos**       | IF node, Expresiones de comparación, Branching, Error handling |

---

## 🎯 Objetivos de Aprendizaje

Al completar este ejercicio, serás capaz de:

1. ✅ Implementar validaciones con el nodo IF
2. ✅ Usar expresiones de comparación (>, <, ==, !=, &&, ||)
3. ✅ Manejar flujos condicionales (true/false branches)
4. ✅ Procesar datos válidos e inválidos por separado
5. ✅ Implementar lógica de negocio básica

---

## 📝 Descripción del Ejercicio

Vas a extender el workflow del Ejercicio 01 añadiendo validaciones:

1. Obtener posts de una API (en lugar de usuarios)
2. Validar que los posts cumplan criterios de calidad
3. Separar posts válidos de inválidos
4. Generar reportes diferentes para cada grupo

**Criterios de Validación:**

- Título debe tener al menos 10 caracteres
- Body debe tener al menos 50 caracteres
- userId debe estar entre 1 y 10

---

## 🔧 Especificaciones Técnicas

### **API a Utilizar:**

```
Endpoint: https://jsonplaceholder.typicode.com/posts
Método: GET
Respuesta: Array de 100 posts con userId, title, body
```

### **Datos de Entrada Esperados:**

La API retorna posts con esta estructura:

```json
{
  "userId": 1,
  "id": 1,
  "title": "sunt aut facere repellat provident",
  "body": "quia et suscipit\nsuscipit recusandae consequuntur..."
}
```

### **Lógica de Validación:**

Un post es **VÁLIDO** si cumple **TODAS** estas condiciones:

```javascript
title.length >= 10 && body.length >= 50 && userId >= 1 && userId <= 10;
```

---

## 🏗️ Estructura del Workflow

```
Manual Trigger
↓
HTTP Request (GET posts)
↓
IF (Validar post)
├─ TRUE (Post válido)
│  ↓
│  Set (Marcar como válido)
│  ↓
│  Code (Resumen válidos)
│
└─ FALSE (Post inválido)
   ↓
   Set (Marcar como inválido + razón)
   ↓
   Code (Resumen inválidos)
```

---

## 📋 Instrucciones Paso a Paso

### **Paso 1: Crear Nuevo Workflow**

1. Crea nuevo workflow: "Ejercicio 02 - Validación Posts"
2. Guarda el workflow

### **Paso 2: Añadir Manual Trigger y HTTP Request**

1. Añade "Manual Trigger"
2. Añade "HTTP Request" configurado así:
   ```
   Request Method: GET
   URL: https://jsonplaceholder.typicode.com/posts
   ```
3. Ejecuta y verifica que obtienes 100 posts

**Checkpoint:** ¿Tienes 100 items en el output?

### **Paso 3: Añadir IF Node para Validación**

1. Conecta un nodo "IF" después de HTTP Request
2. Nombra el nodo: "Validar Calidad Post"
3. Configura la condición compuesta:

**Configuración del IF:**

Modo: "Add Condition" con múltiples reglas

**Condición 1:**

```
Field: {{ $json.title }}
Operation: String - Length
Length: Larger Than or Equal
Value: 10
```

**Condición 2:**

```
Field: {{ $json.body }}
Operation: String - Length
Length: Larger Than or Equal
Value: 50
```

**Condición 3:**

```
Field: {{ $json.userId }}
Operation: Number - Larger or Equal
Value: 1
```

**Condición 4:**

```
Field: {{ $json.userId }}
Operation: Number - Smaller or Equal
Value: 10
```

**Combine Conditions:** AND (todas deben cumplirse)

4. Ejecuta el nodo y observa que se separan en dos outputs

**Checkpoint:** ¿Ves dos ramas: "true" y "false"?

### **Paso 4: Procesar Posts Válidos (Rama TRUE)**

1. En la rama "true", añade un nodo "Set"
2. Nombra el nodo: "Marcar Post Válido"
3. Configura los campos:

```
Campo 1:
Name: post_id
Value: {{ $json.id }}

Campo 2:
Name: autor_id
Value: {{ $json.userId }}

Campo 3:
Name: titulo
Value: {{ $json.title }}

Campo 4:
Name: extracto
Value: {{ $json.body.substring(0, 100) }}...

Campo 5:
Name: estado
Value: VÁLIDO

Campo 6:
Name: longitud_titulo
Value: {{ $json.title.length }}

Campo 7:
Name: longitud_body
Value: {{ $json.body.length }}

Campo 8:
Name: validado_en
Value: {{ $now.toISO() }}
```

4. Activa "Keep Only Set"
5. Ejecuta y verifica la transformación

### **Paso 5: Generar Reporte de Posts Válidos**

1. Después del Set de válidos, añade un nodo "Code"
2. Nombra el nodo: "Reporte Posts Válidos"
3. Usa este código:

```javascript
// Obtener todos los posts válidos
const posts_validos = $input.all();

// Calcular estadísticas
const total_validos = posts_validos.length;

// Agrupar por autor
const posts_por_autor = {};
posts_validos.forEach((post) => {
  const autor_id = post.json.autor_id;
  if (!posts_por_autor[autor_id]) {
    posts_por_autor[autor_id] = [];
  }
  posts_por_autor[autor_id].push({
    id: post.json.post_id,
    titulo: post.json.titulo,
  });
});

// Calcular promedios
const longitudes_titulo = posts_validos.map((p) => p.json.longitud_titulo);
const longitudes_body = posts_validos.map((p) => p.json.longitud_body);

const promedio_titulo =
  longitudes_titulo.reduce((a, b) => a + b, 0) / total_validos;
const promedio_body =
  longitudes_body.reduce((a, b) => a + b, 0) / total_validos;

// Top 5 posts más largos
const top_posts = posts_validos
  .map((p) => ({
    id: p.json.post_id,
    titulo: p.json.titulo,
    longitud_total: p.json.longitud_titulo + p.json.longitud_body,
  }))
  .sort((a, b) => b.longitud_total - a.longitud_total)
  .slice(0, 5);

return [
  {
    json: {
      tipo_reporte: 'POSTS VÁLIDOS',
      total_posts_validos: total_validos,
      posts_por_autor: posts_por_autor,
      estadisticas: {
        promedio_longitud_titulo: Math.round(promedio_titulo),
        promedio_longitud_body: Math.round(promedio_body),
        titulo_mas_corto: Math.min(...longitudes_titulo),
        titulo_mas_largo: Math.max(...longitudes_titulo),
        body_mas_corto: Math.min(...longitudes_body),
        body_mas_largo: Math.max(...longitudes_body),
      },
      top_5_posts_largos: top_posts,
      generado_en: new Date().toISOString(),
    },
  },
];
```

4. Ejecuta y verifica el reporte

**Checkpoint:** ¿Obtienes estadísticas de los posts válidos?

### **Paso 6: Procesar Posts Inválidos (Rama FALSE)**

1. En la rama "false" del IF, añade un nodo "Set"
2. Nombra el nodo: "Marcar Post Inválido + Razón"
3. Configura los campos:

```javascript
Campo 1:
Name: post_id
Value: {{ $json.id }}

Campo 2:
Name: autor_id
Value: {{ $json.userId }}

Campo 3:
Name: titulo
Value: {{ $json.title }}

Campo 4:
Name: estado
Value: INVÁLIDO

Campo 5:
Name: razon_rechazo
Value: {{ $json.title.length < 10 ? 'Título muy corto (' + $json.title.length + ' chars)' : '' }}{{ $json.title.length < 10 && $json.body.length < 50 ? ' | ' : '' }}{{ $json.body.length < 50 ? 'Body muy corto (' + $json.body.length + ' chars)' : '' }}{{ ($json.title.length < 10 || $json.body.length < 50) && ($json.userId < 1 || $json.userId > 10) ? ' | ' : '' }}{{ $json.userId < 1 || $json.userId > 10 ? 'userId fuera de rango (' + $json.userId + ')' : '' }}

Campo 6:
Name: longitud_titulo
Value: {{ $json.title.length }}

Campo 7:
Name: longitud_body
Value: {{ $json.body.length }}

Campo 8:
Name: validado_en
Value: {{ $now.toISO() }}
```

**Nota:** La expresión de `razon_rechazo` es compleja. Puedes simplificarla usando un Code node previo si prefieres.

**Versión Simplificada con Code:**

Si prefieres, añade un Code node antes del Set para calcular la razón:

```javascript
// Para cada item inválido
const items = $input.all();

return items.map((item) => {
  const data = item.json;
  const razones = [];

  if (data.title.length < 10) {
    razones.push(`Título muy corto (${data.title.length} chars)`);
  }
  if (data.body.length < 50) {
    razones.push(`Body muy corto (${data.body.length} chars)`);
  }
  if (data.userId < 1 || data.userId > 10) {
    razones.push(`userId fuera de rango (${data.userId})`);
  }

  return {
    json: {
      ...data,
      razon_rechazo: razones.join(' | '),
    },
  };
});
```

Luego en el Set usa: `{{ $json.razon_rechazo }}`

4. Activa "Keep Only Set"
5. Ejecuta y verifica las razones de rechazo

### **Paso 7: Generar Reporte de Posts Inválidos**

1. Después del Set de inválidos, añade un nodo "Code"
2. Nombra el nodo: "Reporte Posts Inválidos"
3. Usa este código:

```javascript
// Obtener todos los posts inválidos
const posts_invalidos = $input.all();

// Calcular estadísticas
const total_invalidos = posts_invalidos.length;

// Clasificar por tipo de error
const errores = {
  titulo_corto: 0,
  body_corto: 0,
  userid_invalido: 0,
};

const ejemplos_por_tipo = {
  titulo_corto: [],
  body_corto: [],
  userid_invalido: [],
};

posts_invalidos.forEach((post) => {
  const razon = post.json.razon_rechazo;

  if (razon.includes('Título muy corto')) {
    errores.titulo_corto++;
    if (ejemplos_por_tipo.titulo_corto.length < 3) {
      ejemplos_por_tipo.titulo_corto.push({
        id: post.json.post_id,
        titulo: post.json.titulo,
        longitud: post.json.longitud_titulo,
      });
    }
  }

  if (razon.includes('Body muy corto')) {
    errores.body_corto++;
    if (ejemplos_por_tipo.body_corto.length < 3) {
      ejemplos_por_tipo.body_corto.push({
        id: post.json.post_id,
        longitud: post.json.longitud_body,
      });
    }
  }

  if (razon.includes('userId fuera de rango')) {
    errores.userid_invalido++;
    if (ejemplos_por_tipo.userid_invalido.length < 3) {
      ejemplos_por_tipo.userid_invalido.push({
        id: post.json.post_id,
        userId: post.json.autor_id,
      });
    }
  }
});

return [
  {
    json: {
      tipo_reporte: 'POSTS INVÁLIDOS',
      total_posts_invalidos: total_invalidos,
      distribucion_errores: errores,
      ejemplos_por_tipo: ejemplos_por_tipo,
      lista_completa_ids: posts_invalidos.map((p) => p.json.post_id),
      generado_en: new Date().toISOString(),
    },
  },
];
```

4. Ejecuta y verifica el reporte

**Checkpoint:** ¿Obtienes clasificación de errores?

### **Paso 8: Ejecutar Workflow Completo**

1. Ejecuta el workflow completo desde el inicio
2. Observa cómo los datos se separan en dos ramas
3. Verifica ambos reportes (válidos e inválidos)

---

## ✅ Criterios de Éxito

Tu workflow debe cumplir:

- [ ] **IF node separa correctamente** posts válidos e inválidos
- [ ] **Rama TRUE procesa solo posts válidos** (cumplen todos los criterios)
- [ ] **Rama FALSE procesa solo posts inválidos** (fallan al menos 1 criterio)
- [ ] **Razones de rechazo son específicas** (indican qué criterio falló)
- [ ] **Reporte de válidos incluye estadísticas** (promedios, top 5, etc.)
- [ ] **Reporte de inválidos clasifica errores** (por tipo de fallo)
- [ ] **Ambas ramas tienen output** (no están vacías)
- [ ] **Nodos nombrados descriptivamente**
- [ ] **Workflow funciona end-to-end** sin errores

---

## 🧪 Datos de Prueba y Validación

### **Validación del IF Node:**

Verifica la separación:

```
Rama TRUE (válidos): ~40-50 posts aprox
Rama FALSE (inválidos): ~50-60 posts aprox
```

Los números exactos pueden variar según los datos de la API.

### **Ejemplo de Post Válido:**

```json
{
  "post_id": 1,
  "autor_id": 1,
  "titulo": "sunt aut facere repellat provident",
  "extracto": "quia et suscipit\nsuscipit recusandae consequuntur...",
  "estado": "VÁLIDO",
  "longitud_titulo": 36,
  "longitud_body": 146
}
```

### **Ejemplo de Post Inválido:**

```json
{
  "post_id": 150,
  "autor_id": 15,
  "titulo": "short",
  "estado": "INVÁLIDO",
  "razon_rechazo": "Título muy corto (5 chars) | userId fuera de rango (15)",
  "longitud_titulo": 5,
  "longitud_body": 80
}
```

---

## 🐛 Troubleshooting

### **Problema 1: IF node no separa correctamente**

**Síntoma:** Todos los items van a una sola rama

**Solución:**

- Verifica que usaste "AND" para combinar condiciones
- Revisa que cada condición tiene el operador correcto
- Prueba cada condición individualmente primero

### **Problema 2: Rama FALSE está vacía**

**Síntoma:** No hay posts inválidos

**Solución:**

- Revisa los criterios de validación (quizás son muy laxos)
- Verifica que la API retorna 100 posts (no solo 10)
- Comprueba que userId va de 1-10 en los primeros posts

### **Problema 3: Expresión de razon_rechazo da error**

**Síntoma:** "Cannot read property" o expresión muy larga

**Solución:**

- Usa la versión con Code node (más legible)
- Simplifica la expresión ternaria
- Verifica que accedes a $json correctamente

### **Problema 4: Code node no agrupa correctamente**

**Síntoma:** posts_por_autor está vacío o mal estructurado

**Solución:**

- Añade `console.log(posts_validos)` al inicio
- Verifica que `$input.all()` retorna array
- Confirma que autor_id existe en cada item

### **Problema 5: Estadísticas dan NaN**

**Síntoma:** Promedios muestran NaN

**Solución:**

- Verifica que longitudes son números, no strings
- Comprueba que el array no está vacío antes de dividir
- Usa `parseInt()` si es necesario

---

## 💡 Consejos y Mejores Prácticas

### **Al Configurar el IF:**

1. ✅ **Prueba cada condición por separado** antes de combinarlas
2. ✅ **Usa "AND" para criterios estrictos** (todos deben cumplirse)
3. ✅ **Usa "OR" para criterios flexibles** (al menos uno debe cumplirse)
4. ✅ **Verifica que ambas ramas tienen output** (ejecuta el nodo)
5. ✅ **Nombra las ramas claramente** en los nodos siguientes

### **Al Manejar Ramas:**

- ✅ Cada rama debe tener su propio procesamiento
- ✅ No todas las ramas necesitan llegar al mismo lugar
- ✅ Puedes tener diferentes outputs finales por rama
- ✅ Usa NoOp para debugging de ramas específicas

### **Al Calcular Razones de Rechazo:**

- ✅ Sé específico sobre QUÉ falló
- ✅ Incluye valores actuales en el mensaje
- ✅ Facilita el debugging con mensajes claros
- ✅ Considera usar Code node para lógica compleja

---

## 🚀 Desafíos Adicionales

Una vez completado el ejercicio base, intenta:

### **Desafío 1: Validación Multi-Nivel**

Añade un segundo IF en la rama de válidos que separe posts "Excelentes" (título > 40 chars Y body > 200 chars) de posts "Buenos"

```
IF (Validar Calidad)
├─ TRUE
│  ├─ IF (Evaluar Excelencia)
│  │  ├─ TRUE (Excelentes)
│  │  └─ FALSE (Buenos)
│  └─ ...
└─ FALSE (Inválidos)
```

### **Desafío 2: Scoring System**

En lugar de válido/inválido, implementa un sistema de puntos:

- Título >= 10 chars: +10 puntos
- Título >= 40 chars: +20 puntos adicionales
- Body >= 50 chars: +30 puntos
- Body >= 200 chars: +40 puntos adicionales
- userId 1-10: +20 puntos

Posts con 50+ puntos son "Excelentes", 30-49 "Buenos", < 30 "Pobres"

### **Desafío 3: Notificaciones Diferenciadas**

Añade al final de cada rama un nodo que simule enviar notificaciones:

- Válidos: Email de felicitaciones
- Inválidos: Email de mejora necesaria

Usa Set node para crear el contenido del email (no envíes emails reales)

### **Desafío 4: Reintento de Inválidos**

Imagina que puedes "mejorar" posts inválidos. Añade un Code node en la rama de inválidos que:

- Complete títulos cortos añadiendo "..." hasta 10 chars
- Complete bodies cortos añadiendo espacios hasta 50 chars
- Ajuste userId a 1 si está fuera de rango

Luego vuelve a validar con otro IF

---

## 📚 Conceptos Clave Practicados

Al completar este ejercicio has practicado:

| Concepto                    | Descripción                       | Dónde                   |
| --------------------------- | --------------------------------- | ----------------------- |
| **IF Node**                 | Decisiones condicionales          | Validación de calidad   |
| **Branching**               | Flujos separados según condición  | Ramas true/false        |
| **Expresiones Comparación** | >, <, >=, <=, ==, !=              | Criterios de validación |
| **Operadores Lógicos**      | AND, OR para combinar condiciones | IF compuesto            |
| **String Methods**          | length, substring, includes       | Análisis de texto       |
| **Array Methods**           | map, filter, reduce, sort         | Estadísticas y ranking  |
| **Ternary Operator**        | condition ? true : false          | Razones de rechazo      |
| **Data Classification**     | Agrupar por categorías            | Errores por tipo        |
| **Reporting**               | Generar resúmenes ejecutivos      | Code nodes finales      |

---

## 📖 Recursos Relacionados

### **Documentación n8n:**

- [IF Node](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.if/)
- [Conditions and Logic](https://docs.n8n.io/code-examples/expressions/conditions/)
- [Expressions Reference](https://docs.n8n.io/code-examples/expressions/)

### **Teoría Relacionada:**

- 📄 Documento 05: Nodos Fundamentales (sección IF)
- 📄 Documento 06: Conexiones y Flujos (branching)
- 📄 Documento 07: Testing (validar ramas)

---

## 🎓 Siguiente Paso

Una vez completado este ejercicio con éxito, continúa con:

**👉 [Ejercicio 3: Clasificación con Switch](./03-clasificacion-switch.md)**

Donde aprenderás a manejar múltiples categorías con el nodo Switch.

---

## 📝 Notas del Instructor

### **Errores Comunes al Usar IF:**

1. ❌ Usar "OR" cuando debería ser "AND" (y viceversa)
2. ❌ No verificar que ambas ramas tienen datos
3. ❌ Olvidar que IF procesa cada item individualmente
4. ❌ Expresiones muy complejas en una sola línea
5. ❌ No probar condiciones antes de combinarlas

### **Señales de Dominio del IF Node:**

- ✅ Entiendes cuándo usar AND vs OR
- ✅ Pruebas cada condición individualmente
- ✅ Verificas el output de ambas ramas
- ✅ Usas Code node para lógica compleja
- ✅ Nombras las ramas descriptivamente
- ✅ Documentas la lógica de validación

### **Cuándo Usar IF vs Switch:**

**Usa IF cuando:**

- Tienes 2 caminos (válido/inválido, sí/no)
- La decisión es binaria
- Validaciones simples (pasa/no pasa)

**Usa Switch cuando:**

- Tienes 3+ categorías
- Clasificaciones múltiples
- Routing basado en valores específicos

**¡Verás Switch en el siguiente ejercicio!**

---

**¡Excelente trabajo dominando el IF node!** 🎯

_La validación de datos es una habilidad fundamental en automatización. Ahora puedes crear workflows robustos que manejan diferentes escenarios._
