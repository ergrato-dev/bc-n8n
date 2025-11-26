# 🔄 Semana 02: Triggers y Primeros Workflows

![n8n](https://img.shields.io/badge/n8n-Workflow_Automation-FF6D5A?style=flat-square&logo=n8n)
![Triggers](https://img.shields.io/badge/Triggers-Manual_Schedule_Webhook-00D4FF?style=flat-square)
![Duración](https://img.shields.io/badge/Duración-6_horas-00D4FF?style=flat-square)
![Nivel](https://img.shields.io/badge/Nivel-Principiante-00A86B?style=flat-square)

---

## 📋 Descripción General

En esta segunda semana profundizaremos en los diferentes tipos de triggers disponibles en n8n y crearás tus primeros workflows funcionales. Aprenderás a iniciar workflows de manera manual, programada (cron) y mediante webhooks.

Los triggers son el corazón de la automatización - sin un trigger, un workflow no puede ejecutarse. Dominar los diferentes tipos de triggers te permitirá elegir el más adecuado para cada caso de uso.

Esta semana también introduciremos las bases del debugging en n8n, habilidad esencial para identificar y resolver problemas en tus workflows.

---

## 🎯 Objetivos de Aprendizaje

Al finalizar esta semana, serás capaz de:

- [ ] Diferenciar entre los tipos de triggers disponibles en n8n
- [ ] Configurar triggers manuales para desarrollo y testing
- [ ] Crear schedules usando expresiones cron
- [ ] Implementar webhooks para recibir datos externos
- [ ] Debuggear workflows usando las herramientas de n8n
- [ ] Analizar el flujo de datos entre nodos
- [ ] Crear workflows con múltiples nodos

---

## ⏱️ Distribución del Tiempo

| Actividad    | Tiempo      | Porcentaje |
| ------------ | ----------- | ---------- |
| 📚 Teoría    | 1.5 horas   | 25%        |
| 💻 Prácticas | 2 horas     | 33%        |
| 🔨 Proyecto  | 2.5 horas   | 42%        |
| **Total**    | **6 horas** | **100%**   |

---

## 📚 Contenido Teórico

| #   | Módulo                                              | Descripción                           | Tiempo |
| --- | --------------------------------------------------- | ------------------------------------- | ------ |
| 01  | [Tipos de Triggers](1-teoria/01-tipos-triggers.md)  | Manual, Schedule, Webhook y otros     | 30 min |
| 02  | [Expresiones Cron](1-teoria/02-expresiones-cron.md) | Sintaxis y ejemplos de programación   | 30 min |
| 03  | [Debugging en n8n](1-teoria/03-debugging-n8n.md)    | Herramientas y técnicas de depuración | 30 min |

---

## 💻 Prácticas

| #   | Práctica                                                             | Dificultad | Tiempo | Conceptos                  |
| --- | -------------------------------------------------------------------- | ---------- | ------ | -------------------------- |
| 01  | [Trigger Manual Avanzado](2-practicas/practica-01-trigger-manual.md) | ⭐         | 25 min | Manual Trigger, Parámetros |
| 02  | [Schedule Trigger](2-practicas/practica-02-schedule-trigger.md)      | ⭐⭐       | 25 min | Cron, Programación         |
| 03  | [Webhook Básico](2-practicas/practica-03-webhook-basico.md)          | ⭐⭐       | 30 min | Webhook, HTTP              |
| 04  | [Debugging de Workflows](2-practicas/practica-04-debugging.md)       | ⭐⭐       | 30 min | Debugging, Logs            |
| 05  | [Workflow Multi-Trigger](2-practicas/practica-05-multi-trigger.md)   | ⭐⭐⭐     | 30 min | Múltiples Triggers         |

---

## 🔨 Proyecto Integrador

### Sistema de Recordatorios Programados

**Descripción**: Crear un sistema que envíe recordatorios basados en horarios configurables. El sistema tendrá múltiples triggers para diferentes tipos de recordatorios.

| Documento                                         | Descripción                             |
| ------------------------------------------------- | --------------------------------------- |
| [README.md](3-proyecto/README.md)                 | Especificaciones completas del proyecto |
| [GUIA-DISENO.md](3-proyecto/GUIA-DISENO.md)       | Arquitectura del sistema                |
| [EJEMPLOS-DATOS.md](3-proyecto/EJEMPLOS-DATOS.md) | Datos de prueba                         |

---

## 📖 Recursos

Consulta el [índice de recursos](4-recursos/README.md) para:

- Videos sobre triggers en n8n
- Documentación de expresiones cron
- Herramientas de testing de webhooks
- Guías de debugging

---

## 📊 Evaluación

| Componente    | Peso | Puntos |
| ------------- | ---- | ------ |
| Teoría        | 20%  | 20     |
| Prácticas (5) | 30%  | 30     |
| Proyecto      | 50%  | 50     |

📋 Consulta la [Rúbrica de Evaluación](RUBRICA-EVALUACION.md) para criterios detallados.

---

## ✅ Checklist de Completitud

### Teoría

- [ ] Leí el módulo de Tipos de Triggers
- [ ] Leí el módulo de Expresiones Cron
- [ ] Leí el módulo de Debugging en n8n

### Prácticas

- [ ] Completé Práctica 01: Trigger Manual Avanzado
- [ ] Completé Práctica 02: Schedule Trigger
- [ ] Completé Práctica 03: Webhook Básico
- [ ] Completé Práctica 04: Debugging de Workflows
- [ ] Completé Práctica 05: Workflow Multi-Trigger

### Proyecto

- [ ] Creé el sistema de recordatorios
- [ ] Implementé al menos 2 tipos de triggers
- [ ] Documenté el workflow
- [ ] Exporté y probé el workflow

---

## 🧭 Navegación del Bootcamp

```
Semanas:  01   02   03   04   05   06   07   08   09   10
               ▼
         [ ]──[■]──[ ]──[ ]──[ ]──[ ]──[ ]──[ ]──[ ]──[ ]
               │
               └── Estás aquí: Triggers y Primeros Workflows
```

---

## 💡 Tips de la Semana

### ✅ Buenas Prácticas

- Usa Manual Trigger durante el desarrollo
- Documenta tus expresiones cron con comentarios
- Siempre prueba los webhooks con herramientas como Webhook.site

### ⚠️ Errores Comunes

- Olvidar activar el workflow para que el Schedule funcione
- No copiar correctamente la URL del webhook
- Confundir la sintaxis de cron

### 🚀 Consejos Pro

- Usa [crontab.guru](https://crontab.guru) para validar expresiones cron
- Crea un workflow de prueba dedicado para webhooks
- Aprende los atajos de teclado para debugging

---

## 🔗 Enlaces Rápidos

- 📚 [Documentación Triggers](https://docs.n8n.io/workflows/triggers/)
- 🔧 [Webhook.site](https://webhook.site)
- 📅 [Crontab Guru](https://crontab.guru)

---

<div align="center">

| ◀️ Anterior                         | 🏠 Inicio                           | Siguiente ▶️                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| [Semana 01](../semana-01/README.md) | [README Principal](../../README.md) | [Semana 03](../semana-03/README.md) |

</div>
