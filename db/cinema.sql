DROP TABLE tickets;
DROP TABLE customers;
DROP TABLE films;

CREATE TABLE customers (
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255),
  funds VARCHAR(255)
);

CREATE TABLE films (
  id SERIAL2 PRIMARY KEY,
  title VARCHAR(255),
  price VARCHAR(255)
);

CREATE TABLE tickets (
  id SERIAL,
  customers_id INT2 REFERENCES customers(id) ON DELETE CASCADE,
  films_id INT2 REFERENCES films(id) ON DELETE CASCADE
);
