{% if not is_incremental() %}
    {% set table_bkp_qry = 'select 1' %}
    {% set update_qry = 'select 2' %}
{% else %}
    {% set table_bkp_qry = 'select 3' %}
    {% set update_qry = 'select 4' %}
{% endif %}

{{
    config(
         description = 'building table for testing'
        ,materialized = 'incremental'
        ,pre_hook = [table_bkp_qry]
        ,tags = ['facts']
        ,post_hook = [update_qry]
    )
}}

select
'{{ not is_incremental() }}' as boolean_date
,'Hello' as my_col
,'World' as dw_load_id