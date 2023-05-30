WITH
    fonte_produtos AS (
        SELECT *
        FROM {{ source('sap_adw', 'salesorderdetail') }}
    )

    , renomear AS (
        SELECT	
            CAST(salesorderid AS INT) AS id_venda
            ,CAST(productid AS STRING) AS id_produto
            ,CAST(orderqty AS STRING) AS venda_quantidade
            ,CAST(unitprice AS STRING) AS preco_unitario
        FROM fonte_produtos
    )

SELECT
    *
FROM renomear
