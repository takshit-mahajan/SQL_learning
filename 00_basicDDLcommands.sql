CREATE DATABASE paint_store;
USE paint_store;

CREATE TABLE customers(
	customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    phone VARCHAR(15)
);

CREATE TABLE products(
	product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    brand VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO customers (customer_id,customer_name,city,phone)
VALUES
	(1,"Rohit Sharma","Mukerian",1234567890),
    (2,"Aman Kumar","Jalandhar",1234567890),
    (3,"Neha Gupta","Pathankot",1234567890);
    
INSERT INTO products (product_id,product_name,brand,price)
VALUES
	(101,"Wall Paint 20L","Asian Paints",3500),
    (102,"Cement Bag","ACC",450),
    (103,"Paint Brush","Nippon",150);
    
    
ALTER TABLE customers
ADD email VARCHAR(50);

ALTER TABLE customers
MODIFY phone VARCHAR(20);

ALTER TABLE products
RENAME COLUMN price to product_price;

DESC customers;
DESC products;

ALTER TABLE products
RENAME  to inventory;


TRUNCATE TABLE inventory;
DROP TABLE inventory;
	
