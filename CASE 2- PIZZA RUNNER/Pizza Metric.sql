                               -- A. PIZZA METRICS
-- CASE_STUDY_QUESTIONS
-- Each of the following case study questions can be answered using a single SQL statement:

SELECT * FROM runners;
SELECT * FROM runner_orders;
  SELECT * FROM pizza_toppings;
      SELECT * FROM pizza_names;
        SELECT * FROM customer_orders;
        select * from pizza_recipes;
        
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