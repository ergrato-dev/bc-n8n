# 📖 Glosario - Semana 01

## Introducción a n8n y Automatización

> **~40 términos fundamentales** organizados alfabéticamente para dominar los conceptos de la primera semana.

---

## 📋 Términos Fundamentales

### A

**Activar (Activate)**

> Habilitar un workflow para que se ejecute automáticamente según su trigger. Se activa con el toggle en la esquina superior derecha.

**API (Application Programming Interface)**

> Interfaz que permite la comunicación entre diferentes aplicaciones. n8n usa APIs para conectar con servicios externos como Google, Slack, etc.

**API Key**

> Clave única de autenticación proporcionada por un servicio para acceder a su API. Se guarda en credenciales de n8n.

**Automatización**

> Proceso de hacer que tareas repetitivas se ejecuten sin intervención manual. El objetivo principal de n8n.

### B

**Binary Data**

> Datos no textuales (archivos, imágenes, PDFs) que pueden procesarse en n8n. Se almacenan en la propiedad `binary` de los items.

**Branch (Bifurcación)**

> División del flujo de un workflow en múltiples caminos, típicamente usando nodos IF o Switch.

### C

**Canvas**

> Área de trabajo visual en n8n donde se construyen los workflows arrastrando y conectando nodos.

**Code Node**

> Nodo que permite ejecutar código JavaScript personalizado para transformaciones complejas de datos.

**Conexión (Connection)**

> Línea que une dos nodos en un8n workflow, indicando el flujo de datos entre ellos.

**Contenedor (Container)**

> Unidad de software que empaqueta código y dependencias. n8n se ejecuta dentro de un contenedor Docker.

**Credenciales (Credentials)**

> Información de autenticación (API keys, tokens, usuarios/contraseñas) necesaria para conectar con servicios externos. Se gestionan de forma segura en n8n.

### D

**Data Structure (Estructura de Datos)**

> Formato en que n8n organiza la información: arrays de items, cada uno con propiedades `json` y opcionalmente `binary`.

**Debug (Depurar)**

> Proceso de encontrar y corregir errores en un workflow. n8n permite ejecutar nodos individualmente para debugging.

**Docker**

> Plataforma para desarrollar y ejecutar aplicaciones en contenedores. Método recomendado para instalar n8n.

**Docker Compose**

> Herramienta para definir y ejecutar aplicaciones Docker multi-contenedor usando archivos YAML.

**docker-compose.yml**

> Archivo de configuración que define cómo ejecutar n8n en Docker, incluyendo puertos, volúmenes y variables de entorno.

### E

**Editor**

> Interfaz gráfica de n8n donde se crean y editan workflows. Incluye canvas, panel de nodos y editor de expresiones.

**Ejecución (Execution)**

> Una instancia de corrida de un workflow. Puede ser manual o automática según el trigger. Se guarda en el historial.

**Environment Variables (Variables de Entorno)**

> Configuraciones del sistema que modifican el comportamiento de n8n (puerto, autenticación, zona horaria, etc.).

**Error Handling (Manejo de Errores)**

> Estrategias para gestionar fallos en workflows. Incluye Error Trigger y configuración de comportamiento ante errores.

**Expresión (Expression)**

> Código dinámico en n8n que permite acceder y transformar datos. Usa la sintaxis `{{ }}` y soporta JavaScript.

### F

**Fair-code**

> Modelo de licencia de n8n: código abierto disponible, gratuito para uso personal y pequeños equipos, con restricciones para grandes empresas.

**Flujo de Datos (Data Flow)**

> Camino que siguen los datos a través de un workflow, desde el trigger hasta el nodo final.

### H

**HTTP Request**

> Nodo para consumir APIs REST externas. Soporta métodos GET, POST, PUT, DELETE, etc.

### I

**IF Node**

> Nodo condicional que divide el flujo en dos caminos (true/false) basándose en una condición.

**Imagen (Image)**

> En Docker, plantilla de solo lectura usada para crear contenedores. La imagen de n8n es `n8nio/n8n`.

**Input**

> Datos que recibe un nodo del nodo anterior en el workflow. Se accede con `$input` en expresiones.

**Integración (Integration)**

> Conexión entre n8n y un servicio externo. n8n tiene +400 integraciones nativas.

**Item**

> Unidad básica de datos en n8n. Un workflow procesa arrays de items, cada uno con su objeto `json`.

### J

**JSON (JavaScript Object Notation)**

> Formato de datos usado por n8n para representar información estructurada. Ej: `{"nombre": "Juan", "edad": 30}`.

**$json**

> Variable especial en expresiones que accede a los datos JSON del item actual que se está procesando.

### L

**Low-code**

> Enfoque de desarrollo que minimiza la escritura de código manual usando interfaces visuales. n8n es una plataforma low-code.

**Luxon**

> Biblioteca de manejo de fechas usada en n8n. Disponible en expresiones con `$now` y funciones como `format()`.

### M

**Manual Trigger**

> Nodo trigger que inicia un workflow solo cuando el usuario hace clic en "Execute". Ideal para desarrollo y pruebas.

**Merge Node**

> Nodo que combina datos de múltiples ramas de un workflow en un solo flujo.

### N

**n8n**

> Plataforma de automatización de workflows open-source. Se pronuncia "n-eight-n" o "nodemation".

**Nodo (Node)**

> Unidad básica de operación en n8n. Cada nodo realiza una acción específica (trigger, transformar, enviar datos, etc.).

**No-code**

> Desarrollo completamente visual sin escribir código. n8n es low-code porque permite código opcional.

**$now**

> Variable especial que retorna la fecha/hora actual como objeto Luxon. Ej: `{{ $now.format('DD/MM/YYYY') }}`.

### O

**Open Source**

> Software cuyo código fuente está disponible públicamente. n8n tiene licencia fair-code/sustainable use.

**Output**

> Datos que produce un nodo después de ejecutarse. Pasan automáticamente al siguiente nodo conectado.

### P

**Parámetros**

> Configuración de un nodo. Pueden ser valores fijos o expresiones dinámicas.

**Persistencia**

> Capacidad de mantener datos guardados entre reinicios. En Docker, se logra con volúmenes.

**Pin Data**

> Funcionalidad para fijar los datos de salida de un nodo durante desarrollo, evitando re-ejecutar nodos anteriores.

**Puerto (Port)**

> Número que identifica un servicio en una computadora. n8n usa el puerto 5678 por defecto.

### R

**Retry (Reintentar)**

> Ejecutar nuevamente un workflow o nodo que falló. Configurable automáticamente en n8n.

### S

**Schedule Trigger**

> Nodo trigger que ejecuta un workflow en intervalos programados (cada hora, diario, expresión cron, etc.).

**Self-hosted**

> Ejecutar software en tu propia infraestructura en lugar de usar un servicio en la nube. Opción principal de n8n.

**Set Node**

> Nodo core de n8n usado para crear, modificar o filtrar datos JSON.

**Sticky Note**

> Elemento visual del canvas para agregar notas y documentación al workflow.

**Switch Node**

> Nodo que divide el flujo en múltiples caminos basándose en el valor de un campo (más de 2 opciones).

### T

**Template**

> Workflow pre-construido que puede importarse y reutilizarse. n8n ofrece +500 templates.

**Trigger**

> Nodo especial que inicia la ejecución de un workflow. Tipos: Manual, Schedule, Webhook, Event-based.

### V

**Variable**

> En código y expresiones, contenedor con nombre para almacenar datos. Ej: `let nombre = "Juan"`.

**Volumen (Volume)**

> En Docker, mecanismo para persistir datos fuera del contenedor. Esencial para mantener workflows y credenciales.

### W

**Webhook**

> URL única que permite recibir datos de servicios externos via HTTP para iniciar un workflow.

**Webhook Trigger**

> Nodo trigger que crea un endpoint URL. Cuando recibe una petición HTTP, inicia el workflow.

**Workflow**

> Flujo de trabajo automatizado compuesto por nodos conectados que procesan datos. Unidad principal en n8n.

### Y

**YAML**

> Formato de archivo usado por Docker Compose. Sensible a la indentación.

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

## 📊 Resumen de Términos por Categoría

| Categoría           | Términos                                                               | Cantidad |
| ------------------- | ---------------------------------------------------------------------- | -------- |
| **Conceptos n8n**   | Workflow, Nodo, Trigger, Ejecución, Expresión, Item, Canvas, Editor    | 8        |
| **Nodos Core**      | Manual Trigger, Set Node, IF Node, Code Node, Switch, Merge, Webhook   | 7        |
| **Datos**           | JSON, Input, Output, Data Structure, Binary Data, Item, $json          | 7        |
| **Infraestructura** | Docker, Contenedor, Imagen, Volumen, Puerto, docker-compose.yml        | 6        |
| **Autenticación**   | API, API Key, Credenciales, OAuth (próximas semanas)                   | 4        |
| **Programación**    | Expresión, Variable, Luxon, $now, Code Node                            | 5        |
| **Filosofía**       | Automatización, Low-code, No-code, Open Source, Fair-code, Self-hosted | 6        |
| **Total**           |                                                                        | **~45**  |

---

## 🔤 Índice Alfabético Rápido

**A** · Activar · API · API Key · Automatización  
**B** · Binary Data · Branch  
**C** · Canvas · Code Node · Conexión · Contenedor · Credenciales  
**D** · Data Structure · Debug · Docker · Docker Compose  
**E** · Editor · Ejecución · Environment Variables · Error Handling · Expresión  
**F** · Fair-code · Flujo de Datos  
**H** · HTTP Request  
**I** · IF Node · Imagen · Input · Integración · Item  
**J** · JSON · $json  
**L** · Low-code · Luxon  
**M** · Manual Trigger · Merge Node  
**N** · n8n · Nodo · No-code · $now  
**O** · Open Source · Output  
**P** · Parámetros · Persistencia · Pin Data · Puerto  
**R** · Retry  
**S** · Schedule Trigger · Self-hosted · Set Node · Sticky Note · Switch Node  
**T** · Template · Trigger  
**V** · Variable · Volumen  
**W** · Webhook · Webhook Trigger · Workflow  
**Y** · YAML

---

## 🎓 Términos que Aprenderás en Próximas Semanas

| Semana | Nuevos Conceptos                                   |
| ------ | -------------------------------------------------- |
| 02     | Schedule Trigger, Webhook Trigger, Cron Expression |
| 03     | Loop, Merge, Split, Aggregate                      |
| 04     | HTTP Request, REST API, OAuth, Authentication      |
| 05     | Google Sheets, Gmail, Slack integrations           |
| 06     | Database, MySQL, PostgreSQL, Query                 |
| 07     | Sub-workflow, Execute Workflow                     |
| 08     | Error Trigger, Retry, Error Branch                 |
| 09     | Function, Custom Function, npm packages            |
| 10     | Deploy, Environment, Production, Monitoring        |

---

## 🔗 Referencias Externas

- [Glosario Oficial n8n](https://docs.n8n.io/glossary/)
- [Docker Glossary](https://docs.docker.com/glossary/)
- [API Glossary](https://developer.mozilla.org/en-US/docs/Glossary)

---

## 💡 Tips de Estudio

> 📌 **Mantén este glosario abierto mientras estudias.** Los términos se irán volviendo familiares con la práctica.

> 🔍 **Usa Ctrl+F** para buscar términos rápidamente cuando tengas dudas.

> ✍️ **Agrega tus propias notas** debajo de cada término conforme aprendas más.

> 🔄 **Revisa semanalmente** - Los términos que no entiendas hoy, los dominarás con práctica.
