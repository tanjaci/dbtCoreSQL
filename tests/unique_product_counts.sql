SELECT
    ProductID,
    COUNT(*) AS record_count
FROM
    {{ ref('dim_products') }}  
group by ProductID
HAVING
    COUNT(*) > 1 /* indicates that the product is not unique */
