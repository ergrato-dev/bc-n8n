# Guía de Conventional Commits

Este proyecto utiliza [Conventional Commits](https://www.conventionalcommits.org/) para mantener un historial de cambios claro y semántico.

## 📋 Formato Básico

```
<type>(<scope>): <subject>

<body>

<footer>
```

## 🏷️ Tipos de Commit

### Principales

| Tipo       | Descripción                                           | Ejemplo                                            |
| ---------- | ----------------------------------------------------- | -------------------------------------------------- |
| `feat`     | Nueva funcionalidad o característica                  | `feat(modulo-01): add webhook exercise`            |
| `fix`      | Corrección de bug                                     | `fix(docker): resolve port conflict issue`         |
| `docs`     | Cambios en documentación                              | `docs(readme): update installation steps`          |
| `style`    | Cambios de formato (espacios, punto y coma, etc.)     | `style(assets): format SVG indentation`            |
| `refactor` | Refactorización de código (sin cambiar funcionalidad) | `refactor(workflows): reorganize folder structure` |
| `test`     | Agregar o modificar tests                             | `test(module-02): add validation tests`            |
| `chore`    | Tareas de mantenimiento                               | `chore(deps): update n8n to latest version`        |

### Secundarios

| Tipo     | Descripción                    | Ejemplo                                    |
| -------- | ------------------------------ | ------------------------------------------ |
| `perf`   | Mejora de performance          | `perf(docker): optimize Alpine image size` |
| `ci`     | Cambios en CI/CD               | `ci: add GitHub Actions workflow`          |
| `build`  | Cambios en el sistema de build | `build: configure Docker multi-stage`      |
| `revert` | Revertir un commit anterior    | `revert: revert "feat: add feature X"`     |

## 🎯 Scopes (Alcance)

Para este proyecto, usa estos scopes:

### Por Módulo

- `modulo-01` - Fundamentos
- `modulo-02` - Nodos y Datos
- `modulo-03` - Workflows Intermedios
- `modulo-04` - Nivel Avanzado

### Por Categoría

- `docs` - Documentación general
- `assets` - Recursos gráficos
- `docker` - Configuración Docker
- `config` - Archivos de configuración
- `workflows` - Workflows de ejemplo
- `exercises` - Ejercicios
- `projects` - Proyectos

### Ejemplos de Scopes

```bash
feat(modulo-01): add first workflow exercise
docs(readme): update module 2 objectives
fix(docker): resolve Alpine image permissions
style(assets): update banner SVG colors
chore(config): update copilot instructions
```

## 📝 Subject (Asunto)

- Usa imperativo en inglés: "add" no "added" ni "adds"
- Máximo 50 caracteres
- No terminar con punto
- Primera letra en minúscula
- Ser descriptivo pero conciso

✅ **Buenos ejemplos:**

```
add webhook tutorial
fix broken link in module 1
update installation instructions
remove deprecated exercises
```

❌ **Malos ejemplos:**

```
Added new file.
Fixed bug
Update
changes
```

## 📄 Body (Cuerpo)

Opcional pero recomendado para commits complejos:

- Separar del subject con línea en blanco
- Explicar el QUÉ y POR QUÉ (no el cómo)
- Máximo 72 caracteres por línea
- Usar viñetas con `-` o `*`

**Ejemplo:**

```
feat(modulo-02): add HTTP Request node exercise

- Create step-by-step tutorial for HTTP Request
- Include real API examples (JSONPlaceholder)
- Add error handling section
- Provide solution workflow JSON

This exercise helps students understand REST API integration,
which is fundamental for module 2 objectives.
```

## 🔖 Footer

Usa el footer para:

### Breaking Changes

```
feat(docker): migrate to Docker Compose

BREAKING CHANGE: Docker run commands no longer supported.
Users must use docker-compose.yml instead.
```

### Referencias a Issues

```
fix(modulo-01): correct exercise numbering

Fixes #23
Closes #45
Related to #67
```

## 🎨 Ejemplos Completos

### Ejemplo 1: Nueva Funcionalidad

```bash
git commit -m "feat(modulo-01): add n8n installation guide

- Document Docker Compose installation
- Include Alpine image configuration
- Add pnpm installation alternative
- Provide troubleshooting section

This completes the setup documentation for module 1"
```

### Ejemplo 2: Corrección de Bug

```bash
git commit -m "fix(assets): resolve broken SVG rendering

- Update viewBox dimensions
- Fix color contrast for dark theme
- Remove invalid attributes

Fixes #12"
```

### Ejemplo 3: Documentación

```bash
git commit -m "docs(modulo-02): expand triggers documentation

- Add detailed Webhook trigger explanation
- Include Schedule trigger examples
- Document Email trigger configuration"
```

### Ejemplo 4: Refactorización

```bash
git commit -m "refactor(structure): rename module folders with numbers

- Rename teoria/ to 1-teoria/
- Rename ejercicios/ to 2-ejercicios/
- Rename proyectos/ to 3-proyectos/
- Update all README references

This improves logical ordering and navigation"
```

### Ejemplo 5: Chore

```bash
git commit -m "chore(docker): update n8n to latest Alpine image

- Bump n8n image to latest-alpine
- Update docker-compose.yml environment variables
- Add health check configuration"
```

## 🚀 Workflow de Commits

### 1. Hacer cambios pequeños y atómicos

```bash
# ❌ NO hacer
git add .
git commit -m "update files"

# ✅ HACER
git add modulos/modulo-01-fundamentos/1-teoria/
git commit -m "docs(modulo-01): add fundamental concepts documentation"

git add modulos/modulo-01-fundamentos/2-ejercicios/
git commit -m "feat(modulo-01): add webhook basic exercise"
```

### 2. Verificar cambios antes de commit

```bash
git status
git diff
git add -p  # agregar por partes
```

### 3. Usar commits frecuentes

```bash
# Cada funcionalidad completa = 1 commit
# No esperar al final del día
```

## 🔍 Ver Historial

```bash
# Ver commits en formato corto
git log --oneline

# Ver commits con estadísticas
git log --stat

# Ver commits de un archivo específico
git log --oneline -- README.md

# Ver commits por autor
git log --author="nombre"

# Ver commits por tipo
git log --oneline --grep="^feat"
```

## 📊 Generar Changelog

Con Conventional Commits puedes generar changelogs automáticamente:

```bash
# Instalar standard-version
pnpm install -g standard-version

# Generar changelog
standard-version
```

## ✅ Checklist Pre-Commit

Antes de hacer commit, verifica:

- [ ] El tipo de commit es correcto
- [ ] El scope es específico y relevante
- [ ] El subject es imperativo y conciso
- [ ] Se explica el QUÉ y POR QUÉ (no el CÓMO)
- [ ] Se mencionan breaking changes si aplica
- [ ] Se referencian issues relacionados
- [ ] Los cambios son atómicos (una cosa a la vez)

## 🎓 Recursos Adicionales

- [Conventional Commits](https://www.conventionalcommits.org/)
- [Semantic Versioning](https://semver.org/)
- [Angular Commit Guidelines](https://github.com/angular/angular/blob/main/CONTRIBUTING.md#commit)
- [Commitizen](https://github.com/commitizen/cz-cli) - CLI helper para commits

---

**💡 Tip:** Usa un alias de Git para facilitar commits:

```bash
# Agregar a ~/.gitconfig
[alias]
  cm = commit -m
  ca = commit --amend
  cane = commit --amend --no-edit
```

Luego puedes hacer:

```bash
git cm "feat(modulo-01): add new exercise"
```
