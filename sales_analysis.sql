-- Create Database
CREATE DATABASE sales_project;

-- Use Database
USE sales_project;

-- Create Table
CREATE TABLE  superstore_sales(
`Row ID` INT,
`Order ID` VARCHAR(50),
`Order Date` DATE,
`Ship Date` DATE,
`Ship Mode` VARCHAR(50),
`Customer ID` VARCHAR(50),
`Customer Name` VARCHAR(100),
Segment VARCHAR(50),
Country VARCHAR(50),
City VARCHAR(50),
State VARCHAR(50),
Region VARCHAR(50),
`Product ID` VARCHAR(50),
Category VARCHAR(50),
`Sub Category` VARCHAR(50),
`Product Name` VARCHAR(255),
Sales FLOAT,
Quantity INT,
Discount FLOAT,
Profit FLOAT
);

-- Check Dataset
SELECT * FROM superstore_sales LIMIT 10;

-- Total Sales Analysis
SELECT SUM(Sales) AS total_sales
FROM superstore_sales;

-- Sales by Region
SELECT Region, SUM(Sales) AS total_sales
FROM superstore_sales
GROUP BY Region
ORDER BY total_sales DESC;

-- Top Selling Products
SELECT `Product Name`, SUM(Sales) AS total_sales
FROM superstore_sales
GROUP BY `Product Name`
ORDER BY total_sales DESC LIMIT 10;

-- Profit Analysis by Category
SELECT Category, SUM(Profit) AS total_profit
FROM superstore_sales
GROUP BY Category
ORDER BY total_profit DESC;

-- High Revenue Products (>1000)
SELECT `Product Name`, SUM(Sales) AS total_sales
FROM superstore_sales
GROUP BY `Product Name`
HAVING SUM(Sales) > 1000
ORDER BY total_sales DESC;

-- Top Profitable Products
SELECT `Product Name`, SUM(Profit) AS total_profit
FROM superstore_sales
GROUP BY `Product Name`
ORDER BY total_profit DESC LIMIT 10;

-- Loss Making Products
SELECT `Product Name`, SUM(Profit) AS total_profit
FROM superstore_sales
GROUP BY `Product Name`
HAVING total_profit < 0
ORDER BY total_profit;

-- Orders with Sales Greater than Average (Subquery)
SELECT `Product Name`, Sales
FROM superstore_sales
WHERE Sales > (SELECT AVG(Sales) FROM superstore_sales);

-- Top Customers
SELECT `Customer Name`, SUM(Sales) AS total_spent
FROM superstore_sales
GROUP BY `Customer Name`
ORDER BY total_spent DESC LIMIT 10;

-- Monthly Sales Trend
SELECT MONTH(`Order Date`) AS month, SUM(Sales) AS monthly_sales
FROM superstore_sales
GROUP BY MONTH(`Order Date`)
ORDER BY month;

-- Category Wise Sales
SELECT Category, SUM(Sales) AS total_sales
FROM superstore_sales
GROUP BY Category
ORDER BY total_sales DESC;

-- Region Wise Profit
SELECT Region, SUM(Profit) AS total_profit
FROM superstore_sales
GROUP BY Region
ORDER BY total_profit DESC;

-- Create Customer Table (for future joins)
CREATE TABLE IF NOT EXISTS customers(
customer_id VARCHAR(50),
customer_name VARCHAR(100),
region VARCHAR(50)
);

-- Example Aggregation Query
SELECT s.`Customer Name`, SUM(s.Sales) AS total_sales, s.Region
FROM superstore_sales s
GROUP BY s.`Customer Name`, s.Region
ORDER BY total_sales DESC;