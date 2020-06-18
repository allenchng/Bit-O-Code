# left join twice to get manager id's
# if you report directly to the boss, second left join just returns boss again
# take e3 manager id

SELECT e1.employee_id
FROM Employees AS e1
LEFT JOIN Employees AS e2
ON e1.manager_id = e2.employee_id
LEFT JOIN Employees AS e3
ON e2.manager_id = e3.employee_id
WHERE e1.employee_id != 1 AND e3.manager_id = 1
