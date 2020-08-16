-- nest lower and trim functions to take care of text data

SELECT product_name AS PRODUCT_NAME, sale_date AS SALE_DATE, COUNT(*) AS TOTAL
FROM (
    SELECT sale_id, LOWER(TRIM(product_name)) AS product_name, DATE_FORMAT(sale_date, "%Y-%m") AS sale_date
    FROM Sales
) AS t1
GROUP BY product_name, sale_date
ORDER BY product_name ASC, sale_date ASC