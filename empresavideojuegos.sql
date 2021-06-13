-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-06-2021 a las 18:28:49
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empresavideojuegos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL,
  `dniCliente` varchar(9) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `dniCliente`) VALUES
(1, '12345678H'),
(2, '87654321A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallesfacturas`
--

CREATE TABLE `detallesfacturas` (
  `idDetallesFacturas` int(11) NOT NULL,
  `idProductoFK` int(11) NOT NULL,
  `idFacturaFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `detallesfacturas`
--

INSERT INTO `detallesfacturas` (`idDetallesFacturas`, `idProductoFK`, `idFacturaFK`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distribuidores`
--

CREATE TABLE `distribuidores` (
  `idDistribuidor` int(11) NOT NULL,
  `nombreDistribuidor` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `ubicacionDistribuidor` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `distribuidores`
--

INSERT INTO `distribuidores` (`idDistribuidor`, `nombreDistribuidor`, `ubicacionDistribuidor`) VALUES
(1, 'EA', 'California, EEUU'),
(2, 'Ubisoft', 'Montreal, Canadá');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idEmpleado` int(11) NOT NULL,
  `nombreEmpleado` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apellidosEmpleado` varchar(60) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `domicilioEmpleado` varchar(80) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `dniEmpleado` varchar(9) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `telefonoEmpleado` int(11) NOT NULL,
  `idEmpleadoFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`idEmpleado`, `nombreEmpleado`, `apellidosEmpleado`, `domicilioEmpleado`, `dniEmpleado`, `telefonoEmpleado`, `idEmpleadoFK`) VALUES
(1, 'Pedro', 'Gómez Goni', 'Calle CallePrueba1 Nº1', '12345678H', 666666666, 1),
(2, 'Álvaro ', 'Ramírez Barcia', 'Calle CallePrueba2 Nº20 4ºC', '87654321A', 111111111, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `idFactura` int(11) NOT NULL,
  `totalFactura` decimal(6,2) NOT NULL,
  `totalIvaFactura` decimal(6,2) NOT NULL,
  `idClienteFK` int(11) NOT NULL,
  `idEmpleadoFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`idFactura`, `totalFactura`, `totalIvaFactura`, `idClienteFK`, `idEmpleadoFK`) VALUES
(1, '1234.00', '1500.00', 1, 1),
(2, '6543.56', '9876.00', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `nombreProducto` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `stockProducto` int(11) NOT NULL,
  `precioProducto` decimal(6,2) NOT NULL,
  `ivaProducto` decimal(4,2) NOT NULL,
  `idDistribuidorFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `nombreProducto`, `stockProducto`, `precioProducto`, `ivaProducto`, `idDistribuidorFK`) VALUES
(1, 'Silla Gamer', 1000, '299.99', '21.00', 1),
(2, 'Assassins Creed: Valhalla', 99999, '59.99', '21.00', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repartidores`
--

CREATE TABLE `repartidores` (
  `idRepartidor` int(11) NOT NULL,
  `vehiculoRepartidor` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `salarioRepartidor` decimal(6,2) NOT NULL,
  `idEmpleadoFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `repartidores`
--

INSERT INTO `repartidores` (`idRepartidor`, `vehiculoRepartidor`, `salarioRepartidor`, `idEmpleadoFK`) VALUES
(1, 'Camión Nº50', '1400.00', 1),
(2, 'Camión Nº79', '1500.00', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedores`
--

CREATE TABLE `vendedores` (
  `idVendedor` int(11) NOT NULL,
  `salarioVendedor` decimal(6,2) NOT NULL,
  `idEmpleadoFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `vendedores`
--

INSERT INTO `vendedores` (`idVendedor`, `salarioVendedor`, `idEmpleadoFK`) VALUES
(1, '1200.00', 1),
(2, '1250.00', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `detallesfacturas`
--
ALTER TABLE `detallesfacturas`
  ADD PRIMARY KEY (`idDetallesFacturas`),
  ADD KEY `idProductoDetallesFK` (`idProductoFK`),
  ADD KEY `idFacturaDetallesFK` (`idFacturaFK`);

--
-- Indices de la tabla `distribuidores`
--
ALTER TABLE `distribuidores`
  ADD PRIMARY KEY (`idDistribuidor`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `idEmpleado` (`idEmpleadoFK`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `idClienteFacturaFK` (`idClienteFK`),
  ADD KEY `idEmpleadoFacturaFK` (`idEmpleadoFK`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idDistribuidorProductoFK` (`idDistribuidorFK`);

--
-- Indices de la tabla `repartidores`
--
ALTER TABLE `repartidores`
  ADD PRIMARY KEY (`idRepartidor`),
  ADD KEY `idEmpleadoRepartidorFK` (`idEmpleadoFK`);

--
-- Indices de la tabla `vendedores`
--
ALTER TABLE `vendedores`
  ADD PRIMARY KEY (`idVendedor`),
  ADD KEY `idEmpleadoVendedorFK` (`idEmpleadoFK`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detallesfacturas`
--
ALTER TABLE `detallesfacturas`
  MODIFY `idDetallesFacturas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `distribuidores`
--
ALTER TABLE `distribuidores`
  MODIFY `idDistribuidor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `repartidores`
--
ALTER TABLE `repartidores`
  MODIFY `idRepartidor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `vendedores`
--
ALTER TABLE `vendedores`
  MODIFY `idVendedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallesfacturas`
--
ALTER TABLE `detallesfacturas`
  ADD CONSTRAINT `idFacturaDetallesFK` FOREIGN KEY (`idFacturaFK`) REFERENCES `facturas` (`idFactura`),
  ADD CONSTRAINT `idProductoDetallesFK` FOREIGN KEY (`idProductoFK`) REFERENCES `productos` (`idProducto`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `idEmpleado` FOREIGN KEY (`idEmpleadoFK`) REFERENCES `empleados` (`idEmpleado`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `idClienteFacturaFK` FOREIGN KEY (`idClienteFK`) REFERENCES `clientes` (`idCliente`),
  ADD CONSTRAINT `idEmpleadoFacturaFK` FOREIGN KEY (`idEmpleadoFK`) REFERENCES `empleados` (`idEmpleado`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `idDistribuidorProductoFK` FOREIGN KEY (`idDistribuidorFK`) REFERENCES `distribuidores` (`idDistribuidor`);

--
-- Filtros para la tabla `repartidores`
--
ALTER TABLE `repartidores`
  ADD CONSTRAINT `idEmpleadoRepartidorFK` FOREIGN KEY (`idEmpleadoFK`) REFERENCES `empleados` (`idEmpleado`);

--
-- Filtros para la tabla `vendedores`
--
ALTER TABLE `vendedores`
  ADD CONSTRAINT `idEmpleadoVendedorFK` FOREIGN KEY (`idEmpleadoFK`) REFERENCES `empleados` (`idEmpleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
