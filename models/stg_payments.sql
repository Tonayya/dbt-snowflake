select
  id as payment_id,
  {{ cents_to_dollars('unit_price') }} as amount_usd,
  ...
from raw_orders