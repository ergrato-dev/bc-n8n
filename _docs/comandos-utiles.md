# Comandos Útiles para el Bootcamp n8n

Esta guía contiene comandos rápidos para trabajar con el proyecto del bootcamp.

## 🐳 Docker Commands

### Iniciar n8n

```bash
docker compose up -d
```

### Ver el estado de los contenedores

```bash
docker compose ps
```

### Ver logs en tiempo real

```bash
docker compose logs -f n8n
```

### Detener n8n

```bash
docker compose down
```

### Reiniciar n8n

```bash
docker compose restart
```

### Actualizar imagen de n8n

```bash
docker compose pull
docker compose up -d
```

### Eliminar todo (incluyendo volúmenes)

```bash
docker compose down -v
```

### Acceder al contenedor (shell)

```bash
docker compose exec n8n sh
```

## 🌐 Acceder a n8n

### En Linux/macOS

```bash
xdg-open http://localhost:5678
```

O simplemente abre tu navegador en: **http://localhost:5678**

### En Windows

```powershell
start http://localhost:5678
```

## 📝 Git Commands (Conventional Commits)

### Ver estado del repositorio

```bash
git status
```

### Ver cambios realizados

```bash
git diff
```

### Agregar archivos específicos

```bash
git add ruta/al/archivo.md
```

### Agregar todos los archivos modificados

```bash
git add .
```

### Ver qué está en staging

```bash
git status --short
```

### Hacer commit (ejemplos)

#### Nueva funcionalidad

```bash
git commit -m "feat(modulo-01): add webhook basic exercise"
```

#### Corrección de bug

```bash
git commit -m "fix(docker): resolve port conflict"
```

#### Documentación

```bash
git commit -m "docs(readme): update installation steps"
```

#### Recursos gráficos

```bash
git commit -m "style(assets): update banner SVG colors"
```

#### Mantenimiento

```bash
git commit -m "chore(deps): update n8n to latest version"
```

### Commit con cuerpo explicativo

```bash
git commit -m "feat(modulo-02): add HTTP Request tutorial

- Create step-by-step guide
- Include API examples
- Add error handling section"
```

### Ver historial de commits

```bash
git log --oneline
```

### Ver últimos 5 commits

```bash
git log --oneline -5
```

### Ver cambios de un commit específico

```bash
git show <commit-hash>
```

### Deshacer último commit (mantener cambios)

```bash
git reset --soft HEAD~1
```

### Deshacer cambios en un archivo

```bash
git checkout -- archivo.md
```

## 📦 pnpm Commands (si instalas localmente)

### Instalar pnpm globalmente

```bash
npm install -g pnpm
```

### Instalar n8n con pnpm

```bash
pnpm install -g n8n
```

### Iniciar n8n (instalación local)

```bash
n8n start
```

### Actualizar n8n

```bash
pnpm update -g n8n
```

## 🔍 Comandos de Verificación

### Verificar que Docker está corriendo

```bash
docker ps
```

### Verificar que n8n está accesible

```bash
curl http://localhost:5678/healthz
```

### Ver uso de recursos del contenedor

```bash
docker stats n8n-bootcamp
```

### Ver volúmenes de Docker

```bash
docker volume ls | grep n8n
```

## 📂 Navegación del Proyecto

### Listar estructura de directorios

```bash
tree -L 2
```

### O con ls

```bash
ls -la
```

### Buscar archivos por nombre

```bash
find . -name "*.md"
```

### Buscar contenido en archivos

```bash
grep -r "texto a buscar" .
```

## 🛠️ Workflow de Trabajo Recomendado

### 1. Iniciar n8n

```bash
docker compose up -d
```

### 2. Verificar que está corriendo

```bash
docker compose ps
docker compose logs -f n8n
```

### 3. Trabajar en tus archivos

```bash
# Edita los archivos con tu editor favorito
```

### 4. Ver cambios realizados

```bash
git status
git diff
```

### 5. Agregar cambios al staging

```bash
git add modulos/modulo-01-fundamentos/1-teoria/
```

### 6. Hacer commit

```bash
git commit -m "docs(modulo-01): add fundamental concepts"
```

### 7. Repetir pasos 3-6 para cada cambio atómico

### 8. Al terminar el día, detener n8n

```bash
docker compose down
```

## 🚨 Solución de Problemas Comunes

### Error: "port 5678 already in use"

```bash
# Ver qué está usando el puerto
lsof -i :5678

# Detener n8n
docker compose down

# Matar proceso si es necesario
kill -9 <PID>
```

### Error: "Cannot connect to Docker daemon"

```bash
# Iniciar Docker
sudo systemctl start docker

# O en macOS/Windows
# Abrir Docker Desktop
```

### Error de permisos en volúmenes

```bash
# Cambiar permisos de la carpeta .n8n
sudo chown -R $USER:$USER ~/.n8n
```

### Limpiar todo y empezar de cero

```bash
docker compose down -v
docker volume prune
docker compose up -d
```

## 💡 Tips y Atajos

### Alias útiles para .zshrc o .bashrc

```bash
# Agregar al final de ~/.zshrc

# Docker Compose shortcuts
alias dcup='docker compose up -d'
alias dcdown='docker compose down'
alias dclog='docker compose logs -f'
alias dcps='docker compose ps'

# Git shortcuts
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit -m'
alias gl='git log --oneline'

# n8n
alias n8n-start='docker compose up -d && echo "n8n iniciado en http://localhost:5678"'
alias n8n-stop='docker compose down'
alias n8n-logs='docker compose logs -f n8n'
```

### Después de agregar los alias, recargar la configuración

```bash
source ~/.zshrc
```

### Ahora puedes usar

```bash
dcup          # En lugar de: docker compose up -d
n8n-start     # Inicia n8n con mensaje
gs            # En lugar de: git status
gc "feat: add exercise"  # En lugar de: git commit -m "feat: add exercise"
```

## 📚 Referencias Rápidas

- **n8n Docs**: https://docs.n8n.io/
- **Docker Compose Docs**: https://docs.docker.com/compose/
- **Conventional Commits**: https://www.conventionalcommits.org/
- **pnpm Docs**: https://pnpm.io/

---

**💡 Consejo:** Guarda este archivo en tus marcadores o imprímelo para tener acceso rápido mientras trabajas en el bootcamp.
