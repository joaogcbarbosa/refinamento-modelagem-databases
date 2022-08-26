# dio-desafio-refinando-database

<h2>Narrativa do modelo de E-COMMERCE:</h2>

<h3>
Escopo: Venda de produtos

Produto:

1. Os produtos são vendidos por uma única plataforma online. Contudo, estes podem ter vededores distintos (terceiros);
2. Cada produto possui um fornecedor;
3. Um ou mais produtos podem compor um pedido.

Cliente:

1. Pode se cadastrar no site com seu CPF ou CNPJ;

Pedido:

1. Os pedidos são criados por clientes e possuem informações de compra, endereço e status da entrega;
2. Um produto ou mais compoem o pedido;
</h3>

<h2>Narrativa do modelo de Oficina:</h2>

<h3>
1) Clientes levam veículos à oficina mecânica para serem consertados ou para passarem por revisões  periódicas;

2. Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS com data de entrega;

3. A partir da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referência de mão-de-obra;

4. O valor de cada peça também irá compor a OS. O cliente autoriza a execução dos serviços;

5. A mesma equipe avalia e executa os serviços;

6. Os mecânicos possuem código, nome, endereço e especialidade;

7. Cada OS possui: n°, data de emissão, um valor, status e uma data para conclusão dos trabalhos;

8. Uma OS pode ser composta por vários serviços e um mesmo serviço pode estar contido em mais de uma OS;

9. Uma OS pode ter vários tipos de peça e uma peça pode estar presente em mais de uma OS.
</h3>
