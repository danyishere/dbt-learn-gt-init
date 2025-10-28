{{
    config(
        severity = "warn"
    )
}}

{% test greater_than_100(model_name, column_name) %}

    select *
    from {{ model_name }}
    where {{ column_name }} <= 100

{% endtest %}