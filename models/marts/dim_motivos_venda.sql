WITH
    stg_ordens_motivo_vendas AS (
        SELECT
            *
        FROM {{ ref('stg_sap__ordens_motivo_vendas') }}
    )

    , stg_motivo_vendas AS (
        SELECT
            *
        FROM {{ ref('stg_sap__motivo_vendas') }}
    )

    , join_tabelas AS (
        SELECT
            omv.id_ordem_venda
            , omv.id_motivo_venda
            , mv.motivo_venda
            , mv.tipo_venda
        FROM stg_ordens_motivo_vendas AS omv
        LEFT JOIN stg_motivo_vendas AS mv    
            ON omv.id_motivo_venda = mv.id_motivo_venda
    )

    , sk AS (
        SELECT
            ROW_NUMBER() OVER (ORDER BY id_motivo_venda) AS sk_motivo_venda
            , *
        FROM join_tabelas
    )

SELECT *
FROM sk
ORDER BY sk.id_ordem_venda ASC