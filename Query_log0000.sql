DECLARE @CD_PRODUTO VARCHAR (10)
DECLARE @CD_UNIDADE INTEGER
DECLARE @CD_CATEGORIA INTEGER
DECLARE @TIPO_DATA VARCHAR (15)
DECLARE @ST_PEDIDO VARCHAR (3)
DECLARE @DATA_INI SMALLDATETIME
DECLARE @DATA_FIM SMALLDATETIME


SET @CD_PRODUTO = $P{CD_PRODUTO}
SET @CD_UNIDADE = $P{CD_UNIDADE}
SET @CD_CATEGORIA = $P{CD_CATEGORIA}
SET @TIPO_DATA = $P{TIPO_DATA}
SET @ST_PEDIDO = $P{ST_PEDIDO}
SET @DATA_INI = $P{DATA_INI}
SET @DATA_FIM = $P{DATA_FIM}


select
		pedido.num_pedido,
		pedido.dt_abertura_pedido,
		pedido.dt_fecha_pedido,
		pedido.st_pedido,
		pedido.cd_unidade,
		itemPedido.cd_produto,
		produto.descr_produto,
		produto.cd_categoria,
		itemPedido.vl_venda,
		itemPedido.qtd_item,
		(
            case Pedido.st_pedido
            when '1' then 'Orçado'
            when '2' then 'Aguard. Aprovação Gerência'
            when '3' then 'Negado pela Gerência'
            when '4' then 'Aguard. Aprovação Cliente'
            when '5' then 'Aguard. Aprovação Cadastral'
            when '6' then 'Em Produção'
            when '7' then 'Cancelado'
            when '8' then 'Aguard. Liberação Financeira'
            when '9' then 'Entregue'
            when '10' then 'Em Transporte'
            when '11' then 'Montado na Fábrica'
            when '12' then 'Aguard. Liberação Entrega'
            when '13' then 'Liberado para Entrega'
            when '14' then 'Aguard. Cliente'
            when '15' then 'Aguardando Transportadora'
            when '16' then 'Encaminhado ao Cliente'
            when '17' then 'Encaminhado a Transportadora'
            when '18' then 'Problema na Entrega'
            when '19' then 'Problema no Fechamento'
            when '20' then 'Aguard. Pagamento'
            else 'desconhecido'
            end)
as status,
		 sum  ( itemPedido.vl_venda *
			itemPedido.qtd_item  ) as valor_total


from
		tab_pedido as Pedido

		inner join tab_item_pedido as itemPedido (nolock) on
			(pedido.num_orcamento = itemPedido.num_orcamento)
		inner join tab_produto as Produto (nolock) on
			(produto.cd_produto = itemPedido.cd_produto)
		inner join tab_categoria_produto as Categoria(nolock) on
			(Categoria.cd_categoria = Produto.cd_categoria)
		inner join tab_unidade_login as Unidade (nolock) on
			(Unidade.cd_unidade = Pedido.cd_unidade)



		where

		(@CD_PRODUTO = '' or itemPedido.cd_produto=cast(@CD_PRODUTO as integer))


and (@CD_UNIDADE=-1 OR Pedido.cd_unidade= @CD_UNIDADE)

and (@CD_CATEGORIA = -1 OR Categoria.cd_categoria = @CD_CATEGORIA)

and Pedido.num_pedido>0


and ((@TIPO_DATA='ab_pedido' and Pedido.dt_abertura_pedido>=@DATA_INI and Pedido.dt_abertura_pedido<=DATEADD(Hour,23,DATEADD(minute,59,@DATA_FIM)))
            OR (@TIPO_DATA='fc_pedido' and Pedido.dt_fecha_pedido>=@DATA_INI and ped.dt_fecha_pedido<=DATEADD(Hour,23,DATEADD(minute,59,@DATA_FIM)))
            --OR(@TIPO_DATA='prod' and orp.dt_abertura_op>=@DATA_INI and orp.dt_abertura_op<=DATEADD(Hour,23,DATEADD(minute,59,@DATA_FIM)))
)

and ((@PRONTA_ENTREGA=1)
            OR (@PRONTA_ENTREGA=2 AND ite.cd_item_agrega = 0 AND (ite.cd_etiqueta is not null AND ite.cd_etiqueta <> ''))
            OR (@PRONTA_ENTREGA=3 AND ite.cd_item_agrega = 0 AND (ite.cd_etiqueta is null or ite.cd_etiqueta = ''))
)

and (@ST_PEDIDO='-1' OR ped.st_pedido=@ST_PEDIDO)
and (@INC_ENTREGUE='S' OR ped.st_pedido<> '9')

and ped.st_pedido<>'7'
and (@LIB_FINANCEIRA=-1
            OR (@LIB_FINANCEIRA=1 AND itens_pagamentos.pedido_nao_pago>0)
            OR (@LIB_FINANCEIRA=0 AND (itens_pagamentos.pedido_nao_pago<=0 OR itens_pagamentos.pedido_nao_pago IS NULL)))
and (@CD_VENDEDOR=-1 OR ope.cd_operador=@CD_VENDEDOR)



		group by
				pedido.num_pedido,
				pedido.dt_abertura_pedido,
				pedido.dt_fecha_pedido,
				pedido.st_pedido,
				pedido.cd_unidade,
				itemPedido.cd_produto,
				produto.descr_produto,
				produto.cd_categoria,
				itemPedido.vl_venda,
				itemPedido.qtd_item
