# Copilot Instructions - Bootcamp n8n Zero to Hero

## Contexto del Proyecto

Este es un bootcamp intensivo de n8n diseñado para llevar a los estudiantes desde nivel principiante hasta avanzado en 10 semanas, con una dedicación de 6 horas semanales (60 horas totales).

## Estructura de Archivos del Proyecto

### Organización del Repositorio

```
bc-n8n/
├── README.md                          # Documento principal del bootcamp (único en raíz)
├── .gitignore                         # Configuración de Git
├── .github/
│   └── copilot-instructions.md        # Este archivo
├── _docs/                             # Toda la documentación del bootcamp
│   ├── guia-instalacion.md
│   ├── conceptos-fundamentales.md
│   ├── expresiones-y-variables.md
│   ├── mejores-practicas.md
│   ├── troubleshooting.md
│   └── recursos-externos.md
├── modulos/                           # Contenido de los 4 módulos
│   ├── modulo-01-fundamentos/
│   │   ├── README.md
│   │   ├── 1-teoria/
│   │   ├── 2-ejercicios/
│   │   └── 3-proyectos/
│   ├── modulo-02-nodos-datos/
│   ├── modulo-03-workflows-intermedios/
│   └── modulo-04-nivel-avanzado/
├── assets/                            # Recursos gráficos en SVG
│   ├── banner-bootcamp.svg           # Banner principal
│   ├── diagrams/                     # Diagramas conceptuales
│   ├── icons/                        # Iconos
│   └── screenshots/                  # Capturas de pantalla
└── videos/                           # Excluido de Git (ver .gitignore)
```

### Reglas de Estructura

1. **README.md principal**: Único documento en la raíz del proyecto. Debe contener:

   - Banner SVG del bootcamp
   - Introducción general
   - Índice de módulos
   - Enlaces a documentación en `_docs/`
   - Instrucciones de inicio rápido

2. **Directorio `_docs/`**: Toda la documentación auxiliar del bootcamp

   - Guías de instalación y configuración
   - Conceptos fundamentales
   - Referencias técnicas
   - Mejores prácticas
   - FAQs y troubleshooting

3. **Directorio `modulos/`**: Contenido estructurado por módulo

   - Cada módulo tiene su propio README.md
   - Subdirectorios numerados: `1-teoria/`, `2-ejercicios/`, `3-proyectos/`
   - Workflows de ejemplo en formato JSON
   - Soluciones comentadas

4. **Directorio `assets/`**: Recursos visuales únicamente en SVG

   - **Nunca usar ASCII art**
   - Tema dark mode consistente
   - Sin degradados (flat design)
   - Fuentes sans-serif
   - Paleta de colores definida
   - Diagramas conceptuales para reforzar aprendizaje

5. **Directorio `videos/`**: Excluido de Git
   - Videos de las sesiones
   - Tutoriales grabados
   - No se sincroniza al repositorio

## Configuración de n8n

### Instalación Recomendada

Para este bootcamp, **usamos Docker Compose como método principal de instalación local** de n8n por las siguientes razones:

✅ **Ventajas de Docker:**

- Instalación consistente en todos los sistemas operativos
- Aislamiento del entorno
- Fácil actualización y rollback
- Gestión de volúmenes para persistencia de datos
- No requiere instalar Node.js globalmente
- Configuración reproducible

✅ **Por qué Alpine:**

- Imágenes más ligeras (menor tamaño)
- Menor superficie de ataque (más seguro)
- Inicio más rápido
- Optimización de recursos

✅ **Por qué pnpm:**

- Más rápido que npm (hasta 2x)
- Ahorra espacio en disco (almacenamiento compartido)
- Dependencias más eficientes
- Mejor para monorepos

### Docker Compose para n8n (Recomendado)

**Archivo `docker-compose.yml`:**

```yaml
services:
  n8n:
    image: n8nio/n8n:latest
    container_name: n8n
    restart: unless-stopped
    ports:
      - '5678:5678'
    environment:
      - N8N_HOST=localhost
      - N8N_PORT=5678
      - N8N_PROTOCOL=http
      - NODE_ENV=production
      - WEBHOOK_URL=http://localhost:5678/
    volumes:
      - n8n_data:/home/node/.n8n
      - ./workflows:/home/node/.n8n/workflows
      - ./credentials:/home/node/.n8n/credentials

volumes:
  n8n_data:
```

**Nota:** La imagen `n8nio/n8n:latest` ya está basada en Alpine Linux por defecto, por lo que es ligera y optimizada.

**Comandos básicos:**

```bash
# Iniciar n8n
docker compose up -d

# Ver logs
docker compose logs -f n8n

# Detener n8n
docker compose down

# Actualizar n8n
docker compose pull
docker compose up -d
```

### Docker Run (Alternativa)

**Comando básico:**

```bash
docker run -d \
  --name n8n \
  --restart unless-stopped \
  -p 5678:5678 \
  -v ~/.n8n:/home/node/.n8n \
  n8nio/n8n:latest
```

### Instalación con pnpm (Opcional)

Para quienes prefieren instalación local sin Docker:

```bash
# Instalar pnpm globalmente
npm install -g pnpm

# Instalar n8n con pnpm
pnpm install -g n8n

# Iniciar n8n
n8n start
```

### Métodos de Instalación (Orden de Prioridad)

1. **Docker Compose** (recomendado) - imagen basada en Alpine
2. **n8n Cloud** (para empezar sin instalación)
3. **pnpm global** (alternativa sin Docker)
4. **npm global** (última opción)

### Al Crear Contenido de Instalación

- Siempre priorizar **Docker Compose**
- Usar imagen `n8nio/n8n:latest` (ya basada en Alpine por defecto)
- **No usar** el tag `latest-alpine` (no existe)
- Proporcionar ejemplo de `docker-compose.yml` completo
- Mencionar **pnpm** como gestor de paquetes preferido
- Incluir n8n Cloud como alternativa válida para comenzar
- Explicar que las imágenes oficiales de n8n ya están optimizadas

## Estructura del Bootcamp

### Distribución de Tiempo

- **Teoría:** 30% (18 horas)
- **Práctica guiada:** 40% (24 horas)
- **Proyectos/ejercicios:** 30% (18 horas)

### Módulos y Cronograma

#### **Módulo 1: Fundamentos de n8n (Semanas 1-2.5 | 15 horas)**

**Objetivos:**

- Comprender qué es n8n y sus casos de uso
- Configurar entorno de desarrollo
- Crear workflows básicos
- Entender la interfaz y navegación

**Contenido:**

- Introducción a automatización de procesos
- Instalación local y en la nube
- Conceptos: nodos, conexiones, ejecuciones
- Primeros workflows: triggers, acciones básicas
- Buenas prácticas desde el inicio

**Entregables:**

- 3 workflows básicos funcionales
- Documentación de instalación personalizada

#### **Módulo 2: Nodos y Manejo de Datos (Semanas 2.5-5 | 15 horas)**

**Objetivos:**

- Dominar nodos core y triggers
- Gestionar credenciales y autenticación
- Transformar y manipular datos
- Usar expresiones y variables

**Contenido:**

- Nodos principales: HTTP Request, Set, IF, Switch
- Triggers: Webhook, Schedule, Email
- Expresiones y funciones en n8n
- Transformación de datos JSON
- Gestión de credenciales seguras

**Entregables:**

- 5 workflows con diferentes tipos de triggers
- Sistema de transformación de datos
- Documentación de expresiones útiles

#### **Módulo 3: Workflows Intermedios (Semanas 5-7.5 | 15 horas)**

**Objetivos:**

- Implementar lógica condicional compleja
- Manejar loops y arrays
- Integrar servicios externos populares
- Gestionar errores correctamente

**Contenido:**

- Workflows con múltiples ramas
- Loop Over Items y Split In Batches
- Integraciones: Google Sheets, Slack, Email, APIs REST
- Error handling y retry strategies
- Sub-workflows y modularización

**Entregables:**

- Sistema de notificaciones multi-canal
- Workflow de sincronización de datos
- Sistema de manejo de errores robusto

#### **Módulo 4: Nivel Avanzado y Proyecto Final (Semanas 7.5-10 | 15 horas)**

**Objetivos:**

- Programar con Code nodes (JavaScript)
- Optimizar workflows complejos
- Implementar seguridad y mejores prácticas
- Desarrollar proyecto integrador

**Contenido:**

- Function y Function Item nodes
- JavaScript para transformaciones complejas
- Optimización de performance
- Versionado y backup de workflows
- Monitoreo y debugging avanzado
- Testing y QA de workflows

**Proyecto Final:**
Sistema completo de automatización que incluya:

- Múltiples integraciones
- Lógica condicional compleja
- Manejo robusto de errores
- Documentación completa
- Despliegue en producción

## Directrices para Copilot

### Al Generar Código/Workflows:

1. **Siempre incluir comentarios explicativos** en español
2. **Seguir convenciones de nomenclatura**:
   - Workflows: `verbo-sustantivo-contexto` (ej: `enviar-email-bienvenida`)
   - Variables: camelCase en español (ej: `datosUsuario`)
3. **Incluir manejo de errores** en todos los workflows
4. **Documentar credenciales necesarias** sin exponer datos sensibles
5. **Proporcionar ejemplos de datos** de entrada/salida
6. **Siempre recomendar mejores prácticas** de n8n y automatización

### Al Crear Recursos Visuales (SVG):

1. **Solo formato SVG** - Nunca usar ASCII art
2. **Tema dark mode** - Fondo oscuro (#1a1a1a, #2d2d2d)
3. **Sin degradados** - Diseño flat con colores sólidos
4. **Fuentes sans-serif** - Inter, Roboto, o system fonts
5. **Paleta de colores consistente**:
   - n8n Red: `#FF6D5A`
   - Accent: `#00D4FF`
   - Success: `#00A86B`
   - Warning: `#FFA500`
   - Text: `#E0E0E0`
   - Background: `#1a1a1a`, `#2d2d2d`
6. **Diagramas claros** que refuercen conceptos y ejemplos
7. **Ubicación**: Siempre en `/assets/` o subdirectorios

### Estructura de Archivos a Seguir:

- **README.md principal**: Único en la raíz del proyecto
- **Documentación**: Todo en `_docs/`
- **Módulos**: Todo en `modulos/modulo-XX-nombre/`
- **Assets**: Todo en `assets/` (SVG únicamente)
- **Videos**: En `videos/` (excluido de Git)

### Estructura de Respuestas:

```markdown
## [Título del Concepto/Ejercicio]

### 📋 Objetivo

[Qué se aprenderá]

### 🎯 Nivel

[Básico/Intermedio/Avanzado]

### ⏱️ Tiempo estimado

[X horas]

### 📚 Prerrequisitos

[Qué debe saber antes]

### 🔧 Implementación

[Paso a paso detallado]

### ✅ Criterios de Éxito

[Cómo verificar que funciona]

### 💡 Tips y Mejores Prácticas

[Consejos útiles]

### 🚀 Siguiente Paso

[Qué estudiar después]
```

### Al Explicar Conceptos:

- Usar analogías del mundo real
- Incluir diagramas visuales cuando sea posible
- Proporcionar ejemplos prácticos inmediatos
- Relacionar con casos de uso empresariales reales
- Destacar errores comunes y cómo evitarlos

### Al Crear Ejercicios:

- Graduar dificultad progresivamente
- Incluir solución comentada
- Proporcionar variaciones del ejercicio
- Sugerir extensiones para práctica adicional
- Relacionar con el proyecto final

### Enfoque Pedagógico:

1. **Learn by Doing**: Priorizar práctica sobre teoría
2. **Feedback inmediato**: Validar logros constantemente
3. **Proyecto iterativo**: Construir proyecto final desde semana 1
4. **Comunidad**: Fomentar colaboración entre estudiantes
5. **Real-world**: Usar casos de uso empresariales reales

### Recursos a Recomendar:

- Documentación oficial de n8n
- n8n Community forum
- Templates de workflows populares
- YouTube: Canal oficial de n8n
- GitHub: Repositorio de workflows compartidos

### Evaluación Continua:

- **Semana 2.5**: Quiz fundamentos + 1 workflow básico
- **Semana 5**: Proyecto intermedio con integraciones
- **Semana 7.5**: Workflow complejo con error handling
- **Semana 10**: Proyecto final integrador (presentación)

## Adaptaciones según Perfil del Estudiante

### Con Experiencia en Programación:

- Avanzar más rápido en expresiones y Code nodes
- Profundizar en JavaScript desde módulo 2
- Añadir contenido sobre APIs custom y webhooks avanzados

### Sin Experiencia Técnica:

- Reforzar conceptos de lógica de programación
- Más ejemplos visuales y paso a paso
- Enfoque en nodos sin código (low-code)
- Ejercicios adicionales de práctica

### Con Experiencia en Otras Herramientas de Automatización:

- Comparativas con Zapier, Make, Power Automate
- Migración de workflows existentes
- Ventajas y casos de uso específicos de n8n

## Métricas de Éxito del Bootcamp

- ✅ 100% de estudiantes completan 10+ workflows funcionales
- ✅ 90% despliegan al menos 1 workflow en producción
- ✅ 80% completan proyecto final integrador
- ✅ Portfolio de workflows documentados y compartibles
- ✅ Capacidad de resolver problemas reales con n8n

## Soporte y Recursos Adicionales

- Sesiones de Q&A semanales
- Canal de Slack/Discord para dudas
- Biblioteca de workflows de ejemplo
- Office hours 1-on-1 para casos complejos
- Grabaciones de todas las sesiones

---

**Nota para Copilot:** Al trabajar con estudiantes de este bootcamp, adapta tu nivel de detalle según el módulo en el que se encuentren. Sé paciente, didáctico y siempre proporciona contexto sobre el "por qué" además del "cómo".
