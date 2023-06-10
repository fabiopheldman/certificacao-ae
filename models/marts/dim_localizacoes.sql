WITH
    stg_enderecos AS (
        SELECT
            *
        FROM {{ ref('stg_sap__enderecos') }}
    )

    , stg_estados AS (
        SELECT
            *
        FROM {{ ref('stg_sap__estados') }}
    )

    , stg_paises AS (
        SELECT
            *
        FROM {{ ref('stg_sap__paises') }}
    )

    , join_tabelas AS (
        SELECT
            enderecos.id_endereco						
            , enderecos.endereco				
            , enderecos.cidade
            , estados.cod_estado			
            , estados.cod_pais					
            , estados.estado
            , paises.pais
        FROM stg_enderecos AS enderecos
        LEFT JOIN stg_estados AS estados    
            ON enderecos.id_estado = estados.id_estado
        LEFT JOIN stg_paises AS paises
            ON estados.cod_pais = paises.cod_pais
    )

    , sk AS (
        SELECT
            ROW_NUMBER() OVER (ORDER BY id_endereco) AS sk_endereco
            , *
        FROM join_tabelas
    )


SELECT *
FROM sk