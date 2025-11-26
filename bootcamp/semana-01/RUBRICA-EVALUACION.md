# 📊 Rúbrica de Evaluación - Semana 01

## Introducción a n8n y Automatización

---

## 📋 Distribución de Puntos (Total: 100)

| Componente    | Peso     | Puntos  |
| ------------- | -------- | ------- |
| Teoría        | 20%      | 20      |
| Prácticas (5) | 30%      | 30      |
| Proyecto      | 50%      | 50      |
| **TOTAL**     | **100%** | **100** |

---

## 1️⃣ Evaluación Teórica (20 puntos)

### Comprensión de Conceptos (10 pts)

| Nivel        | Puntos | Descripción                                                                                                         |
| ------------ | ------ | ------------------------------------------------------------------------------------------------------------------- |
| Excelente    | 9-10   | Domina los conceptos de automatización, comprende la arquitectura de n8n y diferencia claramente entre herramientas |
| Bueno        | 7-8    | Comprende los conceptos principales con algunas lagunas menores                                                     |
| Suficiente   | 5-6    | Entiende lo básico pero necesita refuerzo en conceptos clave                                                        |
| Insuficiente | 0-4    | Confusión significativa en conceptos fundamentales                                                                  |

### Aplicación de Conocimientos (10 pts)

| Nivel        | Puntos | Descripción                                                                  |
| ------------ | ------ | ---------------------------------------------------------------------------- |
| Excelente    | 9-10   | Puede explicar cuándo usar n8n vs otras herramientas y justificar decisiones |
| Bueno        | 7-8    | Identifica casos de uso apropiados con orientación mínima                    |
| Suficiente   | 5-6    | Necesita guía para identificar casos de uso                                  |
| Insuficiente | 0-4    | No puede relacionar conceptos con aplicaciones prácticas                     |

---

## 2️⃣ Prácticas (30 puntos)

### Práctica 01: Instalación de Docker (6 pts)

| Criterio              | Puntos | Descripción                                                     |
| --------------------- | ------ | --------------------------------------------------------------- |
| Docker instalado      | 2      | Docker y Docker Compose funcionando                             |
| Verificación correcta | 2      | Comandos `docker --version` y `docker compose version` exitosos |
| Sin errores           | 2      | Instalación limpia sin problemas pendientes                     |

### Práctica 02: Levantar n8n Local (6 pts)

| Criterio                 | Puntos | Descripción                      |
| ------------------------ | ------ | -------------------------------- |
| n8n accesible            | 2      | http://localhost:5678 responde   |
| Contenedor corriendo     | 2      | `docker ps` muestra n8n activo   |
| Persistencia configurada | 2      | Volúmenes correctamente montados |

### Práctica 03: Explorar la Interfaz (6 pts)

| Criterio                    | Puntos | Descripción                                     |
| --------------------------- | ------ | ----------------------------------------------- |
| Navegación dominada         | 2      | Puede acceder a todas las secciones principales |
| Identificación de elementos | 2      | Reconoce canvas, panel de nodos, toolbar        |
| Configuración básica        | 2      | Puede modificar ajustes básicos                 |

### Práctica 04: Primer Workflow Manual (6 pts)

| Criterio          | Puntos | Descripción                               |
| ----------------- | ------ | ----------------------------------------- |
| Workflow creado   | 2      | Workflow guardado con nombre descriptivo  |
| Nodos conectados  | 2      | Al menos 2 nodos correctamente conectados |
| Ejecución exitosa | 2      | El workflow se ejecuta sin errores        |

### Práctica 05: Workflow con Datos (6 pts)

| Criterio             | Puntos | Descripción                        |
| -------------------- | ------ | ---------------------------------- |
| Set Node configurado | 2      | Datos JSON correctamente definidos |
| Flujo de datos       | 2      | Los datos pasan entre nodos        |
| Output correcto      | 2      | El resultado final es el esperado  |

---

## 3️⃣ Proyecto Integrador (50 puntos)

### Funcionalidad (20 pts)

| Criterio              | Puntos | Descripción                                        |
| --------------------- | ------ | -------------------------------------------------- |
| Workflow completo     | 5      | El workflow tiene todos los componentes requeridos |
| Ejecución sin errores | 5      | Se ejecuta correctamente de principio a fin        |
| Datos procesados      | 5      | Los datos de entrada se transforman correctamente  |
| Output esperado       | 5      | El mensaje de bienvenida se genera correctamente   |

### Calidad del Workflow (15 pts)

| Criterio             | Puntos | Descripción                                        |
| -------------------- | ------ | -------------------------------------------------- |
| Organización visual  | 5      | Nodos ordenados de izquierda a derecha, sin cruces |
| Nombres descriptivos | 5      | Cada nodo tiene un nombre claro en español         |
| Conexiones lógicas   | 5      | El flujo es intuitivo y fácil de seguir            |

### Mejores Prácticas (10 pts)

| Criterio                   | Puntos | Descripción                                |
| -------------------------- | ------ | ------------------------------------------ |
| Notas explicativas         | 4      | Al menos 2 nodos tienen notas explicativas |
| Sin hardcoding innecesario | 3      | Usa expresiones donde corresponde          |
| Workflow exportable        | 3      | Se exporta correctamente en JSON           |

### Documentación (5 pts)

| Criterio             | Puntos | Descripción                          |
| -------------------- | ------ | ------------------------------------ |
| README del proyecto  | 2      | Incluye descripción y cómo usar      |
| Captura de pantalla  | 2      | Muestra ejecución exitosa            |
| Instrucciones claras | 1      | Cualquiera puede importar y ejecutar |

---

## 🎯 Escala de Calificación

| Rango  | Calificación | Descripción                              |
| ------ | ------------ | ---------------------------------------- |
| 90-100 | Excelente    | Dominio excepcional, supera expectativas |
| 80-89  | Muy Bueno    | Cumple todos los objetivos con calidad   |
| 70-79  | Bueno        | Cumple la mayoría de objetivos           |
| 60-69  | Suficiente   | Cumple los requisitos mínimos            |
| 0-59   | Insuficiente | No cumple los requisitos mínimos         |

---

## 🌟 Bonificaciones (máximo +5 pts)

| Criterio                  | Puntos | Descripción                            |
| ------------------------- | ------ | -------------------------------------- |
| Workflow extra            | +2     | Creó un workflow adicional funcional   |
| Documentación excepcional | +2     | Documentación muy detallada y clara    |
| Ayuda a compañeros        | +1     | Evidencia de colaboración en comunidad |

---

## ⚠️ Penalizaciones

| Criterio          | Puntos  | Descripción                         |
| ----------------- | ------- | ----------------------------------- |
| Entrega tardía    | -10/día | Por cada día de retraso             |
| Plagio            | -50     | Copia de trabajo de otro estudiante |
| Sin documentación | -5      | Proyecto sin README ni notas        |

---

## ✅ Checklist de Entrega

- [ ] Prácticas 1-5 completadas y verificadas
- [ ] Proyecto exportado en JSON
- [ ] Documentación del proyecto completa
- [ ] Captura de pantalla de ejecución
- [ ] n8n local funcionando correctamente

---

## 📝 Notas para el Evaluador

### Puntos a Verificar

1. El contenedor de n8n debe estar corriendo al momento de la evaluación
2. El workflow debe ejecutarse sin modificaciones
3. Los nombres de nodos deben estar en español
4. Las notas deben explicar el "qué" y "para qué"

### Criterios de Aprobación

- Mínimo 60 puntos para aprobar la semana
- Las prácticas 1-3 son requisito obligatorio
- El proyecto debe ejecutarse sin errores

---

## 🔗 Referencias

- [Guía de Evaluación de Workflows](../../_docs/evaluacion/guia-evaluacion-workflows.md)
- [Criterios Generales](../../_docs/evaluacion/criterios-generales.md)
- [Rúbrica de Proyectos](../../_docs/evaluacion/rubrica-proyectos.md)
