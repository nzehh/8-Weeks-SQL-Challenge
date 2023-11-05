-- Data Cleaning
-- the customer_orders table was updated to fill the blank and null values with 'NONE' indicating that no exclusions or extras were either made nor ordered
-- after countless attempt to update columns in this table, i kept getting errors 1175, so i disabled the safe mode using the statement:
set sql_safe_updates=0;
set sql_safe_updates=1;

UPDATE customer_orders
SET exclusions = case when exclusions = '' or exclusions= 'null' then 'None' else exclusions end,
extras = case when extras = '' or extras ='Null' then 'None' else extras end
 ;
SELECT * FROM customer_orders;

Update runner_orders
set 
  pickup_time = case when pickup_time = 'null' then null else pickup_time end,
  distance = case when distance = 'null' then null else distance end,
  duration = case when duration = 'null' then null else duration end,
  cancellation = case when cancellation = 'null' then null else cancellation end,
  distance = trim(replace(distance, 'km', '')),
  duration = case
				when duration like '%mins%' then trim('mins' from duration)
				when duration like '%minutes%' then trim(replace(duration, 'minutes', ''))
				when duration like '%minute%' then trim('minute' from duration)
				else duration end
;																																																																																																
SELECT * FROM runner_orders;