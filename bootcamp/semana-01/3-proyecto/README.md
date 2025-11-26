# 🔨 Proyecto Integrador - Semana 01

## Sistema de Bienvenida Automatizado

---

## 📋 Información General

| Campo               | Valor                                       |
| ------------------- | ------------------------------------------- |
| **Nombre**          | Sistema de Bienvenida Automatizado          |
| **Dificultad**      | ⭐⭐                                        |
| **Tiempo Estimado** | 2-2.5 horas                                 |
| **Tipo**            | Workflow básico con transformación de datos |

---

## 🎯 Objetivos del Proyecto

Al completar este proyecto, habrás demostrado que puedes:

- [ ] Crear un workflow completo desde cero
- [ ] Configurar nodos con datos JSON
- [ ] Conectar múltiples nodos en secuencia
- [ ] Documentar el workflow con notas explicativas
- [ ] Exportar el workflow para compartir

---

## 📝 Descripción

### Contexto

Imagina que trabajas en una startup y necesitas automatizar el proceso de bienvenida para nuevos usuarios. Cuando un usuario se registra, el sistema debe generar un mensaje de bienvenida personalizado con su nombre y la fecha de registro.

### Requerimientos Funcionales

1. **Entrada de Datos**: El workflow debe recibir información del usuario:

   - Nombre completo
   - Email
   - Plan seleccionado (Free, Pro, Enterprise)

2. **Procesamiento**: El workflow debe:

   - Formatear el nombre (capitalizar)
   - Generar fecha y hora de registro
   - Crear mensaje de bienvenida personalizado

3. **Salida**: El workflow debe producir:
   - Mensaje de bienvenida completo
   - Datos del usuario formateados

---

## 🏗️ Arquitectura del Workflow

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Manual    │────▶│  Set Node   │────▶│  Set Node   │────▶│  Set Node   │
│   Trigger   │     │  (Datos     │     │  (Formatear │     │  (Mensaje   │
│             │     │   Usuario)  │     │   Datos)    │     │  Bienvenida)│
└─────────────┘     └─────────────┘     └─────────────┘     └─────────────┘
```

---

## 📋 Instrucciones

### Paso 1: Crear el Workflow

1. Abre n8n en `http://localhost:5678`
2. Crea un nuevo workflow
3. Nómbralo: `proyecto-01-bienvenida-usuario`

### Paso 2: Agregar Manual Trigger

1. Busca "Manual Trigger" en el panel de nodos
2. Arrástralo al canvas
3. Este será el inicio del workflow

### Paso 3: Agregar Datos del Usuario

1. Agrega un nodo "Set"
2. Nómbralo: `Datos del Usuario`
3. Configura los campos:

```json
{
  "nombre": "juan pérez",
  "email": "juan@example.com",
  "plan": "Pro"
}
```

### Paso 4: Formatear Datos

1. Agrega otro nodo "Set"
2. Nómbralo: `Formatear Datos`
3. Usa expresiones para:
   - Capitalizar el nombre
   - Agregar timestamp

### Paso 5: Generar Mensaje de Bienvenida

1. Agrega un nodo "Set" final
2. Nómbralo: `Mensaje de Bienvenida`
3. Crea el mensaje personalizado

### Paso 6: Documentar

1. Agrega notas a cada nodo explicando:
   - ¿Qué hace este nodo?
   - ¿Para qué sirve?

### Paso 7: Probar y Exportar

1. Ejecuta el workflow manualmente
2. Verifica que el output sea correcto
3. Exporta el workflow como JSON

---

## 🎨 Resultado Esperado

### Input (Datos del Usuario)

```json
{
  "nombre": "juan pérez",
  "email": "juan@example.com",
  "plan": "Pro"
}
```

### Output (Mensaje Final)

```json
{
  "mensaje": "¡Bienvenido Juan Pérez! Gracias por unirte con el plan Pro. Tu cuenta fue creada el 26/11/2025 a las 10:30.",
  "usuario": {
    "nombreFormateado": "Juan Pérez",
    "email": "juan@example.com",
    "plan": "Pro",
    "fechaRegistro": "2025-11-26T10:30:00.000Z"
  }
}
```

---

## ✅ Criterios de Evaluación

| Criterio              | Puntos | Descripción                          |
| --------------------- | ------ | ------------------------------------ |
| **Funcionalidad**     | 20     | El workflow se ejecuta correctamente |
| **Calidad**           | 15     | Nodos organizados y bien nombrados   |
| **Mejores Prácticas** | 10     | Notas explicativas, sin hardcoding   |
| **Documentación**     | 5      | README y captura incluidos           |
| **Total**             | **50** |                                      |

---

## 📦 Entregables

1. **Workflow JSON**: `proyecto-01-bienvenida-usuario.json`
2. **Captura de pantalla**: Ejecución exitosa del workflow
3. **Documentación**: Este README completado con tus notas

---

## 💡 Pistas

<details>
<summary>Pista 1: Capitalizar nombres</summary>

Usa la función `capitalize()` en expresiones:

```javascript
{
  {
    $json.nombre
      .split(' ')
      .map((word) => word.charAt(0).toUpperCase() + word.slice(1))
      .join(' ');
  }
}
```

</details>

<details>
<summary>Pista 2: Fecha actual</summary>

Usa `new Date()` o `$now` en expresiones:

```javascript
{
  {
    $now.format('DD/MM/YYYY');
  }
}
```

</details>

<details>
<summary>Pista 3: Concatenar mensaje</summary>

Usa template literals en expresiones:

```javascript
{
  {
    `¡Bienvenido ${$json.nombreFormateado}!`;
  }
}
```

</details>

---

## 🚀 Desafíos Extra (Opcionales)

### Nivel 1: Agregar validación

- Verifica que el email tenga formato válido

### Nivel 2: Diferentes mensajes por plan

- Usa un nodo IF para personalizar el mensaje según el plan

### Nivel 3: Agregar más campos

- Incluye país, idioma preferido, fuente de registro

---

## 🔗 Recursos Relacionados

- [Guía de Diseño](GUIA-DISENO.md)
- [Ejemplos de Datos](EJEMPLOS-DATOS.md)
- [Documentación Set Node](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.set/)
- [Expresiones en n8n](https://docs.n8n.io/code/expressions/)
