# 🔨 Proyecto Integrador - Semana 02

## Sistema de Recordatorios Programados

![Proyecto](https://img.shields.io/badge/Tipo-Proyecto_Integrador-FF6D5A?style=flat-square)
![Dificultad](https://img.shields.io/badge/Dificultad-⭐⭐-00D4FF?style=flat-square)
![Tiempo](https://img.shields.io/badge/Tiempo-2.5_horas-00A86B?style=flat-square)

---

## 📋 Información General

| Campo               | Valor                                |
| ------------------- | ------------------------------------ |
| **Nombre**          | Sistema de Recordatorios Programados |
| **Dificultad**      | ⭐⭐                                 |
| **Tiempo Estimado** | 2-2.5 horas                          |
| **Tipo**            | Workflow con múltiples triggers      |
| **Prerequisitos**   | Prácticas 01-05 completadas          |

---

## 🎯 Objetivos del Proyecto

Al completar este proyecto, habrás demostrado capacidad para:

- [ ] Implementar múltiples tipos de triggers en un workflow
- [ ] Usar expresiones cron para programación de tareas
- [ ] Configurar webhooks para recibir datos externos
- [ ] Aplicar técnicas de debugging aprendidas
- [ ] Diseñar flujos de datos coherentes
- [ ] Documentar un workflow profesionalmente

---

## 📝 Descripción del Proyecto

### El Problema

Una empresa necesita un sistema de recordatorios que:

1. **Envíe recordatorios programados** a horas específicas del día
2. **Permita agregar nuevos recordatorios** desde sistemas externos
3. **Procese recordatorios bajo demanda** para testing
4. **Lleve un registro** de todos los recordatorios procesados

### La Solución

Crearás un workflow en n8n que integre:

- **Schedule Trigger**: Para recordatorios automáticos a horas fijas
- **Webhook Trigger**: Para recibir nuevos recordatorios dinámicamente
- **Manual Trigger**: Para testing y ejecución manual

---

## 🏗️ Arquitectura del Sistema

```
┌─────────────────────────────────────────────────────────────────┐
│           SISTEMA DE RECORDATORIOS PROGRAMADOS                   │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ENTRADAS (Triggers)                                             │
│  ═══════════════════                                             │
│                                                                  │
│  ┌────────────────┐  ┌────────────────┐  ┌────────────────┐     │
│  │ 🎯 Manual      │  │ ⏰ Schedule    │  │ 🌐 Webhook     │     │
│  │    Trigger     │  │    Trigger     │  │    Trigger     │     │
│  │                │  │                │  │                │     │
│  │ Testing y      │  │ 9AM, 12PM,     │  │ Nuevos         │     │
│  │ debugging      │  │ 6PM L-V        │  │ recordatorios  │     │
│  └───────┬────────┘  └───────┬────────┘  └───────┬────────┘     │
│          │                   │                   │               │
│          └───────────────────┼───────────────────┘               │
│                              │                                   │
│  PROCESAMIENTO               ▼                                   │
│  ═════════════    ┌──────────────────┐                          │
│                   │  Identificar     │                          │
│                   │  Origen          │                          │
│                   └────────┬─────────┘                          │
│                            │                                     │
│                            ▼                                     │
│                   ┌──────────────────┐                          │
│                   │  Preparar        │                          │
│                   │  Recordatorio    │                          │
│                   └────────┬─────────┘                          │
│                            │                                     │
│                            ▼                                     │
│                   ┌──────────────────┐                          │
│                   │  Validar         │                          │
│                   │  Datos           │                          │
│                   └────────┬─────────┘                          │
│                            │                                     │
│                      ┌─────┴─────┐                               │
│                      │           │                               │
│  SALIDAS             ▼           ▼                               │
│  ═══════     ┌──────────┐ ┌──────────┐                          │
│              │ ✅ Enviar │ │ ❌ Error │                          │
│              │ Reminder │ │ Handler  │                          │
│              └──────────┘ └──────────┘                          │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 📦 Requisitos Funcionales

### RF01: Triggers Múltiples

- El workflow debe tener al menos 3 triggers:
  - Manual Trigger para testing
  - Schedule Trigger con al menos 2 horarios
  - Webhook Trigger para entrada externa

### RF02: Procesamiento de Recordatorios

- Identificar el origen del trigger
- Generar un ID único para cada recordatorio
- Registrar timestamp de procesamiento
- Validar que los datos estén completos

### RF03: Recordatorios Programados

El Schedule Trigger debe configurarse para ejecutarse:

- 9:00 AM - Recordatorio matutino
- 12:00 PM - Recordatorio de mediodía (opcional)
- 6:00 PM - Recordatorio vespertino

### RF04: Webhook de Entrada

El webhook debe aceptar datos con esta estructura:

```json
{
  "title": "Título del recordatorio",
  "message": "Contenido del recordatorio",
  "priority": "high|normal|low",
  "recipient": "nombre o email del destinatario"
}
```

### RF05: Salida Estructurada

Cada recordatorio procesado debe generar un output con:

```json
{
  "reminderId": "REM-1234567890",
  "title": "...",
  "message": "...",
  "priority": "...",
  "triggerType": "manual|scheduled|webhook",
  "processedAt": "2024-01-15T09:00:00.000Z",
  "status": "sent|failed",
  "recipient": "..."
}
```

---

## 🔧 Especificaciones Técnicas

### Expresiones Cron Requeridas

| Horario      | Expresión Cron | Descripción                 |
| ------------ | -------------- | --------------------------- |
| 9:00 AM L-V  | `0 9 * * 1-5`  | Lunes a Viernes a las 9 AM  |
| 12:00 PM L-V | `0 12 * * 1-5` | Lunes a Viernes a las 12 PM |
| 6:00 PM L-V  | `0 18 * * 1-5` | Lunes a Viernes a las 6 PM  |

### Configuración del Webhook

| Parámetro      | Valor                   |
| -------------- | ----------------------- |
| Path           | `/recordatorios`        |
| Method         | `POST`                  |
| Authentication | Header Auth (opcional)  |
| Response Mode  | When Last Node Finishes |

### Nodos Requeridos

1. **Triggers** (3)

   - Manual Trigger
   - Schedule Trigger
   - Webhook

2. **Procesamiento** (mínimo 4)

   - Set Node (identificar origen)
   - Set Node (preparar datos)
   - IF Node (validación)
   - Set Node (resultado)

3. **Merge** (1)
   - Para unificar los flujos de los triggers

---

## 📋 Pasos de Implementación

### Fase 1: Configurar Triggers (30 min)

1. Crear nuevo workflow: `proyecto-02-recordatorios`
2. Agregar Manual Trigger
3. Agregar Schedule Trigger con cron expressions
4. Agregar Webhook Trigger
5. Configurar nodos de identificación de origen para cada trigger

### Fase 2: Implementar Procesamiento (45 min)

1. Agregar nodo Merge para unificar flujos
2. Crear nodo de preparación de datos
3. Implementar validación con IF Node
4. Agregar nodos de resultado (éxito/error)

### Fase 3: Testing y Debugging (30 min)

1. Probar Manual Trigger
2. Probar Webhook con cURL
3. Verificar Schedule (ejecutar nodo individualmente)
4. Debuggear cualquier error encontrado

### Fase 4: Documentación (30 min)

1. Agregar notas a los nodos importantes
2. Crear documentación del webhook (qué datos acepta)
3. Documentar las expresiones cron usadas

---

## 📊 Rúbrica de Evaluación

| Criterio                  | Puntos  | Descripción                               |
| ------------------------- | ------- | ----------------------------------------- |
| **Triggers Configurados** | 15      | 3 triggers funcionando correctamente      |
| **Expresiones Cron**      | 10      | Cron válidas y zona horaria correcta      |
| **Webhook Funcional**     | 15      | Acepta datos y los procesa                |
| **Flujo Unificado**       | 10      | Merge correcto de los 3 triggers          |
| **Validación de Datos**   | 10      | IF node validando datos de entrada        |
| **Estructura de Salida**  | 10      | Output con todos los campos requeridos    |
| **Manejo de Errores**     | 10      | Rama de error implementada                |
| **Documentación**         | 10      | Notas en nodos, README actualizado        |
| **Calidad del Workflow**  | 10      | Nombres descriptivos, organización visual |
| **TOTAL**                 | **100** |                                           |

---

## 📝 Entregables

1. **Workflow exportado** (`proyecto-02-recordatorios.json`)
2. **Screenshot** del workflow completo
3. **Documentación**:
   - Cómo probar cada trigger
   - Ejemplo de petición al webhook
   - Explicación de las expresiones cron usadas

---

## 🧪 Casos de Prueba

### Caso 1: Manual Trigger

```
Acción: Ejecutar workflow manualmente
Esperado: Recordatorio con triggerType="manual"
```

### Caso 2: Webhook con Datos Válidos

```bash
curl -X POST http://localhost:5678/webhook-test/recordatorios \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Reunión de equipo",
    "message": "No olvides la reunión a las 3 PM",
    "priority": "high",
    "recipient": "equipo@empresa.com"
  }'
```

**Esperado**: Recordatorio procesado con status="sent"

### Caso 3: Webhook con Datos Incompletos

```bash
curl -X POST http://localhost:5678/webhook-test/recordatorios \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Sin mensaje"
  }'
```

**Esperado**: Error con status="failed", indicando datos faltantes

### Caso 4: Schedule Trigger

```
Acción: Ejecutar nodo Schedule manualmente (clic derecho → Execute Node)
Esperado: Recordatorio con triggerType="scheduled" y datos de tiempo
```

---

## 💡 Tips para el Proyecto

1. **Empieza simple**: Primero haz que un trigger funcione completamente, luego agrega los demás

2. **Usa Pinned Data**: Para testing rápido del flujo sin esperar triggers reales

3. **Documenta mientras construyes**: No dejes la documentación para el final

4. **Prueba cada rama**: Asegúrate de que tanto el path de éxito como el de error funcionen

5. **Nombres descriptivos**: Los nombres de nodos deben indicar claramente su función

---

## 🔗 Recursos de Apoyo

- 📖 [Guía de Diseño](GUIA-DISENO.md) - Arquitectura detallada
- 📊 [Ejemplos de Datos](EJEMPLOS-DATOS.md) - Datos de prueba
- 📚 [Teoría - Triggers](../1-teoria/01-tipos-triggers.md)
- 📚 [Teoría - Cron](../1-teoria/02-expresiones-cron.md)
- 💻 [Práctica 05 - Multi-Trigger](../2-practicas/practica-05-multi-trigger.md)

---

## 🏠 Navegación

| ⬅️ Anterior                  | 📚 Sección Actual | ➡️ Siguiente               |
| ---------------------------- | ----------------- | -------------------------- |
| [Prácticas](../2-practicas/) | **Proyecto**      | [Recursos](../4-recursos/) |
