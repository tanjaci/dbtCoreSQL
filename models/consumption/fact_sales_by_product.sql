
WITH base AS (
    {{ 
        calculate_sales_metrics(
            source_table=ref('fact_orders'), 
            product_column='ProductID'
        )
    }}
)
SELECT 
    * 
FROM 
    base

/* 
Explanation:
1. The `calculate_sales_metrics` macro encapsulates the aggregation logic.
2. The model uses the macro to calculate sales metrics, referencing the `fact_orders` table.
3. The result includes columns: `ProductID`, `total_units_sold`, and `total_sales_value`.
*/
