# Módulo 1: Fundamentos de n8n

## 📋 Información General

- **Duración:** Semanas 1-2.5 (15 horas)
- **Nivel:** Principiante
- **Prerequisitos:** Ninguno

## 🎯 Objetivos del Módulo

Al finalizar este módulo serás capaz de:

✅ Comprender qué es n8n y sus casos de uso principales  
✅ Configurar tu entorno de desarrollo (local o cloud)  
✅ Navegar con confianza por la interfaz de n8n  
✅ Crear workflows básicos funcionales  
✅ Entender conceptos fundamentales: nodos, conexiones, ejecuciones  
✅ Aplicar buenas prácticas desde el inicio

## 📚 Contenido

### Semana 1: Introducción y Configuración

#### 📖 Teoría (2 horas)

- [Qué es n8n y por qué usarlo](./1-teoria/01-que-es-n8n.md)
- [Casos de uso empresariales](./1-teoria/02-casos-de-uso.md)
- [Arquitectura básica](./1-teoria/03-arquitectura.md)

#### 💻 Práctica (4 horas)

- [Instalación local con Docker](./2-ejercicios/01-instalacion-docker.md)
- [Instalación en la nube](./2-ejercicios/02-instalacion-cloud.md)
- [Tour por la interfaz](./2-ejercicios/03-tour-interfaz.md)
- [Tu primer workflow: "Hello World"](./2-ejercicios/04-primer-workflow.md)

### Semana 2: Conceptos Fundamentales

#### 📖 Teoría (3 horas)

- [Anatomía de un nodo](./1-teoria/04-anatomia-nodo.md)
- [Tipos de nodos](./1-teoria/05-tipos-nodos.md)
- [Ejecuciones y flujo de datos](./1-teoria/06-flujo-datos.md)
- [Triggers vs Regular nodes](./1-teoria/07-triggers.md)

#### 💻 Práctica (4 horas)

- [Conectar nodos](./2-ejercicios/05-conectar-nodos.md)
- [Usar el nodo Set](./2-ejercicios/06-nodo-set.md)
- [Crear un webhook simple](./2-ejercicios/07-webhook-basico.md)
- [Workflow con Schedule trigger](./2-ejercicios/08-schedule-trigger.md)

### Semana 2.5: Proyecto Integrador

#### 🚀 Proyectos (2 horas)

- [Proyecto 1: Notificador de tareas](./3-proyectos/proyecto-01-notificador.md)
- [Proyecto 2: Guardador de formularios](./3-proyectos/proyecto-02-formularios.md)
- [Proyecto 3: Recordatorio automático](./3-proyectos/proyecto-03-recordatorio.md)

## 📊 Distribución del Tiempo

| Actividad       | Horas   | Porcentaje |
| --------------- | ------- | ---------- |
| Teoría          | 5h      | 33%        |
| Práctica guiada | 8h      | 53%        |
| Proyectos       | 2h      | 14%        |
| **Total**       | **15h** | **100%**   |

## 🎓 Entregables

Al finalizar este módulo deberás entregar:

1. **3 Workflows funcionales:**

   - Workflow con webhook
   - Workflow con schedule
   - Workflow con Set node

2. **Documentación:**

   - Guía de instalación personalizada
   - Notas sobre conceptos clave
   - Screenshots de tus workflows

3. **Autoevaluación:**
   - Quiz de fundamentos (10 preguntas)
   - Reflexión sobre aprendizajes

## ✅ Criterios de Éxito

Para considerar completado este módulo debes:

- [ ] Tener n8n instalado y funcionando
- [ ] Haber creado al menos 3 workflows diferentes
- [ ] Entender la diferencia entre triggers y nodos regulares
- [ ] Saber usar el nodo Set para transformar datos básicos
- [ ] Poder ejecutar workflows manualmente y automáticamente
- [ ] Aprobar el quiz de fundamentos con 80% o más

## 💡 Conceptos Clave

### Nodos

Bloques de construcción que realizan acciones específicas (llamar API, enviar email, etc.)

### Conexiones

Líneas que unen nodos y definen el flujo de datos

### Ejecuciones

Cada vez que un workflow se ejecuta, con sus inputs y outputs

### Triggers

Nodos que inician automáticamente un workflow

### Workflow

Secuencia de nodos conectados que automatizan un proceso

## 🔧 Herramientas Necesarias

- **Obligatorio:**

  - Navegador web moderno
  - Conexión a internet
  - Cuenta de email

- **Opcional (para instalación local):**
  - Docker Desktop
  - Terminal/Línea de comandos
  - Node.js (para instalación con npm)

## 📖 Recursos Adicionales

### Documentación

- [Documentación oficial de n8n](https://docs.n8n.io/)
- [Quickstart Guide](https://docs.n8n.io/getting-started/quickstart/)
- [Guía de instalación completa](../../_docs/guia-instalacion.md)

### Videos

- Tutorial: Primeros pasos con n8n
- Instalación paso a paso
- Tour completo de la interfaz

_(Disponibles en `/videos/modulo-01/`)_

### Comunidad

- [n8n Community Forum](https://community.n8n.io/)
- [Discord de estudiantes del bootcamp]()

## 🚧 Problemas Comunes

### Error: "No puedo acceder a localhost:5678"

**Solución:** Verifica que Docker esté corriendo y el puerto no esté ocupado.

### Error: "Execution failed"

**Solución:** Revisa los datos de entrada y la configuración del nodo en rojo.

### Error: "Credentials required"

**Solución:** Algunos nodos requieren credenciales. Configúralas en Settings.

_Para más ayuda, consulta [Troubleshooting](../../_docs/troubleshooting.md)_

## 🎯 Preparación para Módulo 2

Antes de avanzar al Módulo 2, asegúrate de:

- ✅ Sentirte cómodo navegando la interfaz
- ✅ Entender cómo fluyen los datos entre nodos
- ✅ Poder crear workflows simples sin ayuda
- ✅ Conocer los nodos básicos (Webhook, Schedule, Set, HTTP Request)

## 📝 Notas del Instructor

> **Tip para estudiantes:** No te preocupes si al inicio todo parece confuso. n8n es muy intuitivo una vez que creas 2-3 workflows. ¡La práctica hace al maestro!

> **Importante:** Dedica tiempo a experimentar. Crea workflows "tontos" solo por diversión. Es la mejor forma de aprender.

## 🗓️ Calendario Sugerido

### Semana 1

- **Día 1-2:** Teoría + Instalación (3h)
- **Día 3-4:** Ejercicios guiados (3h)

### Semana 2

- **Día 1-2:** Teoría avanzada (3h)
- **Día 3-5:** Más ejercicios (4h)

### Semana 2.5

- **Día 1-2:** Proyectos finales (2h)

---

## 🚀 Siguiente Paso

Una vez completado este módulo, continúa con:

### [Módulo 2: Nodos y Manejo de Datos →](../modulo-02-nodos-datos/)

---

<div align="center">

**¿Listo para comenzar? ¡Vamos! 💪**

[Ver Teoría](./1-teoria/) | [Hacer Ejercicios](./2-ejercicios/) | [Proyectos](./3-proyectos/)

</div>
