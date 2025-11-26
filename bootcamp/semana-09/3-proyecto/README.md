# 🔨 Proyecto Integrador - Semana 09

## Motor de Reglas de Negocio

---

## 📋 Información General

| Campo               | Valor                      |
| ------------------- | -------------------------- |
| **Nombre**          | Motor de Reglas de Negocio |
| **Dificultad**      | ⭐⭐⭐                     |
| **Tiempo Estimado** | 2-2.5 horas                |

---

## 🎯 Objetivos

- [ ] Crear Code node con motor de reglas
- [ ] Implementar reglas configurables
- [ ] Procesar datos según condiciones
- [ ] Documentar código siguiendo estándares

---

## 🏗️ Arquitectura

```javascript
/**
 * Motor de Reglas de Negocio
 *
 * ¿Qué hace? Evalúa datos contra reglas configuradas
 * ¿Para qué? Automatizar decisiones de negocio
 * ¿Cómo? Itera reglas y aplica condiciones
 */

const rules = [
  {
    name: 'highValueCustomer',
    condition: (item) => item.json.totalPurchases > 1000,
    action: 'premium',
  },
];

// Procesar items con reglas
return $input.all().map((item) => ({
  json: {
    ...item.json,
    tier: applyRules(item, rules),
  },
}));
```

---

## 📦 Entregables

1. Workflow con motor de reglas
2. Al menos 5 reglas implementadas
3. Documentación completa del código
