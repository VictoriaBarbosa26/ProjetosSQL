create database teste;
use teste;

create table produtos (
referencia varchar(3) primary key,
descricao varchar(50) unique,
estoque int not null default 0
);

insert into produtos values
('001','feijão',10),('002','arroz',5),('003','farinha',15);

create table itensvenda (
venda int,
produto varchar(3),
quantidade int
);

select * from produtos;

DELIMITER $
	-- Primeiro Gatilho INSERT
CREATE TRIGGER Tgr_itensvenda_insert AFTER INSERT
ON ItensVenda
FOR EACH ROW
BEGIN
	UPDATE Produtos SET Estoque = Estoque - NEW.Quantidade
WHERE Referenia = NEW.Produto;
END$

	-- Segundo Gatilho DELETE
CREATE TRIGGER Tgr_itensvenda_Delete AFTER DELETE
ON ItensVenda
FOR EACH ROW
BEGIN
	UPDATE Produtos SET Estoque = Estoque + OLD.Quantidade
WHERE Referenia = OLD.Produto;
END$

DELIMITER ;

insert into ItensVenda VALUES (1, '001', 3), (1, '002', 1), (1, '003', 5);

DELETE FROM  ItensVenda WHERE Venda = 1 AND produto = '001';

show triggers;

-- DELETAR a TRIGGER
DROP TRIGGER Tgr_itensvenda_Insert;
select * from ItensVenda;