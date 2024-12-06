CREATE DATABASE Petshop_juju;


CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Telefone VARCHAR(15),
    Email VARCHAR(100),
    Endereco TEXT
);

CREATE TABLE Animais (
    AnimalID INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Especie VARCHAR(30) NOT NULL,
    Raca VARCHAR(50),
    Idade INT,
    ClienteID INT NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE Servicos (
    ServicoID INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Descricao TEXT,
    Preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Atendimentos (
    AtendimentoID INT PRIMARY KEY,
    AnimalID INT NOT NULL,
    ServicoID INT NOT NULL,
    DataAtendimento DATE DEFAULT CURRENT_DATE,
    Observacoes TEXT,
    FOREIGN KEY (AnimalID) REFERENCES Animais(AnimalID),
    FOREIGN KEY (ServicoID) REFERENCES Servicos(ServicoID)
);

CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Descricao TEXT,
    Preco DECIMAL(10, 2) NOT NULL,
    Estoque INT NOT NULL
);

INSERT INTO Clientes (ClienteID, Nome, Telefone, Email, Endereco) VALUES
(1, 'João da Silva', '11987654321', 'joao.silva@email.com', 'Rua A, 123'),
(2, 'Maria Oliveira', '21998765432', 'maria.oliveira@email.com', 'Rua B, 456'),
(3, 'Carlos Souza', '31976543210', 'carlos.souza@email.com', 'Rua C, 789');

INSERT INTO Animais (AnimalID, Nome, Especie, Raca, Idade, ClienteID) VALUES
(1, 'Rex', 'Cachorro', 'Labrador', 5, 1),
(2, 'Mimi', 'Gato', 'Persa', 3, 2),
(3, 'Bobby', 'Cachorro', 'Poodle', 2, 3);

INSERT INTO Servicos (ServicoID, Nome, Descricao, Preco) VALUES
(1, 'Banho', 'Banho completo com produtos especializados.', 50.00),
(2, 'Tosa', 'Tosa higiênica ou completa.', 70.00),
(3, 'Vacinação', 'Aplicação de vacinas essenciais.', 100.00);

INSERT INTO Atendimentos (AtendimentoID, AnimalID, ServicoID, DataAtendimento, Observacoes) VALUES
(1, 1, 1, '2024-12-01', 'Animal comportado durante o banho.'),
(2, 2, 2, '2024-12-02', 'Tosa completa realizada.'),
(3, 3, 3, '2024-12-03', 'Vacinação contra raiva.');

INSERT INTO Produtos (ProdutoID, Nome, Descricao, Preco, Estoque) VALUES
(1, 'Ração Premium', 'Ração para cães adultos, pacote de 15kg.', 120.00, 50),
(2, 'Brinquedo para gatos', 'Bolinha com guizo.', 20.00, 100),
(3, 'Coleira', 'Coleira ajustável para cães.', 30.00, 25);