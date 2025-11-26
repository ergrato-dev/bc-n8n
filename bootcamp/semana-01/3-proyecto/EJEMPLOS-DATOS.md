# 📊 Ejemplos de Datos - Sistema de Bienvenida

## 🧪 Datos de Prueba

Este archivo contiene conjuntos de datos para probar el workflow del proyecto.

---

## 📋 Dataset 1: Usuarios Estándar

### Usuario 1 - Plan Free

```json
{
  "nombre": "juan pérez",
  "email": "juan.perez@gmail.com",
  "plan": "Free"
}
```

**Output Esperado:**
```json
{
  "mensaje": "¡Bienvenido Juan Pérez! Gracias por unirte con el plan Free. Tu cuenta fue creada el 15/01/2025 a las 10:30.",
  "usuario": {
    "nombreFormateado": "Juan Pérez",
    "email": "juan.perez@gmail.com",
    "plan": "Free",
    "fechaRegistro": "2025-01-15T10:30:00.000Z"
  }
}
```

---

### Usuario 2 - Plan Pro

```json
{
  "nombre": "maría garcía lópez",
  "email": "maria.garcia@empresa.com",
  "plan": "Pro"
}
```

**Output Esperado:**
```json
{
  "mensaje": "¡Bienvenido María García López! Gracias por unirte con el plan Pro. Tu cuenta fue creada el 15/01/2025 a las 11:45.",
  "usuario": {
    "nombreFormateado": "María García López",
    "email": "maria.garcia@empresa.com",
    "plan": "Pro",
    "fechaRegistro": "2025-01-15T11:45:00.000Z"
  }
}
```

---

### Usuario 3 - Plan Enterprise

```json
{
  "nombre": "carlos alberto ramírez",
  "email": "c.ramirez@corporativo.com",
  "plan": "Enterprise"
}
```

**Output Esperado:**
```json
{
  "mensaje": "¡Bienvenido Carlos Alberto Ramírez! Gracias por unirte con el plan Enterprise. Tu cuenta fue creada el 15/01/2025 a las 14:20.",
  "usuario": {
    "nombreFormateado": "Carlos Alberto Ramírez",
    "email": "c.ramirez@corporativo.com",
    "plan": "Enterprise",
    "fechaRegistro": "2025-01-15T14:20:00.000Z"
  }
}
```

---

## 📋 Dataset 2: Casos Especiales

### Usuario 4 - Nombre Simple

```json
{
  "nombre": "ana",
  "email": "ana@test.com",
  "plan": "Free"
}
```

**Output Esperado:**
- Nombre formateado: `Ana` (una sola palabra)

---

### Usuario 5 - Nombre Compuesto

```json
{
  "nombre": "josé de la cruz mendoza",
  "email": "jose.cruz@mail.com",
  "plan": "Pro"
}
```

**Output Esperado:**
- Nombre formateado: `José De La Cruz Mendoza`

---

### Usuario 6 - Email Corporativo

```json
{
  "nombre": "elena martínez",
  "email": "e.martinez@mi-empresa.com.mx",
  "plan": "Enterprise"
}
```

---

## 📋 Dataset 3: Batch de Usuarios

Para practicar con múltiples items, usa este array en un Code node:

```javascript
/**
 * Generador de usuarios de prueba
 * Propósito: Crear múltiples items para testing del workflow
 */
const testUsers = [
  {
    nombre: "usuario uno",
    email: "user1@test.com",
    plan: "Free"
  },
  {
    nombre: "usuario dos",
    email: "user2@test.com",
    plan: "Pro"
  },
  {
    nombre: "usuario tres",
    email: "user3@test.com",
    plan: "Enterprise"
  },
  {
    nombre: "usuario cuatro",
    email: "user4@test.com",
    plan: "Free"
  },
  {
    nombre: "usuario cinco",
    email: "user5@test.com",
    plan: "Pro"
  }
];

// Retornar como items de n8n
return testUsers.map(user => ({ json: user }));
```

---

## 📋 Dataset 4: Datos Inválidos (Para Validación)

### Usuario con Email Inválido

```json
{
  "nombre": "usuario test",
  "email": "email-sin-arroba",
  "plan": "Free"
}
```

**Comportamiento Esperado:**
- Si implementas validación: El workflow debe detectar y manejar este caso
- Sin validación: El workflow procesará normalmente

---

### Usuario sin Plan

```json
{
  "nombre": "usuario sin plan",
  "email": "test@email.com",
  "plan": ""
}
```

**Comportamiento Esperado:**
- Deberías considerar un valor por defecto o validación

---

### Usuario con Nombre Vacío

```json
{
  "nombre": "",
  "email": "empty@test.com",
  "plan": "Free"
}
```

**Comportamiento Esperado:**
- La función de capitalización retornará string vacío
- Considera añadir validación

---

## 🎯 Casos de Uso por Dificultad

### ⭐ Básico - Un Usuario

```json
{
  "nombre": "test user",
  "email": "test@example.com",
  "plan": "Free"
}
```

### ⭐⭐ Intermedio - Usuarios por Plan

```javascript
// Para usar con nodo IF o Switch
const usersByPlan = {
  free: [
    { nombre: "free user 1", email: "free1@test.com", plan: "Free" },
    { nombre: "free user 2", email: "free2@test.com", plan: "Free" }
  ],
  pro: [
    { nombre: "pro user 1", email: "pro1@test.com", plan: "Pro" },
    { nombre: "pro user 2", email: "pro2@test.com", plan: "Pro" }
  ],
  enterprise: [
    { nombre: "enterprise user", email: "enterprise@test.com", plan: "Enterprise" }
  ]
};
```

### ⭐⭐⭐ Avanzado - Datos Realistas

```javascript
/**
 * Generador de datos realistas para testing
 * Simula datos que vendrían de un sistema de registro real
 */
const realisticUsers = [
  {
    nombre: "alejandro sánchez",
    email: "a.sanchez@startup.io",
    plan: "Pro",
    fuente: "Google Ads",
    pais: "México",
    idioma: "es"
  },
  {
    nombre: "sarah johnson",
    email: "sarah.j@company.us",
    plan: "Enterprise",
    fuente: "Referido",
    pais: "Estados Unidos",
    idioma: "en"
  },
  {
    nombre: "pedro costa",
    email: "pcosta@empresa.br",
    plan: "Free",
    fuente: "Orgánico",
    pais: "Brasil",
    idioma: "pt"
  }
];

return realisticUsers.map(user => ({ json: user }));
```

---

## 📐 Esquemas de Validación

### Esquema JSON Schema

```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "UserRegistration",
  "type": "object",
  "required": ["nombre", "email", "plan"],
  "properties": {
    "nombre": {
      "type": "string",
      "minLength": 1,
      "description": "Nombre completo del usuario"
    },
    "email": {
      "type": "string",
      "format": "email",
      "description": "Email válido del usuario"
    },
    "plan": {
      "type": "string",
      "enum": ["Free", "Pro", "Enterprise"],
      "description": "Plan seleccionado"
    }
  }
}
```

### Función de Validación (Para Code Node)

```javascript
/**
 * Validador de datos de entrada
 * 
 * ¿Qué hace? Verifica que los datos del usuario sean válidos
 * ¿Para qué? Prevenir errores en nodos posteriores
 * ¿Cómo? Valida presencia de campos y formato de email
 */
function validateUserData(userData) {
  const errors = [];
  
  // Validar nombre
  if (!userData.nombre || userData.nombre.trim().length < 1) {
    errors.push("El nombre es requerido");
  }
  
  // Validar email
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!userData.email || !emailRegex.test(userData.email)) {
    errors.push("El email no es válido");
  }
  
  // Validar plan
  const validPlans = ["Free", "Pro", "Enterprise"];
  if (!userData.plan || !validPlans.includes(userData.plan)) {
    errors.push("El plan debe ser Free, Pro o Enterprise");
  }
  
  return {
    isValid: errors.length === 0,
    errors: errors
  };
}

// Uso en el workflow
const validation = validateUserData($json);
if (!validation.isValid) {
  throw new Error(`Datos inválidos: ${validation.errors.join(", ")}`);
}
```

---

## 🔄 Generador de Datos Aleatorios

Para pruebas extensivas, usa este generador:

```javascript
/**
 * Generador de usuarios aleatorios
 * Útil para testing de volumen y edge cases
 */
const nombres = ["juan", "maría", "carlos", "ana", "pedro", "elena", "diego", "lucía"];
const apellidos = ["garcía", "martínez", "lópez", "rodríguez", "sánchez", "pérez"];
const dominios = ["gmail.com", "hotmail.com", "empresa.com", "test.io"];
const planes = ["Free", "Pro", "Enterprise"];

function generateRandomUser() {
  const nombre = nombres[Math.floor(Math.random() * nombres.length)];
  const apellido = apellidos[Math.floor(Math.random() * apellidos.length)];
  const dominio = dominios[Math.floor(Math.random() * dominios.length)];
  const plan = planes[Math.floor(Math.random() * planes.length)];
  
  return {
    nombre: `${nombre} ${apellido}`,
    email: `${nombre}.${apellido}@${dominio}`,
    plan: plan
  };
}

// Generar 10 usuarios aleatorios
const randomUsers = Array.from({ length: 10 }, () => generateRandomUser());
return randomUsers.map(user => ({ json: user }));
```

---

## 📚 Recursos Adicionales

- [JSON Generator Online](https://www.json-generator.com/)
- [Mockaroo - Realistic Data Generator](https://www.mockaroo.com/)
- [n8n Data Structure Documentation](https://docs.n8n.io/data/data-structure/)
