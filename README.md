# wguLAB-D427Sec3

- 3.6 LAB - Multiple joins with aggregate (Sakila)
Refer to the film, actor, and film_actor tables of the Sakila database. The tables in this lab have the same columns and data types but fewer rows.

Write a query that:

Computes the average length of all films that each actor appears in.
Rounds average length to the nearest minute and renames the result column "average".
Displays last name, first name, and average, in that order, for each actor.
Sorts the result in descending order by average, then ascending order by last name.
The query should exclude films with no actors and actors that do not appear in films.

Hint: Use the ROUND() and AVG() functions.

[answer](https://github.com/yhsomemot/wguLAB-D427Sec3/blob/main/answer/sec3.6.sql)

---

- 3.7 LAB - Nested aggregates (Sakila)
Refer to the film and inventory tables of the Sakila database. The tables in this lab have the same columns and data types but fewer rows.

Write a query that lists the titles of films with the fewest rows in the inventory table.

This query requires a subquery that computes the minimum of counts by film_id:

[answer](https://github.com/yhsomemot/wguLAB-D427Sec3/blob/main/answer/sec3.7.sql)
