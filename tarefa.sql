CREATE DATABASE teste;

USE teste;

CREATE TABLE herois_viloes(
	id_heroi_vilao INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_heroi VARCHAR(191) NOT NULL,
    idade INT UNSIGNED,
	heroi_vilao VARCHAR(191) NOT NULL
);

CREATE TABLE poderes(
	id_poder INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(191) NOT NULL
);

CREATE TABLE herois_viloes_poderes(
	id_heroi_vilao_poder INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    heroi_vilao_id INT UNSIGNED NOT NULL,
    poder_id INT UNSIGNED NOT NULL
);

ALTER TABLE herois_viloes_poderes ADD CONSTRAINT fk_heroi_vilao FOREIGN KEY (heroi_vilao_id) REFERENCES herois_viloes (id_heroi_vilao);
ALTER TABLE herois_viloes_poderes ADD CONSTRAINT fk_poder FOREIGN KEY (poder_id) REFERENCES poderes (id_poder);