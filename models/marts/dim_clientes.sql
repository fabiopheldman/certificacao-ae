WITH
    stg_clientes AS (
        SELECT
            *
        FROM {{ ref('stg_sap__clientes') }}
    )

    , stg_pessoas AS (
        SELECT
            *
        FROM {{ ref('stg_sap__pessoas') }}
    )

    , join_tabelas AS (
        SELECT
            clientes.id_cliente
            , clientes.id_pessoa
            --, pessoas.id_pessoa
            --, clientes.id_loja
            --, clientes.id_territorio
            , pessoas.pessoa_nome 
        FROM stg_clientes AS clientes
        LEFT JOIN stg_pessoas AS pessoas    
            ON clientes.id_pessoa = pessoas.id_pessoa
    )

SELECT *
FROM join_tabelas