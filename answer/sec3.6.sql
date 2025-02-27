-- Your SELECT statment goes here
SELECT 
  a.last_name, 
  a.first_name, 
  ROUND(AVG(f.length)) AS average
FROM 
  actor a
JOIN 
  film_actor fa ON a.actor_id = fa.actor_id
JOIN 
  film f ON fa.film_id = f.film_id
GROUP BY 
  a.actor_id
HAVING 
  COUNT(f.film_id) > 0
ORDER BY 
  average DESC, 
  a.last_name ASC;
