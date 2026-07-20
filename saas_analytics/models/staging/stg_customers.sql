with source as (

    select * from {{ source('saas_analytics', 'raw_customers') }}

),

renamed as (

    select
        customer_id,
        company_name,
        industry,
        country,
        city,
        cast(signup_date as date)   as signup_date,
        plan_type,
        account_manager

    from source

)

select * from renamed