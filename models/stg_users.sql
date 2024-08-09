{{
    config(
        materialized='view'
    )
}}

Select * from {{ ref('raw_users') }}
where name != 'jessica'