{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        on_schema_change='fail'
    )
}}

with orders as (

    select * from {{ ref('stg_jaffle_shop__orders') }}

),
payments as (

    select * from {{ ref('stg_stripe__payments') }}
    
)
,
order_payments as (
    
    select
        order_id,
        sum(amount) as amount
    from payments
    where status = 'success'
    group by 1

),
final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        orders.status AS order_status,
        orders._etl_loaded_at ,
        coalesce(order_payments.amount, 0) as amount

    from orders
    left join order_payments using (order_id)
    
)
select * from final A
{% if is_incremental() %}
where A._etl_loaded_at >= (select B._etl_loaded_at from {{ this }} as B order by B._etl_loaded_at desc limit 1)
{% endif %}