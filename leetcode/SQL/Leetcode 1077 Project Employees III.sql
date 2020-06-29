# project_id | employee_id

-- want the rank of seniority for each employee
-- use rank as opposed to dense rank because you can have ties

SELECT project_id, employee_id
FROM (
    SELECT project_id, employee_id, experience_years,
        RANK() OVER(PARTITION BY project_id ORDER BY experience_years DESC) AS seniority_rank
    FROM (
        SELECT p.project_id, e.employee_id, e.experience_years
        FROM Project AS p
        LEFT JOIN Employee AS e
        ON p.employee_id = e.employee_id
    ) AS t1
) AS t2
WHERE seniority_rank = 1