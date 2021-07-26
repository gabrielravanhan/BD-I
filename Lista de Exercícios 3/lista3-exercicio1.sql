CREATE DATABASE gerenciamento_loja;

USE gerenciamento_loja;

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
    cpf VARCHAR(14) NOT NULL,
    genero CHAR(1),
    data_nascimento DATE,
    rua VARCHAR(191),
    numero VARCHAR(191),
    complemento VARCHAR(191),
    bairro VARCHAR(191),
    cep VARCHAR(191),
    cidade_id INT UNSIGNED NOT NULL,
    celular VARCHAR(191),
    email VARCHAR(191)
);

CREATE TABLE fornecedores(
	id_fornecedor INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(191) NOT NULL,
    cpnj VARCHAR(16) NOT NULL,
    rua VARCHAR(191),
    numero VARCHAR(191),
    complemento VARCHAR(191),
    bairro VARCHAR(191),
    cep VARCHAR(191),
    cidade_id INT UNSIGNED NOT NULL,
    email VARCHAR(191),
    site VARCHAR(191)
);

CREATE TABLE telefones_contato(
	id_telefone_contato INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(191),
    fornecedor_id INT UNSIGNED
);

CREATE TABLE compras(
	id_compra INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fornecedor_id INT UNSIGNED NOT NULL,
    numero_nf INT,
    data_compra DATETIME,
    data_chegada DATETIME,
    valor_total DECIMAL(14,2),
    desconto DECIMAL(14,2)
);

CREATE TABLE vendas(
	id_venda INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT UNSIGNED NOT NULL,
    numero_nota_fiscal INT NOT NULL,
    data_hora_emissao DATETIME,
    desconto DECIMAL(14,2),
    entregar BOOLEAN
);

CREATE TABLE vendedores(
	id_vendedor INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(191) NOT NULL,
    telefone VARCHAR(191)
);

CREATE TABLE produtos(
	id_produto INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(191) NOT NULL,
    valor_unitario DECIMAL(14,2) NOT NULL,
    quantidade_estoque DECIMAL(14,2) NOT NULL
);

CREATE TABLE vendas_produtos(
	id_venda_produto INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    venda_id INT UNSIGNED NOT NULL,
    produto_id INT UNSIGNED NOT NULL,
    valor_unitario_venda DECIMAL(14,2) NOT NULL,
    quantidade DECIMAL(14,2) NOT NULL,
    total DECIMAL(14,2) NOT NULL
);

CREATE TABLE fornecedores_vendedores(
	id_fornecedor_produto INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fornecedor_id INT UNSIGNED NOT NULL,
    vendedor_id INT UNSIGNED NOT NULL
);

CREATE TABLE compras_produtos(
	id_compra_produto INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    compra_id INT UNSIGNED NOT NULL,
    produto_id INT UNSIGNED NOT NULL,
    valor_unitario_compra DECIMAL(14,2) NOT NULL,
	quantidade DECIMAL(14,2) NOT NULL,
    total DECIMAL(14,2) NOT NULL
);

ALTER TABLE cidades ADD CONSTRAINT fk_estado FOREIGN KEY (estado_id) REFERENCES estados (id_estado);

ALTER TABLE clientes ADD CONSTRAINT fk_cidade FOREIGN KEY (cidade_id) REFERENCES cidades (id_cidade);

ALTER TABLE fornecedores ADD CONSTRAINT fk_cidade2 FOREIGN KEY (cidade_id) REFERENCES cidades (id_cidade);

ALTER TABLE telefones_contato ADD CONSTRAINT fk_fornecedor FOREIGN KEY (fornecedor_id) REFERENCES fornecedores (id_fornecedor);

ALTER TABLE fornecedores_vendedores ADD CONSTRAINT fk_fornecedor2 FOREIGN KEY (fornecedor_id) REFERENCES fornecedores (id_fornecedor);

ALTER TABLE fornecedores_vendedores ADD CONSTRAINT fk_vendedor FOREIGN KEY (vendedor_id) REFERENCES vendedores (id_vendedor);

ALTER TABLE compras ADD CONSTRAINT fk_fornecedor3 FOREIGN KEY (fornecedor_id) REFERENCES fornecedores (id_fornecedor);

ALTER TABLE vendas ADD CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES clientes (id_cliente);

ALTER TABLE vendas_produtos ADD CONSTRAINT fk_venda FOREIGN KEY (venda_id) REFERENCES vendas (id_venda);

ALTER TABLE vendas_produtos ADD CONSTRAINT fk_produto FOREIGN KEY (produto_id) REFERENCES produtos (id_produto);

ALTER TABLE compras_produtos ADD CONSTRAINT fk_produto2 FOREIGN KEY (produto_id) REFERENCES produtos (id_produto);

ALTER TABLE compras_produtos ADD CONSTRAINT fk_compra FOREIGN KEY (compra_id) REFERENCES compras (id_compra);

SHOW TABLES;