with source as (

    select * from {{ source('saas_analytics', 'raw_plans') }}

),

renamed as (

    select
        plan_id,
        plan_name,
        plan_type,
        cast(price_monthly as decimal(10,2))    as price_monthly,
        cast(price_annual as decimal(10,2))     as price_annual,
        max_users,
        features

    from source

)

select * from renamed