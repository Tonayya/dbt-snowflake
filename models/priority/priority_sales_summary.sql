{{
    config(
        tags=['priority'],
        materialized='table'
    )
}}

-- This is a PRIORITY model that runs in the first job
-- It creates a summary of sales by region

SELECT
    region,
    COUNT(DISTINCT order_idz) as total_orders,
    COUNT(DISTINCT customer_id) as unique_customers,
    SUM(quantity) as total_quantity,
    SUM(price * quantity) as total_revenue,
    AVG(price * quantity) as avg_order_value,
    MIN(order_date) as first_order_date,
    MAX(order_date) as last_order_date
FROM {{ ref('raw_sales_data') }}
GROUP BY region