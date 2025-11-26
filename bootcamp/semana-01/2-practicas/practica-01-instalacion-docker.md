# 💻 Práctica 01: Instalación de Docker

![Docker](https://img.shields.io/badge/Docker-Installation-2496ED?style=flat-square&logo=docker)
![Dificultad](https://img.shields.io/badge/Dificultad-⭐-00A86B?style=flat-square)
![Tiempo](https://img.shields.io/badge/Tiempo-25_min-00D4FF?style=flat-square)

---

## 📋 Información General

| Campo | Valor |
|-------|-------|
| **Dificultad** | ⭐ Principiante |
| **Tiempo estimado** | 25 minutos |
| **Conceptos** | Docker, Docker Compose, Contenedores |
| **Prerrequisitos** | Sistema operativo compatible |

---

## 🎯 Objetivos

Al completar esta práctica, serás capaz de:

- [ ] Instalar Docker en tu sistema operativo
- [ ] Verificar que Docker funciona correctamente
- [ ] Instalar Docker Compose
- [ ] Ejecutar tu primer contenedor de prueba

---

## 📝 Descripción

En esta práctica instalarás Docker y Docker Compose, las herramientas necesarias para ejecutar n8n localmente. Docker nos permite correr n8n en un contenedor aislado, evitando conflictos con otros software de tu sistema.

---

## 🔧 Requisitos Técnicos

- Sistema operativo: Linux, macOS, o Windows 10/11
- Acceso a terminal/consola
- Conexión a internet
- Permisos de administrador

---

## 📋 Instrucciones

### Paso 1: Verificar si Docker ya está instalado

Primero, verifica si ya tienes Docker instalado:

```bash
# Verificar versión de Docker
docker --version

# Verificar versión de Docker Compose
docker compose version
```

Si ambos comandos muestran versiones, puedes saltar al **Paso 4**.

---

### Paso 2: Instalar Docker

#### 🐧 Linux (Ubuntu/Debian)

```bash
# Actualizar paquetes
sudo apt update

# Instalar dependencias
sudo apt install -y ca-certificates curl gnupg

# Agregar clave GPG oficial de Docker
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Agregar repositorio
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Instalar Docker
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Agregar usuario al grupo docker (evita usar sudo)
sudo usermod -aG docker $USER

# Aplicar cambios de grupo (o cerrar sesión y volver a entrar)
newgrp docker
```

#### 🐧 Linux (Fedora)

```bash
# Instalar dnf-plugins-core
sudo dnf -y install dnf-plugins-core

# Agregar repositorio de Docker
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

# Instalar Docker
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Iniciar y habilitar Docker
sudo systemctl start docker
sudo systemctl enable docker

# Agregar usuario al grupo docker
sudo usermod -aG docker $USER
newgrp docker
```

#### 🍎 macOS

1. Descarga **Docker Desktop** desde: https://www.docker.com/products/docker-desktop
2. Abre el archivo `.dmg` descargado
3. Arrastra Docker a la carpeta Aplicaciones
4. Abre Docker desde Aplicaciones
5. Sigue el asistente de configuración
6. Espera a que Docker inicie (ícono de ballena en la barra de menú)

#### 🪟 Windows 10/11

1. **Habilitar WSL2** (si no está habilitado):
   - Abre PowerShell como Administrador
   - Ejecuta: `wsl --install`
   - Reinicia el computador

2. **Instalar Docker Desktop**:
   - Descarga desde: https://www.docker.com/products/docker-desktop
   - Ejecuta el instalador
   - Marca la opción "Use WSL 2 instead of Hyper-V"
   - Reinicia si es necesario

3. **Verificar que WSL2 está activo**:
   - Abre Docker Desktop
   - Ve a Settings > General
   - Asegúrate que "Use the WSL 2 based engine" está marcado

---

### Paso 3: Verificar la instalación

```bash
# Verificar que Docker está corriendo
docker --version
# Salida esperada: Docker version 24.x.x, build xxxxxxx

# Verificar Docker Compose
docker compose version
# Salida esperada: Docker Compose version v2.x.x

# Verificar que el servicio está activo (Linux)
sudo systemctl status docker
```

---

### Paso 4: Ejecutar contenedor de prueba

Vamos a ejecutar el clásico "Hello World" de Docker:

```bash
# Ejecutar contenedor de prueba
docker run hello-world
```

**Salida esperada:**

```
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
 3. The Docker daemon created a new container from that image...
 ...
```

Si ves este mensaje, ¡Docker está funcionando correctamente! 🎉

---

### Paso 5: Comandos básicos de Docker

Practica estos comandos esenciales:

```bash
# Ver contenedores en ejecución
docker ps

# Ver todos los contenedores (incluyendo detenidos)
docker ps -a

# Ver imágenes descargadas
docker images

# Eliminar contenedor de hello-world
docker rm $(docker ps -a -q -f ancestor=hello-world)

# Ver ayuda de Docker
docker --help
```

---

## 🎨 Resultado Esperado

Al finalizar esta práctica, deberías ver algo similar a:

```bash
$ docker --version
Docker version 24.0.7, build afdd53b

$ docker compose version
Docker Compose version v2.23.3

$ docker run hello-world
Hello from Docker!
This message shows that your installation appears to be working correctly.
...
```

---

## 💡 Pistas

<details>
<summary>Pista 1: Docker no inicia en Linux</summary>

Asegúrate de que el servicio está activo:
```bash
sudo systemctl start docker
sudo systemctl enable docker
```

</details>

<details>
<summary>Pista 2: Error de permisos en Linux</summary>

Asegúrate de estar en el grupo docker:
```bash
sudo usermod -aG docker $USER
# Cierra sesión y vuelve a entrar, o ejecuta:
newgrp docker
```

</details>

<details>
<summary>Pista 3: Docker Desktop no inicia en Windows</summary>

- Verifica que WSL2 está instalado: `wsl --status`
- Verifica que Hyper-V está habilitado (si no usas WSL2)
- Reinicia el computador

</details>

---

## ✅ Criterios de Evaluación

| Criterio | Puntos |
|----------|--------|
| Docker instalado correctamente | 2 |
| Docker Compose instalado | 2 |
| Contenedor hello-world ejecutado | 2 |
| **Total** | **6** |

---

## 🚀 Desafío Extra (Opcional)

Si terminaste antes, intenta:

1. **Ejecutar un servidor web básico:**
   ```bash
   docker run -d -p 8080:80 nginx
   # Abre http://localhost:8080 en tu navegador
   ```

2. **Detener y eliminar el contenedor:**
   ```bash
   docker stop $(docker ps -q -f ancestor=nginx)
   docker rm $(docker ps -a -q -f ancestor=nginx)
   ```

---

## 📚 Recursos Relacionados

- [Docker Installation Guide](https://docs.docker.com/engine/install/)
- [Docker Desktop for Mac](https://docs.docker.com/desktop/install/mac-install/)
- [Docker Desktop for Windows](https://docs.docker.com/desktop/install/windows-install/)
- [Docker Post-installation Steps](https://docs.docker.com/engine/install/linux-postinstall/)

---

<div align="center">

| 🏠 Volver | Siguiente ▶️ |
|-----------|--------------|
| [Índice Prácticas](README.md) | [Práctica 02: Levantar n8n](practica-02-levantar-n8n.md) |

</div>
