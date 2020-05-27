# project_id | avg_experience 

# join project with employee to get years
# group by project_id, avg years
# round to 2

SELECT project_id, ROUND(AVG(experience_years), 2) AS average_years
FROM Project AS p
LEFT JOIN Employee as e
ON p.employee_id = e.employee_id
GROUP BY project_id;