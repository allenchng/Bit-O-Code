# use window function to assign rank based on date
# left join to distinct product ids
# fill nulls with 10

SELECT t1.product_id, IFNULL(t2.new_price, 10) AS price
FROM (
    SELECT DISTINCT product_id
    FROM Products
) AS t1
LEFT JOIN (
    SELECT product_id, new_price, change_date,
        RANK() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS change_rank
    FROM Products
    WHERE change_date <= "2019-08-16"
) AS t2
ON t1.product_id = t2.product_id
AND t2.change_rank = 1;