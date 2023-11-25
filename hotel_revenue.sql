#1. Is the hotel revenue growing?

WITH hotels AS (
SELECT * FROM hotel_revenue_2018
UNION
SELECT * FROM hotel_revenue_2019
UNION
SELECT * FROM hotel_revenue_2020)

SELECT arrival_date_year, hotel, ROUND(sum((stays_in_weekend_nights+stays_in_week_nights) * adr),2) AS revenue 
FROM hotels
GROUP BY arrival_date_year, hotel;


#2. 

WITH hotels AS (
SELECT * FROM hotel_revenue_2018
UNION
SELECT * FROM hotel_revenue_2019
UNION
SELECT * FROM hotel_revenue_2020)

SELECT *
FROM hotels
LEFT JOIN market_segment
ON hotels.market_segment = market_segment.market_segment
LEFT JOIN meal_cost
ON meal_cost.meal = hotels.meal;


SELECT * FROM hotel_revenue_2018