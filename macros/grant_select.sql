{% macro grant_select (schema=target.schema, role=target.role) %} -- target contains info about the current target

    {% set query %}
        grant usage on schema {{ schema }} to role {{ role }};
        grant select on all tables in schema {{ schema }} to role {{ role }};
        grant select on all views in schema {{ schema }} to role {{ role }};
    {% endset %}

    {{ log('Granting select on all tables and views in schema ' ~ schema ~ ' to role ' ~ role, info=True) }}
    {% do run_query(query) %} -- this is a standalone model so we use run_query to execute the SQL
    {{ log('Privileges granted', info=True) }}

{% endmacro %}