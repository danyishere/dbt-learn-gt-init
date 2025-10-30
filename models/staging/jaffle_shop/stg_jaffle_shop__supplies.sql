select
id as supply_id,
name,
cost,
perishable,
sku
from {{ source('jaffle_shop', 'supplies') }}