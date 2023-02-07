-- Banco de dados p/ o P.I Versão 01

create table enderecos (
id_endereco number (4),
nm_rua varchar2 (30),
nr_casa number (4),
nm_comp varchar2 (30),
nr_cep number (8),
nm_cidade varchar2 (30),
sg_estado char (2),
constraint enderecos_id_endereco_pk primary key (id_endereco),
constraint enderecos_nm_rua_nn check (nm_rua is not null),
constraint enderecos_nr_casa_nn check (nr_casa is not null),
constraint enderecos_nr_cep_nn check (nr_cep is not null),
constraint enderecos_nm_cidade_nn check (nm_cidade is not null),
constraint enderecos_sg_estado_nn check (sg_estado is not null)
);

insert into enderecos (id_endereco, nm_rua, nr_casa, nm_comp, nr_cep, nm_cidade, sg_estado) 
values (0001, 'Rua teste', 123, 'Sala 123, andar 14', 12345678, 'São Paulo', 'SP');

insert into enderecos (id_endereco, nm_rua, nr_casa, nm_comp, nr_cep, nm_cidade, sg_estado) 
values (0002, 'Rua teste2', 456, 'Casa', 45678900, 'Rio de Janeiro', 'RJ');

insert into enderecos (id_endereco, nm_rua, nr_casa, nm_comp, nr_cep, nm_cidade, sg_estado) 
values (0003, 'Rua teste3', 789, 'Banca de Jornal', 78945600, 'Santa Catarina', 'SC');

insert into enderecos (id_endereco, nm_rua, nr_casa, nm_comp, nr_cep, nm_cidade, sg_estado) 
values (0004, 'Rua teste4', 666, 'apto 15, bloco 04', 000100233, 'São Paulo', 'SP');

insert into enderecos (id_endereco, nm_rua, nr_casa, nm_comp, nr_cep, nm_cidade, sg_estado) 
values (0005, 'Rua teste5', 777, 'casa 02', 03578170, 'São Paulo', 'SP');

insert into enderecos (id_endereco, nm_rua, nr_casa, nr_cep, nm_cidade, sg_estado) 
values (0006, 'Rua teste6', 44, 03578170, 'São Paulo', 'SP');

insert into enderecos (id_endereco, nm_rua, nr_casa, nr_cep, nm_cidade, sg_estado) 
values (0007, 'Rua teste7', 05, 03578170, 'São Paulo', 'SP');

create table empresa (
id_empresa  number (8),
nr_cnpj number (14),
nm_razaoSocial varchar2 (50),
nm_fantasia varchar2 (50),
nr_telefone number (11),
email varchar2(50),
id_endereco number (4),
observacao varchar2 (50),
constraint empresa_id_empresa_pk primary key (id_empresa),
constraint empresa_nr_cnpj_un unique (nr_cnpj),
constraint empresa_nm_razaoSocial_nn check (nm_razaoSocial is not null),
constraint empresa_nm_fantasia_nn check (nm_fantasia is not null),
constraint empresa_nr_telefone_nn check (nr_telefone is not null),
constraint empresa_email_nn check (email is not null),
constraint empresa_id_endereco_fk foreign key (id_endereco) references enderecos (id_endereco)
);

insert into empresa values 
(1231442, 00000000000101, 'Empresa fictícia 01', 'Nome Fantasia 01', 12345678911, 'teste01@teste.com', 0001, 'teste 01');

insert into empresa values 
(123119, 00000000000102, 'Empresa fictícia 02', 'Nome Fantasia 02', 12345678922, 'teste02@teste.com', 0002, 'teste 02');

insert into empresa values 
(132600, 00000000000103, 'Empresa fictícia 03', 'Nome Fantasia 03', 12345678933, 'teste03@teste.com', 0003, 'teste 03');

insert into empresa values 
(654530, 00000000000104, 'Empresa fictícia 04', 'Nome Fantasia 04', 12345678944, 'teste04@teste.com', 0004, 'teste 04');

create table cliente (
id_cliente number (5),
nr_cpf number (11),
nr_rg number (9),
nm_nome varchar2 (50),
id_sexo char (1),
dt_datanasc date,
nr_telefone number (11),
email varchar2(50),
id_endereco number (4),
constraint cliente_id_cliente_pk primary key (id_cliente),
constraint cliente_nr_cpf_un unique (nr_cpf),
constraint cliente_nr_rg_un unique (nr_rg),
constraint cliente_nm_nome_nn check (nm_nome is not null),
constraint cliente_id_sexo_nn check (id_sexo in ('M', 'F')),
constraint cliente_dt_datanasc_nn check (dt_datanasc is not null),
constraint cliente_nr_telefone_nn check (nr_telefone is not null),
constraint cliente_email_nn check (email is not null),
constraint cliente_id_endereco_fk foreign key (id_endereco) references enderecos (id_endereco)
);

insert into cliente (id_cliente, nr_cpf, nr_rg, nm_nome, id_sexo, dt_datanasc, nr_telefone, email, id_endereco) 
values (11111, 00000000000, 111111111, 'Matheus Oliveira', 'M', '15/11/1999', 2222222222, 'matheus@pi.com', 0005);

insert into cliente (id_cliente, nr_cpf, nr_rg, nm_nome, id_sexo, dt_datanasc, nr_telefone, email, id_endereco) 
values (22222, 00000000001, 111111112, 'José José', 'M', '11/11/1979', 2222222223, 'jose@teste.com', 0006); 

insert into cliente (id_cliente, nr_cpf, nr_rg, nm_nome, id_sexo, dt_datanasc, nr_telefone, email, id_endereco) 
values (33333, 00000000002, 111111113, 'Madalena Madalena', 'F', '05/05/1991', 2222222244, 'teste@teste.com', 0007); 

create table funcionarios (
id_func number (5),
nr_cpf number (11),
nr_rg number (9),
nm_nome varchar2 (50),
id_sexo char (1),
dt_datanasc date,
nr_telefone number (11),
email varchar2(50),
cargo varchar2(50),
constraint funcionarios_id_func_pk primary key (id_func),
constraint funcionarios_nr_cpf_un unique (nr_cpf),
constraint funcionarios_nr_rg_un unique (nr_rg),
constraint funcionarios_nm_nome_nn check (nm_nome is not null),
constraint funcionarios_id_sexo_nn check (id_sexo in ('M', 'F')),
constraint funcionarios_dt_datanasc_nn check (dt_datanasc is not null),
constraint funcionarios_nr_telefone_nn check (nr_telefone is not null),
constraint funcionarios_email_nn check (email is not null),
constraint funcionarios_cargo_nn check (email is not null)
);


insert into funcionarios (id_func, nr_cpf, nr_rg, nm_nome, id_sexo, dt_datanasc, nr_telefone, email, cargo)
values (12, 00000000000, 111111111, 'Fulana de taL', 'F', '18/04/1989', 7777777777, 'blab@gmail.com', 'Vendedora');

insert into funcionarios (id_func, nr_cpf, nr_rg, nm_nome, id_sexo, dt_datanasc, nr_telefone, email,  cargo)
values (13, 00000000001, 111111112, 'King Junior', 'M', '27/06/1995', 7787878785, 'blab@gmail.com',  'Gerente');

insert into funcionarios (id_func, nr_cpf, nr_rg, nm_nome, id_sexo, dt_datanasc, nr_telefone, email, cargo)
values (14, 00000000002, 111111113, 'Ciclano do bem', 'M', '29/08/1999', 17415417217, 'blab@gmail.com', 'Repositor');

insert into funcionarios (id_func, nr_cpf, nr_rg, nm_nome, id_sexo, dt_datanasc, nr_telefone, email, cargo)
values (15, 00000000003, 111111155, 'Beltrano do oeste', 'M', '18/04/2001', 1231748578, 'blab@gmail.com', 'Entregador');

create table mercadorias (
id_merc number (5),
nm_merc varchar2 (40),
vl_merc number (4),
descricao varchar2(30),
constraint mercadorias_id_merc_pk primary key (id_merc),
constraint mercardorias_nm_merc_nn check (nm_merc is not null),
constraint mercadorias_vl_merc_nn check (vl_merc is not null)
);

insert into mercadorias (id_merc,nm_merc,vl_merc)
values (12345, 'Geladeira',5550);

insert into mercadorias (id_merc,nm_merc,vl_merc, descricao)
values (27271, 'MotoG 10',1000, 'Celular');

insert into mercadorias (id_merc,nm_merc,vl_merc)
values (28282, 'Televisão',2050);

insert into mercadorias (id_merc,nm_merc,vl_merc)
values (29293, 'Monitor',999);

create table estoque (
id_estoque number (5),
id_merc number (5),
nm_merc varchar2 (40),
estoqueAtual number (3),
min_estoque number (3),
max_estoque number (3),
constraint estoque_id_estoque_pk primary key (id_estoque),
constraint estoque_id_merc_fk foreign key (id_merc) references mercadorias (id_merc),
constraint estoque_nm_merc_nn check (nm_merc is not null),
constraint estoque_estoqueAtual_nn check (estoqueAtual is not null),
constraint estoque_min_estoque_nn  check (min_estoque is not null),
constraint estoque_max_estoque_nn  check (max_estoque is not null)
);

insert into estoque (id_estoque, id_merc,nm_merc,estoqueAtual,min_estoque,max_estoque)
values (001,12345, 'Geladeira',20,5,30);

insert into estoque (id_estoque, id_merc,nm_merc,estoqueAtual,min_estoque,max_estoque)
values (002,27271, 'MotoG 10 ',187,30,300 );

insert into estoque (id_estoque, id_merc,nm_merc,estoqueAtual,min_estoque,max_estoque)
values (003,28282, 'Televisão',43,15,60);

insert into estoque (id_estoque, id_merc,nm_merc,estoqueAtual,min_estoque,max_estoque)
values (004,29293, 'Monitor',10, 10, 50);

create table pedidos (
nr_pedido number (5),
id_cliente number (5),
dt_pedido date,
id_merc number (8),
nm_merc varchar2 (40),
constraint pedidos_nr_pedido_pk primary key (nr_pedido),
constraint pedidos_id_cliente_fk foreign key (id_cliente) references cliente (id_cliente),
constraint pedidos_dt_pedido_nn check (dt_pedido is not null),
constraint pedidos_id_merc_fk foreign key (id_merc) references mercadorias (id_merc)
);

insert into pedidos (nr_pedido, id_cliente, dt_pedido, id_merc, nm_merc)
values (01, 22222, '21/10/2021', 12345, 'Geladeira');

insert into pedidos (nr_pedido, id_cliente, dt_pedido, id_merc, nm_merc)
values (02, 22222, '21/10/2021', 27271, 'MotoG 10');

insert into pedidos (nr_pedido, id_cliente, dt_pedido, id_merc, nm_merc)
values (03, 33333, '24/10/2021', 28282, 'Televisão');

create table entrega (
nr_entrega number (5),
nr_pedido number (5),
id_cliente number (5),
id_endereco number (4),
constraint entrega_nr_entrega_pk primary key (nr_entrega),
constraint entrega_nr_pedido_fk foreign key (nr_pedido) references pedidos (nr_pedido),
constraint entrega_id_cliente_fk foreign key (id_cliente) references cliente (id_cliente),
constraint entrega_id_endereco_fk foreign key (id_endereco) references enderecos (id_endereco)
);

insert into entrega
values (001, 01, 22222,0006);

insert into entrega
values (002, 02, 22222,0006);

insert into entrega
values (003, 03, 33333,0007);

-- select simples p/ auxilio no desenvolvimento.
select * from entrega
select * from pedidos
select * from estoque
select * from mercadorias
select * from funcionarios
select * from cliente
select * from empresa
select * from enderecos

-- Join / Junções
-- exemplo 01 Cliente e Pedido 

select cliente.nm_nome, pedidos.id_merc,  pedidos.nm_merc
from cliente join pedidos
on (cliente.id_cliente = pedidos.id_cliente);

-- exemplo 02 mercadoria e estoque - Join simplificada

select c.nm_nome, p.id_merc,  p.nm_merc
from cliente c join pedidos p
on (c.id_cliente = p.id_cliente);

select m.nm_merc, m.descricao, e.estoqueAtual, e.min_estoque, e.max_estoque
from mercadorias m join estoque e
on (m.id_merc = e.id_merc);

-- exemplo 03 Cliente, pedido e entrega

select c.nm_nome, p.id_merc, p.nm_merc, p.nr_pedido, e.nr_entrega, ed.nm_rua, ed.nr_casa, ed.nm_comp, ed.nm_cidade, ed.sg_estado, ed.nr_cep
from cliente c join pedidos p
on (c.id_cliente = p.id_cliente)
join entrega e
on (p.nr_pedido = e.nr_pedido)
join enderecos ed 
on (ed.id_endereco = e.id_endereco);





