-- simple group by into join

SELECT d.dept_name, COALESCE(num_students, 0) AS student_number
FROM department AS d
LEFT JOIN (
    SELECT dept_id, COUNT(student_id) As num_students
    FROM student
    GROUP BY dept_id
) AS t1
ON d.dept_id = t1.dept_id
ORDER BY student_number DESC, dept_name ASC

