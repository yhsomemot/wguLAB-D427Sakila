CREATE TABLE phone (
  phone_id INT PRIMARY KEY,
  country_code INT NOT NULL,
  phone_number INT NOT NULL,
  phone_type VARCHAR(12) CHECK (phone_type IN ('home', 'office', 'other'))
);

ALTER TABLE address
DROP COLUMN phone;
ALTER TABLE customer
ADD phone_id INT;

ALTER TABLE staff
ADD phone_id INT;

ALTER TABLE store
ADD phone_id INT;

ALTER TABLE customer
ADD CONSTRAINT fk_customer_phone FOREIGN KEY (phone_id) REFERENCES phone(phone_id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE staff
ADD CONSTRAINT fk_staff_phone FOREIGN KEY (phone_id) REFERENCES phone(phone_id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE store
ADD CONSTRAINT fk_store_phone FOREIGN KEY (phone_id) REFERENCES phone(phone_id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE customer
ADD UNIQUE (phone_id);

ALTER TABLE staff
ADD UNIQUE (phone_id);

ALTER TABLE store
ADD UNIQUE (phone_id);

