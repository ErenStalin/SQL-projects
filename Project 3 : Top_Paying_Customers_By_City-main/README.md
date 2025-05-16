# Top_Paying_Customers_By_City
Find top 3 paying customers in each city using PostgreSQL (CTE + Window Functions)
# 💼 Top Paying Customers by City

**Mini SQL Project – DVD Rental Database**

This project analyzes the top 3 customers (by total amount paid) in each city using PostgreSQL.

---

## 🧠 Objective

> Identify the **top 3 paying customers** per city using aggregate functions, CTEs, and window functions.

---

## 🔧 Tools & Concepts Used

- PostgreSQL
- SQL JOINs
- GROUP BY + SUM()
- CTE (Common Table Expressions)
- RANK() Window Function

---

## 🧪 Query Used

```sql
-- SQL logic to rank top 3 customers by city
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
