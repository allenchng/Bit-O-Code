-- subquery to identify sellers that sold in 2020

select seller_name
from Seller
where seller_id not in (
    select seller_id
    from Orders
    where date_format(sale_date, "%Y") = 2020
)
order by 1 asc