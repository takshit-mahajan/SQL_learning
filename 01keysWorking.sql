/*
CASE STUDY: ONLINE FOOD DELIVERY PLATFORM

A food delivery startup wants to build a database system to manage
customers, restaurants, and orders.

Business Requirements:

1. Each customer should have a unique internal ID.
2. Customer emails must be unique.
3. Each restaurant should have a unique internal ID.
4. GST numbers must be unique for restaurants.
5. Customers can place multiple orders.
6. Every order must belong to a valid customer.
7. Every order must belong to a valid restaurant.
8. The system should prevent orders from being created for
   non-existing customers or restaurants.

Concepts Practiced:
- Primary Key
- Unique Key
- Candidate Key
- Surrogate Key
- Foreign Key
- Auto Increment
*/

CREATE DATABASE food_delivery_db;

USE food_delivery_db;

CREATE TABLE customers(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

CREATE TABLE restaurants(
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_name VARCHAR(100) NOT NULL,
    gst_number VARCHAR(20) UNIQUE,
    city VARCHAR(50)
);

CREATE TABLE orders(
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    order_amount DECIMAL(10,2),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (restaurant_id)
        REFERENCES restaurants(restaurant_id)
);

INSERT INTO customers
(customer_name,email,phone)
VALUES
('Rahul','rahul@gmail.com','1234567890'),
('Aman','aman@gmail.com','1324567890'),
('Neha','neha@gmail.com','1452369870');

INSERT INTO restaurants
(restaurant_name,gst_number,city)
VALUES
('Pizza Hub','GST101','Delhi'),
('Burger Point','GST102','Chandigarh'),
('Food Corner','GST103','Patiala');

INSERT INTO orders
(customer_id,restaurant_id,order_amount)
VALUES
(1,1,450.00),
(1,2,320.00),
(2,3,700.00);

DESC customers;
DESC restaurants;
DESC orders;
