-- QUERIES

-- Clientes que fizeram a compra por CPF
select concat(Fname,' ', Lname) as Name, CPF from clients where CPF;


-- Produtos que têm avaliação máxima
select Pname as Product from product where rating = 5;


-- Produtos que são para crianças
select Pname as Product from product where classification_kids;


-- Produtos que foram comprados com valor de frete padrão e foram comprados por aplicativo
select Pname as Product
from product inner join productorder
on idProduct = idPOProduct
	inner join orders
    on idOrder = idPOOrder
    where freightValue = 10 and orderDescription = 'compra via aplicativo';

    
-- Quantos pedidos foram feitos por cada cliente
select Fname as First_Name, count(*) as Number_of_Orders 
from clients inner join orders
on idClient = idOrderClient
group by idOrderClient;


-- Relação de produtos e fornecedores
select Pname as Product, socialName as Supplier 
from product inner join productsupplier
on idProduct = idPSProduct
	inner join supplier
    on idSupplier = idPSSupplier;


-- Nome dos produtos que foram pagos no débito e estão com o status "Em andamento"
select Pname as Product from orders inner join productOrder
on idOrder = idPOOrder
	inner join product
    on idProduct = idPOProduct
	  where paymentDebit = 1 and orderStatus = 'Em andamento';
	
