# 🔨 Proyecto Integrador - Semana 02

## Sistema de Recordatorios Programados

---

## 📋 Información General

| Campo               | Valor                                |
| ------------------- | ------------------------------------ |
| **Nombre**          | Sistema de Recordatorios Programados |
| **Dificultad**      | ⭐⭐                                 |
| **Tiempo Estimado** | 2-2.5 horas                          |
| **Tipo**            | Workflow con múltiples triggers      |

---

## 🎯 Objetivos del Proyecto

- [ ] Implementar al menos 2 tipos de triggers diferentes
- [ ] Crear un sistema de recordatorios funcional
- [ ] Usar expresiones cron correctamente
- [ ] Documentar el workflow

---

## 📝 Descripción

Crear un sistema que permita programar recordatorios que se activen en diferentes horarios. El sistema debe poder recibir nuevos recordatorios vía webhook y ejecutar recordatorios programados automáticamente.

---

## 🏗️ Arquitectura del Workflow

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│  Schedule   │────▶│  Procesar   │────▶│   Enviar    │
│  Trigger    │     │ Recordatorio│     │ Notificación│
└─────────────┘     └─────────────┘     └─────────────┘

┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│  Webhook    │────▶│   Guardar   │────▶│  Confirmar  │
│  Trigger    │     │ Recordatorio│     │   Recepción │
└─────────────┘     └─────────────┘     └─────────────┘
```

---

## 📦 Entregables

1. Workflow JSON exportado
2. Documentación del sistema
3. Captura de ejecución exitosa
