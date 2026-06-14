/*
CASE STUDY: E-COMMERCE SALES ANALYSIS

You are a Data Engineer at an e-commerce company. The management team requires various sales reports from the orders database.

Tasks:

1. Display all orders.
2. Display selected columns.
3. Rename columns using aliases.
4. Find unique product categories.
5. Find orders above ₹50,000.
6. Find orders below ₹50,000.
7. Find Laptop orders.
8. Find non-Laptop orders.
9. Find Laptop orders above ₹70,000.
10. Find Laptop or Mobile orders.
11. Exclude Furniture orders.
12. Find orders between ₹40,000 and ₹70,000.
13. Find orders belonging to specific categories.
14. Find customers whose names start with a specific letter.
15. Calculate GST-inclusive order amounts.
16. Count total orders.
17. Calculate total revenue.
18. Calculate average order value.
19. Find highest order amount.
20. Find lowest order amount.
21. Calculate average sales by category.
22. Calculate revenue by category.
23. Find categories with average sales above a threshold.
24. Sort orders in ascending order of amount.
25. Sort orders in descending order of amount.
26. Display top N highest-value orders.
27. Skip first N records and display the next N records.
28. Generate a final category-wise business report using filtering, grouping, aggregation, and sorting.
    */

CREATE DATABASE dqlPrac;
CREATE TABLE orders (
    order_id INT,
    customer_name VARCHAR(50),
    category VARCHAR(30),
    amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO orders VALUES
(101,'Aman','Laptop',75000,'2026-01-01'),
(102,'Rahul','Mobile',25000,'2026-01-02'),
(103,'Priya','Laptop',82000,'2026-01-03'),
(104,'Simran','Furniture',45000,'2026-01-04'),
(105,'Rohit','Mobile',30000,'2026-01-05'),
(106,'Neha','Furniture',70000,'2026-01-06'),
(107,'Karan','Laptop',90000,'2026-01-07'),
(108,'Anjali','Mobile',55000,'2026-01-08'),
(109,'Vikas','Furniture',65000,'2026-01-09'),
(110,'Mehak','Laptop',68000,'2026-01-10'),
(111,'Arjun','Laptop',85000,'2026-01-11'),
(112,'Ritika','Mobile',28000,'2026-01-12'),
(113,'Deepak','Furniture',60000,'2026-01-13'),
(114,'Sakshi','Laptop',78000,'2026-01-14'),
(115,'Varun','Mobile',35000,'2026-01-15'),
(116,'Pooja','Furniture',50000,'2026-01-16'),
(117,'Nitin','Laptop',95000,'2026-01-17'),
(118,'Isha','Mobile',48000,'2026-01-18'),
(119,'Manav','Furniture',72000,'2026-01-19'),
(120,'Tanya','Laptop',88000,'2026-01-20'),
(121,'Yash','Mobile',22000,'2026-01-21'),
(122,'Komal','Furniture',58000,'2026-01-22'),
(123,'Harsh','Laptop',73000,'2026-01-23'),
(124,'Naina','Mobile',41000,'2026-01-24'),
(125,'Mohit','Furniture',68000,'2026-01-25'),
(126,'Aditi','Laptop',91000,'2026-01-26'),
(127,'Rakesh','Mobile',52000,'2026-01-27'),
(128,'Shreya','Furniture',47000,'2026-01-28'),
(129,'Tarun','Laptop',79000,'2026-01-29'),
(130,'Muskan','Mobile',33000,'2026-01-30'),
(131,'Gaurav','Furniture',76000,'2026-01-31'),
(132,'Kriti','Laptop',86000,'2026-02-01'),
(133,'Abhishek','Mobile',29000,'2026-02-02'),
(134,'Sneha','Furniture',62000,'2026-02-03'),
(135,'Rajat','Laptop',81000,'2026-02-04'),
(136,'Palak','Mobile',57000,'2026-02-05'),
(137,'Shubham','Furniture',53000,'2026-02-06'),
(138,'Jasleen','Laptop',97000,'2026-02-07'),
(139,'Ayush','Mobile',44000,'2026-02-08'),
(140,'Kashish','Furniture',69000,'2026-02-09'),
(141,'Aditya','Laptop',76000,'2026-02-10'),
(142,'Riya','Mobile',37000,'2026-02-11'),
(143,'Bhavesh','Furniture',64000,'2026-02-12'),
(144,'Diya','Laptop',89000,'2026-02-13'),
(145,'Laksh','Mobile',51000,'2026-02-14'),
(146,'Navya','Furniture',59000,'2026-02-15'),
(147,'Sarthak','Laptop',83000,'2026-02-16'),
(148,'Khushi','Mobile',46000,'2026-02-17'),
(149,'Ujjwal','Furniture',71000,'2026-02-18'),
(150,'Pari','Laptop',92000,'2026-02-19');


SELECT * FROM orders;

SELECT order_id,customer_name,category,amount FROM orders;

SELECT 
	order_id AS 'Order ID',
    customer_name AS 'Customer Name',
    category AS 'Category',
    amount AS 'Amount'
FROM
	orders;
    
SELECT
	category
FROM 
	orders
GROUP BY
	category;
    
SELECT 
	*
FROM 
	orders
WHERE
	(amount>50000);
    
SELECT 
	*
FROM 
	orders
WHERE
	(amount<50000);
    
    
SELECT 
	*
FROM
	orders
WHERE
	category='Laptop';

SELECT 
	*
FROM
	orders
WHERE
	category<>'Laptop';

SELECT 
	*
FROM
	orders
WHERE
	category='Laptop' AND amount>70000;
    
SELECT 
	*
FROM
	orders
WHERE
	category='Laptop' OR category='Mobile';
    
SELECT 
	*
FROM
	orders
WHERE
	category<>'Furniture';
    
SELECT 
	*
FROM
	orders
WHERE
	amount BETWEEN 40000 AND 70000;
    
SELECT *
FROM orders
WHERE category IN ('Laptop', 'Mobile', 'Tablet');

SELECT *
FROM orders
WHERE customer_name LIKE 'A%';

SELECT
    order_id,
    customer_name,
    amount,
    amount * 1.18 AS gst_amount
FROM orders;

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT AVG(amount) AS averageVal
FROM orders;

SELECT MAX(amount) AS highest_order
FROM orders;

SELECT MIN(amount) AS lowest_order
FROM orders;

SELECT
    category,
    AVG(amount) AS average_sales
FROM orders
GROUP BY category;

SELECT
    category,
    SUM(amount) AS revenue
FROM orders
GROUP BY category;

SELECT
    category,
    AVG(amount) AS average_sales
FROM orders
GROUP BY category
HAVING AVG(amount) > 50000;

SELECT *
FROM orders
ORDER BY amount ASC;

SELECT *
FROM orders
ORDER BY amount DESC;

SELECT *
FROM orders
ORDER BY amount DESC
LIMIT 5;

SELECT *
FROM orders
LIMIT 5 OFFSET 5;

SELECT
    category,
    COUNT(*) AS total_orders,
    SUM(amount) AS total_revenue,
    AVG(amount) AS average_order_value,
    MAX(amount) AS highest_order,
    MIN(amount) AS lowest_order
FROM orders
WHERE amount > 30000
GROUP BY category
HAVING AVG(amount) > 40000
ORDER BY total_revenue DESC;
    

    




