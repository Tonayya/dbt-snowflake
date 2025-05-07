{{
  config(
    materialized='view'
  )
}}

SELECT
  order_id,
  order_date,
  customer_id,
  product_id,
  quantity,
  unit_price
FROM {{ ref('raw_orders') }}