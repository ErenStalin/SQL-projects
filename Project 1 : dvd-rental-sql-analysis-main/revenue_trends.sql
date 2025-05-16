-- Monthly revenue trend
SELECT DATE_TRUNC('month', payment_date) AS month, SUM(amount) AS total_revenue
FROM payment
GROUP BY month
ORDER BY month;