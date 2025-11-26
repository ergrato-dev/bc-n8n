# 🔨 Proyecto Integrador - Semana 03

## Sistema de Clasificación de Leads

---

## 📋 Información General

| Campo               | Valor                             |
| ------------------- | --------------------------------- |
| **Nombre**          | Sistema de Clasificación de Leads |
| **Dificultad**      | ⭐⭐⭐                            |
| **Tiempo Estimado** | 2-2.5 horas                       |
| **Tipo**            | Workflow con lógica condicional   |

---

## 🎯 Objetivos del Proyecto

- [ ] Recibir datos de leads
- [ ] Clasificar según puntuación (Hot, Warm, Cold)
- [ ] Dirigir a diferentes flujos según industria
- [ ] Generar reportes de clasificación

---

## 📝 Descripción

Crear un workflow que clasifique automáticamente leads entrantes basándose en:

- **Puntuación**: 80+ (Hot), 50-79 (Warm), <50 (Cold)
- **Industria**: Tech, Finance, Healthcare, Other
- **Origen**: Web, Referral, Ads, Other

---

## 🏗️ Arquitectura

```
┌─────────┐    ┌─────────┐    ┌─────────┐
│ Webhook │───▶│  Parse  │───▶│  Score  │
│ Trigger │    │  Data   │    │  Lead   │
└─────────┘    └─────────┘    └─────────┘
                                   │
                    ┌──────────────┼──────────────┐
                    ▼              ▼              ▼
               ┌─────────┐   ┌─────────┐   ┌─────────┐
               │   Hot   │   │  Warm   │   │  Cold   │
               │  Flow   │   │  Flow   │   │  Flow   │
               └─────────┘   └─────────┘   └─────────┘
```

---

## 📦 Entregables

1. Workflow JSON exportado
2. Documentación del sistema
3. Captura de clasificación funcionando
