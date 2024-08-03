create database empresa;
use empresa;

use empresa;

create table clientes (
id int auto_increment primary key,
nome varchar(40) not null,
email varchar(50) not null
);

use empresa; 

create table produtos (
id int auto_increment primary key,
nome varchar(40) not null,
preco decimal(8, 2) not null

);

use empresa;

create table pedidos (
id int auto_increment primary key,
cliente_id int,
foreign key (cliente_id) references clientes(id),
data_pedido date not null,
total decimal(8, 2) not null

);

use empresa;

create table itens_pedidos (
pedido_id int,
foreign key (pedido_id) references pedidos(id),
produto_id int,
foreign key (produto_id) references produtos(id),
quantidade int not null,
preco decimal(7, 2)
);

use empresa;


insert into clientes (nome, email) values 
('tavares', 'tavares@gmail.com'),
('willian', 'indiano@gmail.com'),
('daniel', 'corredor@gmail,com'),
('karol', 'karol@gmail.com');

insert into clientes (nome, email) values('julios', 'julios@gmailcom');

use empresa;

insert into produtos(nome, preco) values 
('iphone 11', 2500.99),
('sansung galaxy', 1500.89),
('netbook', 4000.56),
('ps5', 5000.99);

insert into produtos (nome, preco) values('nintendo', 2000.00);

use empresa;

insert into pedidos(cliente_id, data_pedido, total) values 
(1, 20230620, 2500.99),
(2, 20101225, 3000.99),
(3, 20240420, 4000.56),
(4, 20240410, 5000.99);
 
insert into pedidos (cliente_id, data_pedido, total) values (1, 20230512, 2500.99);

use empresa;

insert into itens_pedidos (pedido_id, produto_id, quantidade, preco) values 
(1, 1, 5000, 2500.99),
(2, 2, 3000, 3000.87),
(3, 3, 10000, 4000.56),
(4, 4, 50000, 5000.60);

insert into itens_pedidos (pedido_id, produto_id, quantidade, preco) values (5, 2, 6000, 1500.99 ); 

use empresa;

update produtos set  preco = 1200 where id = 2;
update itens_pedidos set preco = 1200 where pedido_id = 2;

use empresa;

delete from itens_pedidos where pedido_id = 3;
delete from pedidos where  cliente_id = 3;
delete from clientes where id = 3;

use empresa;  

alter table clientes add column aniversario date;

use empresa;

select clientes.nome, pedidos.total, produtos.nome from clientes
join pedidos on clientes.id = pedidos.cliente_id
join itens_pedidos on pedidos.id = itens_pedidos.pedido_id
join produtos on produtos.id = itens_pedidos.produto_id;

use empresa;

select clientes.nome,  pedidos.cliente_id from 
clientes left join pedidos on clientes.id = pedidos.cliente_id;



use empresa;

select produtos.nome, itens_pedidos.produto_id from 
itens_pedidos right join produtos on produtos.id = itens_pedidos.produto_id;

use empresa;

select sum(pedidos.total)as total_vendas, sum(itens_pedidos.quantidade ) as total_quantidade
from pedidos join itens_pedidos on pedidos.id = itens_pedidos.pedido_id;

use empresa;
  
select clientes.nome, sum(pedidos.total) as pedidos_total from 
clientes join pedidos on clientes.id = pedidos.cliente_id
group by clientes.nome
order by pedidos_total desc;





use empresa;

select clientes.nome, sum(pedidos.total) as valor_gasto from 
clientes join pedidos on clientes.id = pedidos.cliente_id
group by clientes.nome 
order by valor_gasto desc;

use empresa;

select produtos.nome, itens_pedidos.quantidade as quantidade , sum(pedidos.total) as total from 
produtos join itens_pedidos on produtos.id = itens_pedidos.produto_id
join pedidos on pedidos.id = itens_pedidos.pedido_id
group by produtos.nome, itens_pedidos.quantidade
order by  quantidade desc
limit 3;

use empresa;

select clientes.nome, pedidos.total, sum(itens_pedidos.preco) as total_gasto
from clientes inner join pedidos on clientes.id = pedidos.cliente_id
inner join itens_pedidos on pedidos.id = itens_pedidos.pedido_id
group by clientes.nome, pedidos.total 
order by pedidos.total desc
limit 3;

use empresa;

select clientes.nome, avg(itens_pedidos.quantidade ) as media from 
itens_pedidos inner join pedidos on itens_pedidos.pedido_id = pedidos.id
inner join clientes on pedidos.cliente_id = clientes.id
group by clientes.nome;

use empresa;

select pedidos.data_pedido , clientes.nome  from 
pedidos join clientes on pedidos.cliente_id = clientes.id  WHERE MONTH(pedidos.data_pedido) = '12';                     

use empresa;

select produtos.nome from 
produtos left join itens_pedidos on produtos.id = itens_pedidos.pedido_id where produtos.id not in(itens_pedidos.produto_id);

use empresa;

select clientes.nome,  count( distinct pedidos.id) as pedidos_diferentes 
from clientes 
join pedidos on clientes.id = pedidos.cliente_id
group by clientes.nome
having pedidos_diferentes > 1;





use empresa;

select pedidos.data_pedido , clientes.nome   from 
pedidos join clientes on pedidos.cliente_id = clientes.id 
order by month(pedidos.data_pedido) desc
limit 1;



 

