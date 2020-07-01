-- group by and using first_value to get min and max value
-- need to investigate why last_value behaves so differently

SELECT activity
FROM (
    SELECT activity, num_act,
        FIRST_VALUE(num_act) OVER(ORDER BY num_act DESC) AS max_value,
        FIRST_VALUE(num_act) OVER(ORDER BY num_act) AS min_value
    FROM (
        SELECT activity, COUNT(*) AS num_act
        FROM Friends
        GROUP BY activity
    ) AS t1  
) AS t2
WHERE num_act < max_value AND num_act > min_value