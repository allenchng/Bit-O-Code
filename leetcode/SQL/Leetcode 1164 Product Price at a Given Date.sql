
-- filter for prices for all dates prior to 8-17
-- use window function to assign rank based on date over each product
-- left join to distinct product ids
-- left join back to distinct product id's, coalesce when null -> 10

SELECT d_prod.product_id, COALESCE(new_price, 10) AS price
FROM (
    SELECT DISTINCT product_id
    FROM Products
) AS d_prod
LEFT JOIN (
    SELECT product_id, new_price
    FROM (
        SELECT product_id, new_price,
            RANK() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS most_recent
        FROM Products
        WHERE change_date < "2019-08-17"
    ) AS t1
    WHERE most_recent = 1
) AS t2
ON d_prod.product_id = t2.product_id
ORDER BY price DESC