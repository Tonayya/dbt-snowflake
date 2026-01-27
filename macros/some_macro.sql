{% bla bla macro some_macro(model_name) %}
{%- set normal_ref_relation = ref(model_name) -%}
{%- set some_config = config.get("some_key") -%}

{% if some_config is none %}
    {{ return(normal_ref_relation) }}
{% else %}
    {# do something with the config #}
    {{ return(normal_ref_relation) }}
{% endif %}
{% endmacro %}