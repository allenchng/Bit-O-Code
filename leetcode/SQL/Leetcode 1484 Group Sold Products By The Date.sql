# Group by the sell date, concatenate string together ordering by alphabetical order

SELECT sell_date, COUNT(DISTINCT product) AS num_sold, 
GROUP_CONCAT(DISTINCT product ORDER BY product ASC SEPARATOR  ',') AS products
FROM Activities
GROUP BY sell_date