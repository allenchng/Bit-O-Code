-- inner join removes manager row
-- group by and having to filter

SELECT e2.name
FROM Employee AS e1 
INNER JOIN Employee AS e2
ON e1.ManagerId = e2.Id
GROUP BY e2.Name
HAVING COUNT(*) >= 5

