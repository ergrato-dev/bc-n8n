# 🚀 Semana 01: Introducción a n8n y Automatización

![n8n](https://img.shields.io/badge/n8n-Workflow_Automation-FF6D5A?style=flat-square&logo=n8n)
![Docker](https://img.shields.io/badge/Docker-Container-2496ED?style=flat-square&logo=docker)
![Duración](https://img.shields.io/badge/Duración-6_horas-00D4FF?style=flat-square)
![Nivel](https://img.shields.io/badge/Nivel-Principiante-00A86B?style=flat-square)

---

## 📋 Descripción General

Bienvenido al Bootcamp de n8n. En esta primera semana sentaremos las bases fundamentales para tu viaje en el mundo de la automatización. Aprenderás qué es n8n, por qué es una herramienta poderosa para automatizar procesos, y cómo configurar tu entorno de desarrollo local usando Docker.

Al finalizar esta semana, tendrás n8n funcionando en tu máquina local y habrás creado tu primer workflow básico. Comprenderás la interfaz de usuario, la navegación principal y los conceptos fundamentales que usaremos durante todo el bootcamp.

Esta semana es crucial porque establece el fundamento técnico y conceptual sobre el cual construiremos workflows cada vez más complejos.

---

## 🎯 Objetivos de Aprendizaje

Al finalizar esta semana, serás capaz de:

- [ ] Comprender qué es n8n y sus casos de uso principales
- [ ] Diferenciar n8n de otras herramientas de automatización (Zapier, Make)
- [ ] Instalar y configurar n8n usando Docker Compose
- [ ] Navegar la interfaz de usuario de n8n con confianza
- [ ] Crear y ejecutar tu primer workflow básico
- [ ] Entender los conceptos de nodos, conexiones y ejecuciones
- [ ] Aplicar buenas prácticas desde el inicio

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

| #   | Módulo                                                                         | Descripción                                                    | Tiempo |
| --- | ------------------------------------------------------------------------------ | -------------------------------------------------------------- | ------ |
| 01  | [Introducción a la Automatización](1-teoria/01-introduccion-automatizacion.md) | Qué es automatización, beneficios y casos de uso               | 30 min |
| 02  | [Conociendo n8n](1-teoria/02-conociendo-n8n.md)                                | Historia, características y comparativa con otras herramientas | 30 min |
| 03  | [Instalación y Configuración](1-teoria/03-instalacion-configuracion.md)        | Docker Compose, configuración inicial y primeros pasos         | 30 min |

---

## 💻 Prácticas

| #   | Práctica                                                               | Dificultad | Tiempo | Conceptos              |
| --- | ---------------------------------------------------------------------- | ---------- | ------ | ---------------------- |
| 01  | [Instalación de Docker](2-practicas/practica-01-instalacion-docker.md) | ⭐         | 25 min | Docker, Docker Compose |
| 02  | [Levantar n8n Local](2-practicas/practica-02-levantar-n8n.md)          | ⭐         | 25 min | Contenedores, Puertos  |
| 03  | [Explorar la Interfaz](2-practicas/practica-03-explorar-interfaz.md)   | ⭐         | 25 min | UI, Navegación         |
| 04  | [Primer Workflow Manual](2-practicas/practica-04-primer-workflow.md)   | ⭐⭐       | 30 min | Nodos, Ejecución       |
| 05  | [Workflow con Datos](2-practicas/practica-05-workflow-datos.md)        | ⭐⭐       | 35 min | Set Node, JSON         |

---

## 🔨 Proyecto Integrador

### Sistema de Bienvenida Automatizado

**Descripción**: Crear un workflow que simule un sistema de bienvenida para nuevos usuarios. El workflow recibirá datos de un usuario ficticio y generará un mensaje de bienvenida personalizado.

| Documento                                         | Descripción                             |
| ------------------------------------------------- | --------------------------------------- |
| [README.md](3-proyecto/README.md)                 | Especificaciones completas del proyecto |
| [GUIA-DISENO.md](3-proyecto/GUIA-DISENO.md)       | Arquitectura del workflow               |
| [EJEMPLOS-DATOS.md](3-proyecto/EJEMPLOS-DATOS.md) | Datos de prueba para el proyecto        |

**Entregables**:

- Workflow exportado en formato JSON
- Documentación del workflow (notas en nodos)
- Captura de pantalla de ejecución exitosa

---

## 📖 Recursos

| #   | Recurso                                                  | Tipo          | Descripción                      |
| --- | -------------------------------------------------------- | ------------- | -------------------------------- |
| 01  | [Videos Recomendados](4-recursos/videos-recomendados.md) | 🎬 Video      | Tutoriales y cursos en video     |
| 02  | [eBooks y PDFs](4-recursos/ebooks-pdfs.md)               | 📚 Lectura    | Material de lectura descargable  |
| 03  | [Enlaces Útiles](4-recursos/enlaces-utiles.md)           | 🔗 Links      | Recursos web y documentación     |
| 04  | [Templates](4-recursos/templates.md)                     | 📦 Templates  | Workflows de ejemplo importables |
| 05  | [Cheat Sheet](4-recursos/cheatsheet.md)                  | 📋 Referencia | Guía de consulta rápida          |
| 06  | [FAQ](4-recursos/faq.md)                                 | ❓ FAQ        | Preguntas frecuentes             |

---

## 📖 Glosario

Consulta el [Glosario de Términos](5-glosario/README.md) para definiciones de:

- **Workflow**: Flujo de trabajo automatizado
- **Nodo**: Unidad básica de operación en n8n
- **Trigger**: Evento que inicia un workflow
- **Ejecución**: Una instancia de corrida de un workflow
- **Expresión**: Código dinámico con sintaxis `{{ }}`
- **Docker**: Plataforma de contenedores
- Y más de **45 términos** organizados alfabéticamente...

---

## 🎨 Assets y Diagramas

| #   | Diagrama                                                           | Descripción                 | Usado en    |
| --- | ------------------------------------------------------------------ | --------------------------- | ----------- |
| 01  | [arquitectura-n8n.svg](0-assets/01-arquitectura-n8n.svg)           | Arquitectura general de n8n | Módulo 02   |
| 02  | [flujo-workflow-basico.svg](0-assets/02-flujo-workflow-basico.svg) | Flujo de un workflow simple | Módulo 03   |
| 03  | [interfaz-n8n.svg](0-assets/03-interfaz-n8n.svg)                   | Componentes de la interfaz  | Práctica 03 |

---

## 📊 Evaluación

| Componente    | Peso     | Puntos  |
| ------------- | -------- | ------- |
| Teoría        | 20%      | 20      |
| Prácticas (5) | 30%      | 30      |
| Proyecto      | 50%      | 50      |
| **Total**     | **100%** | **100** |

📋 Consulta la [Rúbrica de Evaluación](RUBRICA-EVALUACION.md) para criterios detallados.

---

## ✅ Checklist de Completitud

### Teoría

- [ ] Leí el módulo de Introducción a la Automatización
- [ ] Leí el módulo de Conociendo n8n
- [ ] Leí el módulo de Instalación y Configuración

### Prácticas

- [ ] Completé Práctica 01: Instalación de Docker
- [ ] Completé Práctica 02: Levantar n8n Local
- [ ] Completé Práctica 03: Explorar la Interfaz
- [ ] Completé Práctica 04: Primer Workflow Manual
- [ ] Completé Práctica 05: Workflow con Datos

### Proyecto

- [ ] Creé el workflow de bienvenida
- [ ] Documenté el workflow con notas
- [ ] Exporté el workflow en JSON
- [ ] Tomé captura de ejecución exitosa

---

## 🧭 Navegación del Bootcamp

```
Semanas:  01   02   03   04   05   06   07   08   09   10
          ▼
         [■]──[ ]──[ ]──[ ]──[ ]──[ ]──[ ]──[ ]──[ ]──[ ]
          │
          └── Estás aquí: Introducción a n8n
```

---

## 💡 Tips de la Semana

### ✅ Buenas Prácticas

- Usa Docker Compose para una instalación reproducible
- Nombra tus nodos de forma descriptiva desde el inicio
- Guarda tu trabajo frecuentemente (n8n auto-guarda, pero verifica)

### ⚠️ Errores Comunes

- No verificar que Docker esté corriendo antes de iniciar
- Olvidar los puertos ocupados (5678 debe estar libre)
- Saltarse la documentación oficial

### 🚀 Consejos Pro

- Crea una carpeta dedicada para tu bootcamp
- Familiarízate con los atajos de teclado de n8n
- Únete a la comunidad de n8n desde el día 1

---

## 🔗 Enlaces Rápidos

- 📚 [Documentación Oficial n8n](https://docs.n8n.io)
- 🌐 [n8n Community](https://community.n8n.io)
- 📦 [Docker Hub - n8n](https://hub.docker.com/r/n8nio/n8n)
- 🎨 [n8n Templates](https://n8n.io/workflows)

---

<div align="center">

| ◀️ Anterior | 🏠 Inicio                           | Siguiente ▶️                        |
| ----------- | ----------------------------------- | ----------------------------------- |
| -           | [README Principal](../../README.md) | [Semana 02](../semana-02/README.md) |

</div>
