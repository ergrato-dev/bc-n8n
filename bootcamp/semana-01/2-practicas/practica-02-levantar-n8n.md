# 💻 Práctica 02: Levantar n8n Local

![n8n](https://img.shields.io/badge/n8n-Local_Setup-FF6D5A?style=flat-square&logo=n8n)
![Dificultad](https://img.shields.io/badge/Dificultad-⭐-00A86B?style=flat-square)
![Tiempo](https://img.shields.io/badge/Tiempo-25_min-00D4FF?style=flat-square)

---

## 📋 Información General

| Campo               | Valor                                            |
| ------------------- | ------------------------------------------------ |
| **Dificultad**      | ⭐ Principiante                                  |
| **Tiempo estimado** | 25 minutos                                       |
| **Conceptos**       | Docker Compose, Contenedores, Puertos, Volúmenes |
| **Prerrequisitos**  | Práctica 01 completada (Docker instalado)        |

---

## 🎯 Objetivos

Al completar esta práctica, serás capaz de:

- [ ] Crear y configurar el archivo docker-compose.yml
- [ ] Levantar n8n usando Docker Compose
- [ ] Acceder a la interfaz web de n8n
- [ ] Detener y reiniciar n8n correctamente

---

## 📝 Descripción

En esta práctica levantarás n8n en tu máquina local usando Docker Compose. Al finalizar, tendrás n8n corriendo y accesible desde tu navegador, listo para crear workflows.

---

## 🔧 Requisitos Técnicos

- Docker y Docker Compose instalados (Práctica 01)
- Puerto 5678 disponible
- Navegador web moderno

---

## 📋 Instrucciones

### Paso 1: Navegar al repositorio del bootcamp

```bash
# Ir al directorio del bootcamp
cd /ruta/a/bc-n8n

# Verificar que estás en el directorio correcto
ls -la

# Deberías ver:
# docker-compose.yml
# README.md
# bootcamp/
# ...
```

---

### Paso 2: Revisar el archivo docker-compose.yml

El repositorio ya incluye un `docker-compose.yml`. Vamos a revisarlo:

```bash
# Ver contenido del archivo
cat docker-compose.yml
```

Deberías ver algo similar a:

```yaml
version: '3.8'

services:
  n8n:
    image: docker.n8n.io/n8nio/n8n
    container_name: n8n-bootcamp
    restart: unless-stopped
    ports:
      - '5678:5678'
    environment:
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=admin
      - N8N_BASIC_AUTH_PASSWORD=bootcamp2024
      - GENERIC_TIMEZONE=America/Mexico_City
      - TZ=America/Mexico_City
      - WEBHOOK_URL=http://localhost:5678/
    volumes:
      - n8n_data:/home/node/.n8n
      - ./workflows:/home/node/workflows

volumes:
  n8n_data:
    name: n8n_bootcamp_data
```

> 📝 **Nota**: Si el archivo no existe, créalo con el contenido anterior.

---

### Paso 3: Crear carpeta para workflows

```bash
# Crear carpeta workflows si no existe
mkdir -p workflows

# Dar permisos (Linux)
chmod 755 workflows
```

---

### Paso 4: Levantar n8n

```bash
# Descargar imagen y levantar contenedor
docker compose up -d

# El flag -d ejecuta en segundo plano (detached)
```

**Salida esperada:**

```
[+] Running 2/2
 ✔ Network bc-n8n_default      Created
 ✔ Container n8n-bootcamp      Started
```

---

### Paso 5: Verificar que n8n está corriendo

```bash
# Ver estado del contenedor
docker compose ps
```

**Salida esperada:**

```
NAME            IMAGE                        STATUS          PORTS
n8n-bootcamp    docker.n8n.io/n8nio/n8n     Up 30 seconds   0.0.0.0:5678->5678/tcp
```

```bash
# Ver logs de n8n
docker compose logs -f

# Presiona Ctrl+C para salir de los logs
```

**Busca en los logs:**

```
Editor is now accessible via:
http://localhost:5678
```

---

### Paso 6: Acceder a n8n en el navegador

1. Abre tu navegador web
2. Ve a: **http://localhost:5678**
3. Ingresa las credenciales:
   - **Usuario**: `admin`
   - **Contraseña**: `bootcamp2024`

```
┌─────────────────────────────────────────────────────────────────┐
│                     n8n Login                                    │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│                        🔐                                        │
│                                                                  │
│     Username: [admin____________]                                │
│                                                                  │
│     Password: [****************]                                 │
│                                                                  │
│              [ Sign in ]                                         │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

### Paso 7: Exploración inicial

Una vez dentro, verás la pantalla principal de n8n:

```
┌─────────────────────────────────────────────────────────────────┐
│ n8n                                          [?] [👤] [⚙️]       │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  📁 Home                    Welcome to n8n!                      │
│  📊 Workflows                                                    │
│  📄 Templates               No workflows yet                     │
│  🔐 Credentials                                                  │
│  📊 Executions              [+ Create Workflow]                  │
│  ⚙️ Settings                                                     │
│                             [Browse Templates]                   │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

¡Felicidades! n8n está corriendo correctamente. 🎉

---

### Paso 8: Comandos útiles

Aprende estos comandos para gestionar n8n:

```bash
# Detener n8n
docker compose down

# Reiniciar n8n
docker compose restart

# Ver logs en tiempo real
docker compose logs -f

# Detener sin eliminar datos
docker compose stop

# Iniciar de nuevo
docker compose start
```

---

## 🎨 Resultado Esperado

Al finalizar esta práctica:

1. ✅ Contenedor `n8n-bootcamp` corriendo
2. ✅ Acceso a http://localhost:5678
3. ✅ Login exitoso con credenciales
4. ✅ Pantalla principal de n8n visible

---

## 💡 Pistas

<details>
<summary>Pista 1: Puerto 5678 ocupado</summary>

Si el puerto está ocupado, cambia el puerto en `docker-compose.yml`:

```yaml
ports:
  - '5679:5678' # Usa puerto 5679
```

Y accede a: http://localhost:5679

</details>

<details>
<summary>Pista 2: Error de permisos en volumen (Linux)</summary>

```bash
# El usuario del contenedor es node (UID 1000)
sudo chown -R 1000:1000 workflows
```

</details>

<details>
<summary>Pista 3: Imagen no descarga</summary>

Verifica tu conexión a internet y ejecuta:

```bash
docker compose pull
docker compose up -d
```

</details>

<details>
<summary>Pista 4: No carga en el navegador</summary>

1. Verifica que el contenedor está corriendo: `docker compose ps`
2. Revisa los logs: `docker compose logs`
3. Prueba con http://127.0.0.1:5678 en lugar de localhost

</details>

---

## ✅ Criterios de Evaluación

| Criterio                           | Puntos |
| ---------------------------------- | ------ |
| docker-compose.yml configurado     | 1      |
| Contenedor levantado correctamente | 2      |
| Acceso a interfaz web              | 2      |
| Login exitoso                      | 1      |
| **Total**                          | **6**  |

---

## 🚀 Desafío Extra (Opcional)

1. **Personaliza las credenciales:**

   - Cambia `N8N_BASIC_AUTH_USER` y `N8N_BASIC_AUTH_PASSWORD`
   - Reinicia n8n y verifica el nuevo login

2. **Cambia la zona horaria:**

   - Modifica `GENERIC_TIMEZONE` a tu zona
   - Encuentra tu zona en: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

3. **Verifica la persistencia:**
   - Crea un workflow vacío (solo guárdalo)
   - Ejecuta `docker compose down`
   - Ejecuta `docker compose up -d`
   - Verifica que el workflow sigue ahí

---

## 📚 Recursos Relacionados

- [n8n Docker Installation](https://docs.n8n.io/hosting/installation/docker/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [n8n Environment Variables](https://docs.n8n.io/hosting/configuration/environment-variables/)

---

<div align="center">

| ◀️ Anterior                                      | 🏠 Volver                     | Siguiente ▶️                                                       |
| ------------------------------------------------ | ----------------------------- | ------------------------------------------------------------------ |
| [Práctica 01](practica-01-instalacion-docker.md) | [Índice Prácticas](README.md) | [Práctica 03: Explorar Interfaz](practica-03-explorar-interfaz.md) |

</div>
