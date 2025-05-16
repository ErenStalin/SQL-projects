WITH customer_payments AS (
    SELECT 
        c.customer_id,
        c.first_name || ' ' || c.last_name AS customer_name,
        ci.city,
        SUM(p.amount) AS total_paid
    FROM customer c
    JOIN address a ON c.address_id = a.address_id
    JOIN city ci ON a.city_id = ci.city_id
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id, customer_name, ci.city
),
ranked_customers AS (
    SELECT *,
           RANK() OVER(PARTITION BY city ORDER BY total_paid DESC) AS rnk
    FROM customer_payments
)
SELECT * 
FROM ranked_customers
WHERE rnk <= 3
ORDER BY city, total_paid DESC;
