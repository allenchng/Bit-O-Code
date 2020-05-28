# self join to get fields for oranges
# want to moake sure fruits don't match when joining

# sale_date | fruit | sold_num | sale_date | fruit | sold_num
# 01 apples 10 01 oranges 8


SELECT s1.sale_date, s2.sold_num - s1.sold_num AS diff
FROM Sales AS s1
JOIN Sales AS s2
ON (s1.sale_date = s2.sale_date) AND s1.fruit != s2.fruit
GROUP BY s1.sale_date
ORDER BY s1.sale_date