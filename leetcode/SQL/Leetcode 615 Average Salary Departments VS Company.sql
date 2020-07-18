-- cte to get department onto salary table
-- window function to get avg per month for company and for each deprtment, month
-- group by ym and deparmtment to aggregate values, can also prob take distinct since all values will be same
-- simple case when to tag as higher lower or same

WITH i AS (
    SELECT s.employee_id, s.amount,
        DATE_FORMAT(s.pay_date, "%Y-%m") AS ym,
        department_id
    FROM salary AS s
    LEFT JOIN employee AS e
    ON s.employee_id = e.employee_id
)

SELECT ym AS pay_month, department_id,
    CASE WHEN dept_avg > comp_avg THEN "higher"
    WHEN dept_avg = comp_avg THEN "same"
    ELSE "lower" END AS Comparison
FROM (
    SELECT ym, department_id,
        AVG(dept_avg) AS dept_avg,
        AVG(comp_avg) AS comp_avg
    FROM (
        SELECT ym, department_id,
            AVG(amount) OVER(PARTITION BY ym, department_id) AS dept_avg,
            AVG(amount) OVER(PARTITION BY ym) AS comp_avg
        FROM i
    ) AS t1
    GROUP BY 1,2 
) AS t2