select
sku,
name,
type,
price,
description
from {{ source('jaffle_shop', 'products') }}