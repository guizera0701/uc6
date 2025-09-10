alter table clientes
change column telefone celular varchar(15);

rename table clientes to usuarios;

alter table usuarios
add column telefone varchar (12) after email;