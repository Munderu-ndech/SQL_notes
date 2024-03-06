------- JOINING TABLES( INNER JOINS) -----

SELECT *
FROM orders AS O
JOIN customers AS C
	ON C.customer_id = O.customer_id;
    
    ------ WHEN SELECTING COLUMNS PRESENT IN BOTH TABLES YOU HAVE TO PREFIX WITH THE TABLE NAME
    
    
SELECT order_id, O.customer_id, first_name, last_name
FROM orders AS O
JOIN customers AS C
	ON C.customer_id = O.customer_id;
    
    
    SELECT OI.product_id, p.name, OI.quantity, OI.unit_price
FROM order_items  OI
JOIN products  P
	ON OI.product_id = P.product_id;
    
    --- NB ---- WHEN ASSIGNING AN ALIAS THEN YOU HAVE TO YOU IT ALL ACCROSS THE QUERY
    
    ------ COMBINING TABLE ACCROSS MUTIPLE DATA BASES
    
    
SELECT *
    FROM sql_inventory.products INV_P
    JOIN sql_store.order_items ORD_I
		ON INV_P.product_id = ORD_I.product_id;
        

------- JOINING A TABLE BY ITSELF


USE sql_hr;

SELECT *
FROM  employees E
JOIN employees EM
	ON E.reports_to = EM.employee_id;
    
---- TO FIND OUT WHO THE MANAGER IS AND REDUCE REPEATED COLUMNS



 SELECT
	E.employee_id,
    E.first_name,
    E.last_name,
    E.job_title,
    EM.first_name AS manager
FROM  employees E
JOIN employees EM
	ON E.reports_to = EM.employee_id;
    
    ----- JOINING MULTIPLE TABLES--
    
 USE sql_store;
   SELECT
	O.order_id,
    O.order_date,
    C.first_name,
    C.last_name,
    OS.name AS status
FROM orders  O
JOIN customers C
	ON C.customer_id = O.customer_id
JOIN order_statuses OS
	ON OS.order_status_id = O.status;
    
    
USE sql_invoicing;

SELECT
payment_id,
invoice_id,
date,
PM.name AS payment_method,
C.name,
address,
state
FROM payments P
JOIN payment_methods PM
	ON P.payment_method = PM.payment_method_id
JOIN clients C
	ON C.client_id = P.client_id;
    
-------- COMPOUND JOIN CONDITIONS--- WHERE WE HAVE COMPUND KEYS THAT UNIQELY IDENTIFY A ROW


USE sql_store;

SELECT *
FROM order_items OI
JOIN order_item_notes OIN
	ON OI.order_id = OIN.order_id
    AND OI.product_id = OIN.product_id;
    
    ----- IMPLICIT JOINT SYNTAX--
    
    
   SELECT *
FROM orders O, customers C
WHERE C.customer_id = O.customer_id; 

    


