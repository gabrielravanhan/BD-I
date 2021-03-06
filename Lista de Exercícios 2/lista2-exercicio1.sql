CREATE DATABASE banco;

USE banco;

CREATE TABLE estados(
	id_estado INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(191) NOT NULL,
    sigla CHAR(2)
);

CREATE TABLE cidades(
	id_cidade INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(191) NOT NULL,
    estado_id INT UNSIGNED NOT NULL
);

CREATE TABLE clientes(
	id_cliente INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(191) NOT NULL,
    cpf VARCHAR(191) NOT NULL,
    endereco VARCHAR (191) NOT NULL,
    cidade_id INT UNSIGNED NOT NULL
);

CREATE TABLE telefones(
	id_telefone INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(191),
    cliente_id INT UNSIGNED
);

CREATE TABLE agencias(
	id_agencia INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    numero_agencia INT UNSIGNED NOT NULL,
    nome VARCHAR(191) NOT NULL,
    cidade_id INT UNSIGNED NOT NULL,
    endereco VARCHAR(191)
);

CREATE TABLE contas_correntes(
	id_conta_corrente INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    numero_identificador_unico INT UNSIGNED NOT NULL,
    cliente INT UNSIGNED NOT NULL,
    agencia INT UNSIGNED NOT NULL,
    saldo DECIMAL
);

SHOW TABLES;

SHOW DATABASES;