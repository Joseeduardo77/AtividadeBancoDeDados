
-- Criação do banco de dados
CREATE DATABASE DoceriaDoJose;
GO

-- Seleciona o banco
USE DoceriaDoJose;
GO

-- Tabela de Categorias de Produtos
CREATE TABLE Categorias (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(50) NOT NULL
);
GO

-- Tabela de Produtos
CREATE TABLE Produtos (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL,
    Preco DECIMAL(10,2) NOT NULL,
    Estoque INT DEFAULT 0,
    CategoriaId INT,
    FOREIGN KEY (CategoriaId) REFERENCES Categorias(Id)
);
GO

-- Tabela de Clientes
CREATE TABLE Clientes (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Telefone VARCHAR(20)
);
GO

-- Tabela de Pedidos
CREATE TABLE Pedidos (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ClienteId INT,
    DataPedido DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(20) DEFAULT 'Pendente',
    FOREIGN KEY (ClienteId) REFERENCES Clientes(Id)
);
GO

-- Tabela de Itens dos Pedidos
CREATE TABLE ItensPedido (
    Id INT PRIMARY KEY IDENTITY(1,1),
    PedidoId INT,
    ProdutoId INT,
    Quantidade INT NOT NULL,
    PrecoUnitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (PedidoId) REFERENCES Pedidos(Id),
    FOREIGN KEY (ProdutoId) REFERENCES Produtos(Id)
);
GO

-- Inserção de Categorias
INSERT INTO Categorias (Nome) VALUES
('Bolos'),
('Doces'),
('Bebidas');
GO

-- Inserção de Produtos
INSERT INTO Produtos (Nome, Preco, Estoque, CategoriaId) VALUES
('Bolo de Chocolate', 40.00, 10, 1),
('Brigadeiro', 2.50, 100, 2),
('Suco de Laranja', 6.00, 50, 3);
GO
