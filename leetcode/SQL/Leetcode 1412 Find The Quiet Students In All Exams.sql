# use window function to find students that have max and min scores on each test
# use in subq for Student table where id NOT in max or min
# because returning all rows, need to filter for where score field is same as max or min field
# use another where subq to find students that don't take any test (5)


SELECT student_id, student_name
FROM Student
WHERE student_id NOT IN (
    SELECT student_id
    FROM (
        SELECT exam_id, student_id, score,
            MAX(score) OVER(PARTITION BY exam_id) AS max_score,
            MIN(score) OVER(PARTITION BY exam_id) AS min_score
        FROM Exam
    ) AS s1
    WHERE score = max_score OR score = min_score
)
AND student_id IN (
    SELECT DISTINCT student_id
    FROM Exam);