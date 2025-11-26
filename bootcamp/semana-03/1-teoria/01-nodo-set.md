# 📚 Módulo 01: Nodo Set y Manipulación de Datos

![Set Node](https://img.shields.io/badge/Tema-Set_Node-FF6D5A?style=flat-square)
![Tiempo](https://img.shields.io/badge/Tiempo-30_min-00D4FF?style=flat-square)
![Nivel](https://img.shields.io/badge/Nivel-Principiante-00A86B?style=flat-square)

---

## 🎯 Objetivos del Módulo

Al finalizar este módulo, serás capaz de:

- Entender el propósito y versatilidad del nodo Set
- Crear nuevos campos de datos desde cero
- Modificar datos existentes en el flujo
- Eliminar propiedades innecesarias
- Usar diferentes modos del nodo Set

---

## 📚 Contenido

### 1.1 ¿Qué es el Nodo Set?

El **nodo Set** es uno de los nodos más versátiles y utilizados en n8n. Su función principal es **manipular datos**: crear nuevos campos, modificar existentes o eliminar propiedades.

#### Definición Formal

> **Set Node**: Nodo core de n8n que permite definir, modificar y estructurar datos JSON que fluyen a través del workflow. Es el equivalente a asignar valores a variables en programación.

#### Analogía

| Acción en Set Node | Analogía           | Ejemplo                        |
| ------------------ | ------------------ | ------------------------------ |
| Crear campo        | Escribir en agenda | Agregar nuevo contacto         |
| Modificar campo    | Editar en agenda   | Actualizar número de teléfono  |
| Eliminar campo     | Borrar de agenda   | Eliminar contacto obsoleto     |
| Renombrar campo    | Corregir nombre    | Cambiar "tel" a "telefono"     |

### 1.2 Modos del Nodo Set

El nodo Set tiene **dos modos principales**:

```
┌─────────────────────────────────────────────────────────────────┐
│                    MODOS DEL NODO SET                            │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│   ┌─────────────────────────────────────────────────────────┐   │
│   │  📝 MODO MANUAL                                         │   │
│   │                                                         │   │
│   │  • Define campos uno por uno                           │   │
│   │  • Interfaz visual con formularios                      │   │
│   │  • Ideal para principiantes                            │   │
│   │  • Soporta expresiones en cada campo                   │   │
│   └─────────────────────────────────────────────────────────┘   │
│                                                                  │
│   ┌─────────────────────────────────────────────────────────┐   │
│   │  ⚡ MODO RAW/JSON                                        │   │
│   │                                                         │   │
│   │  • Define todo el JSON de una vez                       │   │
│   │  • Mayor control y flexibilidad                         │   │
│   │  • Ideal para transformaciones complejas               │   │
│   │  • Requiere conocimiento de JSON                        │   │
│   └─────────────────────────────────────────────────────────┘   │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### 1.3 Configuración del Nodo Set

#### Panel de Configuración

```
┌─────────────────────────────────────────────────────────────────┐
│                    SET NODE - CONFIGURACIÓN                      │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  Mode: [Manual ▼]  [Raw/JSON]                                   │
│                                                                  │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │  Fields to Set                                          │    │
│  │  ─────────────────────────────────────────────────────  │    │
│  │                                                         │    │
│  │  Name:  [nombre        ]                                │    │
│  │  Value: [{{ $json.firstName }}]   [String ▼]           │    │
│  │                                                         │    │
│  │  [+ Add Field]                                          │    │
│  └─────────────────────────────────────────────────────────┘    │
│                                                                  │
│  Options                                                         │
│  ────────                                                        │
│  ☐ Include Other Fields (mantener campos existentes)            │
│  ☐ Include Binary (mantener datos binarios)                     │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

#### Opciones Importantes

| Opción               | Descripción                                                     | Cuándo Usar                   |
| -------------------- | --------------------------------------------------------------- | ----------------------------- |
| Include Other Fields | Mantiene todos los campos del input además de los nuevos        | Cuando quieres agregar campos |
| Keep Only Set        | Solo mantiene los campos que defines (descarta el resto)        | Cuando quieres limpiar datos  |
| Include Binary       | Mantiene archivos/imágenes adjuntos                             | Cuando trabajas con archivos  |

### 1.4 Ejemplos Prácticos

#### Ejemplo 1: Crear Datos desde Cero

**Escenario**: Generar datos de un usuario ficticio.

```json
// Input (vacío o cualquier dato)
{}

// Configuración Set Node:
// Name: "usuario", Value: "Juan Pérez"
// Name: "email", Value: "juan@empresa.com"
// Name: "activo", Value: true

// Output
{
  "usuario": "Juan Pérez",
  "email": "juan@empresa.com",
  "activo": true
}
```

#### Ejemplo 2: Transformar Datos Existentes

**Escenario**: Recibimos datos de una API y necesitamos reestructurarlos.

```json
// Input (de una API externa)
{
  "first_name": "María",
  "last_name": "García",
  "user_email": "maria@test.com",
  "is_active": 1
}

// Configuración Set Node (con expresiones):
// Name: "nombreCompleto", Value: {{ $json.first_name + ' ' + $json.last_name }}
// Name: "email", Value: {{ $json.user_email }}
// Name: "estaActivo", Value: {{ $json.is_active === 1 }}

// Output
{
  "nombreCompleto": "María García",
  "email": "maria@test.com",
  "estaActivo": true
}
```

#### Ejemplo 3: Agregar Campos Calculados

**Escenario**: Agregar timestamp y campos derivados.

```json
// Input
{
  "producto": "Laptop",
  "precio": 1000,
  "cantidad": 3
}

// Configuración Set Node (Include Other Fields: ON):
// Name: "total", Value: {{ $json.precio * $json.cantidad }}
// Name: "fechaProcesado", Value: {{ $now.toISO() }}
// Name: "moneda", Value: "USD"

// Output
{
  "producto": "Laptop",
  "precio": 1000,
  "cantidad": 3,
  "total": 3000,
  "fechaProcesado": "2024-01-15T10:30:00.000Z",
  "moneda": "USD"
}
```

### 1.5 Modo Raw/JSON

El modo Raw permite definir el output completo como JSON:

```javascript
// En modo Raw/JSON, puedes escribir:
{
  "usuario": {
    "nombre": "{{ $json.first_name }}",
    "apellido": "{{ $json.last_name }}",
    "contacto": {
      "email": "{{ $json.email }}",
      "telefono": "{{ $json.phone || 'No disponible' }}"
    }
  },
  "metadata": {
    "procesadoEn": "{{ $now.toISO() }}",
    "version": "1.0"
  }
}
```

#### Cuándo Usar Cada Modo

| Modo    | Ventajas                        | Desventajas                   | Usar Cuando                    |
| ------- | ------------------------------- | ----------------------------- | ------------------------------ |
| Manual  | Fácil de usar, visual           | Lento para muchos campos      | Pocos campos, principiantes    |
| Raw/JSON| Control total, anidación fácil  | Requiere conocer JSON         | Estructuras complejas, expertos|

### 1.6 Patrones Comunes

#### Patrón 1: Normalizar Nombres de Campos

```json
// Input con nombres inconsistentes
{
  "firstName": "Ana",
  "last-name": "López",
  "EMAIL": "ana@test.com"
}

// Output normalizado
{
  "nombre": "{{ $json.firstName }}",
  "apellido": "{{ $json['last-name'] }}",
  "email": "{{ $json.EMAIL.toLowerCase() }}"
}
```

#### Patrón 2: Valores por Defecto

```json
// Usar operador || para valores por defecto
{
  "nombre": "{{ $json.nombre || 'Sin nombre' }}",
  "email": "{{ $json.email || 'no-reply@default.com' }}",
  "rol": "{{ $json.rol || 'usuario' }}"
}
```

#### Patrón 3: Limpieza de Datos

```json
// Eliminar espacios, convertir formatos
{
  "nombre": "{{ $json.nombre.trim() }}",
  "email": "{{ $json.email.toLowerCase().trim() }}",
  "telefono": "{{ $json.telefono.replace(/[^0-9]/g, '') }}"
}
```

### 1.7 Errores Comunes y Soluciones

| Error                                | Causa                           | Solución                                    |
| ------------------------------------ | ------------------------------- | ------------------------------------------- |
| Campo vacío en output                | Expresión retorna undefined     | Usar operador `?.` o `\|\|`                 |
| Tipo de dato incorrecto              | No se convirtió el tipo         | Usar `Number()`, `String()`, `Boolean()`    |
| Campos originales desaparecen        | "Include Other Fields" apagado  | Activar la opción o agregar campos manualmente |
| Error de sintaxis en expresión       | Falta cerrar `}}` o error JS    | Verificar sintaxis y probar en panel         |

### 1.8 Expresiones Útiles para Set Node

```javascript
// Concatenar strings
{{ $json.nombre + ' ' + $json.apellido }}

// Acceso seguro a propiedades anidadas
{{ $json.usuario?.direccion?.ciudad || 'No especificada' }}

// Formatear números
{{ $json.precio.toFixed(2) }}

// Formatear fechas
{{ $now.format('DD/MM/YYYY') }}

// Condicional ternario
{{ $json.edad >= 18 ? 'Mayor de edad' : 'Menor de edad' }}

// Convertir a mayúsculas/minúsculas
{{ $json.nombre.toUpperCase() }}
{{ $json.email.toLowerCase() }}

// Extraer parte de un string
{{ $json.email.split('@')[1] }}  // Dominio del email
```

---

## 💡 Tips y Mejores Prácticas

### ✅ Hacer

- Usar nombres de campos descriptivos en español o inglés consistente
- Activar "Include Other Fields" cuando solo agregas campos
- Validar tipos de datos antes de operaciones
- Documentar transformaciones complejas con notas

### ❌ Evitar

- Crear estructuras demasiado anidadas
- Hardcodear valores que deberían ser dinámicos
- Ignorar campos nulos o undefined
- Mezclar idiomas en nombres de campos

---

## 🧪 Ejercicio de Práctica

### Mini-ejercicio: Transformación de Datos

**Input disponible**:
```json
{
  "first_name": "Carlos",
  "last_name": "Mendoza",
  "birth_date": "1990-05-15",
  "salary": 45000,
  "department": "IT"
}
```

**Output deseado**:
```json
{
  "empleado": {
    "nombreCompleto": "Carlos Mendoza",
    "departamento": "IT",
    "salarioAnual": 45000,
    "salarioMensual": 3750
  },
  "metadata": {
    "procesado": "2024-01-15T10:00:00.000Z",
    "version": "1.0"
  }
}
```

> 💡 **Pista**: Usa modo Raw/JSON para la estructura anidada.

---

## 📖 Recursos Adicionales

- [Documentación oficial: Set Node](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.set/)
- [Expressions in n8n](https://docs.n8n.io/code/expressions/)
- [Data transformation guide](https://docs.n8n.io/data/)

---

## 🏠 Navegación

| ⬅️ Anterior | 📚 Módulo Actual | ➡️ Siguiente |
|------------|------------------|--------------|
| [README Semana](../README.md) | **Nodo Set** | [Nodos IF y Switch](02-if-switch.md) |
