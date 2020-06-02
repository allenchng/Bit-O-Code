# window function to get ranks
# pull top 3
# join to get department names
# use inner join for cases where department is null

# Department | Employee | Salary

SELECT d.Name AS Department, t1.name AS Employee, t1.Salary AS Salary
FROM (
    SELECT *,
        DENSE_RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS sal_rank
    FROM Employee AS e
) AS t1
INNER JOIN Department AS d
ON t1.DepartmentId = d.Id
WHERE sal_rank <= 3;

