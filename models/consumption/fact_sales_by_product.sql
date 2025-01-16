with base as (
select 
doc.ProductID,
       sum(doc.Quantity) as total_units_sold,
       sum(doc.Quantity * doc.UnitPrice * (1 - doc.Discount)) as total_sales_value
-- from  {{ source('customer_source', 'Order_Details') }}  doc
   from {{ ref('fact_orders') }} doc
 group by doc.ProductID
)
select * from base
/*Explanation: This model aggregates sales data by product, calculating the total quantity and total sales for each product from the order_details table*/
