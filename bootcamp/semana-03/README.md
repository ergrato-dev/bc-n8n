# 🔧 Semana 03: Nodos Core y Manipulación de Datos

![n8n](https://img.shields.io/badge/n8n-Workflow_Automation-FF6D5A?style=flat-square&logo=n8n)
![Core Nodes](https://img.shields.io/badge/Core_Nodes-Set_IF_Switch-00D4FF?style=flat-square)
![Duración](https://img.shields.io/badge/Duración-6_horas-00D4FF?style=flat-square)
![Nivel](https://img.shields.io/badge/Nivel-Principiante--Intermedio-FFA500?style=flat-square)

---

## 📋 Descripción General

Esta semana nos adentramos en los nodos core de n8n: Set, IF, Switch y otros nodos fundamentales que forman la base de cualquier workflow. Aprenderás a manipular datos, crear lógica condicional y transformar información JSON.

Los nodos core son los bloques de construcción que usarás en prácticamente todos tus workflows. Dominarlos te dará la flexibilidad para resolver cualquier problema de automatización.

También introduciremos las expresiones de n8n, una herramienta poderosa para acceder y transformar datos dinámicamente.

---

## 🎯 Objetivos de Aprendizaje

Al finalizar esta semana, serás capaz de:

- [ ] Usar el nodo Set para crear y modificar datos
- [ ] Implementar lógica condicional con nodos IF
- [ ] Crear rutas múltiples con el nodo Switch
- [ ] Escribir expresiones básicas en n8n
- [ ] Transformar estructuras de datos JSON
- [ ] Combinar múltiples nodos core en un workflow
- [ ] Aplicar buenas prácticas en manipulación de datos

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

| #   | Módulo                                                      | Descripción                             | Tiempo |
| --- | ----------------------------------------------------------- | --------------------------------------- | ------ |
| 01  | [Nodo Set y Manipulación de Datos](1-teoria/01-nodo-set.md) | Crear, modificar y eliminar propiedades | 30 min |
| 02  | [Nodos IF y Switch](1-teoria/02-if-switch.md)               | Lógica condicional y rutas múltiples    | 30 min |
| 03  | [Expresiones en n8n](1-teoria/03-expresiones-n8n.md)        | Sintaxis y funciones de expresiones     | 30 min |

---

## 💻 Prácticas

| #   | Práctica                                                                         | Dificultad | Tiempo | Conceptos   |
| --- | -------------------------------------------------------------------------------- | ---------- | ------ | ----------- |
| 01  | [Set Node Básico](2-practicas/practica-01-set-basico.md)                         | ⭐         | 25 min | Set, JSON   |
| 02  | [Transformar Datos](2-practicas/practica-02-transformar-datos.md)                | ⭐⭐       | 25 min | Expresiones |
| 03  | [Lógica con IF](2-practicas/practica-03-logica-if.md)                            | ⭐⭐       | 30 min | IF Node     |
| 04  | [Rutas con Switch](2-practicas/practica-04-rutas-switch.md)                      | ⭐⭐       | 30 min | Switch Node |
| 05  | [Workflow Condicional Completo](2-practicas/practica-05-workflow-condicional.md) | ⭐⭐⭐     | 30 min | Combinado   |

---

## 🔨 Proyecto Integrador

### Sistema de Clasificación de Leads

**Descripción**: Crear un workflow que reciba datos de leads y los clasifique automáticamente según su puntuación, industria y origen, dirigiéndolos a diferentes flujos de procesamiento.

| Documento                                         | Descripción                   |
| ------------------------------------------------- | ----------------------------- |
| [README.md](3-proyecto/README.md)                 | Especificaciones del proyecto |
| [GUIA-DISENO.md](3-proyecto/GUIA-DISENO.md)       | Arquitectura del sistema      |
| [EJEMPLOS-DATOS.md](3-proyecto/EJEMPLOS-DATOS.md) | Datos de prueba               |

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

- [ ] Leí el módulo de Nodo Set
- [ ] Leí el módulo de IF y Switch
- [ ] Leí el módulo de Expresiones

### Prácticas

- [ ] Completé todas las 5 prácticas

### Proyecto

- [ ] Creé el sistema de clasificación de leads
- [ ] Implementé lógica condicional
- [ ] Documenté el workflow

---

## 🧭 Navegación del Bootcamp

```
Semanas:  01   02   03   04   05   06   07   08   09   10
                    ▼
         [ ]──[ ]──[■]──[ ]──[ ]──[ ]──[ ]──[ ]──[ ]──[ ]
                    │
                    └── Estás aquí: Nodos Core
```

---

## 💡 Tips de la Semana

### ✅ Buenas Prácticas

- Siempre nombra los outputs del Switch Node
- Usa expresiones en lugar de hardcodear valores
- Valida los datos antes de procesarlos

### ⚠️ Errores Comunes

- Olvidar que IF tiene dos salidas (true/false)
- No manejar el caso "default" en Switch
- Confundir `$json` con `$input`

---

<div align="center">

| ◀️ Anterior                         | 🏠 Inicio                           | Siguiente ▶️                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| [Semana 02](../semana-02/README.md) | [README Principal](../../README.md) | [Semana 04](../semana-04/README.md) |

</div>
