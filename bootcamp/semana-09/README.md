# ⚡ Semana 09: Code Nodes y JavaScript

![n8n](https://img.shields.io/badge/n8n-Workflow_Automation-FF6D5A?style=flat-square&logo=n8n)
![JavaScript](https://img.shields.io/badge/JavaScript-Code_Nodes-F7DF1E?style=flat-square&logo=javascript)
![Duración](https://img.shields.io/badge/Duración-6_horas-00D4FF?style=flat-square)
![Nivel](https://img.shields.io/badge/Nivel-Avanzado-FF4444?style=flat-square)

---

## 📋 Descripción General

Esta semana desbloqueamos el poder completo de n8n con Code nodes y JavaScript. Cuando los nodos visuales no son suficientes, el código te da control total sobre tus datos y lógica.

Los Code nodes te permiten escribir JavaScript personalizado para transformaciones complejas, validaciones avanzadas y lógica de negocio específica. Aprenderás a escribir código limpio, documentado y eficiente.

Recuerda: con gran poder viene gran responsabilidad. Usa código solo cuando los nodos no alcancen.

---

## 🎯 Objetivos de Aprendizaje

Al finalizar esta semana, serás capaz de:

- [ ] Escribir Code nodes en JavaScript
- [ ] Transformar datos con código
- [ ] Usar expresiones avanzadas
- [ ] Acceder a datos de nodos anteriores
- [ ] Implementar validaciones complejas
- [ ] Crear funciones reutilizables
- [ ] Documentar código correctamente

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

| #   | Módulo                                                     | Descripción           | Tiempo |
| --- | ---------------------------------------------------------- | --------------------- | ------ |
| 01  | [Introducción Code Nodes](1-teoria/01-intro-code-nodes.md) | Cuándo y cómo usarlos | 30 min |
| 02  | [JavaScript para n8n](1-teoria/02-javascript-n8n.md)       | Sintaxis y patrones   | 30 min |
| 03  | [Funciones Avanzadas](1-teoria/03-funciones-avanzadas.md)  | Técnicas avanzadas    | 30 min |

---

## 💻 Prácticas

| #   | Práctica                                                      | Dificultad | Tiempo | Conceptos       |
| --- | ------------------------------------------------------------- | ---------- | ------ | --------------- |
| 01  | [Code Node Básico](2-practicas/practica-01-code-basico.md)    | ⭐⭐       | 25 min | Sintaxis básica |
| 02  | [Transformación JSON](2-practicas/practica-02-json.md)        | ⭐⭐       | 25 min | Map, filter     |
| 03  | [Validaciones](2-practicas/practica-03-validaciones.md)       | ⭐⭐⭐     | 30 min | Validación      |
| 04  | [API Helper](2-practicas/practica-04-api-helper.md)           | ⭐⭐⭐     | 30 min | Funciones       |
| 05  | [Lógica Compleja](2-practicas/practica-05-logica-compleja.md) | ⭐⭐⭐     | 30 min | Combinado       |

---

## 🔨 Proyecto Integrador

### Motor de Reglas de Negocio

**Descripción**: Crear un motor de reglas configurable usando Code nodes que procese datos según reglas definidas dinámicamente.

| Documento                                           | Descripción                   |
| --------------------------------------------------- | ----------------------------- |
| [README.md](3-proyecto/README.md)                   | Especificaciones del proyecto |
| [GUIA-CODIGO.md](3-proyecto/GUIA-CODIGO.md)         | Estándares de código          |
| [EJEMPLOS-REGLAS.md](3-proyecto/EJEMPLOS-REGLAS.md) | Reglas de ejemplo             |

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

- [ ] Leí el módulo de Introducción Code Nodes
- [ ] Leí el módulo de JavaScript para n8n
- [ ] Leí el módulo de Funciones Avanzadas

### Prácticas

- [ ] Completé todas las 5 prácticas

### Proyecto

- [ ] Implementé el motor de reglas
- [ ] Documenté el código
- [ ] Seguí estándares de nomenclatura

---

## 🧭 Navegación del Bootcamp

```
Semanas:  01   02   03   04   05   06   07   08   09   10
                                                  ▼
         [ ]──[ ]──[ ]──[ ]──[ ]──[ ]──[ ]──[ ]──[■]──[ ]
                                                  │
                                                  └── Estás aquí: Code Nodes
```

---

## 💡 Tips de la Semana

### ✅ Buenas Prácticas

- Código en inglés, comentarios en español
- Documentar qué, para qué y cómo
- Usar const y let, nunca var
- Nombres descriptivos de variables

### ⚠️ Errores Comunes

- Usar código cuando un nodo basta
- No manejar casos null/undefined
- Olvidar return en Code nodes

---

## 📝 Convenciones de Código

```javascript
/**
 * Función que transforma datos de usuario
 *
 * ¿Qué hace? Normaliza el formato del nombre
 * ¿Para qué? Consistencia en el CRM
 * ¿Cómo? Capitaliza primera letra
 */
function normalizeUserName(name) {
  // Validar entrada
  if (!name) return '';

  // Capitalizar
  return name.charAt(0).toUpperCase() + name.slice(1).toLowerCase();
}
```

---

<div align="center">

| ◀️ Anterior                         | 🏠 Inicio                           | Siguiente ▶️                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| [Semana 08](../semana-08/README.md) | [README Principal](../../README.md) | [Semana 10](../semana-10/README.md) |

</div>
