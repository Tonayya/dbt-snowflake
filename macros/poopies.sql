{% macro fail_docs() %}
  {{ exceptions.raise_compiler_error('Intentionally failing docs generation') }}
{% endmacro %}