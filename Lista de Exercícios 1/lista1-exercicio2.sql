CREATE DATABASE enem DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE enem;

CREATE TABLE cores_racas(
	id_cor_raca INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(50) NOT NULL
);

CREATE TABLE orgaos_expedicao(
	id_orgao_expedicao INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE estados(
	id_estado INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    uf CHAR(2)
);

CREATE TABLE estados_civis(
	id_estado_civil INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE paises(
	id_pais INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE cidades(
	id_cidade INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    estado_id INT UNSIGNED NOT NULL
);

CREATE TABLE enderecos(
	id_endereco INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    endereco VARCHAR(50) NOT NULL,
    numero VARCHAR(50) NOT NULL,
    complemento VARCHAR(191),
    bairro VARCHAR(50) NOT NULL,
    cep VARCHAR(50) NOT NULL,
    municipio_id INT UNSIGNED NOT NULL
);

CREATE TABLE dados_pessoais(
	id_dado_pessoal INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    nome VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL,
    nome_mae VARCHAR(50) NOT NULL,
    sexo CHAR(1),
    cor_raca_id INT UNSIGNED NOT NULL,
    numero_de_indentidade INT,
    orgao_expedicao_id INT UNSIGNED NOT NULL,
    uf_indentidade_id INT UNSIGNED NOT NULL,
	estado_civil_id INT UNSIGNED NOT NULL,
    pais_id INT UNSIGNED NOT NULL,
    municipio_nascimento_id INT UNSIGNED NOT NULL,
    solicita_atualizacao BOOLEAN,
    endereco_id INT UNSIGNED NOT NULL
);

ALTER TABLE cidades ADD CONSTRAINT fk_estado FOREIGN KEY (estado_id) REFERENCES estados (id_estado);

ALTER TABLE dados_pessoais ADD CONSTRAINT fk_cor_raca FOREIGN KEY (cor_raca_id) REFERENCES cores_racas (id_cor_raca);

ALTER TABLE dados_pessoais ADD CONSTRAINT fk_orgao_expedicao FOREIGN KEY (orgao_expedicao_id) REFERENCES orgaos_expedicao (id_orgao_expedicao);

ALTER TABLE dados_pessoais ADD CONSTRAINT fk_uf_indentidade FOREIGN KEY (uf_indentidade_id) REFERENCES estados (id_estado);

ALTER TABLE dados_pessoais ADD CONSTRAINT fk_estado_civil FOREIGN KEY (estado_civil_id) REFERENCES estados_civis (id_estado_civil);

ALTER TABLE dados_pessoais ADD CONSTRAINT fk_pais FOREIGN KEY (pais_id) REFERENCES paises (id_pais);

ALTER TABLE dados_pessoais ADD CONSTRAINT fk_municipio_nascimento FOREIGN KEY (municipio_nascimento_id) REFERENCES cidades (id_cidade);

ALTER TABLE enderecos ADD CONSTRAINT fk_municipio FOREIGN KEY (municipio_id) REFERENCES cidades (id_cidade);

ALTER TABLE dados_pessoais ADD CONSTRAINT fk_endereco FOREIGN KEY (endereco_id) REFERENCES enderecos (id_endereco);

SHOW TABLES;