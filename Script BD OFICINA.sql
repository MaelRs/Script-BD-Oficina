-- Criação de banco de dados para cenario oficina

create database oficina;
use oficina;
-- Criação de banco de dados para cenario oficina

-- criat tabela Cliente
create table client(
		idClient int auto_increment primary key,
        PName varchar(10),
        Veicle char(13),
        Adress varchar(20),
        Contact char(11) not null,
        constraint unique_contact_client unique(Contact)
);
-- criat tabela Veiculo
create table veicle(
		idVeicle int auto_increment primary key,
        Pmark varchar(10) not null,
        MYear char(4),
        model varchar(10) not null,
        Placa varchar(8),
        constraint unique_contact_client unique(Contact)
);

-- criat tabela Mecanico
create table Mechanic(
		idMechanic int auto_increment primary key,
        Pname varchar(15),
        Endereço varchar(50),
        Especilidade varchar(50)
);
-- Criar tabela de serviços 
create table Services(
		idVeicle int auto_increment primary key,
        idServices int auto_increment,
        ValorMO float(10),
        constraint unique_contact_client unique(Contact)
);

-- Criar tabela de peças

create table parts(
		idParts int auto_increment primary key,
        category enum("Suspensão","Motor","Direção","Parte Eletrica","Acabamento") not null,
        quantity int default 0,
        PartsPrice varchar(255)
);
-- Criar tabela de ordem de Serviços
-- criat tabela Pedido
create table orderService(
		idOrderService int auto_increment primary key,
        idOrderClient int,
        idVeicle int,
        orderServiceStatus enum("Autorizado","Não Autorizado","Em Processamento") default "Em Processamento",
        dataEmissão datetime,
        Numero int,
        valorMO float default 10,
        valorPeça float,
        valortotal float,
        DataConclusão datetime,
        constraint fk_order_service foreign key(orderService) references clients(idClient)
);


-- criat tabela pagamentos
create table payments(
		idClient int,
        idPayments int,
        TypePayments enum("Boleto","Cartão","Dois Cartões"),
        limitAvailable float,
        primary key (idClient, id_payment)
);
-- criat tabela Entrega
create table devolution(
		iddevolution int auto_increment primary key,
		idClient int,
        idVeicle int,
        serviçoConcluido boolean,
        PagtoRecebido boolean,
        VeiculoEntregue boolean
);
        
