-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 21-10-2020 a las 17:16:28
-- Versión del servidor: 10.4.15-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u754444868_visualmovile`
--
CREATE DATABASE IF NOT EXISTS `u754444868_visualmovile` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
USE `u754444868_visualmovile`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Categorias`
--

CREATE TABLE `Categorias` (
  `IdCategoria` int(11) NOT NULL,
  `Categoria` varchar(15) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Clientes`
--

CREATE TABLE `Clientes` (
  `IdCliente` int(11) NOT NULL,
  `NumIdentificación` varchar(20) COLLATE utf8_spanish_ci NOT NULL COMMENT 'DNI,NiE o el de su pais',
  `NombreApellidos` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ComprasFacturas`
--

CREATE TABLE `ComprasFacturas` (
  `IdFactura` int(11) NOT NULL,
  `Fechafactura` date NOT NULL,
  `IdProveedor` int(11) NOT NULL,
  `IdPersonalResponsable` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Compras a la tienda';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ComprasProductos`
--

CREATE TABLE `ComprasProductos` (
  `IdCompra` int(11) NOT NULL,
  `IdProducto` int(11) NOT NULL,
  `IdFactura` int(11) NOT NULL,
  `PrecioxUd` float NOT NULL,
  `Unidades` int(9) NOT NULL,
  `Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DireccionesClientes`
--

CREATE TABLE `DireccionesClientes` (
  `IdDireccion` int(11) NOT NULL,
  `Direccion` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `Localidad` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Provincia` varchar(25) COLLATE utf8mb4_spanish_ci NOT NULL,
  `EstadoNacion` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `CodigoPostal` int(5) NOT NULL,
  `Observaciones` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Escandallos`
--

CREATE TABLE `Escandallos` (
  `IdEscandallo` int(11) NOT NULL,
  `IdProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EscandallosComponentes`
--

CREATE TABLE `EscandallosComponentes` (
  `IdComponente` int(11) NOT NULL,
  `IdProducto` int(11) NOT NULL,
  `IdEscandallo` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Marcas`
--

CREATE TABLE `Marcas` (
  `IdMarca` int(11) NOT NULL,
  `Marca` varchar(15) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Personal`
--

CREATE TABLE `Personal` (
  `IdPersonal` int(11) NOT NULL,
  `NumeroIdenficacion` varchar(10) COLLATE utf8_spanish_ci NOT NULL COMMENT 'DNI o NiE',
  `NombreApellidos` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Empleo` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Produccion`
--

CREATE TABLE `Produccion` (
  `IdProduccion` int(11) NOT NULL,
  `IdEscandallo` int(11) NOT NULL,
  `IdPersonal` int(11) NOT NULL,
  `TiempoTotal` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Productos`
--

CREATE TABLE `Productos` (
  `IdProducto` int(11) NOT NULL,
  `Nombre` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Precio` float NOT NULL,
  `UnidadStock` int(11) NOT NULL,
  `Descripcion` varchar(125) COLLATE utf8_spanish_ci NOT NULL,
  `IdMarca` int(11) NOT NULL,
  `IdCategoria` int(11) NOT NULL,
  `Descuento` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Proveedores`
--

CREATE TABLE `Proveedores` (
  `IdProveedor` int(11) NOT NULL,
  `NumeroIdentificacion` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `NombreEmpresa` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Direccion` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `Localidad` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Provincia` varchar(28) COLLATE utf8_spanish_ci NOT NULL,
  `Pais` varchar(28) COLLATE utf8_spanish_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TelefonosClientes`
--

CREATE TABLE `TelefonosClientes` (
  `IdTelefono` int(11) NOT NULL,
  `Tipo` int(11) NOT NULL,
  `NumeroTelefono` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TelefonosPersonal`
--

CREATE TABLE `TelefonosPersonal` (
  `IdTelefono` int(11) NOT NULL,
  `Telefono` int(11) NOT NULL,
  `TipotTefono` int(11) NOT NULL,
  `IdPersonal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TelefonosProveedores`
--

CREATE TABLE `TelefonosProveedores` (
  `IdTelefono` int(11) NOT NULL,
  `NumeroTelefono` int(11) NOT NULL,
  `Tipo` varchar(15) COLLATE utf8mb4_spanish_ci NOT NULL,
  `IdProveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `VentaFacturas`
--

CREATE TABLE `VentaFacturas` (
  `IdFactura` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `IdPersonalResponsable` int(11) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `VentaProductos`
--

CREATE TABLE `VentaProductos` (
  `IdVentas` int(11) NOT NULL,
  `IdFactura` int(11) NOT NULL,
  `IdProducto` int(11) NOT NULL,
  `Cantidad` int(8) NOT NULL,
  `PrecioxUnidad` int(11) NOT NULL,
  `Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Categorias`
--
ALTER TABLE `Categorias`
  ADD PRIMARY KEY (`IdCategoria`);

--
-- Indices de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`IdCliente`),
  ADD UNIQUE KEY `DNI_NIF` (`NumIdentificación`);

--
-- Indices de la tabla `ComprasFacturas`
--
ALTER TABLE `ComprasFacturas`
  ADD PRIMARY KEY (`IdFactura`),
  ADD KEY `IdPersonalResponsable` (`IdPersonalResponsable`),
  ADD KEY `IdProveedor` (`IdProveedor`);

--
-- Indices de la tabla `ComprasProductos`
--
ALTER TABLE `ComprasProductos`
  ADD PRIMARY KEY (`IdCompra`),
  ADD KEY `IdFactura` (`IdFactura`),
  ADD KEY `IdProducto` (`IdProducto`);

--
-- Indices de la tabla `DireccionesClientes`
--
ALTER TABLE `DireccionesClientes`
  ADD KEY `fk_idclientes` (`IdCliente`);

--
-- Indices de la tabla `Escandallos`
--
ALTER TABLE `Escandallos`
  ADD PRIMARY KEY (`IdEscandallo`),
  ADD KEY `IdProducto` (`IdProducto`);

--
-- Indices de la tabla `EscandallosComponentes`
--
ALTER TABLE `EscandallosComponentes`
  ADD PRIMARY KEY (`IdComponente`),
  ADD KEY `IdProducto` (`IdProducto`),
  ADD KEY `IdEscandallo` (`IdEscandallo`);

--
-- Indices de la tabla `Marcas`
--
ALTER TABLE `Marcas`
  ADD PRIMARY KEY (`IdMarca`);

--
-- Indices de la tabla `Personal`
--
ALTER TABLE `Personal`
  ADD PRIMARY KEY (`IdPersonal`),
  ADD UNIQUE KEY `DNI_NIF` (`NumeroIdenficacion`);

--
-- Indices de la tabla `Produccion`
--
ALTER TABLE `Produccion`
  ADD PRIMARY KEY (`IdProduccion`),
  ADD KEY `IdEscandallo` (`IdEscandallo`),
  ADD KEY `IdPersonal` (`IdPersonal`);

--
-- Indices de la tabla `Productos`
--
ALTER TABLE `Productos`
  ADD PRIMARY KEY (`IdProducto`),
  ADD KEY `IdMarca` (`IdMarca`),
  ADD KEY `IdCategoria` (`IdCategoria`);

--
-- Indices de la tabla `Proveedores`
--
ALTER TABLE `Proveedores`
  ADD PRIMARY KEY (`IdProveedor`);

--
-- Indices de la tabla `TelefonosClientes`
--
ALTER TABLE `TelefonosClientes`
  ADD PRIMARY KEY (`IdTelefono`),
  ADD KEY `IdCliente` (`IdCliente`);

--
-- Indices de la tabla `TelefonosPersonal`
--
ALTER TABLE `TelefonosPersonal`
  ADD PRIMARY KEY (`IdTelefono`),
  ADD KEY `IdPersonal` (`IdPersonal`);

--
-- Indices de la tabla `TelefonosProveedores`
--
ALTER TABLE `TelefonosProveedores`
  ADD PRIMARY KEY (`IdTelefono`),
  ADD KEY `IdProveedor` (`IdProveedor`);

--
-- Indices de la tabla `VentaFacturas`
--
ALTER TABLE `VentaFacturas`
  ADD PRIMARY KEY (`IdFactura`),
  ADD KEY `IdPersonalResponsable` (`IdPersonalResponsable`),
  ADD KEY `IdCliente` (`IdCliente`);

--
-- Indices de la tabla `VentaProductos`
--
ALTER TABLE `VentaProductos`
  ADD PRIMARY KEY (`IdVentas`),
  ADD KEY `IdProducto` (`IdProducto`),
  ADD KEY `IdFactura` (`IdFactura`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Categorias`
--
ALTER TABLE `Categorias`
  MODIFY `IdCategoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  MODIFY `IdCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ComprasFacturas`
--
ALTER TABLE `ComprasFacturas`
  MODIFY `IdFactura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ComprasProductos`
--
ALTER TABLE `ComprasProductos`
  MODIFY `IdCompra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `EscandallosComponentes`
--
ALTER TABLE `EscandallosComponentes`
  MODIFY `IdComponente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Marcas`
--
ALTER TABLE `Marcas`
  MODIFY `IdMarca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Personal`
--
ALTER TABLE `Personal`
  MODIFY `IdPersonal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Produccion`
--
ALTER TABLE `Produccion`
  MODIFY `IdProduccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Productos`
--
ALTER TABLE `Productos`
  MODIFY `IdProducto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Proveedores`
--
ALTER TABLE `Proveedores`
  MODIFY `IdProveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `TelefonosPersonal`
--
ALTER TABLE `TelefonosPersonal`
  MODIFY `IdTelefono` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ComprasFacturas`
--
ALTER TABLE `ComprasFacturas`
  ADD CONSTRAINT `ComprasFacturas_ibfk_1` FOREIGN KEY (`IdPersonalResponsable`) REFERENCES `Personal` (`IdPersonal`),
  ADD CONSTRAINT `ComprasFacturas_ibfk_2` FOREIGN KEY (`IdProveedor`) REFERENCES `Proveedores` (`IdProveedor`);

--
-- Filtros para la tabla `ComprasProductos`
--
ALTER TABLE `ComprasProductos`
  ADD CONSTRAINT `ComprasProductos_ibfk_2` FOREIGN KEY (`IdFactura`) REFERENCES `ComprasFacturas` (`IdFactura`),
  ADD CONSTRAINT `ComprasProductos_ibfk_3` FOREIGN KEY (`IdProducto`) REFERENCES `Productos` (`IdProducto`);

--
-- Filtros para la tabla `DireccionesClientes`
--
ALTER TABLE `DireccionesClientes`
  ADD CONSTRAINT `fk_idclientes` FOREIGN KEY (`IdCliente`) REFERENCES `Clientes` (`IdCliente`);

--
-- Filtros para la tabla `Escandallos`
--
ALTER TABLE `Escandallos`
  ADD CONSTRAINT `Escandallos_ibfk_1` FOREIGN KEY (`IdProducto`) REFERENCES `Productos` (`IdProducto`);

--
-- Filtros para la tabla `EscandallosComponentes`
--
ALTER TABLE `EscandallosComponentes`
  ADD CONSTRAINT `EscandallosComponentes_ibfk_1` FOREIGN KEY (`IdProducto`) REFERENCES `Productos` (`IdProducto`),
  ADD CONSTRAINT `EscandallosComponentes_ibfk_2` FOREIGN KEY (`IdEscandallo`) REFERENCES `Escandallos` (`IdEscandallo`);

--
-- Filtros para la tabla `Personal`
--
ALTER TABLE `Personal`
  ADD CONSTRAINT `Personal_ibfk_1` FOREIGN KEY (`IdPersonal`) REFERENCES `TelefonosPersonal` (`IdPersonal`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Produccion`
--
ALTER TABLE `Produccion`
  ADD CONSTRAINT `Produccion_ibfk_1` FOREIGN KEY (`IdEscandallo`) REFERENCES `Escandallos` (`IdEscandallo`),
  ADD CONSTRAINT `Produccion_ibfk_2` FOREIGN KEY (`IdPersonal`) REFERENCES `Personal` (`IdPersonal`);

--
-- Filtros para la tabla `Productos`
--
ALTER TABLE `Productos`
  ADD CONSTRAINT `Productos_ibfk_1` FOREIGN KEY (`IdMarca`) REFERENCES `Marcas` (`IdMarca`),
  ADD CONSTRAINT `Productos_ibfk_2` FOREIGN KEY (`IdCategoria`) REFERENCES `Categorias` (`IdCategoria`);

--
-- Filtros para la tabla `TelefonosClientes`
--
ALTER TABLE `TelefonosClientes`
  ADD CONSTRAINT `TelefonosClientes_ibfk_1` FOREIGN KEY (`IdCliente`) REFERENCES `Clientes` (`IdCliente`);

--
-- Filtros para la tabla `TelefonosPersonal`
--
ALTER TABLE `TelefonosPersonal`
  ADD CONSTRAINT `TelefonosPersonal_ibfk_1` FOREIGN KEY (`IdPersonal`) REFERENCES `Personal` (`IdPersonal`);

--
-- Filtros para la tabla `TelefonosProveedores`
--
ALTER TABLE `TelefonosProveedores`
  ADD CONSTRAINT `TelefonosProveedores_ibfk_1` FOREIGN KEY (`IdProveedor`) REFERENCES `Proveedores` (`IdProveedor`);

--
-- Filtros para la tabla `VentaFacturas`
--
ALTER TABLE `VentaFacturas`
  ADD CONSTRAINT `VentaFacturas_ibfk_1` FOREIGN KEY (`IdPersonalResponsable`) REFERENCES `Personal` (`IdPersonal`),
  ADD CONSTRAINT `VentaFacturas_ibfk_2` FOREIGN KEY (`IdCliente`) REFERENCES `Clientes` (`IdCliente`);

--
-- Filtros para la tabla `VentaProductos`
--
ALTER TABLE `VentaProductos`
  ADD CONSTRAINT `VentaProductos_ibfk_1` FOREIGN KEY (`IdProducto`) REFERENCES `Productos` (`IdProducto`),
  ADD CONSTRAINT `VentaProductos_ibfk_2` FOREIGN KEY (`IdFactura`) REFERENCES `VentaFacturas` (`IdFactura`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
