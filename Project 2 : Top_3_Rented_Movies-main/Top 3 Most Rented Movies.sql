-- Top 3 Most Rented Movies
-- Description: Joined rental, inventory, and film tables to calculate rental frequency per film. Ranked top 3 most rented films using COUNT() and ROW_NUMBER().

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

