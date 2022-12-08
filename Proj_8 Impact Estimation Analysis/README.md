# Project 8 Impact Estimation Analysis Overview

This project is done after the course ended. It's part of Virtual Inteship RevoU x Astro for 2 Months (RevoU Labs)

Dataset is dummy and provided by RevoU

An impact evaluation provodes information about the impacts produced by an intervention. The intervention might be a small prohect, a large programme, a collection of activities, or a policy.

## Background or Expert Problem

The operation team wants to save on shipping costs by unitiving delivery for orders that comes in almost simultaneously and close together. To get the most efficient way for delivery, pool system is designed to reduce the number of delivery and achieve the SLA as much as possible.

## Methodology
 1. Project preparation and project scoping 
 2. Business problem and discovering datasets, data collection
 3. Data cleaning and validation
 4. Exploratory data analysis
 5. Create few proposed method based on the requirements
 6. Compare each method based on the cost and time spend
 7. Give the most efficient recomendation for delivery 

## Proposed Method
1. Add the waiting time before the agent send the delivery orders.
    
    a. Waiting time for 1 pool is 5 minutes counted from the 1st delivery.
    
        • Maxed orders in 1 pool but with maximal quatity are only 40 qty/pool
        • 2 orders max in 1 pool but with maximal quatity are only 40 qty/pool
    b. Waiting time for 1 pool is 3 minutes counted from the 1st delivery.
        
        • Maxed orders in 1 pool but with maximal quatity are only 40 qty/pool
        • 2 orders max in 1 pool but with maximal quatity are only 40 qty/pool
2. Agent deliver the order from the nearest customer when all order are prepared
3. After customer receive the order, agent will deliver the next order (in the same pool) to the next nearest customer. This process will be repeated until no order left in the same pool.

## Recommendation

Based on the number of delivery and number of achieved SLA, the effective method to achieve the objective is 3 Minutes Maxed orders because this method has the highest average ranking overall.