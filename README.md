# 🎬 Sakila SQL — Evaluación Módulo 2

Consultas SQL sobre la base de datos **Sakila**, una base de datos de ejemplo que simula una tienda de alquiler de películas. Contiene tablas de películas, actores, clientes, alquileres, categorías... todo lo que necesitas para practicar SQL de verdad.

Este repositorio recoge los **24 ejercicios** de la evaluación final del Módulo 2, que van desde selects básicos hasta subconsultas anidadas pasando por joins múltiples y funciones de agregación.

---

## 🗂️ Estructura del proyecto

```
📁 evaluacion-modulo2/
├── evaluacion_Modulo2_JuliaCorada.sql   ← todas las consultas
└── README.md                            ← estás aquí
```

---

## 🚀 Cómo ejecutarlo

### Requisitos previos
- **MySQL 8+** instalado en tu máquina
- La base de datos **Sakila** cargada _(si no la tienes, [descárgala aquí](https://dev.mysql.com/doc/index-other.html))_
- Un cliente SQL: MySQL Workbench, DBeaver, TablePlus... el que prefieras

### Pasos

1. Clona este repositorio:
   ```bash
   git clone <(https://github.com/Adalab/bda-modulo-2-evaluacion-final-juliacorada.git)>
   ```

2. Abre el archivo `.sql` en tu cliente

3. Asegúrate de seleccionar la base de datos al inicio:
   ```sql
   USE sakila;
   ```

4. Ejecuta las queries una a una o selecciona las que quieras explorar 🎯

---

## 🧠 Qué se practica

| Concepto | Ejercicios |
|---|---|
| `SELECT`, `DISTINCT`, `WHERE` | 1 – 4 |
| Operadores: `LIKE`, `BETWEEN`, `NOT IN` | 3, 7, 8, 14 |
| Funciones agregadas: `COUNT`, `AVG`, `ROUND` | 9, 12, 20 |
| `GROUP BY` + `HAVING` | 9, 18, 20, 21 |
| `INNER JOIN` y `LEFT JOIN` | 10, 11, 13, 15, 17 |
| Joins múltiples (3+ tablas) | 11, 13, 17, 20, 21 |
| Subconsultas (`IN`, `NOT IN`) | 22, 23 |
| Combinación de todo lo anterior | 24 |

---

## 🎥 Sobre la base de datos Sakila

Sakila es la base de datos de ejemplo oficial de MySQL. Modela una cadena de videoclubs (sí, de esos de antes 📼) con:

- **film** — catálogo de películas con clasificación, duración y descripción
- **actor** — actores y su relación con las películas
- **customer** — clientes registrados en la tienda
- **rental** — registro de cada alquiler con fechas
- **inventory** — copias físicas disponibles por tienda
- **category** — géneros cinematográficos
- **film_category / film_actor** — tablas intermedias de las relaciones N:M

---

> 🍿 *Porque los datos también merecen una buena peli.*
