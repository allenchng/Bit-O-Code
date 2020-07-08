-- window function to get next number
-- filter for rows where 3 consecutive
-- return distinct nums

SELECT DISTINCT Num AS ConsecutiveNums
FROM (
    SELECT Id, Num,
        LEAD(Num, 1) OVER(ORDER BY Id ASC) AS up1,
        LEAD(Num, 2) OVER(ORDER BY Id ASC) AS up2
    From Logs
) AS t1
WHERE Num=up1 AND up1=up2