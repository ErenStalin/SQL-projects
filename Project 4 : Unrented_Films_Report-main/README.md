# Unrented_Films_Report
Find all films that were never rented in the DVD Rental database using SQL
# 🎬 Unrented Films Report

**Mini SQL Project – DVD Rental Database**

This project identifies all films in the inventory that were **never rented**, using SQL with PostgreSQL.

---

## 🧠 Objective

> Find unrented films by performing a LEFT JOIN between the `film`, `inventory`, and `rental` tables and filtering for NULLs.

---

## 🛠️ Tools & Techniques Used

- PostgreSQL
- SQL `LEFT JOIN`
- `IS NULL` filter
- CTE (Common Table Expression)
- pgAdmin (optional for visualization)

---

## 💡 SQL Query

```sql
WITH unrented_films AS (
    SELECT f.film_id, f.title
    FROM film f
    LEFT JOIN inventory i ON f.film_id = i.film_id
    LEFT JOIN rental r ON i.inventory_id = r.inventory_id
    WHERE r.rental_id IS NULL
)
SELECT * FROM unrented_films
ORDER BY title;
