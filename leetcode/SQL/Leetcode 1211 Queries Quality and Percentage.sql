# quality = avg(rating / position)
# poor query percentage perc with ratings less than 3

# query_name | quality | poor_query_percentage
# group by also works


SELECT query_name,
    ROUND(AVG(rating / position), 2) AS quality,
    ROUND(AVG(CASE WHEN rating < 3 THEN 1 ELSE 0 END) *100.00, 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;