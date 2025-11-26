# 🌐 Semana 04: HTTP Request y APIs

![n8n](https://img.shields.io/badge/n8n-Workflow_Automation-FF6D5A?style=flat-square&logo=n8n)
![APIs](https://img.shields.io/badge/APIs-REST_HTTP-00D4FF?style=flat-square)
![Duración](https://img.shields.io/badge/Duración-6_horas-00D4FF?style=flat-square)
![Nivel](https://img.shields.io/badge/Nivel-Intermedio-FFA500?style=flat-square)

---

## 📋 Descripción General

Esta semana aprenderás a conectar n8n con el mundo exterior a través de APIs REST. El nodo HTTP Request es uno de los más versátiles y poderosos de n8n, permitiéndote integrar prácticamente cualquier servicio que tenga una API.

Dominar las APIs es esencial para la automatización moderna. La mayoría de los servicios web ofrecen APIs REST que puedes consumir desde n8n para leer datos, crear registros, actualizar información y más.

También cubriremos métodos de autenticación comunes: API Keys, OAuth 2.0 y Bearer tokens.

---

## 🎯 Objetivos de Aprendizaje

Al finalizar esta semana, serás capaz de:

- [ ] Entender los fundamentos de APIs REST
- [ ] Usar el nodo HTTP Request para consumir APIs
- [ ] Implementar diferentes métodos HTTP (GET, POST, PUT, DELETE)
- [ ] Configurar autenticación con API Keys
- [ ] Configurar autenticación OAuth 2.0
- [ ] Manejar respuestas y errores de APIs
- [ ] Paginar resultados de APIs

---

## ⏱️ Distribución del Tiempo

| Actividad    | Tiempo      | Porcentaje |
| ------------ | ----------- | ---------- |
| 📚 Teoría    | 1.5 horas   | 25%        |
| 💻 Prácticas | 2 horas     | 33%        |
| 🔨 Proyecto  | 2.5 horas   | 42%        |
| **Total**    | **6 horas** | **100%**   |

---

## 📚 Contenido Teórico

| #   | Módulo                                                | Descripción                       | Tiempo |
| --- | ----------------------------------------------------- | --------------------------------- | ------ |
| 01  | [Fundamentos de APIs REST](1-teoria/01-apis-rest.md)  | HTTP, métodos, endpoints, headers | 30 min |
| 02  | [Nodo HTTP Request](1-teoria/02-http-request.md)      | Configuración y uso del nodo      | 30 min |
| 03  | [Autenticación en APIs](1-teoria/03-autenticacion.md) | API Keys, OAuth, Tokens           | 30 min |

---

## 💻 Prácticas

| #   | Práctica                                                          | Dificultad | Tiempo | Conceptos      |
| --- | ----------------------------------------------------------------- | ---------- | ------ | -------------- |
| 01  | [GET Request Básico](2-practicas/practica-01-get-basico.md)       | ⭐         | 25 min | GET, Response  |
| 02  | [POST con Datos](2-practicas/practica-02-post-datos.md)           | ⭐⭐       | 25 min | POST, Body     |
| 03  | [API con Autenticación](2-practicas/practica-03-autenticacion.md) | ⭐⭐       | 30 min | API Key        |
| 04  | [Manejo de Errores API](2-practicas/practica-04-errores-api.md)   | ⭐⭐       | 30 min | Error Handling |
| 05  | [Paginación de Resultados](2-practicas/practica-05-paginacion.md) | ⭐⭐⭐     | 30 min | Pagination     |

---

## 🔨 Proyecto Integrador

### Agregador de Datos Multi-API

**Descripción**: Crear un workflow que consuma múltiples APIs públicas, agregue los datos y genere un reporte consolidado.

| Documento                                         | Descripción                   |
| ------------------------------------------------- | ----------------------------- |
| [README.md](3-proyecto/README.md)                 | Especificaciones del proyecto |
| [GUIA-DISENO.md](3-proyecto/GUIA-DISENO.md)       | Arquitectura del sistema      |
| [EJEMPLOS-DATOS.md](3-proyecto/EJEMPLOS-DATOS.md) | APIs de prueba                |

---

## 📊 Evaluación

| Componente    | Peso | Puntos |
| ------------- | ---- | ------ |
| Teoría        | 20%  | 20     |
| Prácticas (5) | 30%  | 30     |
| Proyecto      | 50%  | 50     |

📋 Consulta la [Rúbrica de Evaluación](RUBRICA-EVALUACION.md) para criterios detallados.

---

## ✅ Checklist de Completitud

### Teoría

- [ ] Leí el módulo de APIs REST
- [ ] Leí el módulo de HTTP Request
- [ ] Leí el módulo de Autenticación

### Prácticas

- [ ] Completé todas las 5 prácticas

### Proyecto

- [ ] Creé el agregador multi-API
- [ ] Implementé al menos 2 APIs diferentes
- [ ] Documenté el workflow

---

## 🧭 Navegación del Bootcamp

```
Semanas:  01   02   03   04   05   06   07   08   09   10
                         ▼
         [ ]──[ ]──[ ]──[■]──[ ]──[ ]──[ ]──[ ]──[ ]──[ ]
                         │
                         └── Estás aquí: HTTP Request y APIs
```

---

## 💡 Tips de la Semana

### ✅ Buenas Prácticas

- Siempre lee la documentación de la API primero
- Usa Postman para probar endpoints antes de n8n
- Guarda las credenciales de forma segura

### ⚠️ Errores Comunes

- No incluir headers necesarios
- Olvidar el Content-Type en POST
- No manejar rate limits

---

<div align="center">

| ◀️ Anterior                         | 🏠 Inicio                           | Siguiente ▶️                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| [Semana 03](../semana-03/README.md) | [README Principal](../../README.md) | [Semana 05](../semana-05/README.md) |

</div>
