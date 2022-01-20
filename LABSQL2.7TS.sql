USE sakila;
--   How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT   c.name, COUNT(f.film_id) AS 'amount_of_movies'
FROM     sakila.film_category f
JOIN     sakila.category c
ON       f.category_id = c.category_id
GROUP BY c.name;

--     Display the total amount rung up by each staff member in August of 2005.
SELECT   s.staff_id, COUNT(r.rental_id) AS 'people_rung_up'
FROM     sakila.rental r
JOIN     sakila.staff s
ON       r.staff_id = s.staff_id
WHERE    r.rental_date
LIKE     '2005-08%'
GROUP BY s.staff_id;

--     Which actor has appeared in the most films? 
SELECT   COUNT(DISTINCT f.film_id) AS 'amount_of_movies', 
         concat(a.first_name,'_', a.last_name) AS actor
FROM     sakila.actor a
JOIN     sakila.film_actor f
ON       f.actor_id = a.actor_id
GROUP BY f.actor_id
ORDER BY COUNT(f.film_id) DESC;

--     Most active customer (the customer that has rented the most number of films)
SELECT   COUNT(DISTINCT r.rental_id) AS 'amount_of_movies_rented', 
         concat(c.first_name,'_', c.last_name) AS 'customer'
FROM     sakila.customer c
JOIN     sakila.rental r USING(customer_id)
GROUP BY customer_id
ORDER BY COUNT(r.rental_id) DESC
LIMIT    1;

--     Display the first and last names, as well as the address, of each staff member.
SELECT   concat(s.first_name,'_', s.last_name) AS 'employee', address
FROM     sakila.staff s
JOIN     sakila.address a USING(address_id)
GROUP BY staff_id;

--     List each film and the number of actors who are listed for that film.
SELECT   f.title, COUNT(DISTINCT a.actor_id) AS 'amount_of_actors' 
FROM     sakila.film_actor a
JOIN     sakila.film f  USING(film_id)
GROUP BY f.title;  

--     Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT   concat(c.last_name,'_', c.first_name) AS 'customer', SUM(amount)
FROM     sakila.customer c
JOIN     sakila.payment p USING(customer_id)
GROUP BY c.last_name
ORDER BY c.last_name;

--     List number of films per category.
-- Didn't we answer this in question one already? 
