-- Drop the table if it already exists --
DROP TABLE IF EXISTS online_sales;

-- Create the table
CREATE TABLE online_sales (
    order_id INTEGER PRIMARY KEY,
    order_date DATE,
    amount INTEGER,
    product_id TEXT
);

select * from online_sales


-- Monthly Revenue --
SELECT 
    TO_CHAR(order_date, 'YYYY-MM') AS month,
    SUM(amount) AS total_revenue
FROM 
    online_sales
GROUP BY 
    month
ORDER BY 
    month;


-- Monthly Order Volume --
SELECT 
    TO_CHAR(order_date, 'YYYY-MM') AS month,
    COUNT(DISTINCT order_id) AS order_volume
FROM 
    online_sales
GROUP BY 
    month
ORDER BY 
    month;


-- Top 3 Months by Sales --
SELECT 
    TO_CHAR(order_date, 'YYYY-MM') AS month,
    SUM(amount) AS total_revenue
FROM 
    online_sales
GROUP BY 
    month
ORDER BY 
    total_revenue DESC
LIMIT 3;