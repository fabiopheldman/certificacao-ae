WITH
    stg_cartoes_credito AS (
        SELECT
            *
        FROM {{ ref('stg_sap__cartoes_credito') }}
    )
    
    , transformar AS (
        SELECT
            id_cartao_credito
            , tipo_cartao
        FROM stg_cartoes_credito
    )

    , sk AS (
        SELECT
            ROW_NUMBER() OVER (ORDER BY id_cartao_credito) AS sk_cartao_credito
            , *
        FROM transformar
    )

SELECT
    *
FROM sk