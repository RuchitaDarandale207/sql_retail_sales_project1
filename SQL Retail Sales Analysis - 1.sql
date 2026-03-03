--Project: SQL Retail Sales Analysis

CREATE TABLE retail_sales
(
	transactions_id int primary key,
	sale_date date,
	sale_time time,
	customer_id int,
	gender varchar(10),
	age int,
	category varchar(15),
	quantiy int,
	price_per_unit float,
	cogs float,
	total_sale float
)
-- how many sales we have

SELECT count(*) FROM retail_sales;

select * from retail_sales;

select * from retail_sales
where transactions_id is null;

select * from retail_sales
where 
	transactions_id is null
	or sale_date is null
	or sale_time is null
	 or customer_id is null
	 or gender is null
	  or age is null
	or category is null
	or quantiy is null
	 or cogs is null
	 or total_sale is null;

delete from retail_sales where 
transactions_id is null
	or sale_date is null
	or sale_time is null
	 or customer_id is null
	or gender is null
	 or age is null
	or category is null
	or quantiy is null
	or cogs is null
	or total_sale is null;
	
-- how many distinct customers
select  count(distinct customer_id) from retail_sales;

-- which and how many categories
select category, count(category) from retail_sales
group by category;

-- Data Analysis

-- Sales made on particular date
select * from retail_sales
where sale_date = '2022-11-05';

-- all sales for clothing and quantity is greater than 2 for nov 2022
select * from retail_sales
where 
category = 'Clothing' 
and quantiy > 2 and 
to_char(sale_date, 'YYYY-MM') = '2022-11';

-- total sales and total orders for each category/ highest revenue by category
select category, sum(total_sale) as net_sale, count(*) as total_orders
from retail_sales
group by 1
order by 2 desc;

-- avg age of customers who purchased beauty category
select round(avg(age),2) as avg_age from retail_sales
where category = 'Beauty';

-- all transactions where sales is greater than 1000
select * from retail_sales
where total_sale > 1000;

-- total transactions made by each gender in each category
select gender, category, count(transactions_id)
from retail_sales
group by gender, category;

-- which category is most profitable
select category, round((sum(total_sale) - sum(cogs))::numeric,2) as Profit
from retail_sales
group by 1
order by 2 desc;

-- what is monthly sales trend
select to_char(sale_date, 'YYYY-MM') as Date, sum(total_sale) as Sales
from retail_sales
group by 1
order by 1 desc;

-- what time of day generates more revenue
select sale_time, sum(total_sale) as Sales
from retail_sales
group by 1
order by 2 desc;

-- which age group customers spend the most
select 
	case
	when age between 18 and 25 then '18-25'
	when age between 26 and 35 then '26-35'
	when age between 35 and 45 then '35-45'
	when age between 45 and 55 then '45-55'
	else '55+'
	end as age_group,
	round(sum(total_sale)::numeric,2) as total_spent

from retail_sales
group by 1
order by 2 desc;

-- what is average order value
select round((sum(total_sale)/ count(transactions_id))::numeric,2) as AOV
from retail_sales;

-- Do higher quantities give you higher total_profit?
select quantiy,
count(*) as total_transactions,
round((sum(total_sale-cogs))::numeric, 2) as profit,
round((avg(total_sale-cogs))::numeric, 2) as avg_profit_per_trans
from retail_sales
group by quantiy
order by quantiy;

-- which day sales are higher
select to_char(sale_date, 'Day') as day, 
-- extract(dow from sale_date) as day 
sum(total_sale)
from retail_sales
group by 1
order by 2 desc;

with sales_by_day as(
	select to_char(sale_date, 'Day') as day, sum(total_sale)
	from retail_sales
	group by 1
	order by 2 desc	
)
select * from sales_by_day;

-- top 5 customers
select customer_id, sum(total_sale) from retail_sales
group by customer_id
order by 2 desc
limit 5;

-- unique customers per category
select category, count(distinct customer_id) as unique_cust
from retail_sales
group by category;

-- End of project