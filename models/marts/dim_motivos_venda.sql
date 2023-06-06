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
            omv.*
            , mv.motivo_venda
            , mv.tipo_venda
        FROM stg_ordens_motivo_vendas AS omv
        LEFT JOIN stg_motivo_vendas AS mv    
            ON omv.id_motivo_venda = mv.id_motivo_venda
    )

SELECT *
FROM join_tabelas
ORDER BY join_tabelas.id_ordem_venda ASC