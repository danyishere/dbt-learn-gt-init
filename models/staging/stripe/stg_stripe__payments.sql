select

    orderid as order_id,
    id as payment_id,
    status,
    amount/100 as amount,
    created as created_at
    
from {{ source('stripe', 'payment') }}