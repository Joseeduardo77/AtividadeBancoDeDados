
-- Criação do banco de dados
CREATE DATABASE Escola;
GO
USE Escola;
GO

-- Tabela de Professores
CREATE TABLE Professores (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100),
    Materia VARCHAR(100)
);

-- Tabela de Cursos
CREATE TABLE Cursos (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100),
    CargaHoraria INT,
    ProfessorId INT,
    FOREIGN KEY (ProfessorId) REFERENCES Professores(Id)
);

-- Tabela de Alunos
CREATE TABLE Alunos (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100),
    DataNascimento DATE
);

-- Tabela de Matrículas
CREATE TABLE Matriculas (
    Id INT PRIMARY KEY IDENTITY(1,1),
    AlunoId INT,
    CursoId INT,
    DataMatricula DATE DEFAULT GETDATE(),
    FOREIGN KEY (AlunoId) REFERENCES Alunos(Id),
    FOREIGN KEY (CursoId) REFERENCES Cursos(Id)
);

-- Inserção de Professores
INSERT INTO Professores (Nome, Materia) VALUES
('Jailson Souza', 'Banco de dados'),
('Carlos Mendes', 'Inteligência Artificial');

-- Inserção de Cursos
INSERT INTO Cursos (Nome, CargaHoraria, ProfessorId) VALUES
('MySQL Básico', 60, 1),
('Fundamentos de IA', 40, 2);

-- Inserção de Alunos
INSERT INTO Alunos (Nome, DataNascimento) VALUES
('Lucas Martins', '2006-03-12'),
('Mariana Oliveira', '2005-09-08');

-- Inserção de Matrículas
INSERT INTO Matriculas (AlunoId, CursoId) VALUES
(1, 1),
(2, 2);
