WITH
    fonte_produtos AS (
        SELECT *
        FROM {{ source('sap_adw', 'product') }}
    )

    , renomear AS (
        SELECT	
            CAST(productid AS INT) AS id_produto
            ,CAST(name AS STRING) AS produto_nome
            ,CAST(productnumber AS STRING) AS produto_numero
            ,CAST(color AS STRING) AS produto_cor
            ,CAST(size AS STRING) AS produto_tamanho
        FROM fonte_produtos
    )

SELECT
    *
FROM renomear
