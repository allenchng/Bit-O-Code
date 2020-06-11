# window function to get most recent month
# filter out most recent (where rank = 1)
# inner join to employees
# second window function to compute running total
# since only want 3 month rolling sum, constrain window over 2 preceding


SELECT e.Id, e.Month,
    SUM(e.Salary) OVER(PARTITION BY Id ORDER BY Month ROWS 
                     BETWEEN 2 PRECEDING AND CURRENT ROW) AS Salary
FROM Employee AS e
INNER JOIN (
    SELECT *
    FROM (
        SELECT Id,
            month,
            RANK() OVER(PARTITION BY Id ORDER BY Month DESC) AS month_rank
        FROM Employee
    ) AS s1
    WHERE month_rank != 1
) AS s2
ON e.Id = s2.Id
AND e.month = s2.month
ORDER BY 1, 2 DESC;