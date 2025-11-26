# 📚 Módulo 01: Tipos de Triggers en n8n

![Triggers](https://img.shields.io/badge/Tema-Triggers-FF6D5A?style=flat-square)
![Tiempo](https://img.shields.io/badge/Tiempo-30_min-00D4FF?style=flat-square)
![Nivel](https://img.shields.io/badge/Nivel-Principiante-00A86B?style=flat-square)

---

## 🎯 Objetivos del Módulo

Al finalizar este módulo, serás capaz de:

- Definir qué es un trigger y su importancia en workflows
- Identificar los diferentes tipos de triggers en n8n
- Seleccionar el trigger adecuado según el caso de uso
- Comprender el flujo de datos desde el trigger

---

## 📚 Contenido

### 1.1 ¿Qué es un Trigger?

Un **trigger** (disparador) es el nodo que inicia la ejecución de un workflow en n8n. Sin un trigger, un workflow no puede ejecutarse automáticamente.

#### Definición Formal

> **Trigger**: Evento o condición que inicia automáticamente la ejecución de un workflow. Es el punto de entrada de datos y el primer nodo de cualquier workflow funcional.

#### Analogías Útiles

| Trigger en n8n   | Analogía en la vida real                   |
| ---------------- | ------------------------------------------ |
| Manual Trigger   | Presionar el botón de inicio de un aparato |
| Schedule Trigger | Alarma programada que suena a cierta hora  |
| Webhook Trigger  | Timbre que suena cuando alguien llega      |
| Email Trigger    | Notificación cuando llega un nuevo correo  |
| Database Trigger | Sensor que detecta cambios en inventario   |

### 1.2 Anatomía de un Trigger

Todo trigger en n8n comparte características comunes:

```
┌─────────────────────────────────────────────────────────────────┐
│                      ANATOMÍA DE UN TRIGGER                      │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│   ┌───────────────┐                                              │
│   │   🎯 TRIGGER   │                                              │
│   │               │                                              │
│   │  • Evento     │──────►  ┌──────────────────┐                 │
│   │  • Condición  │         │ DATOS DE SALIDA  │                 │
│   │  • Frecuencia │         │                  │                 │
│   └───────────────┘         │ • JSON payload   │                 │
│                             │ • Metadata       │                 │
│                             │ • Timestamp      │                 │
│                             └──────────────────┘                 │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

#### Propiedades Comunes

| Propiedad           | Descripción                                     |
| ------------------- | ----------------------------------------------- |
| **Tipo de evento**  | Qué condición activa el trigger                 |
| **Frecuencia**      | Cada cuánto se evalúa (en triggers programados) |
| **Datos de salida** | Información que pasa al siguiente nodo          |
| **Estado**          | Activo/Inactivo para workflows en producción    |

### 1.3 Clasificación de Triggers

Los triggers en n8n se pueden clasificar en **tres categorías principales**:

```
                    ┌─────────────────────────────────────┐
                    │        TIPOS DE TRIGGERS            │
                    └─────────────────────────────────────┘
                                     │
          ┌──────────────────────────┼──────────────────────────┐
          │                          │                          │
          ▼                          ▼                          ▼
   ┌─────────────┐           ┌─────────────┐           ┌─────────────┐
   │   MANUALES  │           │ PROGRAMADOS │           │  EXTERNOS   │
   │             │           │             │           │             │
   │ • Manual    │           │ • Schedule  │           │ • Webhook   │
   │ • Execute   │           │ • Cron      │           │ • Email     │
   │   Workflow  │           │ • Interval  │           │ • App       │
   │             │           │             │           │   Triggers  │
   └─────────────┘           └─────────────┘           └─────────────┘
```

---

## 🔵 Triggers Manuales

### Manual Trigger

El **Manual Trigger** es el más simple y se usa principalmente para **desarrollo y testing**.

#### Características

- ✅ Se ejecuta solo cuando el usuario hace clic en "Execute Workflow"
- ✅ Ideal para probar workflows durante el desarrollo
- ✅ No requiere configuración adicional
- ✅ Puede recibir parámetros de entrada opcionales

#### Caso de Uso

```
┌─────────────────────────────────────────────────────────────────┐
│                    MANUAL TRIGGER                                │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│    Usuario hace clic                                             │
│    en "Execute Workflow"                                         │
│           │                                                      │
│           ▼                                                      │
│    ┌──────────────┐     ┌──────────────┐     ┌──────────────┐   │
│    │   Manual     │────►│   Nodo 1     │────►│   Nodo 2     │   │
│    │   Trigger    │     │              │     │              │   │
│    └──────────────┘     └──────────────┘     └──────────────┘   │
│                                                                  │
│    Datos de salida:                                              │
│    {                                                             │
│      "json": {}  // Objeto vacío por defecto                     │
│    }                                                             │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

#### Configuración Avanzada

El Manual Trigger permite definir **parámetros de entrada** para testing:

```javascript
// Ejemplo de datos que puedes configurar en Manual Trigger
{
  "testMode": true,
  "userId": 12345,
  "action": "test_workflow"
}
```

### Execute Workflow Trigger

El **Execute Workflow Trigger** permite que un workflow sea ejecutado desde otro workflow (sub-workflow).

#### Características

- ✅ Permite modularizar workflows complejos
- ✅ Recibe datos del workflow padre
- ✅ Puede retornar datos al workflow padre
- ✅ Promueve reutilización de lógica

#### Diagrama de Sub-workflows

```
┌─────────────────────────────────────────────────────────────────┐
│                    WORKFLOW PADRE                                │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌─────────┐    ┌─────────────────┐    ┌─────────┐              │
│  │ Trigger │───►│ Execute Workflow │───►│ Nodo X  │              │
│  └─────────┘    │   (Llama Sub)    │    └─────────┘              │
│                 └────────┬─────────┘                             │
│                          │                                       │
└──────────────────────────┼───────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────────┐
│                    SUB-WORKFLOW                                  │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌──────────────────┐    ┌─────────┐    ┌─────────┐             │
│  │ Execute Workflow │───►│ Proceso │───►│ Return  │             │
│  │     Trigger      │    │         │    │  Data   │             │
│  └──────────────────┘    └─────────┘    └─────────┘             │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 🟢 Triggers Programados

### Schedule Trigger

El **Schedule Trigger** ejecuta workflows en intervalos de tiempo definidos usando **expresiones cron** o intervalos simples.

#### Características

- ✅ Ejecuta workflows automáticamente según horario
- ✅ Soporta expresiones cron completas
- ✅ Opción de intervalos simples (cada X minutos/horas)
- ✅ Configurable para zona horaria específica

#### Opciones de Configuración

```
┌─────────────────────────────────────────────────────────────────┐
│              SCHEDULE TRIGGER - OPCIONES                         │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │  MODO SIMPLE (Intervalo)                                 │    │
│  │                                                          │    │
│  │  • Cada X segundos                                       │    │
│  │  • Cada X minutos                                        │    │
│  │  • Cada X horas                                          │    │
│  │  • Cada X días                                           │    │
│  └─────────────────────────────────────────────────────────┘    │
│                                                                  │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │  MODO AVANZADO (Cron)                                    │    │
│  │                                                          │    │
│  │  • Expresión cron personalizada                          │    │
│  │  • Múltiples horarios                                    │    │
│  │  • Días específicos de la semana/mes                     │    │
│  └─────────────────────────────────────────────────────────┘    │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

#### Ejemplos de Uso

| Necesidad                  | Configuración         |
| -------------------------- | --------------------- |
| Cada hora                  | Intervalo: 1 hora     |
| Todos los días a las 9 AM  | Cron: `0 9 * * *`     |
| Lunes a Viernes a las 8 AM | Cron: `0 8 * * 1-5`   |
| Primer día de cada mes     | Cron: `0 0 1 * *`     |
| Cada 15 minutos            | Intervalo: 15 minutos |

#### Datos de Salida

El Schedule Trigger proporciona información sobre la ejecución:

```json
{
  "json": {
    "timestamp": "2024-01-15T09:00:00.000Z",
    "Readable date": "January 15, 2024 at 09:00 AM",
    "Readable time": "09:00:00",
    "Day of week": "Monday",
    "Year": "2024",
    "Month": "January",
    "Day of month": "15",
    "Hour": "09",
    "Minute": "00",
    "Second": "00",
    "Timezone": "America/Mexico_City"
  }
}
```

---

## 🟠 Triggers Externos

### Webhook Trigger

El **Webhook Trigger** es uno de los más poderosos, permitiendo que sistemas externos inicien workflows enviando datos HTTP.

#### Características

- ✅ Recibe datos de cualquier sistema que pueda hacer HTTP requests
- ✅ Soporta múltiples métodos HTTP (GET, POST, PUT, DELETE)
- ✅ URL única para cada workflow
- ✅ Puede validar autenticación

#### ¿Cómo Funciona?

```
┌─────────────────────────────────────────────────────────────────┐
│                  WEBHOOK TRIGGER - FLUJO                         │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│   Sistema Externo                   n8n                          │
│   ───────────────                   ───                          │
│                                                                  │
│   ┌─────────────┐    HTTP POST     ┌──────────────────┐         │
│   │   App       │─────────────────►│  Webhook Trigger │         │
│   │   Externa   │   + JSON Data    │                  │         │
│   └─────────────┘                  │  URL única del   │         │
│                                    │  workflow        │         │
│                                    └────────┬─────────┘         │
│                                             │                    │
│                                             ▼                    │
│                                    ┌──────────────────┐         │
│                                    │ Procesar datos   │         │
│                                    │ recibidos        │         │
│                                    └──────────────────┘         │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

#### URL del Webhook

n8n genera dos URLs para cada webhook:

| Tipo           | Uso                | Ejemplo                                  |
| -------------- | ------------------ | ---------------------------------------- |
| **Test URL**   | Durante desarrollo | `https://tu-n8n.com/webhook-test/abc123` |
| **Production** | Workflow activo    | `https://tu-n8n.com/webhook/abc123`      |

#### Configuración del Webhook

| Parámetro          | Opciones                             | Descripción              |
| ------------------ | ------------------------------------ | ------------------------ |
| **HTTP Method**    | GET, POST, PUT, DELETE, PATCH, HEAD  | Método HTTP aceptado     |
| **Path**           | Personalizable                       | Ruta del webhook         |
| **Authentication** | None, Basic Auth, Header Auth        | Seguridad del endpoint   |
| **Response Mode**  | Immediately, When Last Node Finishes | Cuándo responder         |
| **Response Code**  | 200, 201, 404, etc.                  | Código HTTP de respuesta |

#### Datos Recibidos

El webhook proporciona toda la información de la petición HTTP:

```json
{
  "json": {
    "headers": {
      "content-type": "application/json",
      "user-agent": "PostmanRuntime/7.32.0"
    },
    "params": {},
    "query": {
      "source": "app-externa"
    },
    "body": {
      "userId": 123,
      "event": "user_created",
      "data": {
        "name": "Juan Pérez",
        "email": "juan@example.com"
      }
    }
  }
}
```

### Otros Triggers Externos Populares

#### Email Trigger (IMAP)

Ejecuta el workflow cuando llega un nuevo email:

```
┌──────────────┐     ┌─────────────┐     ┌──────────────┐
│ Nuevo Email  │────►│ Email       │────►│ Procesar     │
│ en bandeja   │     │ Trigger     │     │ contenido    │
└──────────────┘     └─────────────┘     └──────────────┘
```

#### App-Specific Triggers

Muchas integraciones tienen sus propios triggers:

| Aplicación    | Trigger               | Evento                     |
| ------------- | --------------------- | -------------------------- |
| Google Sheets | Google Sheets Trigger | Nueva fila agregada        |
| Slack         | Slack Trigger         | Nuevo mensaje en canal     |
| GitHub        | GitHub Trigger        | Nuevo push, PR, issue      |
| Stripe        | Stripe Trigger        | Nuevo pago, suscripción    |
| Airtable      | Airtable Trigger      | Registro creado/modificado |

---

## 🎯 Selección del Trigger Correcto

### Matriz de Decisión

```
┌─────────────────────────────────────────────────────────────────┐
│               ¿QUÉ TRIGGER NECESITO?                             │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ¿Cuándo debe ejecutarse el workflow?                           │
│                                                                  │
│  ┌─────────────────────┐                                        │
│  │ Solo cuando yo lo   │──────────► Manual Trigger              │
│  │ ejecute manualmente │            (Desarrollo/Testing)        │
│  └─────────────────────┘                                        │
│                                                                  │
│  ┌─────────────────────┐                                        │
│  │ En horarios o       │──────────► Schedule Trigger            │
│  │ intervalos fijos    │            (Cron/Intervalo)            │
│  └─────────────────────┘                                        │
│                                                                  │
│  ┌─────────────────────┐                                        │
│  │ Cuando ocurre un    │──────────► Webhook Trigger             │
│  │ evento en otro      │            o App Trigger               │
│  │ sistema             │                                        │
│  └─────────────────────┘                                        │
│                                                                  │
│  ┌─────────────────────┐                                        │
│  │ Cuando otro         │──────────► Execute Workflow            │
│  │ workflow lo llame   │            Trigger                     │
│  └─────────────────────┘                                        │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Ejemplos por Caso de Uso

| Caso de Uso                            | Trigger Recomendado | Razón                                |
| -------------------------------------- | ------------------- | ------------------------------------ |
| Reporte diario de ventas               | Schedule Trigger    | Se necesita en horario fijo          |
| Procesar formulario de contacto        | Webhook Trigger     | Se activa cuando usuario envía form  |
| Sincronizar datos bajo demanda         | Manual Trigger      | El usuario decide cuándo sincronizar |
| Notificar cuando llega un email        | Email Trigger       | Se activa con evento externo         |
| Procesar parte de un workflow complejo | Execute Workflow    | Modularización de lógica             |

---

## ⚠️ Mejores Prácticas

### ✅ DO (Hacer)

1. **Usar Manual Trigger para desarrollo**

   - Siempre desarrolla y prueba con Manual Trigger primero
   - Cambia al trigger final cuando el workflow funcione

2. **Configurar zona horaria correctamente**

   - En Schedule Trigger, asegura que la zona horaria sea la correcta
   - Considera DST (horario de verano) si aplica

3. **Proteger webhooks en producción**

   - Usar autenticación (Header Auth o Basic Auth)
   - Validar datos de entrada

4. **Documentar el trigger**
   - Agregar nota explicando cuándo y por qué se ejecuta
   - Incluir información sobre el origen de los datos

### ❌ DON'T (No Hacer)

1. **No usar Schedule muy frecuente sin necesidad**

   - Ejecutar cada segundo consume recursos innecesariamente
   - Evalúa si realmente necesitas esa frecuencia

2. **No dejar webhooks sin autenticación en producción**

   - Cualquiera podría ejecutar tu workflow
   - Siempre agrega una capa de seguridad

3. **No ignorar errores del trigger**
   - Si el trigger falla, el workflow no se ejecuta
   - Monitorea las ejecuciones fallidas

---

## 📝 Resumen

| Trigger          | Inicio               | Caso de Uso Principal        |
| ---------------- | -------------------- | ---------------------------- |
| Manual Trigger   | Clic del usuario     | Desarrollo y testing         |
| Schedule Trigger | Tiempo/intervalo     | Tareas programadas           |
| Webhook Trigger  | HTTP request externo | Integraciones en tiempo real |
| Execute Workflow | Otro workflow        | Sub-workflows modulares      |
| App Triggers     | Evento en aplicación | Reaccionar a cambios en apps |

---

## 🔗 Recursos Adicionales

- 📖 [Documentación oficial de Triggers](https://docs.n8n.io/workflows/triggers/)
- 🎥 [Video: Entendiendo Triggers en n8n](https://www.youtube.com/results?search_query=n8n+triggers+tutorial)
- 📝 [Módulo siguiente: Expresiones Cron](02-expresiones-cron.md)

---

## ❓ Preguntas de Reflexión

1. ¿Por qué es importante elegir el trigger correcto para cada workflow?
2. ¿En qué situaciones preferirías un Webhook sobre un Schedule Trigger?
3. ¿Cómo modularizarías un workflow muy complejo usando Execute Workflow Trigger?
4. ¿Qué consideraciones de seguridad debes tener con Webhook Triggers?

---

## 🏠 Navegación

| ⬅️ Anterior                      | 📚 Módulo Actual           | ➡️ Siguiente                                    |
| -------------------------------- | -------------------------- | ----------------------------------------------- |
| [Semana 02 README](../README.md) | **01 - Tipos de Triggers** | [02 - Expresiones Cron](02-expresiones-cron.md) |
