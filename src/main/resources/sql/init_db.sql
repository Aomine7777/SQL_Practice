CREATE TABLE users (
                       id SERIAl PRIMARY KEY,
                       username VARCHAR(50) UNIQUE,
                       email VARCHAR(100) UNIQUE
);

CREATE TABLE orders(
                       id SERIAl PRIMARY KEY,
                       user_id INT,
                       order_date DATE,
                       total_amount NUMERIC(10,2),
                       FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE products(
                         id SERIAl PRIMARY KEY,
                         product_name VARCHAR(100),
                         price NUMERIC(10,2)
);