SELECT DISTINCT title
FROM (
    SELECT c.title, DATE_FORMAT(program_date, "%Y-%m") AS ym
    FROM TVProgram AS t
    INNER JOIN Content AS c
        ON t.content_id = c.content_id
    WHERE c.content_type = "Movies" 
        AND c.Kids_content = "Y"
) AS t1
WHERE ym = "2020-06"