WITH
    stg_vendedores AS (
        SELECT
            *
        FROM {{ ref('stg_sap__vendedores') }}
    )

    , stg_funcionarios AS (
        SELECT
            *
        FROM {{ ref('stg_sap__funcionarios') }}
    )

    , join_tabelas_vf AS (
        SELECT
            vend.*
            , func.*
        FROM stg_vendedores AS vend
        LEFT JOIN stg_funcionarios AS func    
            ON vend.id_vendedor = func.id_funcionario
    )

    , stg_pessoas AS (
        SELECT
            *
        FROM {{ ref('stg_sap__pessoas') }}
    )

    , join_tabelas_vfp AS (
        SELECT 
            jtvf.id_vendedor
            , pess.pessoa_nome AS vendedor_nome
            , jtvf.funcionario_funcao
            , jtvf.funcionario_sexo
            , jtvf.funcionario_data_contratacao
        FROM join_tabelas_vf AS jtvf
        LEFT JOIN stg_pessoas AS pess
            ON jtvf.id_funcionario = pess.id_pessoa
    )

SELECT *
FROM join_tabelas_vfp