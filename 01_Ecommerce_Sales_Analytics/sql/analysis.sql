CREATE DATABASE IF NOT EXISTS ecommerce_analytics; USE ecommerce_analytics;
CREATE TABLE ecommerce_sales(order_id VARCHAR(12) PRIMARY KEY, order_date DATE, customer_id VARCHAR(12), product VARCHAR(50), category VARCHAR(40), quantity INT, unit_price DECIMAL(12,2), revenue DECIMAL(14,2), region VARCHAR(20), sales_channel VARCHAR(30));
-- Import data/ecommerce_sales.csv using MySQL Workbench, then run:
SELECT SUM(revenue) total_revenue, COUNT(DISTINCT order_id) orders FROM ecommerce_sales;
SELECT category,SUM(revenue) revenue FROM ecommerce_sales GROUP BY category ORDER BY revenue DESC;
SELECT DATE_FORMAT(order_date,'%Y-%m') month,SUM(revenue) revenue FROM ecommerce_sales GROUP BY month ORDER BY month;
SELECT customer_id,SUM(revenue) spend FROM ecommerce_sales GROUP BY customer_id ORDER BY spend DESC LIMIT 10;
SELECT region,sales_channel,SUM(revenue) revenue FROM ecommerce_sales GROUP BY region,sales_channel;
