# 🔨 Proyecto Integrador - Semana 05

## Sistema de Reporte y Notificaciones

---

## 📋 Información General

| Campo               | Valor                               |
| ------------------- | ----------------------------------- |
| **Nombre**          | Sistema de Reporte y Notificaciones |
| **Dificultad**      | ⭐⭐⭐                              |
| **Tiempo Estimado** | 2-2.5 horas                         |

---

## 🎯 Objetivos

- [ ] Leer datos de Google Sheets
- [ ] Procesar y generar reporte
- [ ] Enviar por Gmail
- [ ] Notificar en Slack

---

## 🏗️ Arquitectura

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│  Schedule   │───▶│   Google    │───▶│   Procesar  │
│  (Semanal)  │    │   Sheets    │    │    Datos    │
└─────────────┘    └─────────────┘    └─────────────┘
                                            │
                          ┌─────────────────┼─────────────────┐
                          ▼                                   ▼
                   ┌─────────────┐                     ┌─────────────┐
                   │    Gmail    │                     │    Slack    │
                   │   (Email)   │                     │ (Mensaje)   │
                   └─────────────┘                     └─────────────┘
```

---

## 📦 Entregables

1. Workflow JSON exportado
2. Credenciales configuradas (sin exponer)
3. Captura de email y Slack recibidos
