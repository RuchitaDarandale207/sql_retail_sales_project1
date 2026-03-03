# Retail Sales Analysis SQL Project

## Project Overview

**Project Title**: Retail Sales Analysis
This project analyzes retail sales transaction data using PostgreSQL to extract meaningful business insights. The dataset contains information regarding to transactions and sales.
This project is helpful to simulate real-world business problems by answering stakeholder-driven questions using SQL.

## Objectives

1. **Identifying top-performing categories.**
2. **Evaluating profitability trends.**
3. **Understanding customer purchasing behavior.**
4. **Analyzing sales performance across time dimensions.**
5. **Examining the relationship between quantity and profit.**


## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `p1_retail_db`.
- **Table Creation**: A table named `retail_sales` is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

```sql
CREATE DATABASE p1_retail_db;

CREATE TABLE retail_sales
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT
);
```

### 2. Data Exploration & Cleaning

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

### 3. Data Analysis & Findings
The project answers important metrics like:

_Total revenue by category
Total profit (Revenue – COGS)
Profit margin by category
Revenue by age group (age buckets created using CASE statements)
Average spend per customer
Top spending customers
Sales by weekday (using EXTRACT & TO_CHAR functions)
Monthly sales trend
Peak transaction timing
Total and average profit by quantity
Profit margin by quantity
Analysis of bulk purchasing behavior_

Advanced SQL concepts used
**CTEs (Common Table Expressions)
CASE statements
Aggregate functions
Date extraction functions
Correlation analysis
Data type casting (NUMERIC vs DOUBLE PRECISION)
Profit margin calculations**

## Findings

Higher quantity purchases significantly increase profitability.
Certain age groups contribute disproportionately to total revenue.
Specific weekdays generate higher sales volume.**
Category-level analysis reveals revenue does not always equal high margin.

## Learning Outcomes
Through this project, I strengthened my ability to:

Translate business questions into SQL queries
Perform profitability analysis
Handle PostgreSQL-specific data type challenges
Structure queries using CTEs for clarity

Think like a business stakeholder, not just a SQL writer
Thank you for your support, and I look forward to connecting with you!
