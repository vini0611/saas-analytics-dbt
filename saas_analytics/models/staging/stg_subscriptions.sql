with source as (

    select * from {{ source('saas_analytics', 'raw_subscriptions') }}

),

renamed as (

    select
        subscription_id,
        customer_id,
        plan_name,
        plan_type,
        cast(mrr_amount as decimal(10,2))       as mrr_amount,
        cast(start_date as date)                as start_date,
        cast(end_date as date)                  as end_date,
        status

    from source

)

select * from renamed