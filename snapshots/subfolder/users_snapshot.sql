{% snapshot users_snapshot %}

{{
    config(
      unique_key='id',
      strategy='check',
      check_cols=['name', 'age'],
    )
}}

select
    id,
    name,
    age
from {{ source('fake_source', 'missing_table') }}

{% endsnapshot %}