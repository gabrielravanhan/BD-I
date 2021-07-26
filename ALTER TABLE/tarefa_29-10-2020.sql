CREATE DATABASE tarefa29102020 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE tarefa29102020;

CREATE TABLE estados(
	id_estado INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(191) NOT NULL,
    sigla CHAR(2)
);

CREATE TABLE cidade(
	id_cidade INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    tamanho INT,
    governador DECIMAL(14,2)
);

ALTER TABLE cidade
	RENAME TO cidades;
    
ALTER TABLE cidades
	CHANGE COLUMN nome nome_cidade VARCHAR(50);
ALTER TABLE cidades
	CHANGE COLUMN tamanho area_total INT;
    
ALTER TABLE cidades
	DROP COLUMN governador;
    
ALTER TABLE cidades
	MODIFY nome_cidade VARCHAR(191) NOT NULL,
    MODIFY area_total DECIMAL(14,2) DEFAULT '0.00';

ALTER TABLE cidades
	ADD codigo_ibge INT UNIQUE,
    ADD estado_id INT UNSIGNED NOT NULL;
    
ALTER TABLE cidades ADD CONSTRAINT fk_estado FOREIGN KEY (estado_id) REFERENCES estados (id_estado);