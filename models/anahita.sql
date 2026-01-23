select * from {{ ref('nonexistent_model_that_breaks_catalog') }}
