WITH
    stg_produtos AS (
        SELECT
            *
        FROM {{ ref('stg_sap__produtos') }}
    )

    , transformar AS (
        SELECT
            id_produto
            , produto_nome
            , produto_numero
            , produto_cor
            , produto_tamanho
        FROM stg_produtos AS produtos
    )

SELECT *
FROM transformar