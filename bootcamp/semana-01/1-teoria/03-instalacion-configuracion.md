# 📚 Módulo 03: Instalación y Configuración

![Docker](https://img.shields.io/badge/Docker-Container-2496ED?style=flat-square&logo=docker)
![Tiempo](https://img.shields.io/badge/Tiempo-30_min-00D4FF?style=flat-square)
![Nivel](https://img.shields.io/badge/Nivel-Principiante-00A86B?style=flat-square)

---

## 🎯 Objetivos del Módulo

Al finalizar este módulo, serás capaz de:

- Comprender los requisitos para instalar n8n
- Conocer las opciones de instalación disponibles
- Entender Docker y Docker Compose para n8n
- Configurar variables de entorno básicas
- Acceder a la interfaz de n8n por primera vez

---

## 📚 Contenido

### 3.1 Opciones de Instalación

n8n ofrece múltiples formas de instalación según tus necesidades:

```
┌─────────────────────────────────────────────────────────────────┐
│                    OPCIONES DE INSTALACIÓN                       │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│   ☁️  n8n Cloud          │   La forma más rápida de empezar     │
│   └── cloud.n8n.io       │   Sin instalación, listo en minutos  │
│                                                                  │
│   🐳 Docker              │   Recomendado para desarrollo local  │
│   └── docker-compose.yml │   Aislado, reproducible, fácil       │
│                                                                  │
│   📦 npm                 │   Para usuarios avanzados de Node.js │
│   └── npm install n8n    │   Requiere Node.js instalado         │
│                                                                  │
│   ☸️  Kubernetes         │   Para producción enterprise         │
│   └── Helm charts        │   Alta disponibilidad, escalable     │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

#### Comparativa de Opciones

| Opción | Dificultad | Tiempo Setup | Ideal Para |
|--------|------------|--------------|------------|
| **n8n Cloud** | ⭐ | 2 min | Probar rápido, equipos no técnicos |
| **Docker** | ⭐⭐ | 15 min | Desarrollo local, este bootcamp |
| **npm** | ⭐⭐⭐ | 20 min | Desarrolladores Node.js |
| **Kubernetes** | ⭐⭐⭐⭐⭐ | 1-2 hrs | Producción enterprise |

> 🎯 **En este bootcamp usaremos Docker Compose** por su balance entre facilidad y control.

### 3.2 Requisitos Previos

#### Hardware Mínimo

| Recurso | Mínimo | Recomendado |
|---------|--------|-------------|
| **CPU** | 1 core | 2+ cores |
| **RAM** | 2 GB | 4+ GB |
| **Disco** | 5 GB | 20+ GB |

#### Software Requerido

```
┌─────────────────────────────────────────────────────────────────┐
│                    REQUISITOS DE SOFTWARE                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│   ✅ Sistema Operativo                                          │
│      • Linux (Ubuntu, Fedora, Debian)                           │
│      • macOS                                                     │
│      • Windows 10/11 con WSL2                                   │
│                                                                  │
│   ✅ Docker                                                      │
│      • Docker Engine 20.10+                                     │
│      • Docker Compose v2+                                       │
│                                                                  │
│   ✅ Navegador Web                                               │
│      • Chrome, Firefox, Edge (actualizado)                      │
│                                                                  │
│   📝 Opcional pero recomendado                                  │
│      • VS Code (para editar archivos)                           │
│      • Terminal con zsh/bash                                    │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### 3.3 Introducción a Docker

#### ¿Qué es Docker?

**Docker** es una plataforma que permite empaquetar aplicaciones en contenedores aislados. Piensa en un contenedor como una "caja" que incluye todo lo necesario para ejecutar una aplicación.

```
┌─────────────────────────────────────────────────────────────────┐
│                    SIN DOCKER vs CON DOCKER                      │
├──────────────────────────────┬──────────────────────────────────┤
│        Sin Docker            │         Con Docker               │
├──────────────────────────────┼──────────────────────────────────┤
│                              │                                   │
│   Tu Máquina                 │   Tu Máquina                     │
│   ┌────────────────────┐     │   ┌────────────────────┐         │
│   │ Node.js v16        │     │   │                    │         │
│   │ Node.js v18        │ ❌  │   │  ┌──────────────┐  │         │
│   │ n8n                │     │   │  │  Contenedor  │  │         │
│   │ PostgreSQL         │     │   │  │  ┌────────┐  │  │  ✅     │
│   │ Redis              │     │   │  │  │  n8n   │  │  │         │
│   │ ... conflictos ... │     │   │  │  │Node.js │  │  │         │
│   └────────────────────┘     │   │  │  │  todo  │  │  │         │
│                              │   │  │  └────────┘  │  │         │
│                              │   │  └──────────────┘  │         │
│                              │   └────────────────────┘         │
│                              │                                   │
└──────────────────────────────┴──────────────────────────────────┘
```

#### Conceptos Clave de Docker

| Concepto | Descripción | Analogía |
|----------|-------------|----------|
| **Imagen** | Plantilla inmutable con la app | Receta de cocina |
| **Contenedor** | Instancia ejecutable de una imagen | Plato preparado |
| **Volumen** | Almacenamiento persistente | Refrigerador |
| **Red** | Comunicación entre contenedores | Red telefónica |
| **Docker Compose** | Orquestación de múltiples contenedores | Director de orquesta |

#### ¿Qué es Docker Compose?

**Docker Compose** permite definir y ejecutar aplicaciones multi-contenedor usando un archivo YAML.

```yaml
# Ejemplo simplificado de docker-compose.yml
# Qué hace: Define la configuración de n8n
# Para qué: Levantar n8n con un solo comando
# Cómo: docker compose up -d

version: '3.8'

services:
  n8n:
    image: n8nio/n8n
    ports:
      - "5678:5678"
    volumes:
      - n8n_data:/home/node/.n8n

volumes:
  n8n_data:
```

### 3.4 Archivo docker-compose.yml para n8n

El bootcamp incluye un archivo `docker-compose.yml` en la raíz del repositorio. Aquí está su estructura:

```yaml
# docker-compose.yml para bc-n8n
# 
# Qué hace: Configura n8n para desarrollo local
# Para qué: Tener un entorno reproducible para el bootcamp
# Cómo funciona: 
#   1. Descarga la imagen de n8n
#   2. Configura puertos y volúmenes
#   3. Aplica variables de entorno
#   4. Inicia el servicio

version: '3.8'

services:
  n8n:
    image: docker.n8n.io/n8nio/n8n
    container_name: n8n-bootcamp
    restart: unless-stopped
    ports:
      # Puerto host:Puerto contenedor
      # Acceder en http://localhost:5678
      - "5678:5678"
    environment:
      # Configuración básica
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=admin
      - N8N_BASIC_AUTH_PASSWORD=bootcamp2024
      # Zona horaria
      - GENERIC_TIMEZONE=America/Mexico_City
      - TZ=America/Mexico_City
      # Configuración de webhooks
      - WEBHOOK_URL=http://localhost:5678/
    volumes:
      # Persistir datos de n8n
      - n8n_data:/home/node/.n8n
      # Carpeta local para workflows
      - ./workflows:/home/node/workflows

volumes:
  n8n_data:
    name: n8n_bootcamp_data
```

#### Explicación de Cada Sección

| Sección | Propósito |
|---------|-----------|
| `version` | Versión del formato de Docker Compose |
| `services` | Lista de contenedores a ejecutar |
| `image` | Imagen de Docker a usar (n8n oficial) |
| `container_name` | Nombre para identificar el contenedor |
| `restart` | Política de reinicio automático |
| `ports` | Mapeo de puertos (host:contenedor) |
| `environment` | Variables de entorno |
| `volumes` | Almacenamiento persistente |

### 3.5 Variables de Entorno Importantes

```
┌─────────────────────────────────────────────────────────────────┐
│                 VARIABLES DE ENTORNO DE n8n                      │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│   🔐 AUTENTICACIÓN                                              │
│   ├── N8N_BASIC_AUTH_ACTIVE    │ true/false                    │
│   ├── N8N_BASIC_AUTH_USER      │ Usuario para login            │
│   └── N8N_BASIC_AUTH_PASSWORD  │ Contraseña                    │
│                                                                  │
│   🌐 WEBHOOKS                                                    │
│   ├── WEBHOOK_URL              │ URL base para webhooks        │
│   └── N8N_PROTOCOL             │ http o https                  │
│                                                                  │
│   ⏰ ZONA HORARIA                                               │
│   ├── GENERIC_TIMEZONE         │ America/Mexico_City           │
│   └── TZ                       │ America/Mexico_City           │
│                                                                  │
│   💾 BASE DE DATOS                                              │
│   ├── DB_TYPE                  │ sqlite (default), postgresdb  │
│   └── DB_SQLITE_PATH           │ Ruta del archivo SQLite       │
│                                                                  │
│   📊 EJECUCIONES                                                │
│   ├── EXECUTIONS_DATA_PRUNE    │ true (limpiar antiguos)       │
│   └── EXECUTIONS_DATA_MAX_AGE  │ Días a mantener (default 336) │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### 3.6 Comandos Docker Esenciales

#### Comandos Básicos

```bash
# Levantar n8n en segundo plano
docker compose up -d

# Ver logs en tiempo real
docker compose logs -f

# Detener n8n
docker compose down

# Reiniciar n8n
docker compose restart

# Ver estado de contenedores
docker compose ps
```

#### Comandos de Mantenimiento

```bash
# Ver uso de recursos
docker stats n8n-bootcamp

# Entrar al contenedor
docker exec -it n8n-bootcamp /bin/sh

# Hacer backup del volumen
docker run --rm -v n8n_bootcamp_data:/data -v $(pwd):/backup \
  busybox tar cvf /backup/n8n-backup.tar /data

# Actualizar imagen de n8n
docker compose pull
docker compose up -d
```

### 3.7 Primer Acceso a n8n

Una vez que n8n está corriendo, accede a la interfaz:

#### Paso 1: Verificar que está corriendo

```bash
$ docker compose ps

NAME            STATUS         PORTS
n8n-bootcamp    Up 2 minutes   0.0.0.0:5678->5678/tcp
```

#### Paso 2: Abrir en navegador

```
🌐 URL: http://localhost:5678
👤 Usuario: admin
🔐 Contraseña: bootcamp2024
```

#### Paso 3: Primera vista

```
┌─────────────────────────────────────────────────────────────────┐
│                        n8n Interface                             │
├─────────────────────────────────────────────────────────────────┤
│  ┌──────────┐                                                    │
│  │ 🏠 Home  │    [+ Add workflow]                               │
│  ├──────────┤                                                    │
│  │ Workflows│    ┌─────────────────────────────────────────┐    │
│  │ Templates│    │                                         │    │
│  │ Credentials   │     Welcome to n8n! 🎉                  │    │
│  │ Variables│    │                                         │    │
│  │ Settings │    │     Start by creating your first        │    │
│  └──────────┘    │     workflow or explore templates.      │    │
│                  │                                         │    │
│                  │     [Create Workflow] [Browse Templates]│    │
│                  │                                         │    │
│                  └─────────────────────────────────────────┘    │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### 3.8 Estructura de Archivos Generada

Después de la primera ejecución, n8n crea esta estructura:

```
~/.n8n/                          (o volumen Docker)
├── config                       # Configuración
├── database.sqlite              # Base de datos SQLite
├── .n8n/                        # Datos internos
│   ├── crash.journal           # Log de errores
│   └── ...
└── nodes/                       # Nodos personalizados (opcional)
```

### 3.9 Solución de Problemas Comunes

#### Puerto 5678 ocupado

```bash
# Ver qué usa el puerto
lsof -i :5678

# Cambiar puerto en docker-compose.yml
ports:
  - "5679:5678"  # Usar puerto 5679 en host
```

#### Contenedor no inicia

```bash
# Ver logs detallados
docker compose logs n8n

# Errores comunes:
# - Permisos en volúmenes
# - Variables de entorno mal formateadas
# - Puerto ya en uso
```

#### Permisos de volumen (Linux)

```bash
# Dar permisos al usuario del contenedor (node = 1000)
sudo chown -R 1000:1000 ./workflows
```

---

## 💡 Puntos Clave

- ✅ Docker es la forma recomendada para desarrollo local
- ✅ Docker Compose simplifica la configuración
- ✅ Los volúmenes persisten datos entre reinicios
- ✅ Variables de entorno configuran comportamiento
- ✅ El puerto por defecto es 5678

---

## ⚠️ Errores Comunes

| Error | Causa | Solución |
|-------|-------|----------|
| "Port already in use" | Otro servicio usa 5678 | Cambiar puerto o detener servicio |
| "Permission denied" | Permisos de volumen | `chown -R 1000:1000` |
| "Cannot connect" | Contenedor no corre | `docker compose up -d` |
| "No such image" | Imagen no descargada | `docker compose pull` |

---

## 🔗 Referencias

- [n8n Docker Documentation](https://docs.n8n.io/hosting/installation/docker/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [n8n Environment Variables](https://docs.n8n.io/hosting/configuration/environment-variables/)

---

## ✅ Autoevaluación

Antes de continuar, asegúrate de poder responder:

1. **¿Por qué usamos Docker para este bootcamp?**
   <details>
   <summary>Ver respuesta</summary>
   Docker proporciona un entorno aislado, reproducible y fácil de configurar. Evita conflictos con otros software y permite a todos tener exactamente el mismo entorno.
   </details>

2. **¿Qué hace el archivo docker-compose.yml?**
   <details>
   <summary>Ver respuesta</summary>
   Define la configuración de los contenedores: imagen a usar, puertos, volúmenes, variables de entorno. Permite levantar todo con un solo comando.
   </details>

3. **¿Para qué sirven los volúmenes en Docker?**
   <details>
   <summary>Ver respuesta</summary>
   Para persistir datos. Sin volúmenes, los datos se perderían al detener el contenedor. Los volúmenes mantienen workflows, credenciales y configuración.
   </details>

4. **¿En qué URL se accede a n8n local?**
   <details>
   <summary>Ver respuesta</summary>
   http://localhost:5678 (o el puerto configurado en docker-compose.yml)
   </details>

---

<div align="center">

| ◀️ Anterior | 🏠 Volver | ▶️ Ir a Prácticas |
|-------------|-----------|-------------------|
| [Módulo 02](02-conociendo-n8n.md) | [Índice Teoría](README.md) | [Práctica 01](../2-practicas/practica-01-instalacion-docker.md) |

</div>
