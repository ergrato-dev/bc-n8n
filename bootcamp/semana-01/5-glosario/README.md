# 📖 Glosario - Semana 01

## Introducción a n8n y Automatización

---

## 📋 Términos Fundamentales

### A

**API (Application Programming Interface)**

> Interfaz que permite la comunicación entre diferentes aplicaciones. n8n usa APIs para conectar con servicios externos.

**Automatización**

> Proceso de hacer que tareas repetitivas se ejecuten sin intervención manual. El objetivo principal de n8n.

### C

**Canvas**

> Área de trabajo visual en n8n donde se construyen los workflows arrastrando y conectando nodos.

**Conexión**

> Línea que une dos nodos en un workflow, indicando el flujo de datos entre ellos.

**Contenedor (Container)**

> Unidad de software que empaqueta código y dependencias. n8n se ejecuta dentro de un contenedor Docker.

**Credenciales**

> Información de autenticación (API keys, tokens, usuarios/contraseñas) necesaria para conectar con servicios externos.

### D

**Docker**

> Plataforma para desarrollar y ejecutar aplicaciones en contenedores. Método recomendado para instalar n8n.

**Docker Compose**

> Herramienta para definir y ejecutar aplicaciones Docker multi-contenedor usando archivos YAML.

### E

**Ejecución (Execution)**

> Una instancia de corrida de un workflow. Puede ser manual o automática según el trigger.

**Expresión**

> Código dinámico en n8n que permite acceder y transformar datos. Usa la sintaxis `{{ }}`.

### F

**Flujo de Datos**

> Camino que siguen los datos a través de un workflow, desde el trigger hasta el nodo final.

### I

**Input**

> Datos que recibe un nodo del nodo anterior en el workflow.

**Integración**

> Conexión entre n8n y un servicio externo (Google Sheets, Slack, etc.).

### J

**JSON (JavaScript Object Notation)**

> Formato de datos usado por n8n para representar información estructurada.

### L

**Low-code**

> Enfoque de desarrollo que minimiza la escritura de código manual. n8n es una plataforma low-code.

### N

**n8n**

> Plataforma de automatización de workflows open-source. Se pronuncia "n-eight-n".

**Nodo (Node)**

> Unidad básica de operación en n8n. Cada nodo realiza una acción específica (leer, transformar, enviar datos).

### O

**Output**

> Datos que produce un nodo después de ejecutarse, que pasan al siguiente nodo.

**Open Source**

> Software cuyo código fuente está disponible públicamente. n8n tiene licencia fair-code.

### P

**Persistencia**

> Capacidad de mantener datos guardados entre reinicios. En Docker, se logra con volúmenes.

**Puerto**

> Número que identifica un servicio en una computadora. n8n usa el puerto 5678 por defecto.

### S

**Self-hosted**

> Ejecutar software en tu propia infraestructura en lugar de usar un servicio en la nube.

**Set Node**

> Nodo de n8n usado para crear o modificar datos JSON.

### T

**Trigger**

> Nodo especial que inicia la ejecución de un workflow. Puede ser manual, programado o basado en eventos.

### V

**Volumen (Volume)**

> En Docker, mecanismo para persistir datos fuera del contenedor.

### W

**Webhook**

> URL que permite recibir datos de servicios externos para iniciar un workflow.

**Workflow**

> Flujo de trabajo automatizado compuesto por nodos conectados que procesan datos.

---

## 📊 Resumen de Términos

| Categoría       | Términos                                           | Cantidad         |
| --------------- | -------------------------------------------------- | ---------------- |
| Conceptos n8n   | Workflow, Nodo, Trigger, Ejecución, Expresión      | 5                |
| Datos           | JSON, Input, Output, Flujo de Datos                | 4                |
| Infraestructura | Docker, Contenedor, Volumen, Puerto                | 4                |
| Integración     | API, Credenciales, Webhook, Integración            | 4                |
| General         | Automatización, Low-code, Open Source, Self-hosted | 4                |
| **Total**       |                                                    | **~25 términos** |

---

## 🔗 Referencias

- [Glosario Oficial n8n](https://docs.n8n.io/glossary/)
- [Docker Glossary](https://docs.docker.com/glossary/)

---

## 💡 Tip

> Mantén este glosario abierto mientras estudias. Los términos se irán volviendo familiares con la práctica.
