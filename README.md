# wguLAB-D427Saklia

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

- All lower case
- Underscore separator between root and suffix
- Foreign keys have the same name as referenced primary key

Write CREATE TABLE and ALTER TABLE statements that:

1. Implement the entity as a new phone table.
2. Implement the has relationships as foreign keys in the Sakila customer, staff, and store tables.
3. Remove the existing phone column from the Sakila address table.

Step 2 requires adding a foreign key constraint to an existing table. Ex:

```sql
ALTER TABLE customer 
  ADD FOREIGN KEY (phone_id) REFERENCES phone(phone_id)
  ON DELETE SET NULL
  ON UPDATE CASCADE;
```

Specify data types as follows:

- phone_id, phone_number, and country_code have data type INT.
- phone_type has data type VARCHAR(12) and contains strings like 'Home', 'Mobile', and 'Other'.

Apply these constraints:

- NOT NULL and UNIQUE constraints correspond to cardinalities on the diagram above.
- Foreign key actions are SET NULL for delete rules and CASCADE for update rules.
- Specify a suitable column as the phone table primary key.

[answer](https://github.com/yhsomemot/wguLAB-D427Sec3and4/blob/main/answer/sec4.12.sql)

---

- 4.13 LAB - Implement supertype and subtype entities (Sakila)
Similar entities have many common attributes and relationships. Similar entities are often converted into subtypes of a supertype entity, as illustrated in this lab.

In the Sakila database, the customer and staff tables have several common columns. Convert these tables into subtypes of person. Specifically, write CREATE TABLE statements for person, customer, and staff that implement this ER diagram:

In the center is the person entity, with primary key person_id and additional attributes first_name, last_name, email, active, and last_update. 
The person entity contains subtype entities staff and customer. 
The staff entity has primary key person_id and additional attributes picture, username, and password. 
The customer entity has primary key person_id and additional attribute create_date.
Cardinality does not appear after the primary keys and attributes. 
On the left is the address entity, connected to the person entity by the belongs_to relationship. Belongs_to has cardinality 1(1) on the address side and M(0) on the person side. On the right is the store entity, connected to the person entity by the works_at relationship. Works_at has cardinality 1(1) on the store side and M(0) on the person side.

Follow Sakila conventions for table and column names:

- All lower case
- Underscore separator between root and suffix
- Foreign keys have the same name as referenced primary key

Implement attributes as columns:

- All columns are NOT NULL.
- The primary key of all three tables is person_id with data type SMALLINT UNSIGNED.
- The last_update and create_date columns have data type TIMESTAMP.
- The picture column has data type BLOB.
- All other columns have data type VARCHAR(20).

Implement the belongs_to and works_at relationships as foreign keys:

- belongs_to becomes an address_id foreign key in person with data type SMALLINT UNSIGNED.
- works_at becomes a store_id foreign key in staff with data type TINYINT UNSIGNED.
- Specify RESTRICT actions for both foreign keys.

Subtype entities have an IsA relationship to the supertype. Implement these relationships as foreign keys:

- The person_id columns of customer and staff become foreign keys referring to person.
- Specify CASCADE actions for both foreign keys.

NOTE: If you execute your solution with the Sakila database, you must first drop customer, staff, and all constraints that refer to these tables. Use the following statements with Sakila only, not in the zyLab environment:

```sql
ALTER TABLE payment 
   DROP CONSTRAINT fk_payment_customer,
   DROP CONSTRAINT fk_payment_staff;
ALTER TABLE rental 
   DROP CONSTRAINT fk_rental_customer,
   DROP CONSTRAINT fk_rental_staff; 
ALTER TABLE store
   DROP CONSTRAINT fk_store_staff;
DROP TABLE customer, staff;
```

[answer](https://github.com/yhsomemot/wguLAB-D427Sec3and4/blob/main/answer/sec4.13.sql)
