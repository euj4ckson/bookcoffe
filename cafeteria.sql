-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30/05/2024 às 23:54
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cafeteria`
--
CREATE DATABASE IF NOT EXISTS `cafeteria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cafeteria`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `cod_categoria` int(1) NOT NULL,
  `descricao_categoria` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='		';

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`cod_categoria`, `descricao_categoria`) VALUES
(1, 'CAFÉ'),
(2, 'BEBIBA'),
(3, 'BOLO'),
(4, 'SALGADO');

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `cod_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(100) NOT NULL,
  `cpf_cliente` varchar(15) DEFAULT NULL,
  `celular_cliente` varchar(45) DEFAULT NULL,
  `email_cliente` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`cod_cliente`, `nome_cliente`, `cpf_cliente`, `celular_cliente`, `email_cliente`) VALUES
(1, 'Alexandre da Silva Moreira', '451.315.100-58', '(32) 99993-6018', 'alemoreira@gmail.com'),
(2, 'Bruno Souza de Moraes', '924.382.340-08', '(32) 99613-7287', 'brunosmoraes@hotmail.com'),
(3, 'Gabriel Soares Pereira', '394.793.960-41', '(32) 97100-7797', 'gabrielsp@hotmail.com'),
(4, 'João Pedro da Silva Oliveira', '161.131.250-76', '(32) 96784-6635', 'jpsilvaoliv@yahoo.com.br'),
(5, 'Kaike Alves dos Santos', '097.368.020-27', '(32) 99828-0645', 'kaikealvess@yahoo.com.br'),
(6, 'Priscila de Oliveira Machado', '184.587.342-80', '(32) 98419-5752', 'prisco@gmail.com'),
(7, 'Rosana Silveira Apolinário', '145.639.562-65', '(32) 98526-3761', 'vaninha@yahoo.com.br'),
(8, 'Kauã Delgado Moreira', '165.858.834-93', '(32) 98653-5870', 'kakazinho@hotmail.com'),
(9, 'Diego Costa Barbosa\r\n', '149.581.962-60', '(32) 98725-3627', 'didico@yahoo.com.br\r\n'),
(10, 'Bernardo Sales Vianna', '140.834.534-85', ' (32) 98560-6342', 'bebe@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `cod_funcionario` int(11) NOT NULL,
  `nome_funcionario` varchar(100) NOT NULL,
  `login` varchar(45) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `funcionarios`
--

INSERT INTO `funcionarios` (`cod_funcionario`, `nome_funcionario`, `login`, `password`) VALUES
(1, 'Jackson', 'JACK', '123456'),
(15, 'Mateus', 'Matwons', '123');

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens_pedidos`
--

CREATE TABLE `itens_pedidos` (
  `id_item` int(11) NOT NULL,
  `qtde` int(11) NOT NULL,
  `produto` varchar(45) DEFAULT NULL,
  `v_unit` decimal(5,2) NOT NULL,
  `sub_total` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mesas`
--

CREATE TABLE `mesas` (
  `cod_mesa` int(11) NOT NULL,
  `descricao_mesa` varchar(20) NOT NULL,
  `localizacao_mesa` varchar(20) DEFAULT NULL,
  `capacidade_mesa` int(11) DEFAULT NULL,
  `status_mesa` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `mesas`
--

INSERT INTO `mesas` (`cod_mesa`, `descricao_mesa`, `localizacao_mesa`, `capacidade_mesa`, `status_mesa`) VALUES
(1, 'ENTRADA', 'EXTERNA', 4, 'OCUPADA'),
(2, 'CENTRO', 'EXTERNA', 4, 'DESOCUPADA'),
(3, 'ENTRADA', 'INTERNA', 6, 'DESOCUPADA'),
(4, 'CENTRO', 'INTERNA', 4, 'OCUPADA'),
(5, 'CENTRO', 'INTERNA', 4, 'OCUPADA'),
(6, 'FUNDOS', 'INTERNA', 6, 'DESOCUPADA'),
(7, '', '', 0, '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `notas_fiscais`
--

CREATE TABLE `notas_fiscais` (
  `id_nota_fiscal` int(11) NOT NULL,
  `n_nota_fiscal` varchar(45) NOT NULL,
  `nome_cliente` varchar(45) NOT NULL,
  `cpf_cliente` varchar(15) NOT NULL,
  `valor_nota_fiscal` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `cod_pedido` int(11) NOT NULL,
  `mesa_pedido` varchar(10) NOT NULL,
  `cliente_pedido` varchar(45) NOT NULL,
  `hora_pedido` time NOT NULL,
  `atendente_pedido` varchar(45) NOT NULL,
  `valor_total_pedido` decimal(5,2) NOT NULL,
  `data_pedido` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `pedidos`
--

INSERT INTO `pedidos` (`cod_pedido`, `mesa_pedido`, `cliente_pedido`, `hora_pedido`, `atendente_pedido`, `valor_total_pedido`, `data_pedido`) VALUES
(1, '', '', '00:00:00', '', 55.40, '0000-00-00'),
(2, '', '', '00:00:00', '', 213.00, '0000-00-00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `cod_produto` int(11) NOT NULL,
  `v_unit_produto` decimal(5,2) NOT NULL,
  `descricao_produto` varchar(200) NOT NULL,
  `nome_produto` varchar(50) NOT NULL,
  `categoria_produto` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`cod_produto`, `v_unit_produto`, `descricao_produto`, `nome_produto`, `categoria_produto`) VALUES
(1, 8.50, 'Mistura de café com um leite bem \ncremoso e vaporizado, mais espuma, conforme a \nreceita original italiana. Pode conter canela\n', 'Cappuccino', '1'),
(2, 4.50, 'Café rápido', 'Expresso', '1'),
(3, 11.00, 'Café expresso com leite \nvaporizado com uma quantidade generosa de espuma \nde leite no topo', 'Latte Macchiato', '1'),
(4, 11.00, 'Mistura para Preparo de Bebida \nà base de Leite, Cacau e Café', 'Mocha', '1'),
(5, 8.50, 'bebida preparada através da infusão \nde folhas, flores, raízes de planta. Servido gelado', 'Chá Gelado', '2'),
(6, 8.50, 'Uma bebida quente e doce feita \ncom cacau em pó dissolvido no leite quente', 'Chocolate Quente', '2'),
(7, 10.50, 'Suco natural é aquele feito na hora,\n espremendo a fruta ou utilizando a polpa', 'Suco Natural', '2'),
(8, 7.00, '', 'Bolo de banana', '3'),
(9, 7.50, '', 'Bolo de chocolate', '3'),
(10, 7.00, '', 'Bolo de laranja', '3'),
(11, 7.50, '', 'Bolo de indiano', '3'),
(12, 8.00, '', 'Coxinha', '4'),
(13, 8.00, '', 'Cigarrete', '4'),
(14, 8.00, '', 'Empada', '4'),
(15, 7.00, '', 'Enroladinho', '4'),
(16, 7.00, '', 'Quibe', '4');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`cod_categoria`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cod_cliente`);

--
-- Índices de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`cod_funcionario`);

--
-- Índices de tabela `itens_pedidos`
--
ALTER TABLE `itens_pedidos`
  ADD PRIMARY KEY (`id_item`);

--
-- Índices de tabela `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`cod_mesa`);

--
-- Índices de tabela `notas_fiscais`
--
ALTER TABLE `notas_fiscais`
  ADD PRIMARY KEY (`id_nota_fiscal`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`cod_pedido`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`cod_produto`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `cod_categoria` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cod_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `cod_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `itens_pedidos`
--
ALTER TABLE `itens_pedidos`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mesas`
--
ALTER TABLE `mesas`
  MODIFY `cod_mesa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `notas_fiscais`
--
ALTER TABLE `notas_fiscais`
  MODIFY `id_nota_fiscal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `cod_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `cod_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
