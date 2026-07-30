{% snapshot orders_snapshot %}

{{
    config(
      unique_key='order_id',
      strategy='timestamp',
      updated_at='order_date',
    )
}}

select
    order_id,
    order_date,
    customer_id,
    product_id,
    quantity,
    unit_price
from {{ ref('raw_orders') }}

{% endsnapshot %}