{% macro template_example(args) %}
    {% set query %}
        select * from {{ ref('stg_jaffle_shop__orders') }}
    {% endset %}

    {% if execute %}
        {% set results=run_query(query).rows[0].values() %}
        {{ log('SQL results' ~ results , info=True) }}
    {% endif %}

{% endmacro %}