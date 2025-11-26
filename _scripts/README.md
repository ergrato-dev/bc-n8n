# 🔧 Scripts - bc-n8n

## 📋 Descripción

Scripts de automatización y utilidades para el bootcamp de n8n.

---

## 📁 Scripts Disponibles

| Script                     | Descripción                      |
| -------------------------- | -------------------------------- |
| `autocommit.sh`            | Commit automático cada 5 minutos |
| `setup-autocommit-cron.sh` | Configurar cron job en Fedora 43 |

---

## 🔄 Autocommit

### What? (¿Qué hace?)

Script que realiza commits automáticos cada 5 minutos usando **Conventional Commits** en inglés.

### For? (¿Para qué?)

- Backup automático del trabajo en progreso
- Rastrear cambios incrementales durante el desarrollo
- Prevenir pérdida de trabajo por problemas inesperados

### Impact? (¿Impacto?)

- Commits automáticos con mensajes significativos
- Historial de git limpio con conventional commits
- Se ejecuta como cron job cada 5 minutos

---

## 🚀 Instalación Rápida (Fedora 43)

```bash
# 1. Dar permisos de ejecución
chmod +x _scripts/autocommit.sh
chmod +x _scripts/setup-autocommit-cron.sh

# 2. Instalar cron job
./_scripts/setup-autocommit-cron.sh install

# 3. Verificar estado
./_scripts/setup-autocommit-cron.sh status
```

---

## 📝 Uso Manual

### Ejecutar autocommit manualmente

```bash
./_scripts/autocommit.sh
```

### Gestionar cron job

```bash
# Instalar
./_scripts/setup-autocommit-cron.sh install

# Desinstalar
./_scripts/setup-autocommit-cron.sh uninstall

# Ver estado
./_scripts/setup-autocommit-cron.sh status
```

### Configuración manual de cron

```bash
# Editar crontab
crontab -e

# Agregar línea (cada 5 minutos)
*/5 * * * * /home/epti/Documents/epti-dev/bc-channel/bc-n8n/_scripts/autocommit.sh
```

---

## 📊 Formato de Commits

Los commits siguen el formato **Conventional Commits**:

```
<type>(<scope>): <description>

What: <qué hace el commit>
For: <para qué sirve>
Impact: <archivos afectados>

Files changed:
<lista de archivos>
```

### Tipos de commit

| Tipo    | Uso                               |
| ------- | --------------------------------- |
| `docs`  | Documentación, bootcamp, markdown |
| `feat`  | Nuevos workflows, funcionalidades |
| `chore` | Scripts, configuración            |
| `style` | Assets, estilos                   |

### Scopes

| Scope       | Carpeta               |
| ----------- | --------------------- |
| `semana-XX` | `bootcamp/semana-XX/` |
| `scripts`   | `_scripts/`           |
| `docs`      | `_docs/`              |
| `assets`    | `_assets/`            |
| `workflows` | `workflows/`          |

---

## 📋 Logs

Los logs se guardan en `_scripts/autocommit.log`:

```bash
# Ver últimos logs
tail -20 _scripts/autocommit.log

# Seguir logs en tiempo real
tail -f _scripts/autocommit.log
```

---

## ⚙️ Requisitos (Fedora 43)

- **Git** - Sistema de control de versiones
- **cronie** - Implementación de cron para Fedora

```bash
# Instalar cronie si no está instalado
sudo dnf install -y cronie

# Habilitar e iniciar servicio
sudo systemctl enable --now crond
```

---

## 🛠️ Personalización

### Cambiar intervalo de commits

Editar el cron schedule en `setup-autocommit-cron.sh`:

```bash
# Cada 5 minutos (default)
CRON_SCHEDULE="*/5 * * * *"

# Cada 10 minutos
CRON_SCHEDULE="*/10 * * * *"

# Cada hora
CRON_SCHEDULE="0 * * * *"
```

### Habilitar auto-push

Descomentar en `autocommit.sh`:

```bash
# Optional: Auto-push (uncomment if needed)
git push origin main
```

---

## 🔗 Referencias

- [Conventional Commits](https://www.conventionalcommits.org/)
- [Cron en Fedora](https://docs.fedoraproject.org/en-US/quick-docs/cron/)
- [cronie Documentation](https://github.com/cronie-crond/cronie)
