SELECT
	uni.nm_unidade,
(
	case itens.tipo_documento
		when 'P' then pedi.num_pedido
		when 'O' then itens.num_documento
	end
)
	as pedido ,
	itens.cd_cliente,
	itens.nm_cliente,
(
	case itens.tipo_documento
		when 'P' then pedi.matr_vendedor
		when 'O' then ' '
	end
)
	as matr_vend,
(
	case itens.tipo_documento
		when 'P' then operVendedor.nm_operador
		when 'O' then ' '
	end
)
	as vendedor,
	itens.cd_forma_pagto,
	form.descr_forma_pagamento,
	itens.cd_parcelamento,
	parc.descr_parcelamento,
	itens.vl_pago,
	itens.dt_liberacao,
	lib.descr_liberacao

from  ItensFormaPagamento as itens (nolock)
inner join tab_forma_pagamento as form on itens.cd_forma_pagto = form.cd_forma_pagamento and itens.flag_provisorio = 'S' -- Conexão da tab forma de pagamento com os itens forma de pagamento;
inner join tab_entidade_financeira as enti (nolock) on enti.cd_entidade_interno = form.cd_entidade_financeira
inner join tab_liberacao_financeira as lib (nolock) on lib.cd_liberacao = itens.cd_liberacao
inner join tab_unidade_login as uni (nolock) on uni.cd_unidade = itens.cd_unidade
inner join tab_parcelamento as parc (nolock) on itens.cd_parcelamento = parc.cd_parcelamento and itens.cd_forma_pagto = parc.cd_forma_pagamento
inner join tab_pedido as pedi (nolock) on pedi.num_orcamento = itens.num_documento and itens.tipo_documento = 'P' -- Pegando as ordens de serviços e pedidos;
inner join tab_operador as operVendedor (nolock) on operVendedor.cd_operador = pedi.matr_vendedor

where  itens.st_itens_forma_pagto = '1'
