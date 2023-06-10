WITH
    fonte_produtos AS (
        SELECT *
        FROM {{ source('sap_adw', 'salesorderdetail') }}
    )

    , renomear AS (
        SELECT	
            CAST(salesorderid AS INT) AS id_ordem_venda
            ,CAST(productid AS INT) AS id_produto
            ,CAST(orderqty AS INT) AS venda_quantidade
            ,CAST(unitprice AS DECIMAL) AS preco_unitario
        FROM fonte_produtos
    )

SELECT
    *
FROM renomear
