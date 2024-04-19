-- depends_on: {{ ref('abc') }}

{% call statement('st') %}

    select * from {{ ref('abc') }}

{% endcall %}

select 2 as id