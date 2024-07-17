CREATE DATABASE hotel;
USE hotel;

-- see how many rows from dataset hotel
SELECT count(*) FROM htl;
-- see its field and data type
DESCRIBE htl;

-- Change data type of column agent & company from double to int
ALTER TABLE htl
MODIFY COLUMN agent INT;

ALTER TABLE htl
MODIFY COLUMN company INT;

-- Add new column 'total_nights' with data type 'INT'
ALTER TABLE htl ADD COLUMN total_nights INT;

-- disable safe mode to update value in table
SET SQL_SAFE_UPDATES = 0;

-- Calculate value for total_nights column
UPDATE htl
SET total_nights = stays_in_week_nights + stays_in_weekend_nights;

-- Add new column revenue
ALTER TABLE htl ADD COLUMN revenue DECIMAL(15, 2);

-- calculate value for column revenue
UPDATE htl
SET revenue = total_nights * adr;

-- modify bcs of truncate value
ALTER TABLE htl MODIFY COLUMN revenue DECIMAL(15, 2);

-- checks the counts for each revenue
SELECT revenue,count(*) AS COUNT, revenue*count(*) AS total_revenue from htl
GROUP BY revenue
ORDER BY count DESC;
-- Finds out the total sum of ALL revenue (canceled or not canceled)
SELECT 
    SUM(total_rev) AS total_revenue_sum
FROM (
    SELECT revenue, COUNT(*) AS COUNT, revenue * COUNT(*) AS total_rev
    FROM htl
    GROUP BY revenue
) AS subquery;
-- ===============

-- Checks max, minimum and average revenue for booking 
SELECT is_canceled, MAX(revenue) from htl
GROUP BY is_canceled;

SELECT is_canceled, MIN(revenue) FROM htl
WHERE revenue>0
GROUP BY is_canceled;

SELECT is_canceled, round(avg(revenue),2) AS average_revenue from htl
GROUP BY is_canceled;

-- re-enable safe mode
SET SQL_SAFE_UPDATES = 1;


-- QUESTIONS
-- 1. Average number of customer stays in (total no. of stays in / total no. cust checked in)
SELECT ROUND(AVG(total_nights)) AS average_nights_per_stay
FROM htl
WHERE is_canceled=0 AND reservation_status='Check-Out';

-- 2. average confirmed customer by year
SELECT RIGHT(reservation_status_date,4) AS year_date, SUM(is_canceled=0) AS SUM_cust_per_year, 
AVG(is_canceled=0) AS average_cust_per_year
FROM htl
GROUP BY year_date
HAVING SUM_cust_per_year>0
ORDER BY year_date ASC;

-- 3. % customer checked in vs canceled or no show
SELECT is_canceled,count(is_canceled) AS total_guests FROM htl
GROUP BY is_canceled;

SELECT 
    SUM(CASE WHEN is_canceled = 0 THEN 1 ELSE 0 END)  AS checked_in,
    SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) AS canceled
FROM htl;

-- 4. Customer type distribution
SELECT customer_type, count(*) AS COUNT FROM htl
WHERE is_canceled=0
GROUP BY customer_type;

-- 5. Customer deposit type distribution
SELECT deposit_type, count(deposit_type) AS COUNT FROM htl
WHERE is_canceled=0
GROUP BY deposit_type;

-- 6. What is the distribution of our customer across country (not suitable for visualization, too sparse)
SELECT country, count(*) as COUNT FROM htl
WHERE is_canceled=0
GROUP BY country
HAVING count>1000
ORDER BY COUNT DESC;

-- 7. Calculate number of repeated customer and new customer by year
SELECT 
    RIGHT(reservation_status_date, 4) AS reservation_year,
    SUM(CASE WHEN is_repeated_guest = 0 THEN 1 ELSE 0 END) AS new_guests_percentage,
    SUM(CASE WHEN is_repeated_guest = 1 THEN 1 ELSE 0 END) AS repeated_guests_percentage
FROM htl
WHERE is_canceled = 0
GROUP BY RIGHT(reservation_status_date, 4)
ORDER BY reservation_year ASC;

-- 8. see how may total booking made in each year
SELECT RIGHT(reservation_status_date,4) AS year_date, COUNT(*)
FROM htl 
WHERE is_canceled=0
GROUP BY year_date;

-- total confirmed guest
SELECT Count(*) AS confirmed_customer FROM htl WHERE is_canceled=0;


-- 9. Top 10 company in hotel booking, excluding company=0 bcs it is null values
SELECT company, count(*) AS COUNT FROM htl
WHERE company>0
GROUP BY company
ORDER BY COUNT DESC
LIMIT 10;

-- 9. company overview total, confirmed, canceled bookings
SELECT 
    company, 
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN is_canceled = 0 THEN 1 ELSE 0 END) AS checked_in,
    SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) AS canceled_count
FROM htl
WHERE company > 0
GROUP BY company
ORDER BY total_bookings DESC;

-- 10. agent overview total, confirmed, canceled bookings
SELECT 
    agent, 
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN is_canceled = 0 THEN 1 ELSE 0 END) AS checked_in,
    SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) AS canceled_count
FROM htl
WHERE agent > 0
GROUP BY agent
ORDER BY total_bookings DESC;

-- =========== ad-hoc query
-- Top 10 company in hotel booking, where booking is not canceled
SELECT company, count(*) AS COUNT FROM htl
WHERE company > 0 AND is_canceled = 0
GROUP BY company
ORDER BY COUNT DESC
LIMIT 10;


-- Top 10 agent in hotel booking, where booking is not canceled
SELECT agent, count(*) AS COUNT FROM htl
WHERE agent > 0 AND is_canceled = 0
GROUP BY agent
ORDER BY COUNT DESC
LIMIT 10;
-- ======

-- 11. Overall top market segment
SELECT market_segment, SUM(is_canceled=0) AS Confirmed , SUM(is_canceled=1) AS Canceled, count(*) AS Total_bookings
FROM htl
GROUP BY market_segment
ORDER BY Total_bookings DESC;

-- Overall top market segment, where booking is canceled
SELECT market_segment, count(*) AS COUNT FROM htl
WHERE is_canceled=1
GROUP BY market_segment, is_canceled
ORDER BY COUNT DESC;

-- check assumption that if 0 agent & 0company = Direct distribution channel
SELECT distribution_channel, count(*) AS total_count FROM htl
WHERE agent <=0 AND company<=0
GROUP BY distribution_channel;

-- 12. Revenue distribution amongst distribution channel
SELECT distribution_channel, SUM(is_canceled=0) AS Confirmed , SUM(is_canceled=1) AS Canceled, count(*) AS Total_bookings 
FROM htl
GROUP BY distribution_channel
ORDER BY Total_bookings DESC;

-- 13. Revenue distribution amongst market segment
SELECT market_segment, SUM(is_canceled=0) AS Confirmed , SUM(is_canceled=1) AS Canceled, COUNT(revenue) AS total_revenue FROM htl 
GROUP BY market_segment
ORDER BY total_revenue DESC;

-- 14. Revenue distribution amongst distribution_channel
SELECT distribution_channel, SUM(is_canceled=0) AS Confirmed , SUM(is_canceled=1) AS Canceled, COUNT(revenue) AS total_revenue FROM htl 
GROUP BY distribution_channel
ORDER BY total_revenue DESC;

SELECT * FROM htl WHERE is_canceled=1;

-- 15. market segment total revenue, not canceled
SELECT market_segment,SUM(revenue) AS Total_revenue FROM htl
WHERE is_canceled=0
GROUP BY market_segment;

-- 16. distribution channel total revenue, not canceled
SELECT distribution_channel,SUM(revenue) AS Total_revenue FROM htl
WHERE is_canceled=0
GROUP BY distribution_channel;

-- 17. Revenue by year
SELECT RIGHT(reservation_status_date,4) AS year_date, SUM(revenue) AS Total_revenue_loss FROM htl
WHERE is_canceled=0
GROUP BY year_date
ORDER BY year_date ASC;

-- 18. Revenue loss by year
SELECT RIGHT(reservation_status_date,4) AS year_date, SUM(revenue) AS Total_revenue_loss FROM htl
WHERE is_canceled=1
GROUP BY year_date
ORDER BY year_date ASC;