--------- OUTER JOINS ----------


USE sql_store;

SELECT
	c.customer_id,
    c.first_name,
    o.order_id
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY customer_id;

----- ABOVE IS AN INNER JOIN THAT ONLY RETURNS CUSTOMERS WHO HAD PLACED AN ORDER. --
----- OUTER JOINS ALLOWS US TO RETURN ALL ENTRIES REGARDLESS OF WHETHER THE CUSTOMER HAD PLACED AN ORDER OR NOT --
----- LEFT OUTER JOIN RETURNS ALL ENTRIES FROM THE FIRST TABLE ON OUR 'FROM' CLAUSE ie CUSTOMER TABLE --
----- RIGHT OUTER JOIN RETURN ALL ENTRIES FROM THE SECONDTABLE ie ORDERS --

SELECT
	c.customer_id,
    c.first_name,
    o.order_id
FROM customers c
LEFT JOIN orders o
	ON c.customer_id = o.customer_id
ORDER BY customer_id;

----- ABOVE RETURNS ALL ENTRIES OF CUSTOMER TABLE --

SELECT
	c.customer_id,
    c.first_name,
    o.order_id
FROM customers c
RIGHT JOIN orders o
	ON c.customer_id = o.customer_id
ORDER BY customer_id;

----- ABOVE RETURNS ALL ENTRIES FROM ORDERS TABLE WHICH IS SAME AS THE INNER JOIN --


SELECT
p.product_id,
p.name,
oi.quantity
FROM products p
JOIN order_items oi
	on p.product_id = oi.product_id
ORDER BY product_id;

----- OUTER JOIN TO RETURN ALL PRODUCTS TO HAVE A SCOPE OF HOW WELL PRODUCTS ARE PERFORMING --

SELECT
p.product_id,
p.name,
oi.quantity
FROM products p
LEFT JOIN order_items oi
	on p.product_id = oi.product_id
ORDER BY product_id;

----- OUTER JOINS ACCROSS MULTIPLE TABLES --


SELECT
c.customer_id,
c.first_name,
o.order_id,
sh.name AS shipper
FROM customers c
LEFT JOIN orders o
	ON c.customer_id = o.customer_id
LEFT JOIN shippers sh
	ON sh.shipper_id = o.shipper_id
ORDER BY customer_id;



SELECT
o.order_date,
o.order_id,
c.first_name,
sh.name AS shipper,
os.name AS status
FROM orders o
LEFT JOIN customers c
	on c.customer_id = o.customer_id
LEFT JOIN order_statuses os
	ON o.status = os.order_status_id
LEFT JOIN shippers sh
	ON o.shipper_id = sh.shipper_id
ORDER BY status;


----- WHEN DOING JOINS WE CAN SIMPLIFY OUR QUERY WITH THE "USING" CLAUSE--
----- THIS MAKES CODE MORE READABLE--
----- THE "USING" CLAUSE IS ONLY APLLICABLE IF COLUMNS IN BOTH TABLES BEING JOINE HAVE THE SAME NAME --
----- THE "USING" CLAUSE IS ALSO APPLICABLE WITH COMPOSITE JOINS --
----- PARENTHESIS ARE USED WITH THIS CLAUSE --



SELECT
o.order_date,
o.order_id,
c.first_name,
sh.name AS shipper,
os.name AS status
FROM orders o
LEFT JOIN customers c
	USING (customer_id)
LEFT JOIN order_statuses os
	ON o.status = os.order_status_id
LEFT JOIN shippers sh
	USING(shipper_id)
ORDER BY status;

----- COMPOSITE JOIN --


SELECT *
FROM order_items oi
JOIN order_item_notes oin
	ON oi.order_id = oin.order_id
    AND oi.product_id = oin.product_id;
    
    ----- WE WRITE AS --
    
SELECT *
FROM order_items oi
JOIN order_item_notes oin
USING(order_id, product_id);


USE sql_invoicing;

SELECT 
	p.date,
    c.name AS client,
    p.amount,
    pm.name
FROM payments p
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id
LEFT JOIN clients c
	USING(client_id);
    
    
----- NATURAL JOINS (YOU LEAVE THE DATABASE TO FIGURE OUT SIMILAR COLUMNS  --

USE sql_store;
SELECT
	O.order_id,
    c.first_name
FROM orders o
NATURAL JOIN customers c;


----- CROSS JOINS --


SELECT
	c.first_name,
	p.name
FROM customers c
CROSS JOIN products p
ORDER BY first_name;

----- ALSO IT CAN BE WRITTEN AS --

SELECT
	c.first_name,
	p.name
FROM customers c, PRODUCTS P
ORDER BY first_name;
