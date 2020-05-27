# find max employees
# select max employee num
# nest in having
# where count employees is equal to max

SELECT project_id
FROM Project
GROUP BY project_id
HAVING COUNT(employee_id) = (
    SELECT MAX(num)
    FROM(
        SELECT project_id, COUNT(employee_id) AS num
        FROM Project
        GROUP BY project_id
    ) AS t1
);