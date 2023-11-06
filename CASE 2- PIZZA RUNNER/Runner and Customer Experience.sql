  -- B. Runner and Customer Experience
               
-- how many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)

select extract(week from registration_date + 5) as week,count(runner_id) as signedup_count
from runners 
group by 1;

-- What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?

select runner_id,
     round( avg(timestampdiff(minute,order_time,pickup_time)),0) as time
from runner_orders r
join customer_orders c using (order_id) 
group by 1;

-- Is there any relationship between the number of pizzas and how long the order takes to prepare?
select pizza_cnt,avg(prep_time) from(
select count(c.pizza_id)as pizza_cnt, time_format(timediff(pickup_time,order_time),'%i.%s') as prep_time
from runner_orders r
join customer_orders c using (order_id) 
where pickup_time is not null    
group by 2) as prep
group by 1;

-- What was the average distance travelled for each customer?
select customer_id,concat(round(avg(distance),0),' km') as avg_distance
from runner_orders r
join customer_orders c using (order_id)
where distance is not null
group by 1;

-- What was the difference between the longest and shortest delivery times for all orders?
select  max(duration) - min(duration)as timediff
from runner_orders
where duration is not null
 ;
-- What was the average speed for each runner for each delivery and do you notice any trend for these values?
select  
	runner_id,
	order_id, 
		round(avg(distance / duration),2)as avg_speed,
	concat(round(avg(distance / (duration / 60))), ' km/hr') as speedperhour
from runner_orders
where pickup_time is not null
 group by 1,2
 order by 1,2;



-- What is the successful delivery percentage for each runner?
select runner_id,
concat(round((sum(case when pickup_time is not null then 1 else 0 end) / count(*) * 100)), '%') as delivery_percent
from runner_orders
group by 1;
