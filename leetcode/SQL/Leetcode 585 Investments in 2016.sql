# window function to count the number of unique values for TIV_2015
# adds fields to each row
# filter for rows where TIV_2015 is greater than or equal to 2
# filter for lat_lon equal to 1 (has to be unique)


SELECT ROUND(SUM(TIV_2016), 2) AS TIV_2016
FROM (
    SELECT *,
        COUNT(*) OVER(PARTITION BY TIV_2015) AS num1,
        COUNT(*) OVER(PARTITION BY LAT, LON) AS num2
    FROM insurance
) AS t1
WHERE num1 >= 2
AND num2 = 1;