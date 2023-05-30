WITH
    fonte_paises AS (
        SELECT *
        FROM {{ source('sap_adw', 'countryregion') }}
    )

    , renomear AS (
        SELECT
            CAST(countryregioncode AS INT) AS id_pais
            ,CAST(name AS INT) AS pais	
        FROM fonte_paises
    )

SELECT
    *
FROM renomear