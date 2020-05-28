# group by ad_id
# CASE when clicked 1, viewed 0, convert ignored to null
# use if null to coerce null's to 0



SELECT ad_id,
    IFNULL(ROUND(AVG(CASE WHEN action = "Clicked" THEN 1
    WHEN action = "Viewed" THEN 0
    ELSE NULL END) * 100.0, 2), 0) AS ctr
FROM Ads
GROUP BY ad_id
ORDER BY ctr DESC, ad_id ASC