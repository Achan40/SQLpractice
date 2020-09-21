/*Timestamps and Extract*/
SELECT NOW();
SELECT TIMEOFDAY();
SELECT CURRENT_TIME;

SELECT EXTRACT(YEAR FROM payment_date) 
FROM payment; /*Getting year from column of dates*/

SELECT AGE(payment_date) 
FROM payment;

SELECT TO_CHAR(payment_date,'MONTH    YYYY')/*convert to text*/
FROM payment;

SELECT DISTINCT(TO_CHAR(payment_date,'MONTH')) FROM payment;

/*MATH*/
SELECT rental_rate/replacement_cost FROM film;

/*Strings functions and operators*/
SELECT LENGTH(first_name) FROM customer;

SELECT first_name || last_name
FROM customer;/*concacting columns*/

SELECT upper(first_name) ||' ' || last_name
AS full_name
FROM customer;/*concacting columns*/

/*Subquery*/
SELECT title, rental_rate
FROM film
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);

SELECT film_id,title
FROM film
WHERE film_id IN
(SELECT inventory.film_id
FROM rental
INNER JOIN inventory on inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30');

SELECT first_name, last_name
FROM customer AS c
WHERE EXISTS
(SELECT * FROM payment as p
WHERE p.customer_id = c.customer_id
AND amount > 11);

/*Self join*/
/*where a table is joined to itself*/
SELECT f1.title, f2.title, f1.length 
FROM film AS f1
INNER JOIN film AS f2 ON 
f1.film_id != f2.film_id
AND f1.length = f2.length 


 