-- simple rank window function

SELECT product_id, year AS first_year, quantity, price
FROM (
    SELECT product_id, year, quantity, price,
        RANK() OVER(PARTITION BY product_id ORDER BY year ASC) AS year_rank
    FROM Sales
) AS t1
WHERE year_rank = 1