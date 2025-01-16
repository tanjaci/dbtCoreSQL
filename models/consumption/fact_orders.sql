WITH base AS (
    SELECT
        o.OrderID,
        o.CustomerID,
        o.EmployeeID,
        o.OrderDate,
        o.ShipAddress,
        od.ProductID,
        od.UnitPrice,
        od.Quantity,
        od.Discount,
        (od.UnitPrice * od.Quantity * (1 - od.Discount)) AS total_order_value
    FROM
        {{ source('customer_source', 'Orders') }} o
    JOIN
        {{ source('customer_source', 'Order_Details') }} od
        ON o.OrderID = od.OrderID
)

SELECT
    *
FROM base
/*Explanation:This fact table combines the orders and order_details tables to capture detailed order transactions, including a computed field total_order_value for each order.*/