
-- Criação do banco de dados
CREATE DATABASE Adega;
GO
USE Adega;
GO

-- Tabela de Fornecedores
CREATE TABLE Fornecedores (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100),
    Contato VARCHAR(100)
);

-- Tabela de Produtos (vinhos, cervejas, destilados, etc)
CREATE TABLE Produtos (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100),
    Tipo VARCHAR(50),
    VolumeML INT,
    Preco DECIMAL(10,2),
    FornecedorId INT,
    FOREIGN KEY (FornecedorId) REFERENCES Fornecedores(Id)
);

-- Tabela de Clientes
CREATE TABLE Clientes (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100),
    CPF VARCHAR(14)
);

-- Tabela de Vendas
CREATE TABLE Vendas (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ClienteId INT,
    DataVenda DATE DEFAULT GETDATE(),
    FOREIGN KEY (ClienteId) REFERENCES Clientes(Id)
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

-- Inserção de Fornecedores
INSERT INTO Fornecedores (Nome, Contato) VALUES
('Vinícola Aurora', 'aurora@vinhos.com'),
('Cervejaria Itaipava', 'contato@itaipava.com');

-- Inserção de Produtos
INSERT INTO Produtos (Nome, Tipo, VolumeML, Preco, FornecedorId) VALUES
('Vinho Tinto Seco', 'Vinho', 750, 45.90, 1),
('Cerveja Pilsen', 'Cerveja', 350, 4.50, 2);

-- Inserção de Clientes
INSERT INTO Clientes (Nome, CPF) VALUES
('Carlos Silva', '123.456.789-00'),
('Juliana Alves', '987.654.321-00');

-- Inserção de Vendas
INSERT INTO Vendas (ClienteId) VALUES
(1),
(2);

-- Inserção de ItensVenda
INSERT INTO ItensVenda (VendaId, ProdutoId, Quantidade, PrecoUnitario) VALUES
(1, 1, 2, 45.90),
(2, 2, 6, 4.50);
