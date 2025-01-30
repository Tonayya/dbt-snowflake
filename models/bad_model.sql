with raw as (
    select 1 as c from dual
)

select * from raw
{% if is_incremental() %}
where 1 = 1
{% endif %}
