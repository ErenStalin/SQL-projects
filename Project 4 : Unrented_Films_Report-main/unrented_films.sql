WITH unrented_films AS (
    SELECT f.film_id, f.title
    FROM film f
    LEFT JOIN inventory i ON f.film_id = i.film_id
    LEFT JOIN rental r ON i.inventory_id = r.inventory_id
    WHERE r.rental_id IS NULL
)
SELECT * FROM unrented_films
ORDER BY title;
