# 🎬 Top 3 Most Rented Movies — SQL Mini Project

## 🗂️ Project Summary
This SQL project analyzes a DVD Rental database to identify the top 3 most rented movies.  
It demonstrates skills in SQL joins, aggregations, and window functions.

---

## 📌 Objectives
- Count total rentals per movie
- Rank movies using `ROW_NUMBER()`
- List the top 3 rented movies

---

## 🛠️ Tools Used
- PostgreSQL
- pgAdmin
- DVD Rental sample database

---

## 🧠 SQL Concepts Used
- `INNER JOIN`
- `GROUP BY`
- `COUNT()`
- `ORDER BY`
- `ROW_NUMBER()` (window function)

---

## 🧾 SQL Query
```sql
SELECT 
    f.title,
    COUNT(r.rental_id) AS times_rent,
    ROW_NUMBER() OVER (ORDER BY COUNT(r.rental_id) DESC) AS rank
FROM 
    rental r 
INNER JOIN 
    inventory i ON i.inventory_id = r.inventory_id
INNER JOIN 
    film f ON i.film_id = f.film_id
GROUP BY 
    f.title
ORDER BY 
    times_rent DESC
LIMIT 3;

