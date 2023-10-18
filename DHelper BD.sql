use master 
go

if exists(select*from sys.databases where name = 'DHelper')
	drop database DHelper

go

create database DHelper
go

use DHelper 
go

create table Usuario( 
	ID int identity primary key,
	Nome varchar(200) not null,
	Sobrenome varchar(200) not null,
	Email varchar(200) not null,
	Senha varchar(200) not null
)
go

CREATE TABLE Acessibilidade(
	ID INT IDENTITY PRIMARY KEY, 
	Tipo varchar(50)
)
go

CREATE TABLE TipoEstabelecimento(
	ID INT IDENTITY PRIMARY KEY,
	Tipo_estabelecimento VARCHAR(50) not null
)
go

CREATE TABLE Endereco (
	ID INT IDENTITY PRIMARY KEY,
	Rua VARCHAR(50)not null,
	Numero VARCHAR(10) null
)
go

CREATE TABLE Telefone (
	ID INT IDENTITY PRIMARY KEY,
	Telefone varchar(45) null
)
go


CREATE TABLE Estabelecimento (
	ID INT IDENTITY PRIMARY KEY,
	Nome VARCHAR(60) not null,
	IDTelefone int references Telefone (ID) null,
	IDEndereco int references Endereco(ID),
	IDTipo int references TipoEstabelecimento(ID)
)
go

create table EstabelecimentoAcessibilidade(
	ID INT IDENTITY PRIMARY KEY,
	IDEstabelecimento int references Estabelecimento(ID),
	IDAcessibilidade int references Acessibilidade(ID)
)
go


INSERT Acessibilidade VALUES
('Deficiência visual'),
('Deficiência auditiva'),
('Deficiência física'), 
('Deficiência mental')
go

INSERT TipoEstabelecimento VALUES
('Igreja'), 
('Hotel'), 
('Parque'),
('Restaurante'),
('Teatro'),
('Museu'),
('Mercado'),
('Farmacia'),
('Shopping'),
('Instituição'),
('Franquia'),
('Banco'),
('Outros')
go


INSERT Endereco (rua, numero) VALUES 
('R. João Gava', '920'),
('R. Engo. Ostoja Roguski', null),
('R. XV de Novembro', '971'),
('R. Professor Lycio Grein Castro Vellozo', '191'),
('Av. Manoel Ribas', '6121'),
('R. Comendador Araújo', '730'),
('R. Mal. Hermes', '999'),
('R. Alameda Dr. Carlos de Carvalho', '1181'),
('Av. Sete de Setembro', '5190'),
('Av. Brasil', '5122'),
('R. Colomba Merlin', '831'),
('R. Doutor Manoel Pedro', '260'),
('Av. Manoel Ribas', '4455'),
('Av. Sete de Setembro', '4979'),
('R. XV de Novembro', null),
('R. Itupava', '1353'),
('R. Bispo Dom José', '2302'),
('Shopping Novo - T-Área Externa/ R. Cel. Dulcídio', '517'),
('R. Prof. Pedro Viriato Parigot de Souza', '5300'),
('Av. Cândido Hartmann', null),
('R. Dr. Faivre', '846'),
('Rua Presidente Carlos Cavalcanti', null),
('R. Cel. Zacarias', '51'),
('R. Conselheiro Laurindo', '280'),
('R. Konrad Adenauer', '370'),
('Av. João Gualberto', '1487'),
('Av. Pres. Kennedy', '4121')
go

INSERT Telefone (telefone) VALUES
('(41) 99191-5412'),
('(41) 3362-1800'),
('(41) 3304-7900'),
('(41) 3339-7613'),
('(41) 3273-3131'),
('(41) 2102-2000'),
('(41) 3350-4400'),
('(41) 3322-9362'),
('(41) 3351-2222'),
('(45) 3223-6802'),
('(41) 3350-9891'),
('(41) 3252-5583'),
('(41) 3335-1214'),
('(41) 3072-6651'),
('(41) 3018-3836'),
('(41) 2170-8333'),
('(41) 3018-8118'),
('(41) 3026-3223'),
('(41) 3350-9940'),
('(41) 3213-1340'),
('(41) 2118-5111'),
('(41) 3216-1600'),
('(41) 4002-0022'),
('(41) 3212-3500')
go

INSERT Estabelecimento (Nome, IDTelefone, IDEndereco, IDTipo) VALUES
('Ópera de Arame', 1, 1, 5),
('Jardim Botânico', 2, 2, 3),
('Teatro Guaíra', 3, 3, 5),
('Torre Panorâmica', 4, 4, 13),
('Restaurante Dom Antônio', 5, 5, 4),
('Ibis Batel', 6, 6, 2),
('Museu Oscar Niemeyer', 7, 7, 6),
('Restaurante Villa Macollini', 8, 8, 4),
('Hotel Radisson', 9, 9, 2),
('Restaurante Dom Germano', 10, 10, 4),
('Parque Lago Azul', 11, 11, 3),
('Karbonell Frutos do Mar', 12, 12, 4),
('Restaurante Cascatinha', 13, 13, 4),
('Jazz Café', 14, 14, 4),
('Rua XV', null, 15, 13),
('Menina Zen', 15, 16, 4),
('Taj Bar', 16, 17, 4),
('Mustang Sally', 17, 18, 4),
('Teatro Positivo', null, 19, 5),
('Parque Barigui', null, 20, 3),
('Alta Reggia Plaza Hotel', 18, 21, 2),
('Passeio Público', 19, 22, 13),
('Teatro Paiol', 20, 23, 5),
('Caixa Cultural Curitiba', 21, 24, 13),
('Jockey Plaza Shopping', 22, 25, 9),
('Bradesco', 23, 26, 12),
('Shopping Palladium', 24, 27, 9)
go

insert EstabelecimentoAcessibilidade values
(1, 1),
(1, 3),
(2, 1),
(2, 3),
(3, 1),
(3, 3),
(4, 3),
(5, 3),
(6, 1),
(6, 3),
(7, 1),
(7, 3),
(8, 1),
(8, 3),
(9, 1),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 1),
(13, 3),
(14, 3),
(15, 1),
(15, 3),
(15, 2),
(16, 3),
(17, 3),
(18, 3),
(19, 3),
(20, 3),
(20, 4),
(21, 3),
(21, 1),
(22, 3),
(23, 1),
(23, 3),
(24, 3),
(25, 3),
(26, 1),
(26, 3),
(27, 1),
(27, 3)
go

select*from Estabelecimento
select*from TipoEstabelecimento
select*from Endereco
select*from Telefone
select*from Acessibilidade
select*from EstabelecimentoAcessibilidade
select*from Usuario
go


CREATE VIEW AcessibilidadesTipos 
as
select e.ID, e.Nome, a.Tipo from Estabelecimento e 
inner join EstabelecimentoAcessibilidade ea
on e.ID = ea.IDEstabelecimento
inner join Acessibilidade a
on ea.IDAcessibilidade = a.ID
GO

SELECT*FROM AcessibilidadesTipos
GO

CREATE PROCEDURE Igrejas
AS 
SELECT Nome, IDEndereco FROM Estabelecimento
WHERE IDTipo = 1
ORDER BY Nome ASC
GO

EXEC Igrejas
GO

CREATE PROCEDURE Hotel
AS 
SELECT Nome, IDEndereco FROM Estabelecimento
WHERE IDTipo = 2
ORDER BY Nome ASC
GO

EXEC Hotel
GO

CREATE PROCEDURE Parque
AS 
SELECT Nome, IDEndereco FROM Estabelecimento
WHERE IDTipo = 3
ORDER BY Nome ASC
GO

EXEC Parque
GO

CREATE PROCEDURE Restaurantess
AS 
SELECT Nome, IDEndereco FROM Estabelecimento
WHERE IDTipo = 4
ORDER BY Nome ASC
GO

EXEC Restaurantess
GO

CREATE PROCEDURE Teatro
AS 
SELECT Nome, IDEndereco FROM Estabelecimento
WHERE IDTipo = 5
ORDER BY Nome ASC
GO

EXEC Teatro
GO

CREATE PROCEDURE Museu
AS 
SELECT Nome, IDEndereco FROM Estabelecimento
WHERE IDTipo = 6
ORDER BY Nome ASC
GO

EXEC Museu
GO

CREATE PROCEDURE Mercado
AS 
SELECT Nome, IDEndereco FROM Estabelecimento
WHERE IDTipo = 7
ORDER BY Nome ASC
GO

EXEC Mercado
GO

CREATE PROCEDURE Farmacia
AS 
SELECT Nome, IDEndereco FROM Estabelecimento
WHERE IDTipo = 8
ORDER BY Nome ASC
GO

EXEC Farmacia
GO

CREATE PROCEDURE Shopping
AS 
SELECT Nome, IDEndereco FROM Estabelecimento
WHERE IDTipo = 9
ORDER BY Nome ASC
GO

EXEC Shopping
GO

CREATE PROCEDURE Instituicao
AS 
SELECT Nome, IDEndereco FROM Estabelecimento
WHERE IDTipo = 10
ORDER BY Nome ASC
GO

EXEC Instituicao
GO

CREATE PROCEDURE Franquia
AS 
SELECT Nome, IDEndereco FROM Estabelecimento
WHERE IDTipo = 11
ORDER BY Nome ASC
GO

EXEC Franquia
GO

CREATE PROCEDURE Banco
AS 
SELECT Nome, IDEndereco FROM Estabelecimento
WHERE IDTipo = 12
ORDER BY Nome ASC
GO

EXEC Banco
GO

CREATE PROCEDURE Outros
AS 
SELECT Nome, IDEndereco FROM Estabelecimento
WHERE IDTipo = 13
ORDER BY Nome ASC
GO

EXEC Outros
GO

SELECT CONCAT (ende.Rua+ ' ' , ende.Numero) as Endereco, t.Telefone ,e.Nome FROM Estabelecimento AS e 
INNER JOIN Endereco ende
on ende.ID = e.IDEndereco
INNER JOIN Telefone t
on t.ID = ende.ID 
GO