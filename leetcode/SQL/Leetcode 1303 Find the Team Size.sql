# First thing to notice is that the number of rows is not changing, this usually indicates we can use a window function to solve the problem
# Team size means I partition over the team_id and count the number of employees. No need to order in the window function for this problem

SELECT employee_id,
    COUNT(employee_id) OVER(PARTITION BY team_id) AS team_size
FROM Employee
ORDER BY employee_id