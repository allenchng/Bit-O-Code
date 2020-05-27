# project_id | employee_id

# join employee to project to get number of experience_year for each employee 
# window to get max for each project

SELECT project_id, employee_id
FROM (
    SELECT project_id,
        employee_id,
        RANK() OVER(PARTITION BY project_id ORDER BY experience_years DESC) AS exp_rank
    FROM (
        SELECT p.project_id, e.employee_id, e.name, e.experience_years
        FROM Project AS p
        INNER JOIN Employee AS e
        ON p.employee_id = e.employee_id
    ) AS t1
) AS t2
WHERE exp_rank = 1;