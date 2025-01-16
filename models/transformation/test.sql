SELECT * 
FROM {{ source('customer_source', 'Customers') }};