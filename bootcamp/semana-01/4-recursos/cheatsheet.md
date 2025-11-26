# 📖 Cheat Sheet n8n - Semana 01

## 🚀 Referencia Rápida

Guía de consulta rápida para los conceptos de la primera semana.

---

## 🔧 Comandos Docker Esenciales

### Ciclo de Vida de n8n

```bash
# Iniciar n8n
docker compose up -d

# Ver logs
docker compose logs -f

# Detener n8n
docker compose down

# Reiniciar
docker compose restart

# Ver estado
docker compose ps
```

### Gestión de Contenedores

```bash
# Ver contenedores activos
docker ps

# Ver todos los contenedores
docker ps -a

# Ver logs de un contenedor específico
docker logs n8n -f

# Entrar al contenedor
docker exec -it n8n /bin/sh

# Ver uso de recursos
docker stats
```

### Limpieza

```bash
# Eliminar contenedores parados
docker container prune

# Eliminar imágenes no usadas
docker image prune

# Eliminar volúmenes no usados (¡CUIDADO! borra datos)
docker volume prune

# Limpieza completa
docker system prune -a
```

---

## 📝 docker-compose.yml Básico

```yaml
version: '3.8'

services:
  n8n:
    image: n8nio/n8n:latest
    container_name: n8n
    ports:
      - "5678:5678"
    environment:
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=admin
      - N8N_BASIC_AUTH_PASSWORD=password
      - TZ=America/Mexico_City
    volumes:
      - n8n_data:/home/node/.n8n

volumes:
  n8n_data:
```

---

## 🎨 Nodos Core - Semana 01

### Manual Trigger

| Propiedad    | Descripción                              |
| ------------ | ---------------------------------------- |
| **Función**  | Iniciar workflow manualmente             |
| **Uso**      | Desarrollo y testing                     |
| **Shortcut** | Click en "Execute Workflow"              |

### Set Node

| Propiedad      | Descripción                            |
| -------------- | -------------------------------------- |
| **Función**    | Establecer/modificar datos             |
| **Modos**      | Manual, Expression                     |
| **Keep Only**  | Solo mantener campos definidos         |
| **Include**    | Agregar a datos existentes             |

### IF Node

| Propiedad       | Descripción                           |
| --------------- | ------------------------------------- |
| **Función**     | Bifurcar flujo condicionalmente       |
| **Output True** | Primera salida (condición cumplida)   |
| **Output False**| Segunda salida (condición no cumplida)|

### Code Node

| Propiedad       | Descripción                           |
| --------------- | ------------------------------------- |
| **Función**     | Ejecutar JavaScript personalizado     |
| **Modos**       | Run Once, Run for Each Item           |
| **Return**      | Array de objetos con key `json`       |

---

## 💻 Expresiones n8n

### Acceso a Datos

```javascript
// Datos del item actual
{{ $json.campo }}

// Datos de nodo específico
{{ $('Nombre Nodo').item.json.campo }}

// Primer item de un nodo
{{ $('Nombre Nodo').first().json.campo }}

// Todos los items
{{ $('Nombre Nodo').all() }}
```

### Variables Incorporadas

```javascript
// Fecha/hora actual
{{ $now }}                     // Objeto Luxon
{{ $now.toISO() }}            // ISO 8601
{{ $now.format('DD/MM/YYYY') }} // Formateado

// ID de ejecución
{{ $executionId }}

// ID del workflow
{{ $workflow.id }}

// Nombre del workflow
{{ $workflow.name }}
```

### Manipulación de Strings

```javascript
// Mayúsculas/Minúsculas
{{ $json.texto.toUpperCase() }}
{{ $json.texto.toLowerCase() }}

// Capitalizar
{{ $json.texto.split(' ').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ') }}

// Trim (quitar espacios)
{{ $json.texto.trim() }}

// Incluye
{{ $json.texto.includes('buscar') }}

// Reemplazar
{{ $json.texto.replace('viejo', 'nuevo') }}
```

### Manipulación de Números

```javascript
// Redondear
{{ Math.round($json.numero) }}
{{ Math.floor($json.numero) }}
{{ Math.ceil($json.numero) }}

// Operaciones
{{ $json.precio * 1.16 }}   // IVA
{{ ($json.total / 100).toFixed(2) }}
```

### Condicionales en Expresiones

```javascript
// Ternario
{{ $json.status === 'active' ? 'Activo' : 'Inactivo' }}

// Valor por defecto
{{ $json.nombre || 'Sin nombre' }}

// Nullish coalescing
{{ $json.dato ?? 'default' }}
```

---

## 📅 Formato de Fechas (Luxon)

### Formatos Comunes

| Formato          | Resultado            | Código                           |
| ---------------- | -------------------- | -------------------------------- |
| DD/MM/YYYY       | 15/01/2025           | `$now.format('dd/MM/yyyy')`      |
| YYYY-MM-DD       | 2025-01-15           | `$now.format('yyyy-MM-dd')`      |
| HH:mm            | 14:30                | `$now.format('HH:mm')`           |
| HH:mm:ss         | 14:30:45             | `$now.format('HH:mm:ss')`        |
| Completo         | 15/01/2025 14:30     | `$now.format('dd/MM/yyyy HH:mm')`|

### Operaciones con Fechas

```javascript
// Sumar tiempo
{{ $now.plus({ days: 7 }) }}
{{ $now.plus({ hours: 2 }) }}

// Restar tiempo
{{ $now.minus({ days: 30 }) }}

// Inicio/fin del día
{{ $now.startOf('day') }}
{{ $now.endOf('day') }}
```

---

## 🔄 Estructura de Datos n8n

### Estructura de un Item

```javascript
// Un item de n8n
{
  "json": {
    "campo1": "valor1",
    "campo2": "valor2"
  },
  "binary": {
    // Datos binarios (archivos)
  },
  "pairedItem": {
    // Referencia al item origen
  }
}
```

### Return en Code Node

```javascript
// Retornar un item
return [{ json: { resultado: "valor" } }];

// Retornar múltiples items
return [
  { json: { id: 1 } },
  { json: { id: 2 } },
  { json: { id: 3 } }
];

// Retornar con items de entrada
return $input.all().map(item => ({
  json: {
    ...item.json,
    nuevoCampo: "valor"
  }
}));
```

---

## ⚠️ Errores Comunes y Soluciones

| Error                              | Causa                        | Solución                         |
| ---------------------------------- | ---------------------------- | -------------------------------- |
| `Cannot read property of undefined`| Campo no existe              | Verificar estructura de datos    |
| `NodeOperationError`               | Nodo mal configurado         | Revisar parámetros del nodo      |
| `Expression error`                 | Sintaxis de expresión        | Verificar `{{ }}` y código       |
| Puerto 5678 en uso                 | Otro servicio usando puerto  | Cambiar puerto en compose        |
| Contenedor no inicia               | Error de configuración       | Revisar logs con `docker logs`   |

---

## 🎯 Shortcuts de n8n

| Acción                    | Shortcut              |
| ------------------------- | --------------------- |
| Ejecutar workflow         | `Ctrl/Cmd + Enter`    |
| Guardar workflow          | `Ctrl/Cmd + S`        |
| Buscar nodos              | `Tab` o `/`           |
| Duplicar nodo             | `Ctrl/Cmd + D`        |
| Eliminar nodo             | `Delete` o `Backspace`|
| Copiar nodo               | `Ctrl/Cmd + C`        |
| Pegar nodo                | `Ctrl/Cmd + V`        |
| Deshacer                  | `Ctrl/Cmd + Z`        |
| Seleccionar todo          | `Ctrl/Cmd + A`        |
| Zoom in/out               | `Ctrl/Cmd + +/-`      |
| Zoom fit                  | `1`                   |

---

## 📊 Template de Proyecto

```markdown
## 📋 Proyecto: [Nombre]

### Objetivo
[Descripción del objetivo]

### Nodos Utilizados
1. Manual Trigger
2. Set - [Descripción]
3. [Otros nodos]

### Input Esperado
```json
{
  "campo": "valor"
}
```

### Output Esperado
```json
{
  "resultado": "valor"
}
```

### Notas
- [Notas importantes]
```

---

## 🔗 Links Rápidos

| Recurso                | URL                                      |
| ---------------------- | ---------------------------------------- |
| n8n Docs               | https://docs.n8n.io/                     |
| n8n Expressions        | https://docs.n8n.io/code/expressions/    |
| Luxon Formatting       | https://docs.n8n.io/code/cookbook/luxon/ |
| Docker Compose         | https://docs.docker.com/compose/         |
| Webhook Testing        | https://webhook.site/                    |
