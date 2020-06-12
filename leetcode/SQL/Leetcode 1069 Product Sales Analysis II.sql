# window function over product
# Why do I need distinct product_id though?

SELECT DISTINCT product_id,
    SUM(quantity) OVER(PARTITION BY product_id) AS total_quantity
FROM Sales