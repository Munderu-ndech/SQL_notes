--------- UNIONS ----
USE sql_store;


SELECT
	order_id,
    order_date,
    'ACTIVE' AS status
FROM orders
WHERE order_date >= '2019-01-01'
UNION
SELECT
	order_id,
    order_date,
    'ARCHIVED' AS status
FROM orders
WHERE order_date < '2019-01-01';

----- WE CAN ALSO USE UNION ACCROSS MULTIPLE TABLES ---


SELECT
	customer_id,
    first_name,
    points,
    'bronze' AS type
FROM customers
WHERE points <= 2000
UNION
SELECT
	customer_id,
    first_name,
    points,
    'silver' AS type
FROM customers
WHERE 2000 < points <= 3000
UNION
SELECT
	customer_id,
    first_name,
    points,
    'gold' AS type
FROM customers
WHERE 3000 < points
ORDER BY first_name;

----- FOR UNION TO WORK THE NUMBER OF COLUMNS SELECTED NEED TO BE EQUAL --
----- COLUMN NAME FOR A UNION IS THE FIRST COLUMN SELECTED HENCE WE CAN USE AN ALIAS --


----- COLUMN ATTRIBUTES --
----- INSERT A NEW ROW --


USE sql_store;

INSERT INTO customers
VALUES
	(DEFAULT,
    'john',
    'smith',
    '1990-01-01',
    NULL,
    'adress',
    'city',
    'ca',
    DEFAULT);
    
SELECT *
FROM customers;

----- ALTERNATIVELY WE CAN OMMIT THE DEFAULT VALUES --

INSERT INTO customers
	(first_name,
	last_name,
	birth_date,
	address,
	city,
	state,
    points)
VALUES
	('dennis',
    'munderu',
    '1994-05-28',
    '69832 Nairobi',
    'nairobi',
    'na',
    4000);
    
    SELECT *
    FROM customers;
    
    
    
    INSERT INTO shippers (name)
    VALUES
		('SHIPPERS 1'),
		('SHIPPERS 2'),
        ('SHIPPERS 3');
        
 SELECT *
    FROM shippers;
    
    
    
    INSERT INTO products 
		(name,
        quantity_in_stock,
        unit_price)
	VALUES
		('bread','40',3.62),
        ('flour',50,5.05),
       ('spinach',32,2);
       
       SELECT *, SUM(quantity_in_stock) AS sum
       FROM products
       GROUP BY product_id;
       
       

