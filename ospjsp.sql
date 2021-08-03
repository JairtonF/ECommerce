-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 03-Ago-2021 às 16:49
-- Versão do servidor: 5.7.26
-- versão do PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ospjsp`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `email` varchar(100) DEFAULT NULL,
  `idProduto` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `endereco` varchar(250) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `numero` bigint(20) DEFAULT NULL,
  `dataPedido` varchar(100) DEFAULT NULL,
  `dataRecebimento` varchar(100) DEFAULT NULL,
  `metodoPagamento` varchar(100) DEFAULT NULL,
  `idTransacao` varchar(100) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cart`
--

INSERT INTO `cart` (`email`, `idProduto`, `quantidade`, `price`, `total`, `endereco`, `cidade`, `estado`, `pais`, `numero`, `dataPedido`, `dataRecebimento`, `metodoPagamento`, `idTransacao`, `status`) VALUES
('jairton.fcm@outlook.com', 3, 1, 300, 300, 'Rua dos Tolos', 'Fortaleza', 'Ceará', 'Fortaleza', 85930303030, '2021-08-02 17:34:06', '2021-08-09 17:34:06', 'Pagamento na entrega', 'TID - 1234567', 'bill'),
('jairton.fcm@outlook.com', 2, 3, 150, 450, 'Rua dos Tolos', 'Fortaleza', 'Ceará', 'Fortaleza', 85930303030, '2021-08-02 17:34:06', '2021-08-09 17:34:06', 'Pagamento na entrega', 'TID - 1234567', 'bill'),
('jairton.fcm@outlook.com', 4, 1, 1200, 1200, 'Rua dos Tolos', 'Fortaleza', 'Ceará', 'Fortaleza', 85930303030, '2021-08-02 17:34:06', '2021-08-09 17:34:06', 'Pagamento na entrega', 'TID - 1234567', 'bill'),
('jairton.fcm@outlook.com', 1, 1, 17000, 17000, 'Rua dos Tolos', 'Fortaleza', 'Ceará', 'Fortaleza', 85930303030, '2021-08-03 09:15:56', '2021-08-10 09:15:56', 'Pagamento online', 'TID - 1234567', 'bill'),
('jairton.fcm@outlook.com', 2, 3, 150, 450, 'Rua dos Tolos', 'Fortaleza', 'Ceará', 'Fortaleza', 85930303030, '2021-08-03 09:15:56', '2021-08-10 09:15:56', 'Pagamento online', 'TID - 1234567', 'bill'),
('jairton.fcm@outlook.com', 4, 1, 1200, 1200, 'Rua dos Tolos', 'Fortaleza', 'Ceará', 'Fortaleza', 85930303030, '2021-08-03 09:15:56', '2021-08-10 09:15:56', 'Pagamento online', 'TID - 1234567', 'bill'),
('joao@gamil.com', 1, 1, 17000, 17000, 'Rua dos Tolos', 'Fortaleza', 'Ceará', 'Brasil', 85922222222, '2021-08-03 11:01:57', '2021-08-10 11:01:57', 'Pagamento online', 'TID - 1234567', 'bill'),
('joao@gamil.com', 4, 3, 1200, 3600, 'Rua dos Tolos', 'Fortaleza', 'Ceará', 'Brasil', 85922222222, '2021-08-03 11:01:57', '2021-08-10 11:01:57', 'Pagamento online', 'TID - 1234567', 'bill'),
('jairton.fcm@outlook.com', 1, 1, 17000, 17000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `categoria` varchar(200) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `active` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `products`
--

INSERT INTO `products` (`id`, `nome`, `categoria`, `price`, `active`) VALUES
(1, 'Brincos de ouro com diamantes', 'Brincos', 17000, 'yes'),
(NULL, NULL, NULL, NULL, NULL),
(2, 'Colar de ouro', 'Colar', 250, 'yes'),
(3, 'Bracelete de prata e ouro', 'Pulseira', 350, 'yes'),
(4, 'Brincos de safiras e esmeraldas', 'Brincos', 1200, 'yes'),
(5, 'Colar de Pérolas', 'Colar', 1000, 'yes'),
(6, 'Anel de ouro', 'Anel', 250, 'yes'),
(7, 'Anel diamantes', 'Anel', 800, 'yes');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `nome` varchar(150) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `numero` bigint(20) DEFAULT NULL,
  `securityQuestion` varchar(200) DEFAULT NULL,
  `resposta` varchar(150) DEFAULT NULL,
  `senha` varchar(50) DEFAULT NULL,
  `endereco` varchar(250) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`nome`, `email`, `numero`, `securityQuestion`, `resposta`, `senha`, `endereco`, `cidade`, `estado`, `pais`) VALUES
('Jairton Felix Cavalcante de Melo', 'jairton.fcm@outlook.com', 85930303030, 'Qual o nome do seu primeiro bicho de estimacao?', 'Tobias', '1234567', 'Rua dos Tolos', 'Fortaleza', 'Ceará', 'Fortaleza'),
('Felix', 'jairton@yopmail.com', 85911111111, 'Qual o nome do seu primeiro bicho de estimacao?', 'Tobias', '09876543211', '', '', '', ''),
('João Lucas', 'joao@gamil.com', 85922222222, 'Qual a cidade que voce nasceu?', 'Fortaleza', '123456789', 'Rua dos Tolos', 'Fortaleza', 'Ceará', 'Brasil');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
