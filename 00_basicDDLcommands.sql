/*
CASE STUDY: Mahajan Paints & Hardware Store

A small paint and hardware business wants to maintain digital records.

Requirements:
1. Create a database for the store.
2. Create a customers table to store customer details.
3. Create a products table to store inventory information.
4. Insert sample customer and product records.
5. Modify the database structure when business requirements change:
   - Add an email column to customers.
   - Increase phone number length.
   - Rename product price column.
6. View table structures.
7. Rename the products table to inventory.
8. Remove all inventory records while keeping the table.
9. Delete the inventory table when it is no longer needed.

Objective:
Practice core SQL DDL operations:
CREATE DATABASE
CREATE TABLE
ALTER TABLE
RENAME TABLE
DESCRIBE
TRUNCATE TABLE
DROP TABLE

Author: Takshit Mahajan
*/

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
	
