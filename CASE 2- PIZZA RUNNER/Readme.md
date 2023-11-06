# [8-Week SQL Challenge](https://github.com/nzehh/8-Weeks-SQL-Challenge)

# Case Study 2 - Pizza Runner
<p align="center">
<img src="https://github.com/nzehh/8-Weeks-SQL-Challenge/blob/main/IMG/org-2.png" width=40% height=40%>


---

# Problem statement
Danny was scrolling through his Instagram feed when something really caught his eye - “80s Retro Styling and Pizza Is The Future!”

Danny was sold on the idea, but he knew that pizza alone was not going to help him get seed funding to expand his new Pizza Empire - so he had one more genius idea to combine with it - he was going to Uberize it - and so Pizza Runner was launched!

Danny started by recruiting “runners” to deliver fresh pizza from Pizza Runner Headquarters (otherwise known as Danny’s house) and also maxed out his credit card to pay freelance developers to build a mobile app to accept orders from customers.

# Dataset
 Danny shared 6 key datasets for this case study:

 ### **```Runner```**

 <details>
   <summary>
     View table
   </summary>
   This Runner table captures all ***runner_id*** and ***registration_date*** information of delivery runners

| runner_id   | registration_date |
|-------------|-------------------|
| 1           | 2021-01-01        |
| 2           | 2021-01-03        |
| 3           | 2021-01-08        |
| 4           | 2021-01-15        |
|             |                   |

 </details>

### **```Runner Orders```**

 <details>
   <summary>
     View table
   </summary>
   The Runner_orders table contains the ***order_id*** of delivery made by each ***runner_id***, the ***pickup_time***,***duration*** and ***distance*** covered
   
|  order_id  | runner_id | pickup_time         | distance | duration | cancellation            |
|------------|-----------|---------------------|----------|----------|-------------------------|
| 1          | 1         | 2020-01-01 18:15:34 | 20       | 32       |                         |
| 2          | 1         | 2020-01-01 19:10:54 | 20       | 27       |                         |
| 3          | 1         | 2020-01-03 00:12:37 | 13.4     | 20       |                         |
| 4          | 2         | 2020-01-04 13:53:03 | 23.4     | 40       |                         |
| 5          | 3         | 2020-01-08 21:10:57 | 10       | 15       |                         |
| 6          | 3         |                     |          |          | Restaurant Cancellation |
| 7          | 2         | 2020-01-08 21:30:45 | 25       | 25       |                         |
| 8          | 2         | 2020-01-10 00:15:02 | 23.4     | 15       |                         |
| 9          | 2         |                     |          |          | Customer Cancellation   |
| 10         | 1         | 2020-01-11 18:50:20 | 10       | 10       |                         |

 </details>

### **```Pizza toppings```**

<details>
  <summary>
    View table
  </summary>
|  topping_id  | topping_name |
|--------------|--------------|
| 1            | Bacon        |
| 2            | BBQ Sauce    |
| 3            | Beef         |
| 4            | Cheese       |
| 5            | Chicken      |
| 6            | Mushrooms    |
| 7            | Onions       |
| 8            | Pepperoni    |
| 9            | Peppers      |
| 10           | Salami       |
| 11           | Tomatoes     |
| 12           | Tomato Sauce |

</details>

### **```Pizza names```**

<details>
  <summary>
    View table
  </summary>
  
| pizza_id   | pizza_name |
|------------|------------|
| 1          | Meatlovers |
| 2          | Vegetarian |
</details>


### **```Customer orders```**

<details>
  <summary>
    View table
  </summary>
|            |             |          |            |        |                     |
|------------|-------------|----------|------------|--------|---------------------|
| # order_id | customer_id | pizza_id | exclusions | extras | order_time          |                    
| 1          | 101         | 1        | None       | None   | 2020-01-01 18:05:02 |                     
| 2          | 101         | 1        | None       | None   | 2020-01-01 19:00:52 |                     
| 3          | 102         | 1        | None       | None   | 2020-01-02 23:51:23 |                    
| 3          | 102         | 2        | None       | None   | 2020-01-02 23:51:23 |                     
| 4          | 103         | 1        | 4          | None   | 2020-01-04 13:23:46 |                     
| 4          | 103         | 1        | 4          | None   | 2020-01-04 13:23:46 |                    
| 4          | 103         | 2        | 4          | None   | 2020-01-04 13:23:46 |                     
| 5          | 104         | 1        | None       | 1      | 2020-01-08 21:00:29 |                     
| 6          | 101         | 2        | None       | None   | 2020-01-08 21:03:13 |                    
| 7          | 105         | 2        | None       | 1      | 2020-01-08 21:20:29 |                    
| 8          | 102         | 1        | None       | None   | 2020-01-09 23:54:33 |                   
| 9          | 103         | 1        | 4          | 1,5    | 2020-01-10 11:22:59 |                     
| 10         | 104         | 1        | None       | None   | 2020-01-11 18:34:49 |                  
| 10         | 104         | 1        | 2,6        | 1,4    | 2020-01-11 18:34:49 |

</details>

<details>
  <summary>
    View table 
  </summary>

| # pizza_id | toppings |   |   |   |    |    |   |    |
|------------|----------|---|---|---|----|----|---|----|
| 1          | 1        | 2 | 3 | 4 | 5  | 6  | 8 | 10 |
| 2          | 4        | 6 | 7 | 9 | 11 | 12 |   |    |

</details>

# Data Preprocessing

# Data Issues

 Issues dictated in the dataset prior to cleaning include:

 ```Customer_orders``` table
      (i) ```null``` values entered as text
      (ii) using both ``nan`` and ```null```
```Runner_orders``` table
      (i) ```null``` values entered as text
      (ii) using both ```nan``` and ```null``` values 
      (iii) units manually entered in ```distance``` and ```duration``` columns

# Data Cleaning

```Customer_orders```

   (i) converted ```null``` and ```nan``` values into ```none``` in the exclusion and extras column.
      where ```none``` shows no extras or exclusions where made 
      
```Runner_orders```

   (i) converting ```'null'``` text to null values for pickup-time, distance and duration
   (ii) total removal of the units and extrating only numbers and decimal spaces for distance and duration
   (iii) converting ```nan``` into null values
   (iv) saved the transformation in a different table

   Click [here](https://github.com/nzehh/8-Weeks-SQL-Challenge/blob/main/CASE%202-%20PIZZA%20RUNNER/Case%202%20data%20cleaning.sql) to view data cleaning solution

# Solutions

<details>
 <summary>
Pizza Metrics
  </summary>
### **Q1. How many pizzas were ordered?**
 
 ```sql
select count(order_id) from customer_orders
order by order_id;
 
```
 
| # count(order_id) |
|-------------------|
| 14                |

---

### **Q2. How many unique customer orders were made?**

 ```sql
SELECT count(distinct(order_id)) as unique_customer_order
  from customer_orders;

  ```

| # unique_customer_order |
|-------------------------|
| 10                      |

---

 ### **Q3. How many successful orders were delivered by each runner?**
 
 ```sql
  SELECT runner_id,count(order_id) as successful_orders
    FROM runner_orders
    where pickup_time is not null 
    group by runner_id;

  ```
| # runner_id | successful_orders |
|-------------|-------------------|
| 1           | 4                 |
| 2           | 3                 |
| 3           | 1                 |

---

 ### **Q4. How many of each type of pizza was delivered?**
 
 ```sql
  select p.pizza_id,p.pizza_name,count(c.pizza_id)as delivered
  from runner_orders r
  join customer_orders c
  using ( order_id)
  join pizza_names p on p.pizza_id = c.pizza_id
  where r.pickup_time is not null
  group by 1,2
  ;

  ```
| # pizza_id | pizza_name | delivered |
|------------|------------|-----------|
| 1          | Meatlovers | 9         |
| 2          | Vegetarian | 3         |

---

  ### **Q5. How many Vegetarian and Meatlovers were ordered by each customer?**
  
  ```sql
  select customer_id,
  count(case when pizza_name = 'meatlovers' then pizza_id else end) meatlover_ordered,
  count(case when pizza_name = 'vegeterian' then pizza_id else  end) vegeterian_ordered
  from customer_orders c
  join pizza_names p using (pizza_id)
  group by 1
  ;

```

| # customer_id | meatlover_ordered | vegeterian_ordered |
|---------------|-------------------|--------------------|
| 101           | 2                 | 1                  |
| 102           | 2                 | 1                  |
| 103           | 3                 | 1                  |
| 104           | 3                 | 0                  |
| 105           | 0                 | 1                  |

 ---
 
  ### **Q6. What was the maximum number of pizzas delivered in a single order?**
  
  ```sql
  SELECT max(pizza_order) as max_delivery_per_order
    FROM( SELECT r.order_id,count(c.pizza_id) as pizza_order
    FROM runner_orders r
    join customer_orders c on r.order_id = c.order_id
    where pickup_time is not null 
    group by 1)as delivery_per_order
    order by  1 desc;

 ```

| # max_delivery_per_order |
|--------------------------|
| 3                        |

---

### **Q7. For each customer, how many delivered pizzas had at least 1 change and how many had no changes?**

```sql
SELECT  
    c.customer_id,
    sum(case when (exclusions or extras <> 'none' ) then 1 else 0 end )as changed_order,
    sum( case when(exclusions or extras = 'none')  then 1 else 0 end)as no_change_order_count
FROM
    customer_orders c
    JOIN runner_orders r USING (order_id)
WHERE pickup_time is not null
group by 1;

```

| # customer_id | changed_order | no_change_order_count |
|---------------|---------------|-----------------------|
| 101           | 0             | 2                     |
| 102           | 0             | 3                     |
| 103           | 3             | 3                     |
| 104           | 2             | 2                     |
| 105           | 1             | 0                     |
|               |               |                       |

---
    
### **Q8. How many pizzas were delivered that had both exclusions and extras?**
```sql
SELECT 
    COUNT(c.pizza_id) AS delivered_orders
FROM
    customer_orders c
    JOIN runner_orders r USING (order_id)
WHERE
exclusions and extras <> 'none'and
pickup_time is not null ;
 ```
| # delivered_orders |
|--------------------|
| 1                  |

---         

### **Q9. What was the total volume of pizzas ordered for each hour of the day?**

```sql
select
	extract(hour from order_time) as hour,
	count(pizza_id) as pizza_ordered
from customer_orders
group by 1
order by 2 desc;

```

| # hour | pizza_ordered |
|--------|---------------|
| 18     | 3             |
| 23     | 3             |
| 13     | 3             |
| 21     | 3             |
| 19     | 1             |
| 11     | 1             |

---

### **Q10. What was the volume of orders for each day of the week?**

```sql
select
	dayofweek(order_time) as days,
	count(order_id) as pizza_ordered
from customer_orders
group by 1
order by 2 desc;

```

| # days | pizza_ordered |
|--------|---------------|
| 4      | 5             |
| 7      | 5             |
| 5      | 3             |
| 6      | 1             |

---

 </details>

 <details>
  <summary>
Runner and Customer Experience
</summary>
  
### **Q1. how many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)?**

```sql
select extract(week from registration_date + 5) as week,count(runner_id) as signedup_count
from runners 
group by 1;
```
| # week | signedup_count |
|--------|----------------|
| 1      | 2              |
| 2      | 1              |
| 3      | 1              |

---

### **Q2. What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?**

```sql
select runner_id,
     round( avg(timestampdiff(minute,order_time,pickup_time)),0) as time
from runner_orders r
join customer_orders c using (order_id) 
group by 1;
```
| # runner_id | time |
|-------------|------|
| 1           | 15   |
| 2           | 23   |
| 3           | 10   |

---

### **Q3. Is there any relationship between the number of pizzas and how long the order takes to prepare?**

```sql
select pizza_cnt,avg(prep_time) from(
select count(c.pizza_id)as pizza_cnt, time_format(timediff(pickup_time,order_time),'%i.%s') as prep_time
from runner_orders r
join customer_orders c using (order_id) 
where pickup_time is not null    
group by 2) as prep
group by 1;
```
| # pizza_cnt | avg(prep_time) |
|-------------|----------------|
| 1           | 12.214         |
| 2           | 18.225         |
| 3           | 29.17          |

---

### **Q4. What was the average distance travelled for each customer?**

```sql
select customer_id,concat(round(avg(distance),0),' km') as avg_distance
from runner_orders r
join customer_orders c using (order_id)
where distance is not null
group by 1;
```
| # customer_id | avg_distance |
|---------------|--------------|
| 101           | 20 km        |
| 102           | 17 km        |
| 103           | 23 km        |
| 104           | 10 km        |
| 105           | 25 km        |

---

 ### **Q5. What was the difference between the longest and shortest delivery times for all orders?**
 
 ```sql
select  max(duration) - min(duration)as timediff
from runner_orders
where duration is not null
 ;
```
| # timediff |
|------------|
| 30         |

---

### **Q6. What was the average speed for each runner for each delivery and do you notice any trend for these values?**

```SQL
select  
	runner_id,
	order_id, 
		round(avg(distance / duration),2)as avg_speed,
	concat(round(avg(distance / (duration / 60))), ' km/hr') as speedperhour
from runner_orders
where pickup_time is not null
 group by 1,2
 order by 1,2;
```
| # runner_id | order_id | avg_speed | speedperhour |
|-------------|----------|-----------|--------------|
| 1           | 1        | 0.62      | 38 km/hr     |
| 1           | 2        | 0.74      | 44 km/hr     |
| 1           | 3        | 0.67      | 40 km/hr     |
| 1           | 10       | 1         | 60 km/hr     |
| 2           | 4        | 0.58      | 35 km/hr     |
| 2           | 7        | 1         | 60 km/hr     |
| 2           | 8        | 1.56      | 94 km/hr     |
| 3           | 5        | 0.67      | 40 km/hr     |

---


### **Q7. What is the successful delivery percentage for each runner?**

```sql
select runner_id,
concat(round((sum(case when pickup_time is not null then 1 else 0 end) / count(*) * 100)), '%') as delivery_percent
from runner_orders
group by 1;

```
| # runner_id | delivery_percent |
|-------------|------------------|
| 1           | 100%             |
| 2           | 75%              |
| 3           | 50%              |

---
</details>


