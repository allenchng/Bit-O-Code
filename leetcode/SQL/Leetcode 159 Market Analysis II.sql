# get second sale for each seller_id
# window function to get rank of each order date
# left join items to get names
# left join back to users
# on order rank 2
# check if favorite brand is same as item brand


SELECT u.user_id AS seller_id,
    CASE WHEN u.favorite_brand = t1.item_brand THEN "yes" ELSE "no" END AS 2nd_item_fav_brand
FROM Users AS u
LEFT JOIN (
    SELECT o.seller_id,
        o.item_id,
        i.item_brand,
        RANK() OVER(PARTITION BY o.seller_id ORDER BY o.order_date) AS order_rank
    FROM Orders AS o
    LEFT JOIN Items AS i
    ON o.item_id = i.item_id
) AS t1
ON u.user_id = t1.seller_id
AND order_rank = 2