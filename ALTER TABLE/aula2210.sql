CREATE DATABASE aula2210;
USE aula2210;

CREATE TABLE aluno (
	id_aluno INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    rm INT
); 

ALTER TABLE aluno
	ADD cpf VARCHAR(15);
    
ALTER TABLE aluno
	ADD genero CHAR(1),
    ADD endereco VARCHAR(191);
    
ALTER TABLE aluno
	MODIFY name VARCHAR(191) NOT NULL;
    
ALTER TABLE aluno
	MODIFY endereco VARCHAR(191) NOT NULL DEFAULT 'Cadastrar Rua, S/N';
    
ALTER TABLE aluno
	ADD estado CHAR(2) DEFAULT 'SP';

ALTER TABLE aluno
	ADD complemento VARCHAR(50) DEFAULT 'Casa';

ALTER TABLE aluno
	DROP COLUMN genero;
    
ALTER TABLE aluno
	CHANGE COLUMN name nome_aluno VARCHAR(191) NOT NULL;
    
ALTER TABLE aluno
	RENAME TO alunos;
    


    
