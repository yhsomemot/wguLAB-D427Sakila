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

---

- 4.12 LAB - Implement strong entity (Sakila)
Implement a new strong entity phone in the Sakila database. Attributes and relationships are shown in the following diagram:

The diagram has four entities and three relationships. The entities are phone, store, staff, and customer. 
Phone has attributes phone_id R U, country_code R, phone_number R, and phone_type. Store, staff, and customer have no attributes. 
The relationships are store-has-phone, staff-has-phone, and customer-has-phone. All relationships have cardinality one-one maximum and zero-zero minimum.

The diagram uses Sakila naming conventions. Follow the Sakila conventions for your table and column names:

All lower case
Underscore separator between root and suffix
Foreign keys have the same name as referenced primary key
Write CREATE TABLE and ALTER TABLE statements that:

Implement the entity as a new phone table.
Implement the has relationships as foreign keys in the Sakila customer, staff, and store tables.
Remove the existing phone column from the Sakila address table.
Step 2 requires adding a foreign key constraint to an existing table. Ex:

ALTER TABLE customer 
  ADD FOREIGN KEY (phone_id) REFERENCES phone(phone_id)
  ON DELETE SET NULL
  ON UPDATE CASCADE;
Specify data types as follows:

phone_id, phone_number, and country_code have data type INT.
phone_type has data type VARCHAR(12) and contains strings like 'Home', 'Mobile', and 'Other'.
Apply these constraints:

NOT NULL and UNIQUE constraints correspond to cardinalities on the diagram above.
Foreign key actions are SET NULL for delete rules and CASCADE for update rules.
Specify a suitable column as the phone table primary key.

[answer](https://github.com/yhsomemot/wguLAB-D427Sec3and4/blob/main/answer/sec4.12.sql)

