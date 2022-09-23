create database oficina;
use oficina;

create table cliente(
id_cliente int auto_increment primary key,
nome varchar(45) not null,
sobrenome varchar(45) not null,
telefone char(11) not null,
endereco varchar(255) not null
);

insert into cliente (nome, sobrenome, telefone, endereco) values
('João Pedro', 'Souza', '21957863452', 'rua Brasil 215, Rio de Janeiro - RJ'),
('Ana Paula', 'Carvalho', '21943652876', 'rua Jamaica 432, Rio de Janeiro - RJ'),
('Rafael', 'de Paula', '21985462357', 'rua Chile 2, Rio de Janeiro - RJ' ),
('Paulo', 'Tavares', '21956342574', 'rua Peru 56, Rio de Janeiro - RJ'),
('Bernardo', 'Carvalho', '21943562899', 'rua Paraguai 665, Rio de Janeiro - RJ'),
('Mônica', 'Souza', '21963741852', 'rua Equador 232, Rio de Janeiro - RJ'),
('Fernanda', 'Silva', '21951356243', 'rua Uruguai 754, Rio de Janeiro - RJ'),
('Victor Hugo', 'Oliveira', '21951874965', 'rua Bolivia 35, Rio de Janeiro - RJ');


create table veiculo(
id_veiculo int auto_increment primary key,
id_cliente int,
id_equipe int,
placa char(8) not null unique,
marca varchar(20) not null,
modelo varchar(20) not null,
ano char(4) not null,
constraint fk_id_cliente foreign key (id_cliente) references cliente(id_cliente),
constraint fk_id_equipe foreign key (id_equipe) references equipe_mecanicos(id_equipe)
);

insert into veiculo (id_cliente, id_equipe, placa, marca, modelo, ano) values
(1, 1, 'GHR-6523', 'Fiat', 'Punto', '2015'),
(2, 2, 'JJK-5412', 'Honda', 'Civic', '1998'),
(3, 2, 'JNH-3265', 'Fiat', 'Palio', '2000'),
(3, 3, 'TYG-7895', 'Volkswagen', 'Gol', '2010'),
(4, 2, 'JNM-4519', 'Renault', 'Sandero', '2012'),
(5, 3, 'PLM-9512', 'Toyota', 'Etios', '2017'),
(5, 4, 'DFV-6537', 'Chevrolet', 'Prisma', '2012'),
(6, 3, 'TYU-5162', 'Fiat', 'Uno', '2003'),
(7, 1, 'ERF-5679', 'Renault', 'Logan', '2012'),
(8, 4, 'PZZ-8752', 'Fiat', 'Toro', '2018');


create table servico(
id_servico int auto_increment primary key,
id_equipe int,
id_os int,
id_cliente int,
tipo_servico varchar(45) not null,
status_servico enum('Aguardando aprovação', 'Em andamento', 'Feito') not null,
constraint fk_id_equipe foreign key (id_equipe) references equipe_mecanicos(id_equipe),
constraint fk_id_os foreign key (id_os) references ordem_servico(id_os),
constraint fk_id_cliente foreign key (id_cliente) references cliente(id_cliente)
);

insert into servico (id_equipe, id_os, id_cliente, tipo_servico, status_servico) values
(1, 1, 1, 'Refazer o motor', 'Feito'),
(2, 3, 2, 'Trocar molas', 'Aguardando aprovação'),
(2, 5, 3, 'Trocar eixos', 'Em andamento'),
(3, 6, 3, 'Trocar pneus', 'Aguardando aprovação'),
(2, 4, 4, 'Trocar molas', 'Feito'),
(3, 7, 5, 'Trocar aros', 'Em andamento'),
(4, 9, 5, 'Trocar caixa', 'Aguardando aprovação'),
(3, 8, 6, 'Trocar rodas', 'Aguardando aprovação'),
(1, 2, 7, 'Trocar motor de arranque', 'Em andamento'),
(4, 10, 8, 'Trocar caixa', 'Em andamento');


create table equipe_mecanicos(
id_equipe int auto_increment primary key,
especialidade_equipe varchar(45) not null
);

insert into equipe_mecanicos (especialidade_equipe) values
('Motor'),
('Suspensão'),
('Rodas'),
('Câmbio');


create table ordem_servico(
id_os int auto_increment primary key,
id_equipe int,
valor float not null,
status_ordem enum('Aprovada', 'Não aprovada') not null,
data_emissao date not null,
data_entrega date,
valor_pecas float not null,
constraint fk_id_equipe foreign key (id_equipe) references equipe_mecanicos(id_equipe)
);

insert into ordem_servico (id_equipe, valor, status_ordem, data_emissao, data_entrega, valor_pecas) values
(1, 3000 , 'Aprovada', '2022-07-25', '2022-08-01', 1000),            
(1, 1500, 'Aprovada', '2022-02-02', '2022-02-10', 500),             	
(2, 500, 'Não aprovada', '2022-05-02', '2022-05-07', 300),             	                     
(2, 1000, 'Aprovada', '2022-06-12', '2022-06-15', 400), 				
(2, 500, 'Aprovada', '2022-03-15', '2022-03-25', 300),				
(3, 1000,'Não aprovada', '2022-04-23', '2022-04-27', 5000),				
(3, 500,'Aprovada', '2022-09-23', '2022-09-29', 3000),			
(3, 1500,'Não aprovada', '2022-08-03', '2022-08-07', 3000),				
(4, 750, 'Não aprovada', '2022-03-25', '2022-03-29', 500),				
(4, 750, 'Aprovada', '2022-01-25', '2022-01-31', 500);				


create table mecanicos(
id_mecanico int auto_increment primary key,
id_veiculo int,
nome varchar(45) not null,
sobrenome varchar(45) not null,
especialidade enum('Motor', 'Suspensão', 'Rodas', 'Câmbio') not null,
endereco varchar(255) not null
);


insert into mecanicos (nome, sobrenome, especialidade, endereco) values
('Inácio Luiz', 'Silva', 'Motor', 'rua Alagoas 25, Rio de Janeiro - RJ' ),
('José Carlos', 'Souza', 'Motor', 'rua Ilhéus 542, Rio de Janeiro - RJ'),
('João Miguel', 'Barbosa', 'Motor', 'rua Salvador 89, Rio de Janeiro - RJ'),
('Carlos', 'Pereira', 'Suspensão', 'rua Natal 65, Rio da Janeiro - RJ'),
('Rafael', 'Nogueira', 'Suspensão', 'rua Teresópolis 52, Rio de Janeiro - RJ'),
('Victor', 'Andrade', 'Suspensão', 'rua Petrópolis 753, Rio de Janeiro - RJ'),
('Geraldo', 'Alves', 'Rodas', 'rua Paciência 456, Rio de Janeiro - RJ'),
('Andre', 'Matos', 'Rodas', 'rua Tijuca 357, Rio de Janeiro - RJ'),
('Zé Carlos', 'Antunes', 'Rodas', 'rua Madureira 156, Rio de Janeiro - RJ'),
('Ricardo', 'Carvalho', 'Câmbio', 'rua Cascadura 651, Rio de Janeiro - RJ'),
('Wallace', 'Pontes', 'Câmbio', 'rua Taquara 127, Rio de Janeiro - RJ'),
('Hugo', 'Abreu', 'Câmbio', 'rua Freguesia 23, Rio de Janeiro - RJ');



create table rel_equipe_mecanico(
id_mecanico int,
id_equipe int,
constraint fk_id_mecanico foreign key (id_mecanico) references mecanicos(id_mecanico),
constraint fk_id_equipe foreign key (id_equipe) references equipe_mecanicos(id_equipe)
);

insert into rel_equipe_mecanico (id_mecanico, id_equipe) values
(1, 1), (2, 1), (3, 1), 
(4, 2), (5, 2), (6, 2), 
(7, 3), (8, 3), (9, 3), 
(10, 4), (11, 4), (12, 4);
