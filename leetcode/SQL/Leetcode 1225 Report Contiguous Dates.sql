-- fails on leetcode because lc sql doesn't know how to do date subtraction at month ends
-- probably a more efficient way is to concat tables with period state and partition over period state
-- would avoid having to duplicate code

SELECT period_state, start_date, end_date
FROM (
    SELECT MIN(success_date) AS start_date, MAX(success_date) AS end_date, "succeeded" AS period_state
    FROM (
        SELECT success_date,
            success_date - RANK() OVER(ORDER BY success_date ASC) AS date_con
        FROM Succeeded
        WHERE EXTRACT(YEAR FROM success_date) = 2019
    ) AS t1
    GROUP BY date_con

    UNION

    SELECT MIN(fail_date) AS start_date, MAX(fail_date) AS end_date, "failed" AS period_state
    FROM (
        SELECT fail_date,
            fail_date - RANK() OVER(ORDER BY fail_date ASC) AS fail_con
        FROM Failed
        WHERE EXTRACT(YEAR FROM fail_date) = 2019
    ) AS t2
    GROUP BY fail_con
) AS t3
ORDER BY 2

