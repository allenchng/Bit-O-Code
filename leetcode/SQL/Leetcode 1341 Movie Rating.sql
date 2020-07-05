-- split into multiple queries that are unioned
-- first query: aggregate and count rantings. Rank by num ratings
-- second query: extract time date information, filter for feb 2020, average ratings over month. rank

SELECT name AS results
FROM (
    SELECT name, num_ratings,
        RANK() OVER(ORDER BY num_ratings DESC, name ASC) AS rating_rank
    FROM (
        SELECT m.user_id, u.name, COUNT(DISTINCT movie_id) AS num_ratings
        FROM Movie_Rating AS m
        LEFT JOIN Users AS u
        ON m.user_id = u.user_id
        GROUP BY m.user_id
    ) AS t1
) AS t2
WHERE rating_rank = 1

UNION

SELECT title AS results
FROM (
    SELECT title, avg_rating,
        RANK() OVER(ORDER BY avg_rating DESC, title ASC) AS rating_rank
    FROM (
        SELECT title, AVG(rating) AS avg_rating
        FROM (
            SELECT m1.movie_id, m2.title, rating, EXTRACT(YEAR_MONTH FROM created_at) AS yr_mnth
            FROM Movie_Rating AS m1
            LEFT JOIN Movies AS m2
            ON m1.movie_id = m2.movie_id
        ) AS t3
        WHERE yr_mnth = 202002
        GROUP BY title
    ) AS t4
) AS t5
WHERE rating_rank = 1