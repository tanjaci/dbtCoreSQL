with base as (
    SELECT
     ProductID,
     ProductName,
     SupplierID,
     QuantityPerUnit,
     UnitPrice
    FROM
         {{ source('customer_source', 'Products') }}

)
select * from base
/*Explanation: This transformation creates a simple dim_products table from 
the products table in Northwind, including columns like product_name, unit_price, and quantity_per_unit.*/