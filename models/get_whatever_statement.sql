{% if flags.WHICH != 'generate' %}

{%- call statement('st') -%}

    select 2 as c

{%- endcall -%}

select 1 as c

{% endif %}