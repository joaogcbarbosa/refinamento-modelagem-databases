-- Criando o banco de dados

create database ecommerce;
use ecommerce;

-- Criando as tabelas

create table clients(
idClient int auto_increment primary key,
Fname varchar(15),
Minit char(3),
Lname varchar(20),
CPF char(11),
CNPJ char(15),
Address varchar(255),
constraint unique_cpf_client unique(CPF),
constraint unique_cnpj_client unique(CNPJ)
);

insert into clients (Fname, Minit, Lname, CPF, CNPJ, Address) values
('Maria', 'M', 'Silva', 15764253798, null, 'rua silva de pra 29, Carangola - Cidade das flores'),
('Matheus', 'O', 'Pimentel', 16932145678, null, 'rua alameda 289, Centro - Cidade das flores'),
('Ricardo', 'F', 'Silva', null, 123456789654127, 'avenida alameda vinha 1009, Centro - Cidade das flores'),
('Julia', 'S', 'França', 15643218754, null, 'avenida koller 19, Centro - Cidade das flores'),
('Roberta', 'G', 'Assis', 98765432145, null, 'rua laranjeiras 861, Centro - Cidade das flores'),
('Isabela', 'M', 'Cruz', null, 159753654789152, 'rua alameda das flores 28, Centro - Cidade das flores');


create table product(
idProduct int auto_increment primary key,
Pname varchar(30) not null,
classification_kids bool default false,
category enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null,
rating float default null,
size varchar(10)
);

insert into product (Pname, classification_kids, category, rating, size) values
('Fone de ouvido', false, 'Eletrônico', '4', null),
('Barbie Elsa', true, 'Brinquedos', '3', null),
('Body Carters', true, 'Vestimenta', '5', null),
('Microfone Vedo - Youtuber', false, 'Eletrônico', '4', null),
('Sofá retrátil', false, 'Móveis', '3', '300x57x80'),
('Farinha de arroz', false, 'Alimentos', '3', null),
('Fire Stick Amazon', false, 'Eletrônico', '3', null);


create table orders(
idOrder int auto_increment primary key,
idOrderClient int,
orderStatus enum('Cancelado', 'Confirmado', 'Em andamento') default 'Em andamento',
orderDescription varchar(255),
freightValue float default 10,
paymentCredit boolean default 0,
paymentDebit boolean default 0,
paymentPix boolean default 0,
constraint fk_order_client foreign key (idOrderClient) references clients(idClient) 
on update cascade
);

insert into orders (idOrderClient, orderStatus, orderDescription, freightValue, paymentCredit, paymentDebit, paymentPix) values
(1, default, 'compra via aplicativo', default, true, false, false),
(2, default, 'compra via aplicativo', 50, false, true, false),
(3, 'Confirmado', 'compra via website', 0, true, true, false),
(4, default, 'compra via website', default, false, true, true);


create table productStorage(
idProductStorage int auto_increment primary key,
storageLocation varchar(255),
quantity int default 0
);

insert into productStorage (storageLocation, quantity) values
('Rio de Janeiro', 1000),
('Rio de Janeiro', 500),
('São Paulo', 10),
('São Paulo', 100),
('São Paulo', 10),
('Brasilia', 60);


create table supplier(
idSupplier int auto_increment primary key,
socialName varchar(255) not null,
CNPJ char(15) not null,
contact char(15) not null,
constraint unique_supplier unique (CNPJ)
);

insert into supplier (socialName, CNPJ, contact) values
('Almeida e filhos', 123456789542978, '21985474'),
('Eletrônicos Silva', 571945278169825, '21985484'),
('Eletrônicos Valma', 187964523798564, '21975474');


create table seller(
idSeller int auto_increment primary key,
socialName varchar(255) not null,
abstName varchar(255),
CNPJ char(15),
CPF char(11),
location varchar(255),
contact char(15) not null,
constraint unique_cnpj_seller unique (CNPJ),
constraint unique_cpf_seller unique (CPF)
);

insert into seller (socialName, abstName, CNPJ, CPF, location, contact) values
('Tech Eletronics', null, 942516378452196, null, 'Rio de Janeiro', 219946287),
('Botique Durgas', null, null, 15978543621, 'Rio de Janeiro', 219567895),
('Kids World', null, 513487965423156, null, 'São Paulo', 1198657484);


create table delivery(
idDelivery int auto_increment primary key,
idDeliveryProduct int,
status enum('Estoque','Transportadora', 'A caminho', 'Entregue') default 'Estoque',
trackingCode char(13),
constraint fk_delivery_product foreign key (idDeliveryProduct) references productStorage(idProductStorage)
);

insert into delivery (idDeliveryProduct, status, trackingcode) values
(2, default, 5134879006351),
(3, 'A caminho', 1236547891596),
(1, 'Transportadora', 3217854693315),
(1, 'Entregue', 1655789942031);


create table productSeller(
idProductSeller int,
idProductProduct int,
productQuantity int default 1,
primary key (idProductSeller, idProductProduct),
constraint fk_product_seller foreign key (idProductSeller) references seller(idSeller),
constraint fk_product_product foreign key (idProductProduct) references product(idProduct)
);

insert into productSeller (idProductSeller, idProductProduct, productQuantity) values
(1, 6, 80),
(2, 7, 10);


create table productOrder(
idPOProduct int,
idPOOrder int,
pOQuantity int default 1,
pOStatus enum('Disponível', 'Sem estoque') default 'Disponível',
primary key (idPOProduct, idPOOrder),
constraint fk_productorder_seller foreign key (idPOProduct) references product(idProduct),
constraint fk_productorder_product foreign key (idPOOrder) references orders(idOrder)
);

insert into productOrder (idPOProduct, idPOOrder, pOQuantity, pOStatus) values
(1, 1, 2, default),
(2, 1, 1, default),
(3, 2, 1, default);


create table storageLocation(
idLProduct int,
idLStorage int,
location varchar(255) not null,
primary key (idLProduct, idLStorage),
constraint fk_storage_location_product foreign key (idLProduct) references product(idProduct),
constraint fk_storage_location_storage foreign key (idLStorage) references productStorage(idProductStorage)
);

insert into storageLocation (idLProduct, idLStorage, location) values
(1, 2, 'RJ'),
(2, 6, 'GO');


create table productSupplier(
idPSSupplier int,
idPSProduct int,
quantity int not null,
primary key (idPSSupplier, idPSProduct),
constraint fk_product_supplier_supplier foreign key (idPSSupplier) references supplier(idSupplier),
constraint fk_product_supplier_prodcut foreign key (idPSProduct) references prodcut(idProduct)
);

insert into productSupplier (idPSSupplier, idPSProduct, quantity) values
(1, 1, 500),
(1, 2, 400),
(2, 4, 633),
(3, 3, 5),
(2, 5, 10);
