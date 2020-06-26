
# When I see each stock, I immediately think about grouping by. 
# One way to think about gain or loss is to convert buy into expenditure of money (-) and sell into acquisition of money (+)
# A way to modify price is to use a case when statement

SELECT stock_name, SUM(profit) AS capital_gain_loss
FROM (
    SELECT stock_name,
        CASE WHEN operation = "Buy" THEN price * -1 ELSE price END AS profit
    FROM Stocks
) AS t1
GROUP BY stock_name