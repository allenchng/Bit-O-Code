-- median = rank order
-- column for rank
-- column for n / 2
-- if odd, mod is going to be rounded to 1
-- if even, mode is going to be rounded to 0
-- want to add 0.5 to odd, 1 to even (returns two midpoints)

SELECT Id, Company, Salary
FROM (
    SELECT *, 
        CASE WHEN rem = 0 THEN midpoint_one + 1
        ELSE midpoint_one + 0.5 END AS midpoint_two
    FROM (
        SELECT Id, Company, Salary,
            ROW_NUMBER() OVER(PARTITION BY Company ORDER BY Salary DESC, Id DESC) AS sal_rank,
            COUNT(Id) OVER(PARTITION BY Company) / 2 AS midpoint_one,
            MOD(COUNT(Id) OVER(PARTITION BY Company), 2) AS rem
        FROM Employee
    ) AS t1
) AS t2
WHERE sal_rank = midpoint_one OR sal_rank = midpoint_two
ORDER BY Company ASC, Salary ASC