-- cte to get tax rates
-- join back to original
-- calculate new salaries

WITH tax_rates AS (
    SELECT company_id,
        CASE WHEN max_sal < 1000 THEN 0
        WHEN max_sal >= 1000 AND max_sal <= 10000 THEN 0.24
        ELSE 0.49 END AS tax_rate
    FROM (
        SELECT company_id, MAX(salary) AS max_sal
        FROM Salaries
        GROUP BY company_id
    ) AS t1
)

SELECT s.company_id, s.employee_id, s.employee_name,
    ROUND(s.salary - (s.salary * t.tax_rate), 0) AS salary
FROM Salaries AS s
LEFT JOIN tax_rates AS t
ON s.company_id = t.company_id