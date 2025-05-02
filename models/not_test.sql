
with
customer_orders as (
    select
        user_id as customer_id,
        min(order_date) as first_order_date
    from {{ source("jaffle_shop", "orders") }}
    group by 1
)

select
    customers.id as customer_id,
    customers.first_name,
    customers.last_name,
    customer_orders.first_order_date
from {{ source("jaffle_shop", "customers") }} as customers
left join customer_orders
    on customers.id = customer_orders.customer_id
