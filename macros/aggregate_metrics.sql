{% macro calculate_sales_metrics(source_table, product_column) %}
(
    SELECT
        {{ product_column }} AS ProductID,
        SUM(Quantity) AS total_units_sold,
        SUM(Quantity * UnitPrice * (1 - Discount)) AS total_sales_value
    FROM {{ source_table }}
    GROUP BY {{ product_column }}
)
{% endmacro %}