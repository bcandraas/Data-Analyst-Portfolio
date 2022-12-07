/*Q1: Get the total users who completed the order and total orders per month (Jan 2019 - April 2022)*/

select date_trunc(date(created_at), month) as month, 
  count(distinct user_id)AS total_users,
  count(distinct order_id)AS total_order
from `bigquery-public-data.thelook_ecommerce.orders`
where created_at between '2019-01-01' and '2022-05-01'
and status = "Complete"
group by 1
order by 1;





/*Q2: Get average order value and total number or unique users, grouped by month (Jan 2019 - April 2022)*/

select date_trunc(date(created_at),month) as month, 
  count(distinct user_id) as users,
  round(avg(sale_price), 2) as aov
from `bigquery-public-data.thelook_ecommerce.order_items`
where created_at between '2019-01-01' and '2022-05-01'
group by 1
order by 1;



/*Q3: Find the first and last name of users from the youngest and oldest age of each gender*/

with minMax as 
(
  select gender,
    max(age) as oldest,
    min(age) as youngest,
  from `bigquery-public-data.thelook_ecommerce.users`
  group by 1
)
select users.gender,
  users.age,
  users.first_name,
  users.last_name, 
case 
  when users.age = minMax.oldest then 'Oldest' 
  else 'Youngest' 
end as status_age
from `bigquery-public-data.thelook_ecommerce.users` as users
join minMax on users.gender = minMax.gender
  and (users.age = (minMax.oldest) or users.age = (minMax.youngest))
order by 1,2;



/*Q4: Get the top 5 most profitable product and its profit detail breakdown by month*/

with detailProduct as(
  select date_trunc(date(created_at),month) as month, 
    products.id as product_id,
    name as product_name,
    round(sum(order_items.sale_price), 2) as sales,
    round(sum(cost), 2) as cost,
    round(sum(retail_price-cost), 2) as profit
  from `bigquery-public-data.thelook_ecommerce.products` as products
  join `bigquery-public-data.thelook_ecommerce.order_items` as order_items
    on products.id = order_items.product_id
  group by 1,2,3
  order by 1 
)
select * from(
  select *,
  row_number() over(partition by detailProduct.month order by detailProduct.profit desc) as ranking
  from detailProduct
) sort
where sort.ranking <= 5
order by sort.month;



/*Q5: Get Month to Date of total revenue in each products categories of past 3 months, breakdown by date (Current date 15 April 2022)*/

with detailProduct as(
  select date_trunc(date(created_at),day) as date_month, 
    category as category,
    round(sum(order_items.sale_price), 2) as revenue,
  from `bigquery-public-data.thelook_ecommerce.products` as products
  join `bigquery-public-data.thelook_ecommerce.order_items` as order_items
    on products.id = order_items.product_id
  group by 1,2
  order by 1 
)
select * 
from detailProduct
where detailProduct.date_month between date_sub('2022-04-15', interval 3 month) and '2022-04-15'