{%- macro union_tables_by_pattern(database, schema, pattern) -%}

  {%- set tables = dbt_utils.get_relations_by_pattern(database=database, schema_pattern=schema, table_pattern=pattern) -%}

  {% for table in tables %}

      {%- if not loop.first -%}
      union all 
      {%- endif %}
        
      select * from {{ table.database }}.{{ table.schema }}.{{ table.name }}
      
  {% endfor -%}
  
{%- endmacro -%}