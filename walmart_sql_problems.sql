-- Walmart Project Queries
USE walmart_db;

SELECT * FROM walmart_db;

-- Count total records
SELECT COUNT(*) FROM walmart;

-- Count payment methods and number of transactions by payment method
SELECT 
    payment_method,
    COUNT(*) AS no_payments
FROM walmart
GROUP BY payment_method;  

-- Count distinct branches
SELECT COUNT(DISTINCT branch) FROM walmart;

-- Find the minimum quantity sold
SELECT MIN(quantity) FROM walmart;

-- Buisness Problems
-- Q1. Find different payment methods, number of transactions, and quantity sold by payment method
SELECT 
	payment_method,
    COUNT(invoice_id) AS Transactions,
    SUM(quantity) AS Quantity_Sold
FROM walmart_db
GROUP BY payment_method
ORDER BY transactions;

-- Q2: Identify the highest-rated category in each branch. Display the branch, category, and average rating
SELECT 
	t.Branch,
    t.category,
    t.avg_rating
FROM
(
SELECT
	Branch,
    category,
    AVG(rating) AS avg_rating,
    RANK() OVER(PARTITION BY Branch ORDER BY AVG(rating) DESC) as ranking
FROM walmart_db
GROUP BY branch,category) AS t
WHERE t.ranking = 1;

-- Q3: a) Identify the busiest day for each branch based on the number of transactions¶
SELECT *
FROM
(
SELECT 
	Branch,
    dayname(date) AS day_name,
    COUNT(*) as transactions,
    RANK() OVER(PARTITION BY Branch ORDER BY COUNT(*) DESC) AS ranking 
FROM walmart_db
GROUP BY Branch, day_name
ORDER BY Branch, transactions DESC) t
WHERE t.ranking=1;

-- b) Identify the busiest month for each branch based on the number of transactions
SELECT *
FROM
(
SELECT 
	Branch,
    monthname(date) AS month_name,
    COUNT(*) as transactions,
    RANK() OVER(PARTITION BY Branch ORDER BY COUNT(*) DESC) AS ranking 
FROM walmart_db
GROUP BY Branch, month_name
ORDER BY Branch, transactions DESC) t
WHERE t.ranking=1;

-- Q4: Calculate the total quantity of items sold per payment method
SELECT
	payment_method,
    SUM(quantity) AS total_quantity
FROM walmart_db
GROUP BY payment_method
ORDER BY total_quantity DESC;

-- Q5. Determine the average, minimum, and maximum rating of category for each city. 
-- List the city, average_rating, min_rating and max_rating
SELECT
	City,
    category,
    AVG(rating) AS avg_rating,
    MAX(rating) AS max_rating,
    MIN(rating) AS min_rating
FROM walmart_db
GROUP BY City,category
Order BY City DESC;

-- Q6: Calculate the total profit for each category
SELECT
	category,
    SUM(unit_price * quantity * profit_margin) AS total_margin
FROM walmart_db
GROUP BY category
ORDER BY total_margin DESC;

-- Q7: Determine the most common payment method for each branch
SELECT *
FROM (
SELECT
	Branch,
    payment_method,
    COUNT(payment_method) AS distinct_count,
    RANK() OVER(PARTITION BY Branch ORDER BY COUNT(payment_method) DESC) AS ranking
FROM walmart_db
GROUP BY Branch,payment_method
ORDER BY Branch) t
WHERE t.ranking = 1;

-- Q8: Categorize sales into Morning, Afternoon, and Evening shifts
SELECT
	Branch,
    CASE
		WHEN HOUR(time) < 12 THEN 'Morning'
        WHEN HOUR(time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
	END AS Shift,
    COUNT(*) AS num_invoices
FROM walmart_db
GROUP BY Branch,Shift
ORDER BY Branch, num_invoices DESC;

-- Q9: Identify the 5 branches with the highest revenue decrease ratio from last year to current year (e.g., 2022 to 2023)
WITH revenue_of_2022 AS (
	SELECT
		Branch,
		SUM(total) AS revenue
	FROM walmart_db
	WHERE YEAR(str_to_date(date,'%d/%m/%y')) = 2022
	GROUP BY Branch
),
revenue_of_2023 AS (
	SELECT
		Branch,
		SUM(total) AS revenue
	FROM walmart_db
	WHERE YEAR(str_to_date(date,'%d/%m/%y')) = 2023
	GROUP BY Branch
)
SELECT 
	rev22.branch,
	rev22.revenue AS last_year_revenue,
    rev23.revenue AS current_year_revenue,
    ROUND(((rev22.revenue - rev23.revenue) / rev22.revenue) * 100, 2) AS revenue_decrease
FROM revenue_of_2022 AS rev22
JOIN revenue_of_2023 AS rev23 ON rev22.Branch = rev23.Branch
WHERE rev22.revenue > rev23.revenue
ORDER BY revenue_decrease DESC
LIMIT 5;