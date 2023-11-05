                               -- A. PIZZA METRICS
-- CASE_STUDY_QUESTIONS
-- Each of the following case study questions can be answered using a single SQL statement:

SELECT * FROM runners;
SELECT * FROM runner_orders;
  SELECT * FROM pizza_toppings;
      SELECT * FROM pizza_names;
        SELECT * FROM customer_orders;
        
-- How many pizzas were ordered?
select count(order_id) from customer_orders
order by order_id;

-- How many unique customer orders were made?
SELECT count(distinct(order_id)) as unique_customer_order
  from customer_orders;
  
  -- How many successful orders were delivered by each runner?
  SELECT runner_id,count(order_id) as successful_orders
    FROM runner_orders
    where pickup_time is not null 
    group by runner_id;
  
  -- How many of each type of pizza was delivered?
  select p.pizza_id,p.pizza_name,count(c.pizza_id)as delivered
  from runner_orders r
  join customer_orders c
  using ( order_id)
  join pizza_names p on p.pizza_id = c.pizza_id
  where r.pickup_time is not null
  group by 1,2
  ;
  
  -- How many Vegetarian and Meatlovers were ordered by each customer?
  select customer_id,
  count(case when pizza_name = 'meatlovers' then pizza_id else end) meatlover_ordered,
  count(case when pizza_name = 'vegeterian' then pizza_id else  end) vegeterian_ordered
  from customer_orders c
  join pizza_names p using (pizza_id)
  group by 1
  ;
  
-- What was the maximum number of pizzas delivered in a single order?
  SELECT max(pizza_order) as max_delivery_per_order
    FROM( SELECT r.order_id,count(c.pizza_id) as pizza_order
    FROM runner_orders r
    join customer_orders c on r.order_id = c.order_id
    where pickup_time is not null 
    group by 1)as delivery_per_order
    order by  1 desc;
    
-- For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
SELECT  
    c.customer_id,
    sum(case when (exclusions or extras <> 'none' ) then 1 else 0 end )as changed_order,
    sum( case when(exclusions or extras = 'none')  then 1 else 0 end)as no_change_order_count
FROM
    customer_orders c
    JOIN runner_orders r USING (order_id)
WHERE pickup_time is not null
group by 1;
    
-- How many pizzas were delivered that had both exclusions and extras?

SELECT 
    COUNT(c.pizza_id) AS delivered_orders
FROM
    customer_orders c
    JOIN runner_orders r USING (order_id)
WHERE
exclusions and extras <> 'none'and
pickup_time is not null ;
          

-- What was the total volume of pizzas ordered for each hour of the day?

select
	extract(hour from order_time) as hour,
	count(pizza_id) as pizza_ordered
from customer_orders
group by 1
order by 2 desc;

-- What was the volume of orders for each day of the week?

select
	dayofweek(order_time) as days,
	count(order_id) as pizza_ordered
from customer_orders
group by 1
order by 2 desc;


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

                                         -- C. Ingredient Optimisation
-- What are the standard ingredients for each pizza?
-- What was the most commonly added extra?
-- What was the most common exclusion?
-- Generate an order item for each record in the customers_orders table in the format of one of the following:
-- Meat Lovers
-- Meat Lovers - Exclude Beef
-- Meat Lovers - Extra Bacon
-- Meat Lovers - Exclude Cheese, Bacon - Extra Mushroom, Peppers
-- Generate an alphabetically ordered comma separated ingredient list for 
-- each pizza order from the customer_orders table and add a 2x in front of any relevant ingredients
-- For example: "Meat Lovers: 2xBacon, Beef, ... , Salami"
-- What is the total quantity of each ingredient used in all delivered pizzas sorted by most frequent first?

