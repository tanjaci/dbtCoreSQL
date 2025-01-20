{% snapshot products_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key='ProductID',
        strategy='check',
        check_cols=['ProductName', 'SupplierID', 'QuantityPerUnit', 'UnitPrice']
    )
}}

   SELECT
     ProductID,
     ProductName,
     SupplierID,
     QuantityPerUnit,
     UnitPrice
    FROM
         {{ source('customer_source', 'Products') }}

{% endsnapshot %}
