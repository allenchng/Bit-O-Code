-- filter orders that aren't in the last year
-- aggregate across book_id
-- Left join to books to capture books that haven't made any sales 
-- filter out books published in the last month
-- filter for books that have sold fewer than 10

SELECT book_id, name
FROM (
    SELECT b.book_id, b.name, COALESCE(t1.num_sold, 0) AS num_sold
    FROM Books AS b
    LEFT JOIN (
        SELECT book_id, SUM(quantity) AS num_sold
        FROM Orders
        # WHERE dispatch_date > ("2019-06-23" - INTERVAL 1 YEAR)
        WHERE dispatch_date > DATE_SUB("2019-06-23", INTERVAL 1 YEAR)
        GROUP BY book_id
    ) AS t1
    ON b.book_id = t1.book_id
    WHERE b.available_from < DATE_SUB("2019-06-23", INTERVAL 1 MONTH)
) AS t2
WHERE num_sold < 10