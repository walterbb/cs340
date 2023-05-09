-- We want to find out how many of each category of film MAE HOFFMAN has starred in.

-- So return a table with category_name and the count of the number_of_films that MAE was in that category.

-- Your query should return every category even if MAE has been in no films in that category

-- Order by the category name in descending order.

SELECT c.category_name, COUNT(fc.film_id) as number_of_films
FROM category c
LEFT JOIN film_category fc ON c.category_id = fc.category_id
LEFT JOIN film_actor fa ON fc.film_id = fa.film_id
LEFT JOIN actor a ON fa.actor_id = a.actor_id AND a.first_name = 'Mae' AND a.last_name = 'Hoffman'
GROUP BY c.category_name;