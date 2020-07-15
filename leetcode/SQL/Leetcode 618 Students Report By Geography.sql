-- window function to alphabetically rank names by country
-- "pivot" using case when functions
-- grouping by rank and taking the min of each field "lifts" names to the top

SELECT MIN(America) AS America, MIN(Asia) AS Asia, MIN(Europe) AS Europe
FROM (
    SELECT
        ROW_NUMBER() OVER (PARTITION BY continent ORDER BY name) AS alpharank,
        CASE WHEN continent = 'America' THEN name ELSE NULL END AS America,
        CASE WHEN continent = 'Asia' THEN name ELSE NULL END AS Asia,
        CASE WHEN continent = 'Europe' THEN name ELSE NULL END AS Europe
        FROM student
) AS t1
GROUP BY alpharank
ORDER BY alpharank;
