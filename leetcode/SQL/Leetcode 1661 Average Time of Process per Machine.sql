
-- calculating at the machine grain
-- window function that partitions over machine_id and process_id and takes diff between start and end using lag
-- since window function partitions over process_id can take average

select 
    machine_id
    , round(avg(diff), 3) as processing_time
from (
    select
        *
        , timestamp - lag(timestamp) over (partition by machine_id, process_id order by timestamp asc) as diff
    from Activity
) as t1
where diff is not null
group by 1