{{
  config(
    materialized='table',
    cluster_by=['date_day']
  )
}}

SELECT 
  order_date::DATE as date_day,
  customer_id,
  order_id,
  product_id,
  quantity,
  unit_price,
  quantity * unit_price as total_amount
FROM {{ ref('stg_orders') }}