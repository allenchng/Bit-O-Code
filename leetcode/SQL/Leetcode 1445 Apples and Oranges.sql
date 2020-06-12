# self join 
# filter for left side of subtraction to be apples, right side to be oranges
# take difference between values

SELECT s1.sale_date, s1.sold_num - s2.sold_num AS diff
FROM Sales AS s1
LEFT JOIN Sales AS s2
ON s1.sale_date = s2.sale_date
AND s1.fruit != s2.fruit
WHERE s1.fruit = 'apples' AND s2.fruit = 'oranges'