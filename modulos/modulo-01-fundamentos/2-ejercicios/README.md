# Ejercicios Prácticos - Módulo 1: Fundamentos

## 📋 Introducción

Esta sección contiene **8 ejercicios prácticos** diseñados para reforzar los conceptos aprendidos en la teoría del Módulo 1. Cada ejercicio está diseñado para ser completado en 30-45 minutos y construye sobre los conocimientos previos.

---

## 🎯 Objetivos de los Ejercicios

Al completar estos ejercicios, habrás:

- ✅ Creado workflows funcionales desde cero
- ✅ Practicado con nodos fundamentales en contextos reales
- ✅ Implementado lógica condicional y manejo de errores
- ✅ Trabajado con APIs REST reales
- ✅ Transformado y validado datos
- ✅ Debuggeado problemas comunes
- ✅ Aplicado mejores prácticas de n8n
- ✅ Desarrollado confianza para proyectos más complejos

---

## 📚 Ejercicios Disponibles

### **Ejercicio 1: Primer Workflow con API**

⏱️ **30 min** | 🎯 **Nivel: Básico**

Crea tu primer workflow completo que obtiene datos de una API pública y los transforma.

**Conceptos practicados:**

- Manual Trigger
- HTTP Request
- Set node
- Expresiones básicas

📁 [`01-primer-workflow-api.md`](./01-primer-workflow-api.md)

---

### **Ejercicio 2: Validación de Datos con IF**

⏱️ **35 min** | 🎯 **Nivel: Básico**

Implementa validación de datos usando nodos condicionales para filtrar información.

**Conceptos practicados:**

- IF node
- Expresiones de comparación
- Branching (ramificación)
- Manejo de datos inválidos

📁 [`02-validacion-datos-if.md`](./02-validacion-datos-if.md)

---

### **Ejercicio 3: Clasificación Multi-Ruta con Switch**

⏱️ **40 min** | 🎯 **Nivel: Intermedio**

Clasifica datos en múltiples categorías usando Switch y procesa cada categoría diferente.

**Conceptos practicados:**

- Switch node
- Múltiples outputs
- Lógica de clasificación
- Procesamiento paralelo

📁 [`03-clasificacion-switch.md`](./03-clasificacion-switch.md)

---

### **Ejercicio 4: Enriquecimiento de Datos con Merge**

⏱️ **45 min** | 🎯 **Nivel: Intermedio**

Combina datos de dos APIs diferentes usando Merge (similar a SQL JOIN).

**Conceptos practicados:**

- Merge node
- HTTP Request múltiple
- Combinación de datos
- Transformación compleja

📁 [`04-enriquecimiento-merge.md`](./04-enriquecimiento-merge.md)

---

### **Ejercicio 5: Procesamiento en Lotes**

⏱️ **40 min** | 🎯 **Nivel: Intermedio**

Procesa grandes volúmenes de datos en lotes para evitar problemas de memoria.

**Conceptos practicados:**

- Split In Batches
- Loop Over Items
- Procesamiento eficiente
- Manejo de volumen

📁 [`05-procesamiento-lotes.md`](./05-procesamiento-lotes.md)

---

### **Ejercicio 6: Manejo de Errores Robusto**

⏱️ **45 min** | 🎯 **Nivel: Intermedio**

Implementa un sistema completo de manejo de errores con retry y notificaciones.

**Conceptos practicados:**

- Error Trigger
- Continue On Fail
- Retry strategies
- Error notifications

📁 [`06-manejo-errores.md`](./06-manejo-errores.md)

---

### **Ejercicio 7: Workflow Programado con Schedule**

⏱️ **40 min** | 🎯 **Nivel: Intermedio**

Crea un workflow que se ejecuta automáticamente según un horario.

**Conceptos practicados:**

- Schedule Trigger
- Cron expressions
- Automatización temporal
- Reporting automático

📁 [`07-workflow-programado.md`](./07-workflow-programado.md)

---

### **Ejercicio 8: Webhook API REST Completo**

⏱️ **50 min** | 🎯 **Nivel: Avanzado**

Construye una API REST completa con webhook que valida, procesa y responde.

**Conceptos practicados:**

- Webhook Trigger
- Validación completa
- Response codes HTTP
- API design patterns

📁 [`08-webhook-api-rest.md`](./08-webhook-api-rest.md)

---

## 🗺️ Ruta de Aprendizaje Sugerida

```
BÁSICO (Ejercicios 1-2)
└─ Familiarización con interfaz y nodos básicos
   └─ INTERMEDIO (Ejercicios 3-7)
      └─ Lógica más compleja y patrones comunes
         └─ AVANZADO (Ejercicio 8)
            └─ Proyecto integrador tipo producción
```

---

## 📝 Cómo Usar los Ejercicios

### **Antes de Empezar**

1. ✅ Completa todos los documentos de teoría (01-07)
2. ✅ Asegúrate de tener n8n instalado y funcionando
3. ✅ Lee el README de cada ejercicio antes de comenzar
4. ✅ Prepara datos de prueba si se especifican

### **Durante el Ejercicio**

1. 📖 Lee todo el enunciado primero
2. 🎯 Identifica los objetivos principales
3. 🏗️ Construye el workflow paso a paso
4. 🧪 Prueba frecuentemente cada nodo
5. 🐛 Debuggea errores según surjan
6. ✅ Valida que cumple criterios de éxito

### **Después de Completar**

1. ✅ Compara con la solución proporcionada
2. 📝 Identifica diferencias en tu enfoque
3. 💡 Lee las "Notas del instructor"
4. 🚀 Intenta las variaciones sugeridas
5. 🔄 Refactoriza tu workflow si es necesario

---

## 🎯 Criterios de Éxito

Cada ejercicio tiene criterios claros de éxito. Valida que tu workflow:

- ✅ **Funciona correctamente** con los datos de prueba
- ✅ **Maneja errores** apropiadamente
- ✅ **Sigue mejores prácticas** de n8n
- ✅ **Está documentado** con nombres claros
- ✅ **Es eficiente** (no operaciones innecesarias)

---

## 🆘 Si Te Atascas

### **Estrategias de Debug:**

1. 🔍 **Ejecuta nodo por nodo** - No todo el workflow de una vez
2. 👁️ **Inspecciona datos** - Haz clic en cada nodo para ver output
3. 📋 **Verifica expresiones** - Usa el editor de expresiones
4. 🧪 **Prueba con datos simples** - Reduce complejidad temporalmente
5. 📖 **Revisa la teoría** - Vuelve al documento correspondiente

### **Recursos de Ayuda:**

- 📚 [Documentación oficial de n8n](https://docs.n8n.io/)
- 💬 [n8n Community Forum](https://community.n8n.io/)
- 🎥 [n8n YouTube Channel](https://www.youtube.com/@n8n-io)
- 📖 Documentos de teoría del Módulo 1

---

## 🏆 Sistema de Progreso

Marca tu progreso mientras completas los ejercicios:

```
[ ] Ejercicio 1: Primer Workflow con API
[ ] Ejercicio 2: Validación de Datos con IF
[ ] Ejercicio 3: Clasificación Multi-Ruta con Switch
[ ] Ejercicio 4: Enriquecimiento de Datos con Merge
[ ] Ejercicio 5: Procesamiento en Lotes
[ ] Ejercicio 6: Manejo de Errores Robusto
[ ] Ejercicio 7: Workflow Programado con Schedule
[ ] Ejercicio 8: Webhook API REST Completo
```

**Al completar los 8 ejercicios, estarás listo para:**

- ✅ Construir workflows de producción
- ✅ Resolver problemas reales con n8n
- ✅ Avanzar a proyectos más complejos
- ✅ Comenzar el Módulo 2 con confianza

---

## 📊 Tiempo Estimado Total

| Nivel      | Ejercicios       | Tiempo         |
| ---------- | ---------------- | -------------- |
| Básico     | 1-2              | ~1.0 hora      |
| Intermedio | 3-7              | ~3.5 horas     |
| Avanzado   | 8                | ~1.0 hora      |
| **TOTAL**  | **8 ejercicios** | **~5.5 horas** |

---

## 🎓 Evaluación

### **Autoevaluación:**

Después de completar todos los ejercicios, pregúntate:

1. ¿Puedo crear workflows básicos sin ayuda?
2. ¿Entiendo cuándo usar cada nodo fundamental?
3. ¿Sé cómo debuggear errores comunes?
4. ¿Puedo implementar lógica condicional compleja?
5. ¿Estoy listo para proyectos más grandes?

Si respondiste **SÍ** a todas, ¡estás listo para los **Proyectos Integradores**! 🚀

---

## 🔄 Variaciones Opcionales

Una vez completados los ejercicios base, prueba estas variaciones:

### **Variación A: Cambia las APIs**

- Usa APIs diferentes pero con lógica similar
- Practica adaptación a nuevas fuentes de datos

### **Variación B: Añade Complejidad**

- Agrega más validaciones
- Implementa caching
- Mejora el manejo de errores

### **Variación C: Optimiza Performance**

- Reduce tiempo de ejecución
- Minimiza llamadas a APIs
- Implementa procesamiento paralelo

### **Variación D: Integra con Servicios**

- Guarda resultados en Google Sheets
- Envía notificaciones por Slack
- Registra en base de datos

---

## 📚 Siguiente Paso

Después de completar estos ejercicios, continúa con:

**📁 [`3-proyectos/`](../3-proyectos/README.md)** - Proyectos integradores que combinan múltiples conceptos

---

## 💡 Tips Generales

### **Para Máximo Aprendizaje:**

1. 🚫 **No copies y pegues** - Escribe el workflow tú mismo
2. 🧪 **Experimenta** - Prueba diferentes enfoques
3. 💬 **Explica en voz alta** - Enseña los conceptos a otros
4. 📝 **Documenta tus workflows** - Añade notas y descripciones
5. 🔄 **Repite ejercicios difíciles** - La práctica hace al maestro

### **Mejores Prácticas:**

- ✅ Nombra nodos descriptivamente
- ✅ Usa NoOp para debugging
- ✅ Valida datos en cada paso
- ✅ Implementa error handling siempre
- ✅ Comenta lógica compleja
- ✅ Exporta workflows importantes

---

## 🎯 ¡Comienza Ahora!

**Tu primer ejercicio te espera:**

👉 **[Ejercicio 1: Primer Workflow con API](./01-primer-workflow-api.md)**

---

**¡Buena suerte y disfruta el proceso de aprendizaje!** 🚀

_Recuerda: El objetivo no es terminar rápido, sino aprender bien. Tómate tu tiempo, experimenta, y no tengas miedo de cometer errores._
