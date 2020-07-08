-- dense rank time

SELECT Score AS score, 
    DENSE_RANK() OVER(ORDER BY Score DESC) AS 'Rank'
FROM Scores