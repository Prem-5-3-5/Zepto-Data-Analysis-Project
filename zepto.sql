CREATE DATABASE zepto;
USE zepto;


-- Data exploration
-- count of rows 
SELECT COUNT(*) FROM zepto_v2;

-- sample data
SELECT * FROM zepto_v2
LIMIT 10;

-- CHECK NUL VALUES
SELECT * FROM zepto_v2
WHERE name IS NULL
OR 
 category IS NULL
OR 
 mrp IS NULL
OR 
 discountPercent IS NULL
OR 
 availableQuantity IS NULL
OR 
 discountedSellingPrice IS NULL
OR 
 outOfStock IS NULL
OR 
 quantity IS NULL;

-- Data Cleaning 
-- where price is zero 
SELECT * FROM zepto_v2
WHERE mrp = 0 or discountedSellingPrice = 0;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM zepto_v2
WHERE mrp = 0 or discountedSellingPrice = 0;

-- convert paisa into ruppes

UPDATE zepto_v2
SET mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

SELECT name,mrp,discountedSellingPrice FROM zepto_v2;

-- data analysis 

--- Q1. Find the top 10 best-value products based on the discount percentage.

SELECT DISTINCT name,mrp,discountedSellingPrice
FROM zepto_v2
ORDER BY discountedSellingPrice DESC
LIMIT 10;

--- Q2.Calculate Estimated Revenue for each category
SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto_v2
GROUP BY category
ORDER BY total_revenue;

-- Q3. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto_v2
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC , discountPercent DESC;

-- Q4. Identify the top 5 categories offering the highest average discount percentage.
SELECT category,
ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto_v2
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q5.What is the Total Inventory Weight Per Category 

SELECT category, 
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto_v2
GROUP BY category
ORDER BY total_weight;



