# ❓ FAQ - Preguntas Frecuentes Semana 01

## 🤔 Dudas Comunes

Respuestas a las preguntas más frecuentes de la primera semana.

---

## 🐳 Docker y Configuración

### ¿Por qué usar Docker para n8n?

**Respuesta:** Docker proporciona:
- ✅ Entorno aislado y consistente
- ✅ Fácil instalación sin dependencias
- ✅ Actualizaciones simples
- ✅ Datos persistentes con volúmenes
- ✅ Mismo entorno en cualquier sistema operativo

### ¿Puedo usar n8n sin Docker?

**Respuesta:** Sí, hay otras opciones:
1. **npm global:** `npm install n8n -g`
2. **n8n Cloud:** https://n8n.io/cloud (gratis para empezar)
3. **Electron App:** Aplicación de escritorio

Para el bootcamp recomendamos Docker por su portabilidad.

### Mi puerto 5678 está ocupado, ¿qué hago?

**Respuesta:** Cambia el puerto en `docker-compose.yml`:

```yaml
ports:
  - "5679:5678"  # Usar puerto 5679 en lugar de 5678
```

Luego accede a `http://localhost:5679`

### ¿Cómo actualizo n8n?

**Respuesta:**

```bash
# Detener n8n
docker compose down

# Descargar última imagen
docker compose pull

# Iniciar con nueva versión
docker compose up -d
```

### ¿Dónde se guardan mis workflows?

**Respuesta:** En el volumen Docker `n8n_data`. Los datos persisten aunque detengas o elimines el contenedor.

Para ver la ubicación física:
```bash
docker volume inspect n8n_data
```

### ¿Cómo hago backup de mis workflows?

**Respuesta:** Varias opciones:

1. **Exportar desde UI:** Workflow > Export
2. **API:** `GET /api/v1/workflows`
3. **Copiar volumen:**
   ```bash
   docker cp n8n:/home/node/.n8n ./backup
   ```

---

## 🎨 Interfaz de n8n

### ¿Qué significa el color de los nodos?

**Respuesta:**
- 🔵 **Azul:** Nodo ejecutado exitosamente
- 🔴 **Rojo:** Error en ejecución
- ⚪ **Gris:** Nodo no ejecutado
- 🟡 **Amarillo:** Advertencia

### ¿Cómo veo los datos entre nodos?

**Respuesta:**
1. Ejecuta el workflow
2. Click en el nodo
3. Ve la pestaña "Output" a la derecha
4. También puedes usar "Table" o "JSON" view

### ¿Puedo ejecutar un solo nodo?

**Respuesta:** Sí, click derecho en el nodo > "Execute Node"

También puedes usar el pin icon para "pinear" datos y probar nodos posteriores.

### ¿Cómo duplico un nodo?

**Respuesta:** `Ctrl/Cmd + D` o click derecho > Duplicate

### ¿Por qué mi nodo muestra "No data"?

**Respuesta:** El nodo no ha sido ejecutado o el nodo anterior no produjo output. Ejecuta el workflow completo primero.

---

## 💻 Expresiones y Código

### ¿Cuál es la diferencia entre `{{ }}` y sin llaves?

**Respuesta:**
- `{{ expresión }}` - Evalúa código JavaScript
- `texto normal` - Se usa como string literal

```javascript
// Expresión (se evalúa)
{{ $json.nombre }}  // Retorna: "Juan"

// Literal (no se evalúa)
$json.nombre        // Retorna: "$json.nombre"
```

### ¿Qué es `$json` vs `$input`?

**Respuesta:**
- `$json` - Datos del item actual que se está procesando
- `$input` - Acceso a todos los items de entrada

```javascript
// Datos del item actual
{{ $json.nombre }}

// Primer item de entrada
{{ $input.first().json.nombre }}

// Todos los items
{{ $input.all() }}
```

### ¿Cómo accedo a datos de un nodo anterior?

**Respuesta:**

```javascript
// Por nombre del nodo
{{ $('Nombre del Nodo').item.json.campo }}

// Primer item de ese nodo
{{ $('Nombre del Nodo').first().json.campo }}
```

### ¿Por qué mi expresión no funciona?

**Respuesta:** Verifica:
1. ✅ Sintaxis correcta con `{{ }}`
2. ✅ Nombre del campo es exacto (case-sensitive)
3. ✅ El nodo anterior produjo datos
4. ✅ El campo existe en el JSON

Tip: Usa el panel de Output para ver la estructura exacta de datos.

### ¿Cuándo uso Set Node vs Code Node?

**Respuesta:**
- **Set Node:** Transformaciones simples, agregar campos
- **Code Node:** Lógica compleja, loops, funciones personalizadas

Regla general: Si Set Node puede hacerlo, úsalo. Code Node para lo demás.

---

## 🔄 Workflows

### ¿Puedo tener múltiples workflows activos?

**Respuesta:** Sí, sin límite en la versión self-hosted.

### ¿Cómo activo un workflow para que corra automáticamente?

**Respuesta:**
1. Usa un trigger automático (Schedule, Webhook, etc.)
2. Toggle "Active" en la esquina superior derecha
3. El workflow se ejecutará según el trigger configurado

### ¿Por qué mi workflow no se ejecuta automáticamente?

**Respuesta:** Verifica:
- ✅ El workflow está "Active" (toggle activado)
- ✅ Tiene un trigger automático (no Manual Trigger)
- ✅ n8n está corriendo
- ✅ No hay errores en el trigger

### ¿Puedo ejecutar un workflow desde otro workflow?

**Respuesta:** Sí, usa el nodo "Execute Workflow" (lo veremos en semanas posteriores).

### ¿Cómo comparto un workflow?

**Respuesta:**
1. Menú del workflow > Export
2. Guarda el archivo JSON
3. Comparte el JSON
4. Otros pueden importarlo en su n8n

---

## ⚠️ Errores y Debugging

### "Cannot read property 'X' of undefined"

**Causa:** Estás intentando acceder a un campo que no existe.

**Solución:**
```javascript
// Verificar antes de acceder
{{ $json.campo ?? 'valor_por_defecto' }}

// O usar optional chaining
{{ $json.objeto?.subCampo }}
```

### "Node does not have any input data"

**Causa:** El nodo no recibió datos del nodo anterior.

**Solución:**
- Verifica que el nodo anterior produce output
- Verifica que la conexión está correcta
- Ejecuta el workflow completo

### "Expression error"

**Causa:** Sintaxis incorrecta en la expresión.

**Solución:**
- Verifica las llaves `{{ }}`
- Revisa nombres de variables
- Prueba en el editor de expresiones (click en el ícono de expresión)

### Mi workflow funciona en test pero no en producción

**Posibles causas:**
1. Variables de entorno diferentes
2. Credenciales expiradas
3. APIs con rate limiting
4. Datos de prueba vs datos reales

---

## 🎓 Conceptos Generales

### ¿n8n es gratis?

**Respuesta:**
- ✅ **Self-hosted:** Completamente gratis, código abierto
- 💰 **n8n Cloud:** Plan gratuito limitado, planes pagados para más features

### ¿Qué tan seguro es n8n?

**Respuesta:** n8n self-hosted te da control total:
- Tus datos nunca salen de tu servidor
- Puedes configurar autenticación
- Código abierto auditable
- Comunidad activa

### ¿Puedo usar n8n para proyectos comerciales?

**Respuesta:** Sí, la licencia lo permite. Revisa los términos en https://n8n.io/license

### ¿n8n tiene límites de workflows/ejecuciones?

**Respuesta:**
- **Self-hosted:** Sin límites artificiales
- **n8n Cloud:** Límites según plan

### ¿Dónde puedo pedir ayuda?

**Respuesta:**
1. 🔗 **Comunidad n8n:** https://community.n8n.io/
2. 💬 **Discord:** https://discord.gg/n8n
3. 📚 **Documentación:** https://docs.n8n.io/
4. 📝 **Este bootcamp:** Foro/chat del curso

---

## 🤖 Sobre el Bootcamp

### ¿Necesito saber programar?

**Respuesta:** No para empezar. Conocimientos de programación ayudan para Code nodes, pero puedes hacer mucho con nodos visuales.

### ¿Qué hago si me atraso?

**Respuesta:**
1. No te preocupes, el material estará disponible
2. Los ejercicios están diseñados para aprendizaje progresivo
3. Enfócate en entender conceptos, no solo completar tareas
4. Pide ayuda si te atascas

### ¿Puedo adelantar contenido?

**Respuesta:** Sí, pero recomendamos seguir el orden para construir fundamentos sólidos.

---

## 💡 ¿Tienes otra pregunta?

Si tu duda no está aquí:
1. Revisa la documentación oficial
2. Busca en la comunidad de n8n
3. Pregunta en el foro del bootcamp
4. Contacta al instructor
