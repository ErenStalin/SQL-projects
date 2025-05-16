WITH customer_summary AS (
    SELECT 
        c.customer_id,
        c.first_name || ' ' || c.last_name AS customer_name,
        COUNT(r.rental_id) AS total_rentals,
        SUM(p.amount) AS total_paid,
        MAX(r.rental_date) AS last_rental_date
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    JOIN rental r ON p.rental_id = r.rental_id
    GROUP BY c.customer_id, customer_name
)
SELECT
    customer_name,
    total_rentals,
    total_paid,
    last_rental_date,
    CASE 
        WHEN total_paid > 150 THEN 'High Spender'
        WHEN total_paid BETWEEN 100 AND 150 THEN 'Mid Spender'
        ELSE 'Low Spender'
    END AS customer_category
FROM customer_summary
ORDER BY total_paid DESC
LIMIT 10;
