# Department | Employee | Salary

-- window function, return ranks of salary
-- filter for rank 1
--  left join back onto department

SELECT d.Name AS Department, t1.name AS Employee, t1.Salary
FROM Department AS d
INNER JOIN (
    SELECT DepartmentId,
        Name,
        Salary,
        RANK() OVER(PARTITION BY DepartmentId ORDER BY Salary DESC) AS salary_rank
    FROM Employee
) AS t1
ON d.id = t1.DepartmentId
WHERE salary_rank = 1