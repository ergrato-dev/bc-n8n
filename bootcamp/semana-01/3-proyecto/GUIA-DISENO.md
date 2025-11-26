# 📐 Guía de Diseño - Sistema de Bienvenida Automatizado

## 🎨 Arquitectura del Sistema

---

## 📊 Diagrama de Flujo Detallado

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                        WORKFLOW: Sistema de Bienvenida                          │
├─────────────────────────────────────────────────────────────────────────────────┤
│                                                                                 │
│   ┌──────────────┐                                                              │
│   │   TRIGGER    │                                                              │
│   │   Manual     │                                                              │
│   └──────┬───────┘                                                              │
│          │                                                                      │
│          ▼                                                                      │
│   ┌──────────────┐                                                              │
│   │   SET NODE   │  Datos del Usuario                                           │
│   │   Entrada    │  • nombre: "juan pérez"                                      │
│   │              │  • email: "juan@example.com"                                 │
│   │              │  • plan: "Pro"                                               │
│   └──────┬───────┘                                                              │
│          │                                                                      │
│          ▼                                                                      │
│   ┌──────────────┐                                                              │
│   │   SET NODE   │  Formatear Datos                                             │
│   │   Proceso    │  • Capitalizar nombre                                        │
│   │              │  • Agregar timestamp                                         │
│   │              │  • Validar datos                                             │
│   └──────┬───────┘                                                              │
│          │                                                                      │
│          ▼                                                                      │
│   ┌──────────────┐                                                              │
│   │   SET NODE   │  Mensaje de Bienvenida                                       │
│   │   Salida     │  • Generar mensaje personalizado                             │
│   │              │  • Estructurar output final                                  │
│   └──────────────┘                                                              │
│                                                                                 │
└─────────────────────────────────────────────────────────────────────────────────┘
```

---

## 🔧 Especificación de Nodos

### 1️⃣ Manual Trigger

| Propiedad   | Valor                        |
| ----------- | ---------------------------- |
| **Tipo**    | Manual Trigger               |
| **Nombre**  | Manual Trigger               |
| **Función** | Iniciar workflow manualmente |

**Propósito:**

- Permite ejecutar el workflow bajo demanda
- Ideal para desarrollo y pruebas
- En producción se reemplazaría por Webhook o Schedule

---

### 2️⃣ Set Node - Datos del Usuario

| Propiedad   | Valor                    |
| ----------- | ------------------------ |
| **Tipo**    | Set                      |
| **Nombre**  | Datos del Usuario        |
| **Modo**    | Keep Only Set            |
| **Función** | Simular entrada de datos |

**Configuración de Campos:**

```json
{
  "nombre": {
    "tipo": "String",
    "valor": "juan pérez",
    "descripcion": "Nombre del usuario en minúsculas"
  },
  "email": {
    "tipo": "String",
    "valor": "juan@example.com",
    "descripcion": "Email del usuario"
  },
  "plan": {
    "tipo": "String",
    "valor": "Pro",
    "descripcion": "Plan seleccionado: Free, Pro o Enterprise"
  }
}
```

**Nota del nodo:**

```
📝 DATOS DE ENTRADA
Este nodo simula los datos que llegarían de un formulario de registro.
En un caso real, estos datos vendrían de un Webhook o API.
```

---

### 3️⃣ Set Node - Formatear Datos

| Propiedad   | Valor                          |
| ----------- | ------------------------------ |
| **Tipo**    | Set                            |
| **Nombre**  | Formatear Datos                |
| **Modo**    | Keep Only Set                  |
| **Función** | Transformar y enriquecer datos |

**Configuración de Campos:**

| Campo              | Expresión                                                                                  |
| ------------------ | ------------------------------------------------------------------------------------------ |
| `nombreFormateado` | `{{ $json.nombre.split(' ').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ') }}` |
| `email`            | `{{ $json.email }}`                                                                        |
| `plan`             | `{{ $json.plan }}`                                                                         |
| `fechaRegistro`    | `{{ $now.toISO() }}`                                                                       |
| `fechaFormateada`  | `{{ $now.format('DD/MM/YYYY') }}`                                                          |
| `horaFormateada`   | `{{ $now.format('HH:mm') }}`                                                               |

**Nota del nodo:**

```
🔄 PROCESAMIENTO DE DATOS
Transformaciones aplicadas:
1. Capitalización del nombre (primera letra de cada palabra)
2. Timestamp de registro en formato ISO
3. Fecha y hora en formato legible para el mensaje
```

---

### 4️⃣ Set Node - Mensaje de Bienvenida

| Propiedad   | Valor                             |
| ----------- | --------------------------------- |
| **Tipo**    | Set                               |
| **Nombre**  | Mensaje de Bienvenida             |
| **Modo**    | Keep Only Set                     |
| **Función** | Generar output final estructurado |

**Configuración de Campos:**

| Campo     | Expresión                                                                                                                                                                                          |
| --------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `mensaje` | `{{ '¡Bienvenido ' + $json.nombreFormateado + '! Gracias por unirte con el plan ' + $json.plan + '. Tu cuenta fue creada el ' + $json.fechaFormateada + ' a las ' + $json.horaFormateada + '.' }}` |
| `usuario` | Objeto JSON (ver abajo)                                                                                                                                                                            |

**Estructura del objeto `usuario`:**

```javascript
// Configurar como Expression
{
  "nombreFormateado": "{{ $json.nombreFormateado }}",
  "email": "{{ $json.email }}",
  "plan": "{{ $json.plan }}",
  "fechaRegistro": "{{ $json.fechaRegistro }}"
}
```

**Nota del nodo:**

```
📤 OUTPUT FINAL
Este nodo genera el mensaje de bienvenida personalizado
y estructura todos los datos del usuario para uso posterior
(envío de email, guardado en DB, etc.)
```

---

## 🎨 Mejores Prácticas de Diseño

### 📛 Nomenclatura de Nodos

| ✅ Correcto             | ❌ Incorrecto       |
| ----------------------- | ------------------- |
| `Datos del Usuario`     | `Set`               |
| `Formatear Datos`       | `Set1`              |
| `Mensaje de Bienvenida` | `Nodo para mensaje` |

### 📝 Notas Explicativas

Cada nodo debe tener una nota que responda:

1. **¿QUÉ?** - ¿Qué hace este nodo?
2. **¿PARA QUÉ?** - ¿Cuál es su propósito en el flujo?
3. **¿CÓMO?** - Detalles técnicos si son necesarios

### 🔗 Conexiones

```
[Trigger] ──────▶ [Entrada] ──────▶ [Proceso] ──────▶ [Salida]
           Sin filtrar    Sin filtrar    Sin filtrar
```

### 📐 Distribución Visual

```
┌───────────────────────────────────────────────────────────┐
│                                                           │
│    [ Trigger ]                                            │
│         │                                                 │
│         ▼                                                 │
│    [ Entrada ]    ← Agrupar verticalmente                 │
│         │           para flujos lineales                  │
│         ▼                                                 │
│    [ Proceso ]                                            │
│         │                                                 │
│         ▼                                                 │
│    [ Salida ]                                             │
│                                                           │
└───────────────────────────────────────────────────────────┘
```

---

## 🔍 Validación de Datos

### Esquema de Entrada

```typescript
interface UserInput {
  nombre: string; // Requerido, min 2 caracteres
  email: string; // Requerido, formato email válido
  plan: 'Free' | 'Pro' | 'Enterprise'; // Requerido
}
```

### Esquema de Salida

```typescript
interface WelcomeOutput {
  mensaje: string; // Mensaje de bienvenida completo
  usuario: {
    nombreFormateado: string;
    email: string;
    plan: string;
    fechaRegistro: string; // ISO 8601
  };
}
```

---

## 🧪 Casos de Prueba

### Caso 1: Datos Válidos Estándar

**Input:**

```json
{
  "nombre": "maría garcía",
  "email": "maria@empresa.com",
  "plan": "Pro"
}
```

**Output Esperado:**

```json
{
  "mensaje": "¡Bienvenido María García! Gracias por unirte con el plan Pro...",
  "usuario": {
    "nombreFormateado": "María García",
    "email": "maria@empresa.com",
    "plan": "Pro",
    "fechaRegistro": "2025-01-15T10:30:00.000Z"
  }
}
```

### Caso 2: Nombre con Múltiples Palabras

**Input:**

```json
{
  "nombre": "ana maría de los santos",
  "email": "ana@test.com",
  "plan": "Free"
}
```

**Output Esperado:**

- Nombre formateado: `Ana María De Los Santos`

### Caso 3: Plan Enterprise

**Input:**

```json
{
  "nombre": "carlos ruiz",
  "email": "carlos@empresa.com",
  "plan": "Enterprise"
}
```

---

## 🚀 Extensiones Futuras

### Versión 2.0 - Con Validación

```
[Trigger] → [Entrada] → [IF: Email Válido] → [Proceso] → [Salida]
                              │
                              └──▶ [Error: Email Inválido]
```

### Versión 3.0 - Mensajes por Plan

```
[Trigger] → [Entrada] → [Proceso] → [Switch: Plan]
                                         │
                        ┌────────────────┼────────────────┐
                        ▼                ▼                ▼
                   [Msg Free]       [Msg Pro]      [Msg Enterprise]
                        │                │                │
                        └────────────────┴────────────────┘
                                         │
                                         ▼
                                    [Merge] → [Output]
```

### Versión 4.0 - Integración Completa

```
[Webhook] → [Validar] → [Proceso] → [Switch] → [Mensajes]
                                         │
                                         ▼
                                    [Merge]
                                         │
                        ┌────────────────┼────────────────┐
                        ▼                ▼                ▼
                   [Gmail]          [Slack]        [Database]
```

---

## 📚 Referencias

- [n8n Set Node Documentation](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.set/)
- [n8n Expressions](https://docs.n8n.io/code/expressions/)
- [Luxon Date Formatting](https://docs.n8n.io/code/cookbook/luxon/)
- [n8n Data Structure](https://docs.n8n.io/data/data-structure/)
