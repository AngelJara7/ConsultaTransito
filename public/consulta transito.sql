-- -------------------------------------------------------------
-- TablePlus 5.0.0(454)
--
-- https://tableplus.com/
--
-- Database: consulta transito
-- Generation Time: 2022-10-10 00:44:33.7890
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `Boleta`;
CREATE TABLE `Boleta` (
  `Numero_Boleta` int NOT NULL AUTO_INCREMENT,
  `Numero_Control` bigint NOT NULL,
  `Codigo_Boleta` int NOT NULL,
  `Fecha_Emision` date NOT NULL,
  `Comentario` tinytext CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Estado_Boleta` set('Pagado','Pendiente por Pagar') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Monto_Desacato` float(5,2) DEFAULT '0.00',
  PRIMARY KEY (`Numero_Boleta`),
  KEY `Numero_Control` (`Numero_Control`),
  KEY `Codigo_Boleta` (`Codigo_Boleta`),
  CONSTRAINT `Boleta_ibfk_1` FOREIGN KEY (`Numero_Control`) REFERENCES `Licencia` (`Numero_Control`),
  CONSTRAINT `Boleta_ibfk_2` FOREIGN KEY (`Codigo_Boleta`) REFERENCES `Tipo_Boleta` (`Codigo_Boleta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `Datos_Usuario`;
CREATE TABLE `Datos_Usuario` (
  `ID_Usuario` int NOT NULL AUTO_INCREMENT,
  `Tipo_Identificacion` set('Cedula de Identidad Personal','Registro Único de Contibuyente','Pasaporte','Código de Entidad Pública') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Numero_Identificacion` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Apellido` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `sexo` set('Masculino','Femenino','Otro') CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Celular` varchar(9) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Telefono_Residencial` varchar(8) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Correo_Electronico` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`ID_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `Licencia`;
CREATE TABLE `Licencia` (
  `Numero_Control` bigint NOT NULL AUTO_INCREMENT,
  `ID_Usuario` int NOT NULL,
  `Tipo_Licencia` char(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Fecha_Emision` date NOT NULL,
  `Fecha_Vencimiento` date NOT NULL,
  `Estado_Licencia` set('Vigente','Vencida','Suspención Temporal','Suspención Definitiva') CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `Inicio_Suspencion` date DEFAULT '0000-00-00',
  `Vencimiento_Suspension` date DEFAULT '0000-00-00',
  PRIMARY KEY (`Numero_Control`),
  UNIQUE KEY `ID_LicenciaUsuario` (`ID_Usuario`),
  KEY `Tipo_Licencia` (`Tipo_Licencia`),
  KEY `ID_Usuario` (`ID_Usuario`),
  CONSTRAINT `Licencia_ibfk_1` FOREIGN KEY (`Tipo_Licencia`) REFERENCES `Tipo_Licencia` (`Tipo_Licencia`),
  CONSTRAINT `Licencia_ibfk_2` FOREIGN KEY (`ID_Usuario`) REFERENCES `Datos_Usuario` (`ID_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `Municipio`;
CREATE TABLE `Municipio` (
  `Codigo_Municipio` char(8) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Codigo_Provincia` char(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Municipio` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`Codigo_Municipio`),
  KEY `Codigo_Provincia` (`Codigo_Provincia`),
  CONSTRAINT `Municipio_ibfk_1` FOREIGN KEY (`Codigo_Provincia`) REFERENCES `Provincia` (`Codigo_Provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `Placa`;
CREATE TABLE `Placa` (
  `ID_Placa` int NOT NULL AUTO_INCREMENT,
  `ID_Vehiculo` int NOT NULL,
  `Numero_Placa` varchar(7) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Fecha_Vencimiento` year NOT NULL,
  PRIMARY KEY (`ID_Placa`),
  UNIQUE KEY `ID_VehiculoPlaca` (`ID_Vehiculo`),
  KEY `ID_Vehiculo` (`ID_Vehiculo`),
  CONSTRAINT `Placa_ibfk_1` FOREIGN KEY (`ID_Vehiculo`) REFERENCES `Vehiculo` (`ID_Vehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `Provincia`;
CREATE TABLE `Provincia` (
  `Codigo_Provincia` char(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Provincia` tinytext CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`Codigo_Provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `Seguro`;
CREATE TABLE `Seguro` (
  `ID_Seguro` int NOT NULL AUTO_INCREMENT,
  `ID_Vehiculo` int NOT NULL,
  `Tipo_Seguro` set('Cobertura Completa','Daños a Terceros') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Aseguradora` tinytext CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Fecha_Emision` date NOT NULL,
  `Fecha_Vencimiento` date NOT NULL,
  PRIMARY KEY (`ID_Seguro`),
  UNIQUE KEY `ID_VehiculoSeguro` (`ID_Vehiculo`),
  KEY `ID_Vehiculo` (`ID_Vehiculo`),
  KEY `ID_Vehiculo_2` (`ID_Vehiculo`),
  CONSTRAINT `Seguro_ibfk_1` FOREIGN KEY (`ID_Vehiculo`) REFERENCES `Vehiculo` (`ID_Vehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `Tipo_Boleta`;
CREATE TABLE `Tipo_Boleta` (
  `Codigo_Boleta` int NOT NULL,
  `Descripcion` tinytext CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Monto_Boleta` float(5,2) DEFAULT '0.00',
  `Puntos` int DEFAULT '0',
  PRIMARY KEY (`Codigo_Boleta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `Tipo_Licencia`;
CREATE TABLE `Tipo_Licencia` (
  `Tipo_Licencia` char(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Descripcion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`Tipo_Licencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `Vehiculo`;
CREATE TABLE `Vehiculo` (
  `ID_Vehiculo` int NOT NULL AUTO_INCREMENT,
  `ID_Usuario` int NOT NULL,
  `Marca` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Modelo` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Tipo_vehiculo` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Numero_Pasajeros` int NOT NULL,
  `Agno` int NOT NULL,
  `Codigo_Provincia` char(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Codigo_Municipio` char(8) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`ID_Vehiculo`),
  KEY `ID_Usuario` (`ID_Usuario`),
  KEY `Codigo_Provincia` (`Codigo_Provincia`),
  KEY `Codigo_Municipio` (`Codigo_Municipio`),
  CONSTRAINT `Vehiculo_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `Datos_Usuario` (`ID_Usuario`),
  CONSTRAINT `Vehiculo_ibfk_2` FOREIGN KEY (`Codigo_Provincia`) REFERENCES `Provincia` (`Codigo_Provincia`),
  CONSTRAINT `Vehiculo_ibfk_3` FOREIGN KEY (`Codigo_Municipio`) REFERENCES `Municipio` (`Codigo_Municipio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

INSERT INTO `Boleta` (`Numero_Boleta`, `Numero_Control`, `Codigo_Boleta`, `Fecha_Emision`, `Comentario`, `Estado_Boleta`, `Monto_Desacato`) VALUES
(1, 0, 9, '2022-09-10', 'Todos los demas documentos en orden', 'Pagado', 0.00);

INSERT INTO `Datos_Usuario` (`ID_Usuario`, `Tipo_Identificacion`, `Numero_Identificacion`, `Nombre`, `Apellido`, `sexo`, `Fecha_Nacimiento`, `Celular`, `Telefono_Residencial`, `Correo_Electronico`) VALUES
(1, 'Cedula de Identidad Personal', '1-111-1111', 'Angel', 'Jaramillo', 'Masculino', '1996-10-07', '1234-5678', '765-4321', 'anlguien@gmail.com'),
(2, 'Pasaporte', '12345678', 'Luis', 'Camargo', 'Masculino', '1986-03-29', '2232-1342', '232-4234', 'juanc@gmail.com');

INSERT INTO `Licencia` (`Numero_Control`, `ID_Usuario`, `Tipo_Licencia`, `Fecha_Emision`, `Fecha_Vencimiento`, `Estado_Licencia`, `Inicio_Suspencion`, `Vencimiento_Suspension`) VALUES
(0, 1, 'D', '2020-07-02', '2020-07-02', 'Vencida', '0000-00-00', '0000-00-00'),
(1, 2, 'E2', '2020-07-02', '2020-07-02', 'Vigente', '0000-00-00', '0000-00-00');

INSERT INTO `Municipio` (`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES
('MuAgd', 'CL', 'Aguadulce'),
('MuAlj', 'CH', 'Alanje'),
('MuAtly', 'VG', 'Atalaya'),
('MuAtn', 'CL', 'Antón'),
('MuBgb', 'CH', 'Bugaba'),
('MuBlb', 'PA', 'Balboa'),
('MuBqrn', 'CH', 'Boquerón'),
('MuBqt', 'CH', 'Boquete'),
('MuBr', 'CH', 'Barú'),
('MuBsk', 'NB', 'Besikó'),
('MuBT', 'BT', 'Bocas del Toro'),
('MuCh', 'BT', 'Changuinola'),
('MuChG', 'BT', 'Chiriquí Grande'),
('MuChm', 'PA', 'Chame'),
('MuChmn', 'PA', 'Chimán'),
('MuChp', 'PA', 'Chepo'),
('MuChpg', 'DA', 'Chepigana'),
('MuChr', 'CO', 'Chagres'),
('MuCht', 'HE', 'Chitré'),
('MuClbr', 'VG', 'Calobre'),
('MuCln', 'CO', 'Colón'),
('MuCmc', 'EW', 'Cémaco'),
('MuCñzs', 'VG', 'Cañazas'),
('MuCpr', 'PA', 'Capira'),
('MuDlg', 'CH', 'Dolega'),
('MuDns', 'CO', 'Donoso'),
('MuDvd', 'CH', 'David'),
('MuGlc', 'CH', 'Gualaca'),
('MuGre', 'LS', 'Guararé'),
('MuJrd', 'NB', 'Jirondai'),
('MuKnt', 'NB', 'Kankintú'),
('MuLChr', 'PA', 'La Chorrera'),
('MuLMns', 'HE', 'Las Minas'),
('MuLMs', 'VG', 'La Mesa'),
('MuLPms', 'VG', 'Las Palmas'),
('MuLPt', 'CL', 'La Pintada'),
('MuLPzs', 'HE', 'Los Pozos'),
('MuLSts', 'LS', 'Los Santos'),
('MuLTbs', 'LS', 'Las Tablas'),
('MuMcrs', 'LS', 'Macaracas'),
('MuMntj', 'VG', 'Montijo'),
('MuMrt', 'VG', 'Mariato'),
('MuNatá', 'CL', 'Natá'),
('MuOcú', 'HE', 'Ocú'),
('MuOlá', 'CL', 'Olá'),
('MuPcr', 'LS', 'Pocrí'),
('MuPds', 'LS', 'Pedasí'),
('MuPesé', 'HE', 'Pesé'),
('MuPngn', 'DA', 'Pinogana'),
('MuPnm', 'PA', 'Panamá'),
('MuPnnm', 'CL', 'Penonomé'),
('MuPrt', 'HE', 'Parita'),
('MuPrtb', 'CO', 'Portobelo'),
('MuRcmt', 'CH', 'Renacimiento'),
('MuRdJs', 'VG', 'Río de Jesús'),
('MuRmd', 'CH', 'Remedios'),
('MuSCls', 'PA', 'San Carlos'),
('MuSFe', 'VG', 'Sante Fe'),
('MuSFrsc', 'VG', 'San Fransisco'),
('MuSFx', 'CH', 'San Félix'),
('MuSIb', 'CO', 'Santa Isabel'),
('MuSLz', 'CH', 'San Lorenzo'),
('MuSmb', 'EW', 'Sambú'),
('MuSMglt', 'PA', 'San Miguelito'),
('MuSoná', 'VG', 'Soná'),
('MuStg', 'VG', 'Santiago'),
('MuStMr', 'HE', 'Santa María'),
('MuTbg', 'PA', 'Taboga'),
('MuTl', 'CH', 'Tolé'),
('MuTns', 'LS', 'Tonosí');

INSERT INTO `Placa` (`ID_Placa`, `ID_Vehiculo`, `Numero_Placa`, `Fecha_Vencimiento`) VALUES
(1, 1, 'CB2712', '2021');

INSERT INTO `Provincia` (`Codigo_Provincia`, `Provincia`) VALUES
('BT', 'Bocas de Toro'),
('CH', 'Chiriquí'),
('CL', 'Coclé'),
('CO', 'Colón'),
('DA', 'Darién'),
('EW', 'Embera-Wounan'),
('HE', 'Herrera'),
('LS', 'Los Santos'),
('NB', 'Ngobe Bugle'),
('PA', 'Panamá'),
('PO', 'Panamá Oeste'),
('VG', 'Veraguas');

INSERT INTO `Seguro` (`ID_Seguro`, `ID_Vehiculo`, `Tipo_Seguro`, `Aseguradora`, `Fecha_Emision`, `Fecha_Vencimiento`) VALUES
(1, 1, 'Cobertura Completa', 'Assa', '2017-05-03', '2021-05-03'),
(2, 2, 'Cobertura Completa', 'Assa', '2022-10-10', '2023-10-10'),
(3, 3, 'Cobertura Completa', 'Assa', '2022-10-10', '2023-10-10');

INSERT INTO `Tipo_Boleta` (`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES
(1, 'Sin equipo de seguridad', 50.00, 1),
(2, 'Sin condiciones adecuadas de seguridad', 75.00, 2),
(3, 'Usar señales acusticas o luminosas, en vehículos no autorizados', 75.00, 3),
(4, 'Con llantas lisas', 50.00, 2),
(5, 'Accesorios en rines que sobresalen de los gurdafangos', 20.00, 1),
(6, 'Emitir gases, ruidos o sonidos excesivos', 50.00, 3),
(7, 'Derramar combustible o sustancias tóxicas en la vía', 150.00, 3),
(8, 'En mal estado mecánico o de carrocería', 0.00, 0),
(9, 'Vehículo sin registro unico de propiredad vehicular', 25.00, 1),
(10, 'Portar placa con diseño diferente al oficial en lugar al establecido o no visible en su totalidad', 20.00, 2),
(11, 'Vehículo con placa vencida', 50.00, 3),
(12, 'Vehículo sin placa', 50.00, 3),
(13, 'Vehículo de transporte público y comercial de carga sin la identificación establecida', 20.00, 2),
(14, 'Vehículo con luces no adecuadas', 25.00, 2),
(15, 'Vehículo con vagón para transporte de personas sin medidas de seguridad', 50.00, 2),
(16, 'Vehículo sin cinta reflectiva o con cinta en mal estado', 50.00, 2),
(17, 'Vehículo para transporte sin dispositivos de seguridad', 50.00, 3),
(18, 'Vehículo para transporte de carga sin gurdabarros', 25.00, 1),
(19, 'Vehículo con vagón para transporte público de personas sin medidas de seguridad', 150.00, 3),
(20, 'Vehículo de transporte colectivo, colegial y turismo sin gobernador o con gobernador alterno', 100.00, 3),
(21, 'Papel ahumado en tono o lugar no autorizado', 20.00, 1),
(22, 'Vehículo de transporte colegial que no cumple las medidas de regulación establecidas', 100.00, 3),
(23, 'Transportar cargas incompatibles entre sí', 500.00, 5),
(24, 'Transportar cargas sin tomar las medidas de seguridad', 500.00, 5),
(25, 'Transportar cargas sin el permiso previo de circulación o con el permiso vencido', 500.00, 5),
(26, 'Transportar cargas fuera del itinerario aprobado', 250.00, 5),
(27, 'Portar licencia de conducir deteriorada (no legible)', 150.00, 1),
(28, 'No portar licencia de conducir', 50.00, 2),
(29, 'Ceder el manejo a persona no autorizada', 150.00, 5),
(30, 'Negarse a detener el vehículo al ser requerido (fuga)', 200.00, 6),
(31, 'Transportar carga no adecuada al tipo de vehículo', 75.00, 3),
(32, 'Transportar exceso de pasajeros', 20.00, 1),
(33, 'transportar menores de edad sin medidas de seguridad', 100.00, 5),
(34, 'Prestar servicio de transporte público en vehículo no autorizado', 0.00, 0),
(35, 'Coducir bicicletas y motocicletas sin medidas de seguridad', 15.00, 1),
(36, 'Hablar por telefono al conducir', 75.00, 3),
(37, 'No utilizar el cituron de seguridad', 75.00, 3),
(38, 'Reparar el Vehiculo en vía pública', 50.00, 2),
(39, 'Cambiar llantas sin tomar medidas la smedidas de seguridad', 20.00, 1),
(40, 'Derramar, arrojar o verter desechos en la va', 75.00, 2),
(41, 'Infrigir prohibiciones con relación a los pasajeros o negarse a llevar pasajeros', 75.00, 1),
(42, 'Condiucir fuera del recorrido establecido o pactado con el usuario', 50.00, 2),
(43, 'Prestar el servicio en ruta distinta a la establecida', 100.00, 3),
(44, 'Tomar o dejar pasasjeros fuera de los lugares especificados', 50.00, 2),
(45, 'Conducir con aliento alcohólico', 150.00, 5),
(46, 'Conducir en estado de embriaguez comprobada o bajo efecto de espefacientes', 0.00, 0),
(47, 'Conducir de forma desordenada', 75.00, 3),
(48, 'Conducir sin mantener la distancia adecuada', 20.00, 1),
(49, 'Conducir en vía contraria o girar en forma de `U` sobre la vía en lugar prohibido', 75.00, 3),
(50, 'Conducir por carril indebido en carreteras y autopistas', 50.00, 2),
(51, 'Conducir por el hombro', 50.00, 2),
(52, 'Conducir en lugar prohibido', 30.00, 2),
(53, 'Rebasar a otro vehículo sin la debida precaución', 75.00, 3),
(54, 'Conducir obstruyendo el transito', 50.00, 3),
(55, 'Conducir en retroceso en forma indebida', 30.00, 2),
(56, 'Romolcar otro vehículo sin cumplir las medidas de seguridad', 50.00, 2),
(57, 'No hacer alto', 100.00, 5),
(58, 'Realizar giro indebido', 20.00, 2),
(59, 'Desantender lineas de no pare, paso peatonal e indicaciones del inspector', 20.00, 2),
(60, 'Pasar con luz roja en el semaforo', 100.00, 6),
(61, 'Abandono de Vehículo en la vía pública (Chatarra)', 75.00, 3),
(62, 'Estacionar autobuses, camiones y unidades de arrastre en areas resindenciales', 75.00, 2),
(63, 'Estacionar autobuses, camiones y unidades de arrastre en la vía pública o en el hombro', 50.00, 2),
(64, 'Vehículo mal estacionado', 10.00, 1),
(65, 'Estacionar en espacio para personas con discapacidad (Ley 42 del 27 de agosto de 1999)', 50.00, 3),
(66, 'Conducir a velocidad superior al limite', 50.00, 5),
(67, 'Conduicr con velocidad inferior al limite', 20.00, 2),
(68, 'Hacer compentencia de velocidad (regatas) en la vía pública', 0.00, 0),
(69, 'Colisión y fuga, atropello o daños a la propiedad', 0.00, 0);

INSERT INTO `Tipo_Licencia` (`Tipo_Licencia`, `Descripcion`) VALUES
('A', 'Bicicleta'),
('B', 'Motocicleta'),
('C', 'Automóviles y camionetas'),
('D', 'Camiones livianos hasta 8 Toneladas y autobuses de hasta 16 pasajeros'),
('E1', 'Transporte selectivo (Taxis)'),
('E2', 'Busitos de Turismo, colegiales y transporte púbico hasta 16 pasajeros'),
('E3', 'Autobuses de más de 16 pasajeros'),
('F', 'Camiones unitarios de más de 8 toneladas y autobuses de más de 16 pasajeros'),
('G', 'Camiones combinados'),
('H', 'Vehículos de transporte de cargas peligrosas'),
('I', 'Equipo pesado'),
('J', 'Autobuses del Nuevo Sistema de Movilización Masivo de Pasajeros del Área Metropolitana (METROBUS)');

INSERT INTO `Vehiculo` (`ID_Vehiculo`, `ID_Usuario`, `Marca`, `Modelo`, `Tipo_vehiculo`, `Numero_Pasajeros`, `Agno`, `Codigo_Provincia`, `Codigo_Municipio`) VALUES
(1, 1, 'Hyundai', 'Eon', 'Camioneta', 5, 2017, 'PA', 'MuSMglt'),
(2, 2, 'Toyota', 'Corolla', 'Camioneta', 5, 2020, 'PA', 'MuSMglt'),
(3, 2, 'Honda', 'City', 'Sedán', 5, 2022, 'PA', 'MuSMglt');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;