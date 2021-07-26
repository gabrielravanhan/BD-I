CREATE DATABASE aula_insert;

USE aula_insert;

CREATE TABLE fornecedores (
	id_fornecedor INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(191) NOT NULL,
	cnpj VARCHAR(18) NOT NULL UNIQUE,
	telefone VARCHAR(18),
	data_abertura DATE,
	capital DECIMAL(14,2)
);

INSERT INTO fornecedores (nome, cnpj, telefone, data_abertura, capital) 
	VALUES ('Bidu palace', '123456789987456321', '(14)9983333333', '1500-11-10', 1000000000.00);
    
INSERT INTO fornecedores (nome, cnpj, telefone, data_abertura, capital)
	VALUES ('Osmar Careca', '454545454', '(16)54544444450', '1498-11-21', 4.00),
	('Bilu', '2323535', '154545454', '1478-10-30', 0.01);
    
SELECT * FROM fornecedores;