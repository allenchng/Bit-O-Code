# each question id
# answer / answer + skip
# use case when to sum up num answers / num questions

SELECT question_id AS survey_log
FROM (
    SELECT 
        question_id,
        SUM(CASE WHEN action = "answer" THEN 1 ELSE 0 END) / SUM(CASE WHEN action = 'show' THEN 1 ELSE 0 END) AS perc_answer
    FROM survey_log
    GROUP BY question_id
) AS t1
ORDER BY perc_answer DESC
LIMIT 1;
