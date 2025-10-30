select
id as item_id,
order_id,
sku
from {{ source('jaffle_shop', 'items') }}