{% test not_null(model_name, column_name) %}

    with selection as(
        select {{ column_name }}
        from {{ model_name }}
        where {{ column_name }} is not null and {{ column_name }} != 00000
        group by 1
        having count(*) > 1
    )
    select *
    from selection

{% endtest %}