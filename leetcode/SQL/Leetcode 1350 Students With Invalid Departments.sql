# department_id | name

# Looking for department_id's that do not exist in the departments table
# One way to solve the problem is to write a WHERE subquery that selects id's from department

SELECT id, name
FROM Students
WHERE department_id NOT IN (
    SELECT DISTINCT id
    FROM Departments);