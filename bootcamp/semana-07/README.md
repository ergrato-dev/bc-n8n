# 🔁 Semana 07: Lógica Avanzada y Loops

![n8n](https://img.shields.io/badge/n8n-Workflow_Automation-FF6D5A?style=flat-square&logo=n8n)
![Loops](https://img.shields.io/badge/Loops-SplitInBatches-00D4FF?style=flat-square)
![Duración](https://img.shields.io/badge/Duración-6_horas-00D4FF?style=flat-square)
![Nivel](https://img.shields.io/badge/Nivel-Intermedio--Avanzado-FFA500?style=flat-square)

---

## 📋 Descripción General

Esta semana nos adentramos en técnicas avanzadas de procesamiento de datos: loops, batches y agregación. Aprenderás a manejar grandes volúmenes de datos de manera eficiente y a combinar información de múltiples fuentes.

Loop Over Items y Split In Batches son nodos esenciales para procesar listas de datos sin sobrecargar las APIs o quedarte sin memoria. El nodo Merge te permitirá combinar datos de diferentes ramas de tu workflow.

Estas técnicas son fundamentales para workflows de producción que manejan datos reales.

---

## 🎯 Objetivos de Aprendizaje

Al finalizar esta semana, serás capaz de:

- [ ] Usar Loop Over Items para procesar arrays
- [ ] Implementar Split In Batches para grandes volúmenes
- [ ] Combinar datos con el nodo Merge
- [ ] Agregar y resumir datos
- [ ] Manejar rate limits de APIs
- [ ] Crear workflows eficientes en memoria
- [ ] Implementar procesamiento paralelo cuando sea seguro

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

| #   | Módulo                                                | Descripción                  | Tiempo |
| --- | ----------------------------------------------------- | ---------------------------- | ------ |
| 01  | [Loop Over Items](1-teoria/01-loop-over-items.md)     | Iterar sobre arrays de datos | 30 min |
| 02  | [Split In Batches](1-teoria/02-split-batches.md)      | Procesar datos en lotes      | 30 min |
| 03  | [Merge y Agregación](1-teoria/03-merge-agregacion.md) | Combinar y resumir datos     | 30 min |

---

## 💻 Prácticas

| #   | Práctica                                                          | Dificultad | Tiempo | Conceptos        |
| --- | ----------------------------------------------------------------- | ---------- | ------ | ---------------- |
| 01  | [Loop Básico](2-practicas/practica-01-loop-basico.md)             | ⭐⭐       | 25 min | Loop Over Items  |
| 02  | [Batches con API](2-practicas/practica-02-batches-api.md)         | ⭐⭐       | 25 min | Split In Batches |
| 03  | [Merge de Datos](2-practicas/practica-03-merge.md)                | ⭐⭐       | 30 min | Merge            |
| 04  | [Agregación](2-practicas/practica-04-agregacion.md)               | ⭐⭐⭐     | 30 min | Summarize        |
| 05  | [Workflow Complejo](2-practicas/practica-05-workflow-complejo.md) | ⭐⭐⭐     | 30 min | Combinado        |

---

## 🔨 Proyecto Integrador

### Sistema ETL de Procesamiento Masivo

**Descripción**: Crear un sistema ETL (Extract, Transform, Load) que procese miles de registros de manera eficiente, transformándolos y cargándolos en un destino.

| Documento                                         | Descripción                   |
| ------------------------------------------------- | ----------------------------- |
| [README.md](3-proyecto/README.md)                 | Especificaciones del proyecto |
| [GUIA-DISENO.md](3-proyecto/GUIA-DISENO.md)       | Arquitectura ETL              |
| [EJEMPLOS-DATOS.md](3-proyecto/EJEMPLOS-DATOS.md) | Datasets de prueba            |

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

- [ ] Leí el módulo de Loop Over Items
- [ ] Leí el módulo de Split In Batches
- [ ] Leí el módulo de Merge y Agregación

### Prácticas

- [ ] Completé todas las 5 prácticas

### Proyecto

- [ ] Creé el sistema ETL
- [ ] Procesé al menos 1000 registros
- [ ] Documenté el workflow

---

## 🧭 Navegación del Bootcamp

```
Semanas:  01   02   03   04   05   06   07   08   09   10
                                        ▼
         [ ]──[ ]──[ ]──[ ]──[ ]──[ ]──[■]──[ ]──[ ]──[ ]
                                        │
                                        └── Estás aquí: Lógica Avanzada y Loops
```

---

## 💡 Tips de la Semana

### ✅ Buenas Prácticas

- Usa Split In Batches para respetar rate limits
- Siempre prueba con datasets pequeños primero
- Monitorea el uso de memoria en workflows grandes

### ⚠️ Errores Comunes

- Crear loops infinitos
- No manejar el caso de arrays vacíos
- Sobrecargar APIs sin batching

---

<div align="center">

| ◀️ Anterior                         | 🏠 Inicio                           | Siguiente ▶️                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| [Semana 06](../semana-06/README.md) | [README Principal](../../README.md) | [Semana 08](../semana-08/README.md) |

</div>
