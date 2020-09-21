/*CASE*/
SELECT customer_id,
CASE 
	WHEN (customer_id <= 100) THEN 'Premium'
	WHEN (customer_id BETWEEN 100 and 200) THEN 'Plus'
	ELSE 'Normal'
END AS customer_class
FROM customer;

/*just checking equality*/
SELECT customer_id, 
CASE customer_id
	WHEN 2 THEN 'Winner'
	WHEN 5 THEN 'Second Place'
	ELSE 'Normal'
END AS raffle_results
FROM customer;

/*Count the number of .99 cent movies, and the number of regular 2.99 and premium*/
SELECT
SUM(CASE rental_rate
	WHEN .99 THEN 1
	ELSE 0
END) AS number_of_bargains,
SUM(CASE rental_rate
   WHEN 2.99 THEN 1
   ELSE 0
END) AS regular,
SUM(CASE rental_rate
   WHEN 4.99 THEN 1
   ELSE 0
END) AS premium
FROM film;

/*COALESCE*/
/*accepts unlimited num of args, it returns first arg that is not null, if all args are null, it returns null*/

/*CAST*/
/*convert from one data type to antother*/
SELECT CAST('5' AS INTEGER) AS new_int;
SELECT '10'::INTEGER;

SELECT CHAR_LENGTH(CAST(inventory_id AS VARCHAR)) FROM rental;

/*NULLIF*/
/*take 2 inputs and returns null if both are equal else return first arg*/
/*See NULLIF file*/

/*VIEW*/
/*database object that is a stored query, a virtual table*/

/*CREATE VIEW customer_info AS
SELECT first_name,last_name,address FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;*/

/*CREATE OR REPLACE VIEW customer_info AS
SELECT first_name,last_name,address,district FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;*/

DROP VIEW IF EXISTS customer_info;
