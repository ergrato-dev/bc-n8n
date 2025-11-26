# 🗄️ Semana 06: Integraciones Populares II

![n8n](https://img.shields.io/badge/n8n-Workflow_Automation-FF6D5A?style=flat-square&logo=n8n)
![Databases](https://img.shields.io/badge/Databases-MySQL_PostgreSQL-336791?style=flat-square&logo=postgresql)
![CRM](https://img.shields.io/badge/CRM-HubSpot_Salesforce-FF7A59?style=flat-square)
![Duración](https://img.shields.io/badge/Duración-6_horas-00D4FF?style=flat-square)
![Nivel](https://img.shields.io/badge/Nivel-Intermedio-FFA500?style=flat-square)

---

## 📋 Descripción General

Esta semana expandimos nuestro repertorio de integraciones con bases de datos relacionales (MySQL, PostgreSQL), CRMs (HubSpot, Salesforce) y servicios de almacenamiento (Google Drive, Dropbox).

Las bases de datos son el corazón de muchas aplicaciones empresariales. Aprender a conectar n8n con ellas te permitirá automatizar procesos de sincronización, backups, reportes y más.

Los CRMs son esenciales para equipos de ventas y marketing, y poder automatizar la gestión de contactos y oportunidades es un caso de uso muy valioso.

---

## 🎯 Objetivos de Aprendizaje

Al finalizar esta semana, serás capaz de:

- [ ] Conectar n8n con MySQL y PostgreSQL
- [ ] Ejecutar queries SQL desde n8n
- [ ] Integrar con HubSpot o Salesforce
- [ ] Sincronizar datos entre sistemas
- [ ] Usar Google Drive y Dropbox para archivos
- [ ] Crear workflows de backup automatizado
- [ ] Manejar transacciones de datos

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

| #   | Módulo                                                | Descripción                 | Tiempo |
| --- | ----------------------------------------------------- | --------------------------- | ------ |
| 01  | [Bases de Datos en n8n](1-teoria/01-bases-datos.md)   | MySQL, PostgreSQL, queries  | 30 min |
| 02  | [CRMs: HubSpot y Salesforce](1-teoria/02-crms.md)     | Contactos, deals, pipelines | 30 min |
| 03  | [Almacenamiento Cloud](1-teoria/03-almacenamiento.md) | Google Drive, Dropbox       | 30 min |

---

## 💻 Prácticas

| #   | Práctica                                                     | Dificultad | Tiempo | Conceptos  |
| --- | ------------------------------------------------------------ | ---------- | ------ | ---------- |
| 01  | [Conectar MySQL](2-practicas/practica-01-mysql.md)           | ⭐⭐       | 25 min | MySQL      |
| 02  | [Query PostgreSQL](2-practicas/practica-02-postgresql.md)    | ⭐⭐       | 25 min | PostgreSQL |
| 03  | [Crear Contacto HubSpot](2-practicas/practica-03-hubspot.md) | ⭐⭐       | 30 min | CRM        |
| 04  | [Subir Archivo Drive](2-practicas/practica-04-drive.md)      | ⭐⭐       | 30 min | Storage    |
| 05  | [Sync DB a CRM](2-practicas/practica-05-sync-db-crm.md)      | ⭐⭐⭐     | 30 min | Sync       |

---

## 🔨 Proyecto Integrador

### Sistema de Sincronización CRM-Database

**Descripción**: Crear un sistema que sincronice contactos entre una base de datos y un CRM, manteniendo ambos sistemas actualizados bidirecccionalmente.

| Documento                                         | Descripción                   |
| ------------------------------------------------- | ----------------------------- |
| [README.md](3-proyecto/README.md)                 | Especificaciones del proyecto |
| [GUIA-DISENO.md](3-proyecto/GUIA-DISENO.md)       | Arquitectura del sistema      |
| [EJEMPLOS-DATOS.md](3-proyecto/EJEMPLOS-DATOS.md) | Schema y datos de prueba      |

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

- [ ] Leí el módulo de Bases de Datos
- [ ] Leí el módulo de CRMs
- [ ] Leí el módulo de Almacenamiento

### Prácticas

- [ ] Completé todas las 5 prácticas

### Proyecto

- [ ] Creé el sistema de sincronización
- [ ] Probé la sincronización bidireccional
- [ ] Documenté el workflow

---

## 🧭 Navegación del Bootcamp

```
Semanas:  01   02   03   04   05   06   07   08   09   10
                                   ▼
         [ ]──[ ]──[ ]──[ ]──[ ]──[■]──[ ]──[ ]──[ ]──[ ]
                                   │
                                   └── Estás aquí: Integraciones Populares II
```

---

## 💡 Tips de la Semana

### ✅ Buenas Prácticas

- Usa conexiones SSL para bases de datos en producción
- Implementa manejo de errores para queries
- Limita las filas retornadas en queries grandes

### ⚠️ Errores Comunes

- Credenciales de DB incorrectas
- No escapar valores en queries
- Olvidar cerrar conexiones

---

<div align="center">

| ◀️ Anterior                         | 🏠 Inicio                           | Siguiente ▶️                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| [Semana 05](../semana-05/README.md) | [README Principal](../../README.md) | [Semana 07](../semana-07/README.md) |

</div>
