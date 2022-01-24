Question 3: Count
select count(*) from public.yellow_tripdata
where tpep_pickup_datetime::date = '2021-01-15'


-- Question 4: Largest tip for each day *
select max(tip_amount), tpep_pickup_datetime::date from public.yellow_tripdata
group by tpep_pickup_datetime, tip_amount
order by tip_amount desc
limit 1

-- Question 5: Most popular destination *
select count(zdo."Zone") as drop_off_zone,  zdo."Zone"
from public.yellow_tripdata t
inner join public.zones zpu on t."DOLocationID" = zpu."LocationID"
INNER JOIN public.zones zdo on t."PULocationID" = zdo."LocationID"
where zpu."Zone" like '%Central Park%' and t.tpep_dropoff_datetime::date = '2021-01-14'
group by zdo."Zone"
order by count(zdo."Zone") desc

