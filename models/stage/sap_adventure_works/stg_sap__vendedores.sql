WITH
    fonte_vendedores AS (
        SELECT *
        FROM {{ source('sap_adw', 'salesperson') }}
    )

    , renomear AS (
        SELECT	
            CAST(businessentityid AS INT) AS id_vendedor
        FROM fonte_vendedores
    )

SELECT
    *
FROM renomear