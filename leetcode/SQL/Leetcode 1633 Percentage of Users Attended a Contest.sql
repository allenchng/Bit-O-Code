-- contest_id grain


select 
    contest_id
    , round((count(distinct user_id) / (select count(distinct user_id) from Users)) * 100.0, 2) as percentage
from Register
group by contest_id
order by percentage desc, contest_id asc