# project_id | employee_id

# most experience employees in each project

# project_id | employee_name | experience_years
# join project and employee
# window funciton to rank years by project
# return rank == 1


SELECT project_id, employee_id
FROM (
    SELECT p.project_id, p.employee_id,
        RANK() OVER(PARTITION BY project_id ORDER BY experience_years DESC) AS year_rank
    FROM Project AS p
    LEFT JOIN Employee As e
    ON p.employee_id = e.employee_id
) AS t1
WHERE year_rank = 1;