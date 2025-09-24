{% macro cent_to_dollar(col_name) -%}
    {{ col_name }} / 100
{%- endmacro %}
