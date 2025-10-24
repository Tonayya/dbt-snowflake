{% macro get_models_list() %}
{%- if execute -%}
  {%- for node in graph.nodes.values()
     | selectattr("resource_type", "equalto", "model") -%}
    {%- if node.depends_on.macros and "macro.analytics.cents_to_dollars" in node.depends_on.macros -%}
        {{- node.name ~ "," ~ node.original_file_path ~ ",macro.analytics.cents_to_dollarsn\n" -}}    
    {%- endif -%}
  {%- endfor -%}
{%- endif -%}
{% endmacro %}