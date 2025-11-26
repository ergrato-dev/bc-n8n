# 🔨 Proyecto Integrador - Semana 07

## Sistema ETL de Procesamiento Masivo

---

## 📋 Información General

| Campo               | Valor                               |
| ------------------- | ----------------------------------- |
| **Nombre**          | Sistema ETL de Procesamiento Masivo |
| **Dificultad**      | ⭐⭐⭐                              |
| **Tiempo Estimado** | 2-2.5 horas                         |

---

## 🎯 Objetivos

- [ ] Extraer datos de una fuente (API o archivo)
- [ ] Transformar datos usando loops y batches
- [ ] Cargar datos en un destino
- [ ] Manejar errores y reintentos

---

## 🏗️ Arquitectura ETL

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   EXTRACT   │───▶│  TRANSFORM  │───▶│    LOAD     │
│  (Source)   │    │  (Process)  │    │ (Destination)│
└─────────────┘    └─────────────┘    └─────────────┘
       │                  │                  │
   API/File          Batches            DB/API
                    + Merge
```

---

## 📦 Entregables

1. Workflow JSON exportado
2. Métricas de procesamiento
3. Documentación del sistema
