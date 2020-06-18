
# window function over student
# rank top score, order by grade and course_id (for ties)
# outer query pulls rank 1

SELECT student_id, course_id, grade
FROM (
    SELECT student_id,
        course_id,
        grade,
        RANK() OVER(PARTITION BY student_id ORDER BY grade DESC, course_id ASC) AS course_rank
    FROM Enrollments
) AS t1
WHERE course_rank = 1
ORDER BY student_id