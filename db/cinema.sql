DROP TABLE if exists tickets;
DROP TABLE if exists customers;
DROP TABLE if exists films;

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  funds VARCHAR(255)
);

CREATE TABLE films (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  price VARCHAR(255)
);

CREATE TABLE tickets (
  id SERIAL,
  customers_id INT REFERENCES customers(id) ON DELETE CASCADE,
  films_id INT REFERENCES films(id) ON DELETE CASCADE
);
