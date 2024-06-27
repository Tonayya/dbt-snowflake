{{ config(
    pre_hook="DELETE FROM DBT_TONAYYA.STG_USERS WHERE NAME='JESSICA'",
) }}

Select * from {{ ref('raw_users') }}