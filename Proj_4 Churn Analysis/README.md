# Project 4 Churn Analysis Overview

The project using a dataset from Kaggle:
https://www.kaggle.com/datasets/mehmetsabrikunt/internet-service-churn

Tools for this project are Python (Google Colab), Tableau for making the dashboard and Canva. 

## About Dataset

There is a big competition between Internet providers. If a providers want to increase its revenue they needs more subscriber but keep existing customer is more important than having new ones. 

So providers want to know which customer will likely cancel his service, we call this as churn. If the know who will go, maybe they can catch them with promotions.

## Project Objective

This company have a 58% churn rate on this 3-month dataset which is a bad thing for internet service provider company that have services based on subscription.

What are the recommendations to reduce the churn rate by 5% in the next quarter?

## Methodology

1. Finding the root cause
2. Data preparation and cleaning
3. Exploratory Data Analysis and analyze using visualization 
4. Data manipulation (comparing accuracy, precision and recall from 5 different method and manipulate variable on dataset)
5. Give the recommendation

## Insight from Dataset

› After data cleaning, number of customer reduce to 62.496 user while churn rate is 58.01%

› Internet with TV Package have highest number of user, generates highest revenue while have highest churn rate

› Remaining contract highly affecting churn while download average and upload average mildly affecting churn

› From the result of data manipulation, the remaining contract and average download have highest % of accuracy, precision, and recall

› With Decision Tree we found high possibility to reduce churn by increasing remaining contract and average download

## Recommendation

› Create a loyalty-based campaign to increase remaining contract, download average, and upload average to reduce churn

› Create promotion for up-selling programs to increase the number of the Internet with Movie and TV Package that proven to have the lowest churn rate

› Create a promotion that target an audience segmentation "user with subscription age 1-2 years" because subscription age around 2 years more likely to churn

› Increase the number of remaining contracts by creating a campaign for converting "non-contract users" to "users with contract"
