
-- Criação do banco de dados
CREATE DATABASE Padaria;
GO
USE Padaria;
GO

-- Tabela de Funcionários
CREATE TABLE Funcionarios (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100),
    Cargo VARCHAR(50),
    Salario DECIMAL(10,2)
);

-- Tabela de Produtos (pães, bolos, salgados, etc)
CREATE TABLE Produtos (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100),
    Categoria VARCHAR(50),
    Preco DECIMAL(10,2),
    Estoque INT
);

-- Tabela de Clientes
CREATE TABLE Clientes (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100),
    Telefone VARCHAR(20)
);

-- Tabela de Vendas
CREATE TABLE Vendas (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ClienteId INT,
    DataVenda DATE DEFAULT GETDATE(),
    FuncionarioId INT,
    FOREIGN KEY (ClienteId) REFERENCES Clientes(Id),
    FOREIGN KEY (FuncionarioId) REFERENCES Funcionarios(Id)
);

-- Tabela de Itens da Venda
CREATE TABLE ItensVenda (
    Id INT PRIMARY KEY IDENTITY(1,1),
    VendaId INT,
    ProdutoId INT,
    Quantidade INT,
    PrecoUnitario DECIMAL(10,2),
    FOREIGN KEY (VendaId) REFERENCES Vendas(Id),
    FOREIGN KEY (ProdutoId) REFERENCES Produtos(Id)
);

-- Inserção de Funcionários
INSERT INTO Funcionarios (Nome, Cargo, Salario) VALUES
('Maria Clara', 'Atendente', 1800.00),
('João Mendes', 'Padeiro', 2200.00);

-- Inserção de Produtos
INSERT INTO Produtos (Nome, Categoria, Preco, Estoque) VALUES
('Pão Francês', 'Pães', 0.50, 300),
('Bolo de Chocolate', 'Bolos', 25.00, 20),
('Coxinha', 'Salgados', 5.00, 50);

-- Inserção de Clientes
INSERT INTO Clientes (Nome, Telefone) VALUES
('Fernanda Souza', '(11) 91234-5678'),
('Ricardo Lima', '(11) 99876-5432');

-- Inserção de Vendas
INSERT INTO Vendas (ClienteId, FuncionarioId) VALUES
(1, 1),
(2, 2);

-- Inserção de ItensVenda
INSERT INTO ItensVenda (VendaId, ProdutoId, Quantidade, PrecoUnitario) VALUES
(1, 1, 10, 0.50),
(1, 3, 2, 5.00),
(2, 2, 1, 25.00);
