-- simple left join and use coalesce to replace null values with 0

SELECT q.id, q.year, COALESCE(npv, 0) AS npv
FROM Queries AS q
LEFT JOIN NPV AS n
ON q.id = n.id 
AND q.year = n.year
ORDER BY id ASC