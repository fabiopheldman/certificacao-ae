WITH
    dim_clientes AS (
        SELECT
            *
        FROM {{ ref('dim_clientes') }}
    )

    , dim_localizacoes AS (
        SELECT
            *
        FROM {{ ref('dim_localizacoes') }}
    )

    , dim_motivos_venda AS (
        SELECT
            *
        FROM {{ ref('dim_motivos_venda') }}
    )

    , dim_produtos AS (
        SELECT
            *
        FROM {{ ref('dim_produtos') }}
    )

    , dim_vendedores AS (
        SELECT
            *
        FROM {{ ref('dim_vendedores') }}
    )

    , dim_cartoes_credito AS (
        SELECT
            *
        FROM {{ ref('dim_cartoes_credito') }}
    )

    , dim_ordens_itens AS (
        SELECT
            *
        FROM {{ ref('int_vendas__ordens_itens') }}
    )

    , joined_tabelas AS (
        SELECT
            oi.id_ordem_venda
            , cc.sk_cartao_credito AS fk_cartao_credito
            , cli.sk_cliente AS fk_cliente
            , loc.sk_endereco AS fk_endereco
            , mv.sk_motivo_venda AS fk_motivo_venda
            , prod.sk_produto AS fk_produto
            , vend.sk_vendedor AS fk_vendedor				
            , oi.data_venda			
            , oi.data_vencimento		
            , oi.data_entrega			
            , oi.total_vendido
            , oi.taxa_cambio
            , oi.peso	
            , oi.total_devido
            , oi.venda_quantidade
            , oi.preco_unitario

            , cli.pessoa_nome AS cliente

            , loc.endereco			
            , loc.cidade				
            , loc.estado
            , loc.pais

            , mv.motivo_venda
            , mv.tipo_venda

            , prod.produto_nome

            , vend.vendedor_nome

            , cc.tipo_cartao

        FROM dim_ordens_itens AS oi
        LEFT JOIN dim_clientes AS cli
            ON oi.id_cliente = cli.id_cliente
        LEFT JOIN dim_localizacoes AS loc
            ON oi.id_endereco_fatura = loc.id_endereco
        LEFT JOIN dim_motivos_venda AS mv
            ON oi.id_ordem_venda = mv.id_ordem_venda
        LEFT JOIN dim_produtos AS prod
            ON oi.id_produto = prod.id_produto
        LEFT JOIN dim_vendedores AS vend
            ON oi.id_vendedor = vend.id_vendedor
        LEFT JOIN dim_cartoes_credito AS cc
            ON oi.id_cartao_credito = cc.id_cartao_credito
    )

     , transformacoes as (
        select
            {{ dbt_utils.generate_surrogate_key(['id_ordem_venda', 'fk_produto', 'fk_motivo_venda']) }} as sk_venda
            , *
        from joined_tabelas
    )
    
SELECT
    *
FROM transformacoes

