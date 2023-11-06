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
[Pizza Metrics](https://github.com/nzehh/8-Weeks-SQL-Challenge/blob/main/CASE%202-%20PIZZA%20RUNNER/Pizza%20Metric.sql)
[Runner and Customer Experience](https://github.com/nzehh/8-Weeks-SQL-Challenge/blob/main/CASE%202-%20PIZZA%20RUNNER/Runner%20and%20Customer%20Experience.sql)




