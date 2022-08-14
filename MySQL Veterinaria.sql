CREATE TABLE IF NOT EXISTS `dueno` (
  `DNI` int(30) NOT NULL unique,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Telefono` varchar(30)  NOT NULL,
  `Dirección` varchar(50) NOT NULL,
  PRIMARY KEY (`DNI`)
);

INSERT INTO `dueno` (`DNI`, `Nombre`, `Apellido`, `Telefono`, `Dirección`) VALUES
(45365258, 'Daniel', 'Ramirez', '474-5547', 'Córdoba 2584'),
(362459871, 'Diego', 'Ruiz', '486-5656', 'Aconcagua 688'),
(35125633, 'Daniela', 'Gutierrez', '452-3747', 'Córdoba 3030'),
(52163516, 'Cristian', 'Carrizo', '468-2556', 'Av. Siempre Viva 777');

CREATE TABLE IF NOT EXISTS `perro` (
  `ID_Perro` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45)NOT NULL,
  `Fecha_nac` date NOT NULL,
  `Sexo` varchar(45)NOT NULL,
  `DNI_dueno` int(10)NOT NULL,
  PRIMARY KEY (`ID_Perro`),
  FOREIGN KEY (`DNI_dueno`) 
  REFERENCES `dueno` (`DNI`)
);

INSERT INTO `perro` (`ID_Perro`, `Nombre`, `Fecha_nac`, `Sexo`, `DNI_dueno`) VALUES
(1,'Tita', '2015-07-13','Macho',35125633),
(2,'Carola', '2010-11-11','Hembra',362459871),
(3,'Neron', '2008-07-05','Macho',45365258),
(4,'Yaco', '2017-09-11','Hembra',52163516);

CREATE TABLE IF NOT EXISTS `historial` (
  `ID_Historial` int(7) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Perro` int(4) NOT NULL,
  `Descripción` varchar(45) NOT NULL,
  `Monto` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_Historial`),
  FOREIGN KEY (`Perro`)
  REFERENCES `perro` (`ID_Perro`)
);

INSERT INTO `historial` (`ID_Historial`, `Fecha`, `Perro`, `Descripción`, `Monto`) VALUES
(1, '2022-08-05', 1, 'Garrapatas', '1000'),
(2, '2021-11-02', 2, 'Colicos', '2000'),
(3, '2022-08-05', 3, 'Traumatismos', '5000'),
(4, '2022-11-02', 4, 'Intoxicacion', '10000');

SELECT `Nombre` AS " Mascotas Atendidas durante el año >2022 "
FROM `perro` INNER JOIN `historial` ON `ID_Perro`= `Perro` WHERE `Fecha` LIKE "2022%";