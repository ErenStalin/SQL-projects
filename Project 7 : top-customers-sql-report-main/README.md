# 🎯 Top Renting Customers SQL Report (PostgreSQL + DVD Rental)

## 📘 Project Overview

This mini SQL project identifies the **top 10 customers** who spent the most money renting DVDs from the classic **DVD Rental** database. It includes each customer's total rentals, total amount paid, last rental date, and a customer spending category using `CASE` logic.

It's a simple, real-world business query that demonstrates skills in:
- Data aggregation
- Joins across multiple tables
- CTE (Common Table Expressions)
- CASE statements for conditional logic
- Ranking and limiting results

---

## 📊 Output Fields

| Field               | Description                         |
|---------------------|-------------------------------------|
| customer_name       | Full name of the customer           |
| total_rentals       | Total number of rentals             |
| total_paid          | Total amount paid by the customer   |
| last_rental_date    | The latest rental date              |
| customer_category   | High / Mid / Low spender category   |

---

## 🛠️ Tools Used

- **Database**: PostgreSQL
- **Dataset**: DVD Rental Sample Database
- **Skills Practiced**:
  - SQL Joins
  - Aggregation
  - CTE
  - CASE statements
  - Ranking with ORDER BY and LIMIT

---

## 🧠 SQL Logic Used

```sql
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
SELECT *,
    CASE 
        WHEN total_paid > 150 THEN 'High Spender'
        WHEN total_paid BETWEEN 100 AND 150 THEN 'Mid Spender'
        ELSE 'Low Spender'
    END AS customer_category
FROM customer_summary
ORDER BY total_paid DESC
LIMIT 10;
