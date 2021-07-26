CREATE DATABASE Aula03122020 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE Aula03122020;

CREATE TABLE mestres(
	id_mestre INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(191),
    idade INT
);

INSERT INTO mestres (nome, idade)
	VALUES ('Baidu', 20),
    ('LF', 10),
    ('nanoR', 60),
    ('Sid', 30);
    
UPDATE mestres
	SET nome = 'Tisgão, o Mago'
    WHERE id_mestre = 2;
    
DELETE FROM mestres
	WHERE id_mestre = 4;
    
SELECT nome FROM mestres 
	WHERE id_mestre != 3;