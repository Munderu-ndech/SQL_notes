SELECT * FROM sql_inventory.products;

---- CREATING AN ALIAS FOR THE NEW COLUMN


SELECT
	name,
    unit_price,
    unit_price * 1.1 AS new_price
FROM sql_inventory.products
;

----- FILTERING OUT DATA USING THE WHERE CLAUSE


SELECT *
FROM sql_store.orders
WHERE order_date >= '2019-01-01';

------- LOGICAL OPERATORS AND/OR/NOT


SELECT *
FROM sql_store.customers
WHERE birth_date > '1990-01-01'  AND points > 1000;

SELECT *
FROM sql_store.customers
WHERE birth_date > '1990-01-01'  OR points > 1000;

SELECT *
FROM sql_store.customers
WHERE birth_date > '1990-01-01'  OR points > 1000 AND state = 'va';

SELECT *
FROM sql_store.customers
WHERE NOT birth_date > '1990-01-01'  OR points > 1000;

----- THE IN OPERATOR---- USED TO REDUCE REDUNDANCY WHILE PASSING CONDITIONS


SELECT *
FROM sql_store.customers
WHERE state IN('va','fl','ca');

SELECT *
FROM sql_store.customers
WHERE state NOT IN('va','fl','ca');

SELECT *
FROM sql_store.products
WHERE quantity_in_stock IN(49,38,72);

------- BETWEEN OPERATOR


SELECT *
FROM sql_store.customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';

----- FETCHING ROWS THAT MATCH SPECIFIC STRING PATTERNS-----
-------- % IN LIKE STATEMENTS INDICATE CHARACTERS PRESENT EITHER BEFORE OR AFTER


SELECT *
FROM sql_store.customers
WHERE last_name LIKE 'B%' OR '%Y';

SELECT *
FROM sql_store.customers
WHERE last_name LIKE '_____Y';

SELECT *
FROM sql_store.customers
WHERE last_name LIKE '%field%';

------- A NEWER VERSION OF THE LIKE OPERATOR IS REGEXP THAT DOES THE SAME THING AND IS MORE POWERFUL


SELECT *
FROM sql_store.customers
WHERE last_name REGEXP 'field';

------ WE USE ^ TO REPRESENT BEGINNG OF A STRING, $ TO REPRESENT END OF A STRING, | TO REPRESENT MULTIPLE SEARCH PATTERN
------ [] GIVES OPTION TO RETURN ANY ENTRY THAT MACHES THE STRINGS OFFERED INSIDE BRACKET AND [-] THAT GIVES A RANGE


SELECT *
FROM sql_store.customers
WHERE first_name REGEXP 'ELKA|AMBUR';

SELECT *
FROM sql_store.customers
WHERE last_name REGEXP 'ey$|on$';

SELECT *
FROM sql_store.customers
WHERE last_name REGEXP '^my|se';

SELECT *
FROM sql_store.customers
WHERE last_name REGEXP 'b[ru]';

----------------- OR ----------------------

SELECT *
FROM sql_store.customers
WHERE last_name REGEXP 'br|bu';

-------------- searching for null values ----------


SELECT *
FROM sql_store.customers
WHERE phone IS NULL;

SELECT *
FROM sql_store.customers
WHERE phone IS NOT NULL;

-------------- ORDERS THAT ARE NOT SHIPPED ------------


SELECT *
FROM sql_store.orders
WHERE shipped_date IS NULL AND shipper_id IS NULL;

---------- ORDER BY CLAUSE


SELECT *, unit_price * quantity AS total_price
FROM sql_store.order_items
WHERE order_id = 2
ORDER BY total_price DESC;

---------- LIMIT CLAUSE


SELECT *
FROM sql_store.customers
LIMIT 3;

------------- THE 6 IS THE OFFSET IT TELLS SQL TO SKIP RECORDS UPTO 6 AND SHOW THE FOLLOWING 3 ie 7,8,9

SELECT *
FROM sql_store.customers
LIMIT 6, 3;

----------- TOP 3 LOYAL CUSTOMERS

SELECT *
FROM sql_store.customers
ORDER BY points DESC
LIMIT 3;