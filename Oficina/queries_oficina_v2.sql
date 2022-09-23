-- veículos fabricados do ano 2000 para baixo
select marca, modelo, ano from veiculo where ano <= 2000;

-- número de serviços que estão aguardando aprovação
select count(id_servico) as servicos_em_espera from servico
where status_servico = 'Aguardando aprovação';

-- mecânicos que têm como especialidade consertar motor
select concat(nome, ' ', sobrenome) as nome_completo from mecanicos
where especialidade = 'Motor';

-- clientes que já estão com os carros sendo consertados
select concat(nome, ' ', sobrenome) as Nome, status_servico as Status 
from cliente inner join servico 
on cliente.id_cliente = servico.id_cliente
where status_servico = 'Em andamento'
order by Nome;

-- cliente e seu respectivo carro
select concat(nome, ' ', sobrenome) as Nome, modelo, placa
from cliente inner join veiculo 
on cliente.id_cliente = veiculo.id_cliente
order by Nome;

-- clientes que tiverem a ordem de serviço aprovada e pagaram mais de R$1000 pelo serviço
select concat(nome, ' ', sobrenome) as Nome 
from ordem_servico inner join servico
on ordem_servico.id_os = servico.id_os
	inner join cliente
    on servico.id_cliente = cliente.id_cliente
where status_ordem = 'Aprovada'
group by valor
having valor > 1000;

-- Com qual equipe está cada carro
select placa, modelo, especialidade_equipe from 
	veiculo inner join equipe_mecanicos
	on veiculo.id_equipe = equipe_mecanicos.id_equipe;
		
-- Quanto cada cliente pagará pelo serviço e peças
select concat(nome, ' ', sobrenome) as Nome, tipo_servico, (valor + valor_pecas) as total_a_pagar from 
	cliente inner join servico
	on cliente.id_cliente = servico.id_cliente
		inner join ordem_servico
        on servico.id_os = ordem_servico.id_os
order by Nome;

-- Pessoas que possuem carro Fiat do ano de 2010 para cima
select nome, placa, marca, modelo, ano from 
	cliente inner join veiculo
    on cliente.id_cliente = veiculo.id_cliente
where marca = 'Fiat'
group by ano
having ano >= 2010;

-- O que cada equipe está fazendo no momento
select especialidade_equipe, tipo_servico, status_servico from 
	equipe_mecanicos inner join servico 
	on equipe_mecanicos.id_equipe = servico.id_equipe
    where status_servico = 'Em andamento';
    