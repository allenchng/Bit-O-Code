# new field for column over 100
# window function, 3 cases to that sum to 3
# 1) current + 2 ahead
# 2) current - 2 behind
# 4) current + 1 ahead and -1 behind 

SELECT id, visit_date, people
FROM (
    SELECT *,
        SUM(over_100) OVER(ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS num1,
        SUM(over_100) OVER (ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) AS num2,
        SUM(over_100) OVER(ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS num3
    FROM (
        SELECT *,
            CASE WHEN people >= 100 THEN 1 ELSE 0 END AS over_100
        FROM stadium
    ) AS s1
) AS s2
WHERE num1 = 3
OR num2 = 3
OR num3 = 3;