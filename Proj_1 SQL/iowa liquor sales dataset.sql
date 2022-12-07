-- /*Calculate monthly total sales in 2020 and total sales prediction 2021 by city
-- What is the growth rate of sales in 2020 to 2021? (Hint: Please remove the NULL data, 
-- growth rate is defined as:
--  (sales year 1 - sales year 0)/sales year 0
-- */
with sales20 as (
     select city, 
     extract(month from date) as month,
     round(sum(sale_dollars),0) as total_sales
     from `bigquery-public-data.iowa_liquor_sales_forecasting.2020_sales_train`
     group by 1,2
), 
predict21 as (
     select city, 
     extract(month from date) as month,
     round(sum(sale_dollars),0) as total_sales
     from `bigquery-public-data.iowa_liquor_sales_forecasting.2021_sales_predict`
     group by 1,2
) 
select sales20.city,
     sales20.month,
     sales20.total_sales,
     predict21.total_sales,
     concat(round(((predict21.total_sales - sales20.total_sales)/sales20.total_sales)*100,2),'%') as growth_rate
     from sales20
     left join predict21 on sales20.city = predict21.city
     and sales20.month = predict21.month
     where sales20.total_sales is not null
     and predict21.total_sales is not null
     order by 1,2;

-- /*get a comparison of sales in 2020 and 2021 for each store name
-- Imagine you need to create a graph that shows trends of sales 2020-2021.
-- How would you create the query? 
-- (Hint: Use CTE and UNION to compile data from both 2020 and 2021, 
-- Roundup the sales dollars to integer and add “$” symbol)
-- */
with sales20 as (
     select store_name, 
     date_trunc(date, month) as month,
     cast(round(sum(sale_dollars),0) as integer) as total_sales
     from `bigquery-public-data.iowa_liquor_sales_forecasting.2020_sales_train`
     group by 1,2
), 
predict21 as (
     select store_name, 
     date_trunc(date, month) as month,
     cast(round(sum(sale_dollars),0) as integer) as total_sales
     from `bigquery-public-data.iowa_liquor_sales_forecasting.2021_sales_predict`
     group by 1,2
)
select store_name,
     month,
     total_sales
from sales20
UNION ALL 
select store_name,
     month,
     total_sales
from predict21
order by 1,2
     

     
























-- /*Calculate monthly total sales in 2020 and total sales prediction 2021 by city
-- What is the growth rate of sales in 2020 to 2021? (Hint: Please remove the NULL data, 
-- growth rate is defined as:
--  (sales year 1 - sales year 0)/sales year 0
-- */
WITH s_2020 as (
     SELECT city,
     EXTRACT(MONTH from date) as month,
     ROUND(SUM(sale_dollars),0) as total_sales
     FROM `bigquery-public-data.iowa_liquor_sales_forecasting.2020_sales_train`
     GROUP BY 1,2
),
p_2021 as (
     SELECT city,
     EXTRACT(MONTH from date) as month,
     ROUND(SUM(sale_dollars),0) as total_sales
     FROM `bigquery-public-data.iowa_liquor_sales_forecasting.2021_sales_predict`
     GROUP BY 1,2
)
SELECT s_2020.city,
       s_2020.month,
       s_2020.total_sales as total_sales_2020,
       p_2021.total_sales as total_sales_2021,
       CONCAT(ROUND(((p_2021.total_sales - s_2020.total_sales)/s_2020.total_sales)*100,2),'%') as growth_rate
       FROM s_2020
       LEFT JOIN p_2021 on s_2020.city = p_2021.city 
       AND s_2020.month = p_2021.MONTH
       WHERE s_2020.total_sales IS NOT NULL
       AND p_2021.total_sales IS NOT NULL
       ORDER BY 1,2 ASC;

/*Combine also city and zipcode, show it as 'city-zipcode'.
Which 'city-zipcode' is ranked 315 from the top sales in H1 2020?
(Use CTE and Window Function)*/
WITH top_sales as (
     SELECT CONCAT(city,'-',zip_code) as city_zipcode,
     SUM(sale_dollars) as total_sales,
     ROW_NUMBER() OVER (ORDER BY SUM(sale_dollars)DESC) as rank_sales
     FROM `bigquery-public-data.iowa_liquor_sales_forecasting.2020_sales_train`
     WHERE date BETWEEN '2020-01-01' AND '2020-06-30'
     GROUP BY 1
)
SELECT *
     FROM top_sales
     WHERE rank_sales = 100



-- /*get a comparison of sales in 2020 and 2021 for each store name
-- Imagine you need to create a graph that shows trends of sales 2020-2021.
-- How would you create the query? 
-- (Hint: Use CTE and UNION to compile data from both 2020 and 2021, 
-- Roundup the sales dollars to integer and add “$” symbol)
-- */
WITH s_2020 as (
     SELECT store_name,
     DATE_TRUNC(date, MONTH) as trunc_month,
     CAST(ROUND(SUM(sale_dollars),0) as integer) as total_sales
     FROM `bigquery-public-data.iowa_liquor_sales_forecasting.2020_sales_train`
     GROUP BY 1,2
),
p_2021 as (
     SELECT store_name,
     DATE_TRUNC(date, MONTH) as trunc_month,
     CAST(ROUND(SUM(sale_dollars),0) as integer) as total_sales
     FROM `bigquery-public-data.iowa_liquor_sales_forecasting.2021_sales_predict`
     GROUP BY 1,2
)
SELECT store_name,
       trunc_month,
       total_sales
       FROM s_2020
UNION ALL
SELECT store_name,
       trunc_month,
       total_sales
       FROM p_2021
ORDER BY 1,2








