/*
Author: Hamir Dhanquer
Description: scripts sql para popular as tabelas do sistema SIMPLEEAD
version: 0.0 
########## REPORTING SERVICES DO BASICO AO PROJETO ##########
*/

CREATE DATABASE SIMPLEMARKET;

USE SIMPLEMARKET;

/*
CRIACAO DE TABELAS
*/


CREATE TABLE CLIENTE( 
 Idcliente int, 
 nome varchar(60), 
 dtnascimento date, 
 cpf varchar(11), 
 CONSTRAINT pk_cliente PRIMARY KEY (Idcliente) 
);

CREATE TABLE PEDIDO( 
 Idpedido int, 
 Idcliente int, 
 datapedido date,  
 vltotal decimal(10,2), 
 CONSTRAINT pk_pedido PRIMARY KEY (Idpedido), 
 CONSTRAINT fk_pedido_cliente FOREIGN KEY (Idcliente) REFERENCES CLIENTE(Idcliente) 
);

CREATE TABLE PRODUTO( 
 Idproduto int, 
 descricao varchar(100), 
 quantidade int, 
 CONSTRAINT pk_produto PRIMARY KEY (Idproduto) 
);

CREATE TABLE ITEMPEDIDO( 
 Idpedido int, 
 Nritem int, 
 valor decimal(10,2), 
 quantidade int, 
 Idproduto int, 
 CONSTRAINT pk_itempedido PRIMARY KEY (Idpedido, Nritem), 
 CONSTRAINT fk_Idpedido FOREIGN KEY (Idpedido) REFERENCES PEDIDO (Idpedido), 
 CONSTRAINT fk_itempedido_produto FOREIGN KEY (Idproduto) REFERENCES PRODUTO (Idproduto) 
);

CREATE TABLE LOG( 
 Idlog int, 
 data date, 
 descricao varchar(255), 
 CONSTRAINT pk_log PRIMARY KEY (Idlog) 
);