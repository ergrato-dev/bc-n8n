# Ejercicio 1: Primer Workflow con API

## 📋 Información del Ejercicio

| Propiedad           | Detalle                                        |
| ------------------- | ---------------------------------------------- |
| **Nivel**           | 🟢 Básico                                      |
| **Tiempo estimado** | ⏱️ 30 minutos                                  |
| **Prerequisitos**   | Documentos 01-04 de teoría                     |
| **Conceptos**       | Manual Trigger, HTTP Request, Set, Expresiones |

---

## 🎯 Objetivos de Aprendizaje

Al completar este ejercicio, serás capaz de:

1. ✅ Crear un workflow desde cero
2. ✅ Configurar y usar el nodo HTTP Request
3. ✅ Transformar datos con el nodo Set
4. ✅ Usar expresiones básicas de n8n
5. ✅ Inspeccionar y validar resultados

---

## 📝 Descripción del Ejercicio

Vas a crear un workflow que:

1. Se ejecute manualmente
2. Obtenga una lista de usuarios de una API pública (JSONPlaceholder)
3. Transforme los datos para mostrar solo información relevante
4. Calcule estadísticas básicas

---

## 🔧 Especificaciones Técnicas

### **API a Utilizar:**

```
Endpoint: https://jsonplaceholder.typicode.com/users
Método: GET
Respuesta: Array de 10 usuarios con nombre, email, ciudad, empresa
```

### **Datos de Entrada Esperados:**

La API retorna usuarios con esta estructura:

```json
{
  "id": 1,
  "name": "Leanne Graham",
  "username": "Bret",
  "email": "Sincere@april.biz",
  "address": {
    "street": "Kulas Light",
    "suite": "Apt. 556",
    "city": "Gwenborough",
    "zipcode": "92998-3874",
    "geo": {
      "lat": "-37.3159",
      "lng": "81.1496"
    }
  },
  "phone": "1-770-736-8031 x56442",
  "website": "hildegard.org",
  "company": {
    "name": "Romaguera-Crona",
    "catchPhrase": "Multi-layered client-server neural-net",
    "bs": "harness real-time e-markets"
  }
}
```

### **Datos de Salida Deseados:**

Debes transformar cada usuario a este formato simplificado:

```json
{
  "id": 1,
  "nombre_completo": "Leanne Graham",
  "email": "sincere@april.biz",
  "ciudad": "Gwenborough",
  "empresa": "Romaguera-Crona",
  "dominio_email": "april.biz"
}
```

---

## 🏗️ Estructura del Workflow

```
Manual Trigger
↓
HTTP Request (GET usuarios)
↓
Set (Transformar datos)
↓
Code (Calcular estadísticas)
```

---

## 📋 Instrucciones Paso a Paso

### **Paso 1: Crear Nuevo Workflow**

1. Abre n8n en tu navegador (http://localhost:5678)
2. Haz clic en "New Workflow" (botón superior derecha)
3. Nombra tu workflow: "Ejercicio 01 - API Usuarios"
4. Guarda el workflow (Ctrl+S o Cmd+S)

### **Paso 2: Añadir Manual Trigger**

1. Busca "Manual Trigger" en el panel de nodos
2. Arrástralo al canvas
3. Observa que es el punto de inicio (ícono de play)
4. No requiere configuración adicional

### **Paso 3: Añadir HTTP Request**

1. Conecta un nodo "HTTP Request" después del Manual Trigger
2. Configura el nodo:
   ```
   Authentication: None
   Request Method: GET
   URL: https://jsonplaceholder.typicode.com/users
   ```
3. Haz clic en "Execute Node" (botón de play en el nodo)
4. Verifica que obtienes 10 usuarios en la respuesta

**Checkpoint:** ¿Ves 10 items en el output del nodo HTTP Request?

### **Paso 4: Añadir Set Node para Transformar Datos**

1. Conecta un nodo "Set" después de HTTP Request
2. Nombra el nodo: "Transformar Usuario"
3. Configura los campos a extraer:

   **Campo 1:**

   ```
   Name: id
   Value: {{ $json.id }}
   ```

   **Campo 2:**

   ```
   Name: nombre_completo
   Value: {{ $json.name }}
   ```

   **Campo 3:**

   ```
   Name: email
   Value: {{ $json.email.toLowerCase() }}
   ```

   **Campo 4:**

   ```
   Name: ciudad
   Value: {{ $json.address.city }}
   ```

   **Campo 5:**

   ```
   Name: empresa
   Value: {{ $json.company.name }}
   ```

   **Campo 6:**

   ```
   Name: dominio_email
   Value: {{ $json.email.split('@')[1] }}
   ```

4. En "Options", activa "Keep Only Set"
5. Ejecuta el nodo y verifica la transformación

**Checkpoint:** ¿Cada usuario tiene solo los 6 campos especificados?

### **Paso 5: Añadir Code Node para Estadísticas**

1. Conecta un nodo "Code" después de Set
2. Nombra el nodo: "Calcular Estadísticas"
3. Usa el siguiente código:

```javascript
// Obtener todos los usuarios transformados
const usuarios = $input.all();

// Calcular estadísticas
const total_usuarios = usuarios.length;

// Obtener dominios únicos
const dominios = usuarios.map((u) => u.json.dominio_email);
const dominios_unicos = [...new Set(dominios)];

// Contar usuarios por dominio
const usuarios_por_dominio = {};
dominios.forEach((dominio) => {
  usuarios_por_dominio[dominio] = (usuarios_por_dominio[dominio] || 0) + 1;
});

// Ciudades únicas
const ciudades = usuarios.map((u) => u.json.ciudad);
const ciudades_unicas = [...new Set(ciudades)];

// Empresas únicas
const empresas = usuarios.map((u) => u.json.empresa);
const empresas_unicas = [...new Set(empresas)];

// Retornar estadísticas
return [
  {
    json: {
      total_usuarios: total_usuarios,
      dominios_email_unicos: dominios_unicos.length,
      lista_dominios: dominios_unicos,
      usuarios_por_dominio: usuarios_por_dominio,
      total_ciudades: ciudades_unicas.length,
      total_empresas: empresas_unicas.length,
      lista_usuarios: usuarios.map((u) => ({
        nombre: u.json.nombre_completo,
        email: u.json.email,
        ciudad: u.json.ciudad,
      })),
    },
  },
];
```

4. Ejecuta el nodo y verifica las estadísticas

**Checkpoint:** ¿Obtienes un objeto con estadísticas calculadas?

### **Paso 6: Ejecutar Workflow Completo**

1. Haz clic en "Execute Workflow" (botón superior derecha)
2. Observa cómo se ejecutan todos los nodos en secuencia
3. Revisa el output de cada nodo
4. Verifica que no hay errores

---

## ✅ Criterios de Éxito

Tu workflow debe cumplir:

- [ ] **Se ejecuta sin errores** desde Manual Trigger hasta Code
- [ ] **HTTP Request obtiene 10 usuarios** de JSONPlaceholder
- [ ] **Set transforma correctamente** los 10 usuarios al formato especificado
- [ ] **Emails están en minúsculas** (toLowerCase aplicado)
- [ ] **Dominio de email extraído correctamente** (split por @)
- [ ] **Code calcula estadísticas** correctas:
  - Total usuarios: 10
  - Dominios únicos: varios
  - Lista de usuarios simplificada
- [ ] **Nodos tienen nombres descriptivos**
- [ ] **Workflow está guardado** con nombre apropiado

---

## 🧪 Datos de Prueba y Validación

### **Validación del Set Node:**

Verifica que el primer usuario transformado sea similar a:

```json
{
  "id": 1,
  "nombre_completo": "Leanne Graham",
  "email": "sincere@april.biz",
  "ciudad": "Gwenborough",
  "empresa": "Romaguera-Crona",
  "dominio_email": "april.biz"
}
```

### **Validación del Code Node:**

Verifica que las estadísticas incluyan:

```json
{
  "total_usuarios": 10,
  "dominios_email_unicos": 10,
  "total_ciudades": 10,
  "total_empresas": 10
}
```

---

## 🐛 Troubleshooting

### **Problema 1: HTTP Request falla con error de red**

**Síntoma:** Error "ENOTFOUND" o "Network Error"

**Solución:**

- Verifica tu conexión a internet
- Confirma que la URL es correcta (sin espacios)
- Prueba la URL en el navegador primero

### **Problema 2: Set Node no transforma correctamente**

**Síntoma:** Campos vacíos o undefined

**Solución:**

- Verifica que el nodo anterior tenga datos
- Revisa que las expresiones usen `$json` correctamente
- Usa el Expression Editor para probar expresiones

### **Problema 3: toLowerCase() no funciona**

**Síntoma:** Error "toLowerCase is not a function"

**Solución:**

- Asegúrate de usar `{{ $json.email.toLowerCase() }}`
- Verifica que email existe en los datos

### **Problema 4: split('@') da error**

**Síntoma:** "split is not a function" o undefined

**Solución:**

- Usa: `{{ $json.email.split('@')[1] }}`
- Asegúrate de que email es un string

### **Problema 5: Code Node no retorna datos**

**Síntoma:** Output vacío o error

**Solución:**

- Verifica que usas `return [{ json: {...} }]`
- Confirma que `$input.all()` tiene datos
- Añade `console.log()` para debugging

---

## 💡 Consejos y Mejores Prácticas

### **Al Construir el Workflow:**

1. ✅ **Ejecuta nodo por nodo** - No ejecutes todo de una vez
2. ✅ **Verifica datos en cada paso** - Haz clic en cada nodo para ver output
3. ✅ **Usa nombres descriptivos** - "Transformar Usuario" es mejor que "Set"
4. ✅ **Prueba expresiones** - Usa el Expression Editor (fx button)
5. ✅ **Guarda frecuentemente** - Ctrl+S después de cada cambio importante

### **Al Escribir Expresiones:**

- ✅ Usa `$json.campo` para acceder a campos del nodo anterior
- ✅ Las expresiones van entre `{{ }}` en el editor visual
- ✅ En Code node, no necesitas `{{ }}`
- ✅ Prueba expresiones complejas en el editor antes de usar

### **Al Debuggear:**

- 🔍 Haz clic en cada nodo para ver su output
- 🔍 Verifica que cada nodo recibe los datos esperados
- 🔍 Usa NoOp node para "pausar" el workflow si necesitas

---

## 🚀 Desafíos Adicionales

Una vez completado el ejercicio base, intenta:

### **Desafío 1: Filtrar Usuarios**

Añade un nodo IF que solo procese usuarios cuyo dominio de email sea ".com"

### **Desafío 2: Formatear Salida**

Añade un nodo Set final que cree un resumen ejecutivo en texto:

```
"Se procesaron 10 usuarios de 10 ciudades diferentes"
```

### **Desafío 3: Añadir Más Transformaciones**

En el Set node, añade campos calculados:

- `iniciales`: Primeras letras del nombre (ej: "LG")
- `username_generado`: Nombre + primeras 3 letras de ciudad (ej: "leanne-gwe")

### **Desafío 4: Manejo de Errores**

Configura el HTTP Request con "Continue On Fail" y añade manejo para el caso de error

---

## 📚 Conceptos Clave Practicados

Al completar este ejercicio has practicado:

| Concepto            | Descripción                    | Dónde                  |
| ------------------- | ------------------------------ | ---------------------- |
| **Manual Trigger**  | Ejecutar workflow bajo demanda | Nodo inicial           |
| **HTTP Request**    | Obtener datos de APIs REST     | GET a JSONPlaceholder  |
| **Set Node**        | Transformar y mapear datos     | Simplificar estructura |
| **Expresiones**     | Manipular datos con JS         | toLowerCase, split     |
| **Code Node**       | Lógica JavaScript custom       | Calcular estadísticas  |
| **Array methods**   | map, filter, reduce, Set       | En Code node           |
| **Data inspection** | Ver output de cada nodo        | Click en nodos         |

---

## 📖 Recursos Relacionados

### **Documentación n8n:**

- [HTTP Request Node](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.httprequest/)
- [Set Node](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.set/)
- [Code Node](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.code/)
- [Expressions](https://docs.n8n.io/code-examples/expressions/)

### **Teoría Relacionada:**

- 📄 Documento 04: Primer Workflow
- 📄 Documento 05: Nodos Fundamentales
- 📄 Documento 07: Ejecución y Testing

---

## 🎓 Siguiente Paso

Una vez completado este ejercicio con éxito, continúa con:

**👉 [Ejercicio 2: Validación de Datos con IF](./02-validacion-datos-if.md)**

Donde aprenderás a implementar lógica condicional para validar y filtrar datos.

---

## 📝 Notas del Instructor

### **Errores Comunes de Principiantes:**

1. ❌ Olvidar ejecutar nodos individuales antes del workflow completo
2. ❌ No verificar que cada nodo tiene datos antes de continuar
3. ❌ Usar expresiones sin `{{ }}` en nodos visuales
4. ❌ No nombrar los nodos descriptivamente
5. ❌ No guardar el workflow regularmente

### **Señales de que lo Estás Haciendo Bien:**

- ✅ Ejecutas nodo por nodo y verificas cada output
- ✅ Entiendes qué hace cada expresión antes de usarla
- ✅ Tus nodos tienen nombres claros
- ✅ Debuggeas problemas sistemáticamente
- ✅ Experimentas con variaciones

---

**¡Felicitaciones por completar tu primer ejercicio práctico de n8n!** 🎉

_Recuerda: La práctica hace al maestro. No te preocupes si algo no funciona a la primera, el debugging es parte natural del proceso de aprendizaje._
