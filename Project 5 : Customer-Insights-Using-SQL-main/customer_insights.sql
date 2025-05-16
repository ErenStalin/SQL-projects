1. Top 10 Most Active Customers

SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS total_rentals
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY total_rentals DESC
LIMIT 10;


2. Monthly Revenue Trend

SELECT DATE_TRUNC('month', p.payment_date) AS month, SUM(p.amount) AS revenue
FROM payment p
GROUP BY month
ORDER BY month;

3. Most Popular Film Categories

SELECT cat.name AS category, COUNT(r.rental_id) AS total_rentals
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film_category fc ON i.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
GROUP BY cat.name
ORDER BY total_rentals DESC
LIMIT 5;

4. Top-Spending Customers

SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 10;

5. Customer Retention Check: Repeat Customers

SELECT customer_id, COUNT(DISTINCT DATE(rental_date)) AS rental_days
FROM rental
GROUP BY customer_id
HAVING COUNT(DISTINCT DATE(rental_date)) > 1
ORDER BY rental_days DESC
LIMIT 10;


