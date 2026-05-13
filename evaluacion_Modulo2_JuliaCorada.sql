# Evaluación Final Módulo 2: SQL
## Ejercicios
-- Para este ejercicio utilizaremos la bases de datos Sakila que hemos estado utilizando durante el repaso de SQL. 

USE sakila;

SELECT * FROM film; 

-- 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.

SELECT DISTINCT title Película
FROM film;

-- 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".

SELECT title Película
FROM film
WHERE rating = "PG-13";

-- 3. Encuentra el título y la descripción de todas las películas que contengan la cadena de caracteres "amazing" en su descripción.

SELECT title Nombre, description Descripción
FROM film
WHERE description LIKE "%amazing%";

-- 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.

SELECT title Película
FROM film
WHERE length > 120;

-- 5. Recupera los nombres y apellidos de todos los actores.
SELECT*FROM actor;

SELECT CONCAT(first_name, " ", last_name) Nombres_Actores
FROM actor;

SELECT first_name NOMBRE, last_name APELLIDO
FROM actor;

-- 6. Encuentra el nombre y apellidos de los actores que tengan "Gibson" en su apellido.

SELECT first_name NOMBRE, last_name APELLIDO
FROM actor
WHERE last_name = 'Gibson';

-- 7. Encuentra los nombres y apellidos de los actores que tengan un actor_id entre 10 y 20.

SELECT first_name NOMBRE, last_name APELLIDO, actor_id
FROM actor
WHERE actor_id BETWEEN 10 AND 20;

-- 8. Encuentra el título de las películas en la tabla `film` que no sean ni "R" ni "PG-13" en cuanto a su clasificación.

SELECT title Película, rating
FROM film
WHERE rating NOT IN ("R","PG-13");
			-- se me ocurren dos formas para hacerlo
SELECT title Película, rating
FROM film
WHERE rating != "R" AND rating != "PG-13";

-- 9. Encuentra la cantidad total de películas en cada clasificación de la tabla `film` y muestra la clasificación junto con el recuento.

SELECT COUNT(film_id) Cantidad_peliculas, rating Valoración
FROM film
GROUP BY rating;

-- 10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.

SELECT * FROM customer;
SELECT * FROM rental;

SELECT c.customer_id ID_Cliente, CONCAT(first_name, " ", last_name) Nombre_Cliente, COUNT(rental_id) Total_peliculas
FROM customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
GROUP BY ID_Cliente, Nombre_Cliente;

-- 11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.

SELECT*FROM category;
SELECT*FROM film_category;
SELECT*FROM inventory;
SELECT*FROM rental;


SELECT c.name Nombre_categoria, COUNT(r.rental_id) Total_alquileres 
FROM category c
INNER JOIN  film_category fc 
ON c.category_id = fc.category_id
INNER JOIN inventory i 
ON fc.film_id = i.film_id
INNER JOIN rental r 
ON i.inventory_id = r.inventory_id
GROUP BY Nombre_categoria;

-- 12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla `film` y muestra la clasificación junto con el promedio de duración.

SELECT ROUND(AVG(length), 2) Duracion_Promedio, rating
FROM film
GROUP BY rating;

-- 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".

SELECT * FROM actor;
SELECT * FROM film_actor;
SELECT * FROM film;

SELECT CONCAT(first_name, " ", last_name) 'Actores en Indian Love'
FROM actor a
INNER JOIN film_actor fa
ON a.actor_id = fa.actor_id
INNER JOIN film f
ON fa.film_id = f.film_id
WHERE f.title = 'Indian Love';

-- 14. Muestra el título de todas las películas que contengan la cadena de caracteres "dog" o "cat" en su descripción.

SELECT title AS 'titulo pelicula', description
FROM film
WHERE description LIKE "%dog%" OR description LIKE "%cat%";

-- 15. Hay algún actor o actriz que no aparezca en ninguna película en la tabla `film_actor`.
SELECT * FROM actor;
SELECT * FROM film_actor;
SELECT * FROM film;

SELECT a.actor_id, CONCAT(first_name, " ", last_name) Nombre_Actor
FROM actor a
LEFT JOIN film_actor fa
ON a.actor_id = fa.actor_id
WHERE fa.film_id IS NULL;

-- 16. Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.

SELECT title AS Titulo_pelicula, release_year AS Año_estreno
FROM film
WHERE release_year BETWEEN 2005 AND 2010;

-- 17. Encuentra el título de todas las películas que son de la misma categoría que "Family".
SELECT*FROM film;
SELECT*FROM category;
SELECT*FROM film_category;

SELECT f.title Nombre_pelicula 
FROM film f 
INNER JOIN film_category fc 
ON f.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
WHERE c.name = 'Family';

-- 18. Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.

SELECT * FROM film_actor;
SELECT * FROM actor;

SELECT CONCAT(a.first_name, " ", a.last_name) AS Nombre_actor, COUNT(fa.film_id) 'Número peliculas'
FROM actor a
INNER JOIN film_actor fa
ON a.actor_id = fa.actor_id
GROUP BY Nombre_actor
HAVING COUNT(film_id) > 10;


-- 19. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla `film`.

SELECT title AS nombre_pelicula
FROM film
WHERE rating = 'R' AND length > 120;

-- 20. Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y muestra el nombre de la categoría junto con el promedio de duración.
SELECT*FROM film;
SELECT*FROM film_category;
SELECT * FROM category;

SELECT c.name Categoría, ROUND(AVG(length), 2) duracion_promedio 
FROM film f
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON c.category_id = fc.category_id
GROUP BY c.name
HAVING duracion_promedio > 120;


-- 21. Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto con la cantidad de películas en las que han actuado.

SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM film_actor;

SELECT CONCAT(a.first_name, " ", a.last_name) AS nombre_actor, COUNT(f.film_id) AS numero_peliculas
FROM film f
INNER JOIN film_actor fa
ON f.film_id = fa.film_id
INNER JOIN actor a
ON fa.actor_id = a.actor_id
GROUP BY nombre_actor
HAVING COUNT(f.film_id) >= 5;

-- 22. Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. 
	-- Utiliza una subconsulta para encontrar los rental_ids con una duración superior a 5 días y luego selecciona las películas correspondientes.
SELECT * FROM film;
SELECT * FROM rental;
SELECT * FROM inventory;

SELECT f.title AS Nombre_pelicula 
FROM film f
WHERE f.film_id IN (
	SELECT i.film_id
	FROM inventory i
	WHERE i.inventory_id IN(
		SELECT r.inventory_id 
		FROM rental r
		WHERE DATEDIFF(r.return_date, r.rental_date) > 5));

-- 23. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría "Horror".
	-- Utiliza una subconsulta para encontrar los actores que han actuado en películas de la categoría "Horror" y luego exclúyelos de la lista de actores.

SELECT * FROM actor;
SELECT * FROM film_actor;
SELECT * FROM film_category;
SELECT * FROM category;
SELECT * FROM film;


SELECT CONCAT(a.first_name, " ", a.last_name) AS nombre_actor
FROM actor a
WHERE a.actor_id NOT IN(
	SELECT fa.actor_id
	FROM  category c
	INNER JOIN film_category fc
		ON c.category_id = fc.category_id
	INNER JOIN film_actor fa
		ON fc.film_id = fa.film_id
	WHERE c.name = 'Horror');

-- 24. Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla `film`.

SELECT * FROM film;
SELECT * FROM film_category;
SELECT * FROM category;

SELECT f.title AS nombre_pelicula 
FROM film f
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
WHERE f.length > 180 AND c.name = 'Comedy';








