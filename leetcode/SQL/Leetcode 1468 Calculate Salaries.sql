# find max for each company
# case when to get salary rate
# join back to salaries table
# calculate new salaries based on rate


SELECT sal.company_id, sal.employee_id, sal.employee_name, ROUND(salary - (salary*tax_rate)) AS salary
FROM salaries AS sal
JOIN (
    SELECT company_id,
        CASE WHEN max_salary < 1000 THEN 0
        WHEN max_salary BETWEEN 1000 AND 10000 THEN 0.24
        ELSE 0.49 END AS tax_rate
    FROM (
        SELECT company_id, MAX(salary) AS max_salary
        FROM Salaries
        GROUP BY company_id
    ) AS s1
) AS s2
ON sal.company_id = s2.company_id
ORDER BY company_id, employee_id;