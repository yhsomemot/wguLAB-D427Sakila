-- Your SELECT statement goes here
SELECT film.title
FROM film
INNER JOIN 
( SELECT film_id, COUNT(film_id) AS count_film_id
   FROM inventory
   GROUP BY film_id ) 
AS temp_table ON film.film_id = temp_table.film_id
WHERE temp_table.count_film_id = 
-- Use the following subquery:
  ( SELECT MIN(count_film_id) FROM 
      ( SELECT COUNT(film_id) AS count_film_id
        FROM inventory
        GROUP BY film_id ) 
    AS temp_table );
