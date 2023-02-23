# refinamento-modelagem-databases

<h3>Narrativa do modelo de E-COMMERCE:</h3>
<ul>
  <li>Os produtos são vendidos por uma única plataforma online. Contudo, estes podem ter vendedores distintos (terceiros);</li>
  <li>Cada produto possui um fornecedor;</li>
  <li>Um ou mais produtos podem compor um pedido;</li>
  <li>Cada cliente pode se cadastrar no site com seu CPF ou CNPJ;</li>
  <li>Os pedidos são criados por clientes e possuem informações de compra, endereço e status da entrega;</li>
  <li>Um produto ou mais compõem o pedido.</li>
</ul>

<h3>Narrativa do modelo de Oficina:</h3>
<ul>
  <li>Clientes levam veículos à oficina mecânica para serem consertados ou para passarem por revisões periódicas;</li>
  <li>Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS com data de entrega;</li>
  <li>A partir da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referência de mão-de-obra;</li>
  <li>O valor de cada peça também irá compor a OS. O cliente autoriza a execução dos serviços;</li>
  <li>A mesma equipe avalia e executa os serviços;</li>
  <li>Os mecânicos possuem código, nome, endereço e especialidade;</li>
  <li>Cada OS possui: n°, data de emissão, um valor, status e uma data para conclusão dos trabalhos;</li>
  <li>Uma OS pode ser composta por vários serviços e um mesmo serviço pode estar contido em mais de uma OS;</li>
  <li>Uma OS pode ter vários tipos de peça e uma peça pode estar presente em mais de uma OS.</li>
</ul>
