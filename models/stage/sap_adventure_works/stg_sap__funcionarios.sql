WITH
    fonte_funcionarios AS (
        SELECT *
        FROM {{ source('sap_adw', 'employee') }}
    )

    , renomear AS (
        SELECT	
            CAST(businessentityid AS INT) AS id_funcionario
            ,CAST(jobtitle AS STRING) AS funcionario_funcao
            ,CAST(gender AS STRING) AS funcionario_sexo	
            ,CAST(hiredate AS DATE) AS funcionario_data_contratacao	
        FROM fonte_funcionarios
    )

SELECT
    *
FROM renomear