-- write query general enough to adapt to any product table
-- filter for product keys in product
-- filter after aggregation for num unique keys

SELECT customer_id
FROM Customer
WHERE product_key IN (
    SELECT product_key
    FROM Product
    )
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (
    SELECT COUNT(DISTINCT product_key)
    FROM Product
    )
    