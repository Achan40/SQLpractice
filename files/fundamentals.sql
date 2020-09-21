SELECT first_name,last_name,email FROM customer;/*Return frst_name, last_name and email columns from the table cutomer*/
SELECT DISTINCT(release_year) FROM film;/*Return the unique values of release_year from film table*/
SELECT DISTINCT(rental_rate) FROM film;/*Return the unique values of release_rate from film table*/

/*COUNT*/
SELECT COUNT(DISTINCT amount) FROM payment;/*Count the number of unique vales in the amount column from the payment table*/

/*WHERE*/
SELECT * FROM film WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R';/*return all rows from the film table with certain conditions*/
SELECT COUNT(*) FROM film WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R';/*return the count of the rows from the film table with certain conditions*/

SELECT first_name,last_name,email FROM customer WHERE first_name = 'Nancy' AND last_name = 'Thomas';
SELECT phone FROM address WHERE address = '259 Ipoh Drive';

/*ORDER BY*/
SELECT * FROM customer ORDER BY first_name DESC;/*ordering all colums in customer table by firt_name in descending order*/
SELECT store_id, first_name, last_name FROM customer ORDER BY store_id DESC, first_name ASC;/*ordering specific columns from the customer table, first by store_id in descending order, then by first_name in acending order*/

/*LIMIT*/
SELECT * FROM payment ORDER BY payment_date DESC LIMIT 5;/*limit allows you to select certain number of rows*/

SELECT customer_id FROM payment ORDER BY payment_date ASC LIMIT 10;
SELECT title,length FROM film ORDER BY length ASC LIMIT 5;

/*BETWEEN*/
SELECT * FROM payment WHERE amount BETWEEN 8 AND 9;
SELECT * FROM payment WHERE amount NOT BETWEEN 8 AND 9;
SELECT * FROM payment WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';

/*IN*/
SELECT * FROM payment WHERE amount IN(.99,1.98,1.99); 
SELECT * FROM payment WHERE amount NOT IN(.99,1.98,1.99); 
SELECT * FROM customer WHERE first_name IN ('John','Jake','Julie');

/*LIKE and ILIKE*/
/*pattern matching in a string using wild cards*/
/*LIKE is case sensitive, ILIKE is case insensitive*/
SELECT * FROM customer WHERE first_name LIKE 'J%' AND last_name LIKE 'S%';/*everyone with a firstname starting with the letter J and the last name starting with the letter S*/
SELECT * FROM customer WHERE first_name LIKE '%er%';/*everyone who has a first name where er shows up somewhere*/

/*Aggregation Functions*/
/*Only happen in the SELECT clause or HAVING clause*/
SELECT MAX(replacement_cost) FROM film;
SELECT MIN(replacement_cost) FROM film;
SELECT MIN(replacement_cost), MAX(replacement_cost) FROM film;

SELECT ROUND(AVG(replacement_cost),3) FROM film;

/*GROUP BY*/
/*must appear right after a FROM or WHERE statement*/
SELECT customer_id,SUM(amount) FROM payment GROUP BY customer_id ORDER BY SUM(amount);
SELECT customer_id,staff_id,SUM(amount) FROM payment GROUP BY staff_id,customer_id ORDER BY customer_id;

SELECT DATE(payment_date),SUM(amount) FROM payment GROUP BY DATE(payment_date) ORDER BY SUM(amount);
SELECT rating,AVG(replacement_cost) FROM film GROUP BY rating;
SELECT customer_id,SUM(amount) FROM payment GROUP BY customer_id ORDER BY SUM(amount) DESC;

/*HAVING*/
/* comes after a GROUP BY, used to select information based on aggregate funciton*/
SELECT customer_id,SUM(amount) FROM payment WHERE customer_id NOT IN (184,87,477) GROUP BY customer_id HAVING SUM(amount) > 100;
SELECT customer_id, COUNT(payment_id) FROM payment GROUP BY customer_id HAVING COUNT(payment_id) >= 40;

/*JOINS*/
/*combine info from multiple tables*/

/*AS*/
/*rename columns*/
SELECT customer_id AS cust_id FROM payment;
SELECT COUNT(amount) AS num_transactions FROM payment;

/*INNER JOIN*/
/*result with the set of records that match in both tables (grab everything)*/
SELECT payment_id,payment.customer_id,first_name  FROM payment INNER JOIN customer ON payment.customer_id = customer.customer_id;
SELECT district,email FROM address JOIN customer ON address.address_id = customer.address_id WHERE district = 'California';

/*FULL OUTER JOIN*/
/*dealing with values only present in one of the tables being joined*/
SELECT * FROM customer 
FULL OUTER JOIN payment 
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IS null
OR payment.payment_id IS null; /*there are no completely unique rows*/

SELECT first_name,last_name,film.title FROM actor
JOIN film_actor
ON actor.actor_id = film_actor.actor_id
JOIN film
ON film_actor.film_id = film.film_id
WHERE first_name = 'Nick' AND last_name = 'Wahlberg';
/*All movies that Nick Wahlberg has been in*/

/*LEFT OUTER JOIN*/
/*Results in the set of records that are in the left table, if there is no match w right table, then result is null*/
/*order matters*/
SELECT film.film_id, film.title, inventory_id
FROM film
LEFT JOIN inventory ON
inventory.film_id = film.film_id;


/*RIGHT OUTER JOIN*/
/*Left join but table is switched*/

/*UNION*/
/*combine the result-set of two or more select statements*/
 