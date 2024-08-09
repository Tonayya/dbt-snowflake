{{
    config(
        materialized='idk'
    )
}}

Select * from {{ ref('raw_users') }}
where name != 'jessica'