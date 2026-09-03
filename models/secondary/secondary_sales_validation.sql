{{
    config(
        tags=['secondary']
    )
}}

-- This is a SECONDARY model that runs in the second job
-- It creates the same summary for validation purposes

SELECT
    region,
    COUNT(DISTINCT order_id) as total_orders,
    COUNT(DISTINCT customer_id) as unique_customers,
    SUM(quantity) as total_quantity,
    SUM(price * quantity) as total_revenue,
    AVG(price * quantity) as avg_order_value,
    MIN(order_date) as first_order_date,
    MAX(order_date) as last_order_date
FROM {{ ref('raw_sales_data') }}
GROUP BY region