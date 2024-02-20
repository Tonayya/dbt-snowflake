{{
    config(
        snowflake_warehouse= env_var("DBT_SNOWFLAKE_WAREHOUSE"),
    )
}}

with
    customer_orders as (
        select id as order_id, min(order_date) as first_order_date

        from {{ source("jaffle_shop", "orders") }}

        group by 1
    )

select id as customer_id, customers.first_name, customers.last_name

from {{ source("jaffle_shop", "customers") }}
