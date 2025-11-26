# 🛡️ Semana 08: Error Handling y Sub-workflows

![n8n](https://img.shields.io/badge/n8n-Workflow_Automation-FF6D5A?style=flat-square&logo=n8n)
![Error Handling](https://img.shields.io/badge/Error_Handling-Resiliencia-FF4444?style=flat-square)
![Duración](https://img.shields.io/badge/Duración-6_horas-00D4FF?style=flat-square)
![Nivel](https://img.shields.io/badge/Nivel-Avanzado-FF4444?style=flat-square)

---

## 📋 Descripción General

Esta semana abordamos dos temas críticos para workflows de producción: manejo de errores y modularización. Aprenderás a crear workflows resilientes que recuperan de fallos y a organizar tu lógica en componentes reutilizables.

El Error Trigger te permite capturar y manejar errores de forma elegante. Los sub-workflows te permiten modularizar y reutilizar lógica compleja. Juntos, forman la base de workflows profesionales.

Un workflow sin manejo de errores es como un barco sin botes salvavidas.

---

## 🎯 Objetivos de Aprendizaje

Al finalizar esta semana, serás capaz de:

- [ ] Implementar Error Trigger para capturar errores
- [ ] Diseñar estrategias de retry
- [ ] Crear sub-workflows modulares
- [ ] Implementar Execute Workflow y Call Workflow
- [ ] Manejar errores a nivel de nodo y workflow
- [ ] Diseñar workflows resilientes
- [ ] Implementar notificaciones de error

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

| #   | Módulo                                                 | Descripción                      | Tiempo |
| --- | ------------------------------------------------------ | -------------------------------- | ------ |
| 01  | [Error Handling Básico](1-teoria/01-error-handling.md) | Error Trigger y Continue On Fail | 30 min |
| 02  | [Retry Strategies](1-teoria/02-retry-strategies.md)    | Reintentos y backoff             | 30 min |
| 03  | [Sub-workflows](1-teoria/03-sub-workflows.md)          | Modularización y reutilización   | 30 min |

---

## 💻 Prácticas

| #   | Práctica                                                        | Dificultad | Tiempo | Conceptos        |
| --- | --------------------------------------------------------------- | ---------- | ------ | ---------------- |
| 01  | [Error Trigger](2-practicas/practica-01-error-trigger.md)       | ⭐⭐       | 25 min | Error Trigger    |
| 02  | [Continue On Fail](2-practicas/practica-02-continue-on-fail.md) | ⭐⭐       | 25 min | Nodo settings    |
| 03  | [Retry con Backoff](2-practicas/practica-03-retry.md)           | ⭐⭐⭐     | 30 min | Retry            |
| 04  | [Sub-workflow](2-practicas/practica-04-sub-workflow.md)         | ⭐⭐⭐     | 30 min | Execute Workflow |
| 05  | [Sistema Resiliente](2-practicas/practica-05-resiliente.md)     | ⭐⭐⭐     | 30 min | Combinado        |

---

## 🔨 Proyecto Integrador

### Sistema de Monitoreo y Alertas

**Descripción**: Crear un sistema completo de manejo de errores con notificaciones, logs y recuperación automática para workflows críticos.

| Documento                                               | Descripción                   |
| ------------------------------------------------------- | ----------------------------- |
| [README.md](3-proyecto/README.md)                       | Especificaciones del proyecto |
| [GUIA-ARQUITECTURA.md](3-proyecto/GUIA-ARQUITECTURA.md) | Arquitectura del sistema      |
| [ESCENARIOS-ERROR.md](3-proyecto/ESCENARIOS-ERROR.md)   | Casos de error a manejar      |

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

- [ ] Leí el módulo de Error Handling
- [ ] Leí el módulo de Retry Strategies
- [ ] Leí el módulo de Sub-workflows

### Prácticas

- [ ] Completé todas las 5 prácticas

### Proyecto

- [ ] Implementé el sistema de monitoreo
- [ ] Configuré alertas de error
- [ ] Documenté el workflow

---

## 🧭 Navegación del Bootcamp

```
Semanas:  01   02   03   04   05   06   07   08   09   10
                                             ▼
         [ ]──[ ]──[ ]──[ ]──[ ]──[ ]──[ ]──[■]──[ ]──[ ]
                                             │
                                             └── Estás aquí: Error Handling
```

---

## 💡 Tips de la Semana

### ✅ Buenas Prácticas

- Siempre implementa Error Trigger en workflows de producción
- Notifica errores a canales relevantes (Slack, Email)
- Documenta los tipos de errores esperados

### ⚠️ Errores Comunes

- Ignorar errores silenciosamente
- No registrar información suficiente para debugging
- Crear loops de error infinitos

---

<div align="center">

| ◀️ Anterior                         | 🏠 Inicio                           | Siguiente ▶️                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| [Semana 07](../semana-07/README.md) | [README Principal](../../README.md) | [Semana 09](../semana-09/README.md) |

</div>
