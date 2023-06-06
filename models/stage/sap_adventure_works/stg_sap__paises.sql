WITH
    fonte_paises AS (
        SELECT *
        FROM {{ source('sap_adw', 'countryregion') }}
    )

    , renomear AS (
        SELECT
            CAST(countryregioncode AS STRING) AS cod_pais
            ,CAST(name AS STRING) AS pais	
        FROM fonte_paises
    )

SELECT
    *
FROM renomear