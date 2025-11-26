# 💻 Prácticas - Semana 02

## Triggers y Primeros Workflows

![Prácticas](https://img.shields.io/badge/Tipo-Prácticas-FF6D5A?style=flat-square)
![Tiempo](https://img.shields.io/badge/Tiempo_Total-140_min-00D4FF?style=flat-square)
![Ejercicios](https://img.shields.io/badge/Ejercicios-5-00A86B?style=flat-square)

---

## 📋 Lista de Prácticas

| #   | Práctica                                                 | Dificultad | Tiempo | Conceptos                   |
| --- | -------------------------------------------------------- | ---------- | ------ | --------------------------- |
| 01  | [Trigger Manual Avanzado](practica-01-trigger-manual.md) | ⭐         | 25 min | Manual Trigger, Set, IF     |
| 02  | [Schedule Trigger](practica-02-schedule-trigger.md)      | ⭐⭐       | 25 min | Cron, Timezone, Schedule    |
| 03  | [Webhook Básico](practica-03-webhook-basico.md)          | ⭐⭐       | 30 min | Webhook, HTTP, Validación   |
| 04  | [Debugging de Workflows](practica-04-debugging.md)       | ⭐⭐       | 30 min | Debugging, Errores, Testing |
| 05  | [Workflow Multi-Trigger](practica-05-multi-trigger.md)   | ⭐⭐⭐     | 30 min | Merge, Múltiples Triggers   |

---

## 🎯 Objetivos de las Prácticas

Al completar todas las prácticas, habrás:

- [ ] Configurado Manual Trigger con datos de prueba y Pinned Data
- [ ] Creado expresiones cron y configurado zona horaria
- [ ] Implementado un webhook funcional con validación de datos
- [ ] Diagnosticado y corregido errores en workflows
- [ ] Diseñado un workflow que responde a múltiples triggers

---

## 📊 Progresión de Dificultad

```
  Práctica 01   Práctica 02   Práctica 03   Práctica 04   Práctica 05
       ⭐            ⭐⭐           ⭐⭐           ⭐⭐          ⭐⭐⭐
       │             │             │             │             │
       ▼             ▼             ▼             ▼             ▼
  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐
  │ Manual  │  │Schedule │  │ Webhook │  │Debugging│  │ Multi   │
  │ Trigger │  │ Trigger │  │ Básico  │  │         │  │ Trigger │
  │         │  │ + Cron  │  │ + HTTP  │  │         │  │ + Merge │
  └─────────┘  └─────────┘  └─────────┘  └─────────┘  └─────────┘
       │             │             │             │             │
       └─────────────┴─────────────┴─────────────┴─────────────┘
                                   │
                                   ▼
                          🎯 PROYECTO INTEGRADOR
```

---

## 📖 Resumen de Cada Práctica

### Práctica 01: Trigger Manual Avanzado

- Configurar Manual Trigger con parámetros
- Usar Pinned Data para testing rápido
- Flujo básico con Set Node e IF
- Inspeccionar datos en cada nodo

### Práctica 02: Schedule Trigger

- Expresiones cron (sintaxis de 5 campos)
- Configuración de zona horaria
- Múltiples schedules en un workflow
- Datos automáticos del Schedule Trigger

### Práctica 03: Webhook Básico

- URLs de test vs producción
- Métodos HTTP (GET, POST)
- Validación de datos de entrada
- Autenticación de webhooks
- Pruebas con cURL

### Práctica 04: Debugging de Workflows

- Identificar errores en workflows
- Usar vistas Table, JSON, Schema
- Ejecución parcial (paso a paso)
- Errores comunes y soluciones
- Estrategias sistemáticas de debugging

### Práctica 05: Workflow Multi-Trigger

- Múltiples triggers en un workflow
- Merge para unificar flujos
- Identificación del origen del trigger
- Lógica compartida entre triggers

---

## 💡 Tips para las Prácticas

1. **Sigue el orden**: Las prácticas están diseñadas para construir conocimiento progresivamente
2. **No copies, escribe**: Escribir manualmente ayuda a memorizar
3. **Experimenta**: Los "Experimentos Adicionales" son opcionales pero valiosos
4. **Guarda frecuentemente**: Usa `Ctrl/Cmd + S` después de cada cambio
5. **Si te atascas**: Revisa el módulo teórico relacionado

---

## 🏠 Navegación

| ⬅️ Anterior            | 📚 Sección Actual | ➡️ Siguiente               |
| ---------------------- | ----------------- | -------------------------- |
| [Teoría](../1-teoria/) | **Prácticas**     | [Proyecto](../3-proyecto/) |
