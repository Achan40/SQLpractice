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