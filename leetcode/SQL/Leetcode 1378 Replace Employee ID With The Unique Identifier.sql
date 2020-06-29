# A left join naturally fills rows in the first table that do not have a match in the second table with NULL

SELECT e2.unique_id, e1.name
FROM Employees AS e1
LEFT JOIN EmployeeUNI AS e2
ON e1.id = e2.id