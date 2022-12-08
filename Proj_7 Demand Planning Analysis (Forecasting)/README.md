# Project 5 Overview

This project is done after the course ended. It's part of Virtual Inteship RevoU x Astro for 2 Months (RevoU Labs)

Dataset is dummy and provided by RevoU

Demand planning is a supply chain management process that enables a company to project future demand and successfully costumize caompany output, be it products or services.

## Background or Expert Problem

The operation team wants to know the forecast number for the next 1 month (August 2022) for their stock item preparation  in order to heightened company efficiency and increased customer satisfactory.

## Methodology
 1. Project preparation and project scoping 
 2. Business problem and discovering datasets, data collection
 3. Data cleaning and validation
 4. Exploratory data analysis and forecast analysis
 5. Collects, integrates and analysis all relevant data and information
 6. Draw logical and objectives conclusion
 7. Identifies a number of solutions
 8. Priorities Solutions

## Forecasting

Forecast analysis made by using product category view with weekly view for the time series option. 

Then using 2 method to compare which one is the best method to forecast the next month's item stock, Moving Average and Decomposition. Based on the actual data trend, the most similar method is moving average with 2 months period. 

The proportion of data training and data testing is 80:20. 

## Recommendation

Moving average with 2 monts period is the most suitable for this forecasting is because it has the lowest absolute error with the smallest error is 3.17% and the biggest absolute error is 16.88% (mainly in food that has longer expiration date, such as: frozen foods)