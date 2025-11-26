# 🔨 Proyecto Integrador - Semana 08

## Sistema de Monitoreo y Alertas

---

## 📋 Información General

| Campo               | Valor                          |
| ------------------- | ------------------------------ |
| **Nombre**          | Sistema de Monitoreo y Alertas |
| **Dificultad**      | ⭐⭐⭐                         |
| **Tiempo Estimado** | 2-2.5 horas                    |

---

## 🎯 Objetivos

- [ ] Capturar errores de múltiples workflows
- [ ] Enviar notificaciones a Slack/Email
- [ ] Registrar errores en log
- [ ] Implementar recuperación automática

---

## 🏗️ Arquitectura

```
┌─────────────────┐
│ Error Trigger   │
│                 │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Log del Error   │
│                 │
└────────┬────────┘
         │
    ┌────┴────┐
    ▼         ▼
┌────────┐ ┌────────┐
│ Notify │ │ Retry  │
│ Slack  │ │ Logic  │
└────────┘ └────────┘
```

---

## 📦 Entregables

1. Workflow de monitoreo
2. Sub-workflow de notificaciones
3. Documentación
