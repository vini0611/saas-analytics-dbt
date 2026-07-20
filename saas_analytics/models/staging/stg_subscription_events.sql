with source as (

    select * from {{ source('saas_analytics', 'raw_subscription_events') }}

),

renamed as (

    select
        event_id,
        subscription_id,
        customer_id,
        event_type,
        cast(event_date as date)                as event_date,
        old_plan,
        new_plan,
        cast(old_mrr as decimal(10,2))          as old_mrr,
        cast(new_mrr as decimal(10,2))          as new_mrr,
        churn_reason

    from source

)

select * from renamed