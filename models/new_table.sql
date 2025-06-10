{{
    config(
        materialized='table'
    )
}}

Select * from {{ ref('abc') }}