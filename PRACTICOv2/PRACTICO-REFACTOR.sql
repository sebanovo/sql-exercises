CREATE DATABASE HOTELERO2025;
-- DROP DATABASE HOTELERO2025;
USE HOTELERO2025;

/*
    BASE DE DATOS PARA UN HOTEL PRACTICO BASE DE DATOS I
*/

-- Tabla de roles de usuario
CREATE TABLE ROL (
    ID INTEGER PRIMARY KEY NOT NULL,
    NOMBRE VARCHAR(100) NOT NULL
);

-- Tabla con datos personales
CREATE TABLE DATOPERSONAL (
    CI INTEGER PRIMARY KEY NOT NULL,
    NOMBRE VARCHAR(80) NOT NULL,
    APELIIDO VARCHAR(80) NOT NULL,
    TELEFONO VARCHAR(15) NOT NULL
);

-- Tabla de tipos de pago
CREATE TABLE TIPOPAGO (
    ID INTEGER PRIMARY KEY NOT NULL,
    NOMBRE VARCHAR(50) NOT NULL
);

-- Tabla de SERVICIO del hotel
CREATE TABLE SERVICIO (
    ID INTEGER PRIMARY KEY NOT NULL,
    NOMBRE VARCHAR(100) NOT NULL,
    DESCRIPCION TEXT,
    PRECIO FLOAT NOT NULL
);

-- Tabla de tipos de habitación (ej: suite, doble, sencilla)
CREATE TABLE TIPOHABITACION (
    ID INTEGER PRIMARY KEY NOT NULL,
    NOMBRE VARCHAR(80) NOT NULL,
    DESCRIPCION TEXT
);

-- Tabla de estados (libre, ocupado, limpieza, etc.)
CREATE TABLE ESTADO (
    ID INTEGER PRIMARY KEY NOT NULL,
    NOMBRE VARCHAR(80) NOT NULL,
    DESCRIPCION TEXT
);


-- Tabla de HABITACION
CREATE TABLE HABITACION (
    NRO INTEGER PRIMARY KEY NOT NULL,
    PRECIO FLOAT NOT NULL,
    IDTIPOHABITACION INTEGER NOT NULL,
    IDESTADO INTEGER NOT NULL,
    FOREIGN KEY (IDTIPOHABITACION) REFERENCES TIPOHABITACION(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (IDESTADO) REFERENCES ESTADO(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Tabla de usuarios
CREATE TABLE USUARIO (
    ID INTEGER PRIMARY KEY NOT NULL,
    NOMBRE VARCHAR(80) NOT NULL,
    CONTRASEÑA VARCHAR(150) NOT NULL,
    URLFOTO VARCHAR(200),
    IDROL INTEGER NOT NULL,
    IDPERSONAL INTEGER NOT NULL,
    FOREIGN KEY (IDROL) REFERENCES ROL(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (IDPERSONAL) REFERENCES DATOPERSONAL(CI)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Tabla intermedia entre empleados y SERVICIO
CREATE TABLE EMPLEADOSERVICIO (
    IDUSUARIO INTEGER NOT NULL,
    IDSERVICIO INTEGER NOT NULL,
    PRIMARY KEY (IDUSUARIO, IDSERVICIO),
    FOREIGN KEY (IDUSUARIO) REFERENCES USUARIO(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (IDSERVICIO) REFERENCES SERVICIO(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Tabla de notas de venta realizadas por usuarios
CREATE TABLE NOTAVENTA (
    ID INTEGER PRIMARY KEY NOT NULL,
    FECHA DATE,
    MONTOTOTAL FLOAT NOT NULL,
    IDUSUARIO INTEGER NOT NULL,
    IDTIPOPAGO INTEGER NOT NULL,
    FOREIGN KEY (IDUSUARIO) REFERENCES USUARIO(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (IDTIPOPAGO) REFERENCES TIPOPAGO(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Detalle de los SERVICIO incluidos en una nota de venta
CREATE TABLE DETALLESERVICIO1 (
    IDNOTAVENTA INTEGER NOT NULL,
    IDSERVICIO INTEGER NOT NULL,
    PRIMARY KEY (IDNOTAVENTA, IDSERVICIO),
    FOREIGN KEY (IDNOTAVENTA) REFERENCES NOTAVENTA(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (IDSERVICIO) REFERENCES SERVICIO(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Detalle de HABITACION incluidos en una nota de venta
CREATE TABLE DETALLESERVICIO2 (
    IDNOTAVENTA INTEGER NOT NULL,
    NROHABITACION INTEGER NOT NULL,
    PRIMARY KEY (IDNOTAVENTA, NROHABITACION),
    FOREIGN KEY (IDNOTAVENTA) REFERENCES NOTAVENTA(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (NROHABITACION) REFERENCES HABITACION(NRO)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Tabla de artículos disponibles (tv, secador, etc.)
CREATE TABLE ARTICULOS (
    ID INTEGER PRIMARY KEY NOT NULL,
    NOMBRE VARCHAR(50) NOT NULL
);

-- Detalle de artículos disponibles en cada habitación
CREATE TABLE DETALLEHABITACION (
    IDARTICULO INTEGER NOT NULL,
    IDHABITACION INTEGER NOT NULL,
    PRIMARY KEY (IDARTICULO, IDHABITACION),
    FOREIGN KEY (IDARTICULO) REFERENCES ARTICULOS(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (IDHABITACION) REFERENCES HABITACION(NRO)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Tabla de RESERVA realizadas por usuarios
CREATE TABLE RESERVA (
    ID INTEGER PRIMARY KEY NOT NULL,
    FECHAINI DATE NOT NULL,
    FECHASAL DATE NOT NULL,
    IDUSUARIO INTEGER NOT NULL,
    IDESTADO INTEGER NOT NULL,
    FOREIGN KEY (IDUSUARIO) REFERENCES USUARIO(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (IDESTADO) REFERENCES ESTADO(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Detalle que relaciona HABITACION con RESERVA y su ESTADO
CREATE TABLE DETALLERESERVA (
    IDRESERVA INTEGER NOT NULL,
    IDHABITACION INTEGER NOT NULL,
    PRIMARY KEY (IDRESERVA, IDHABITACION),
    FOREIGN KEY (IDRESERVA) REFERENCES RESERVA(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (IDHABITACION) REFERENCES HABITACION(NRO)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Población de la tabla 'ROL'
INSERT INTO ROL (ID, NOMBRE) VALUES
(1, 'Administrador'),
(2, 'Recepcionista'),
(3, 'Personal de Limpieza'),
(4, 'Cliente');

INSERT INTO DATOPERSONAL (CI, NOMBRE, APELIIDO, TELEFONO) VALUES
-- Trabajadores
(1001,'Ana','Pérez','70000001'),
(1002,'Luis','González','70000002'),
(1003,'Carla','Rodríguez','70000003'),
(1004,'Pedro','Mamani','70000004'),
(1005,'Sofía','Vargas','70000005'),
(1006,'Javier','Torres','70000006'),
(1007,'Daniela','Flores','70000007'),
(1008,'Marcos','Quispe','70000008'),
(1009,'Elena','Ruiz','70000009'),
(1010,'Raúl','Castro','70000010'),

-- Clientes
(2001,'María','Suárez','71000001'),
(2002,'Carlos','López','71000002'),
(2003,'Laura','Gutiérrez','71000003'),
(2004,'Andrés','Silva','71000004'),
(2005,'Valentina','Rojas','71000005'),
(2006,'Gabriel','Velasco','71000006'),
(2007,'Camila','Mendoza','71000007'),
(2008,'Sebastián','Herrera','71000008'),
(2009,'Martina','Navarro','71000009'),
(2010,'Nicolás','Vargas','71000010'),
(2011,'Isabella','Chávez','71000011'),
(2012,'Mateo','Miranda','71000012'),
(2013,'Renata','Flores','71000013'),
(2014,'Benjamín','Ortiz','71000014'),
(2015,'Lucía','Jiménez','71000015'),
(2016,'Emilio','Soto','71000016'),
(2017,'Sofía','Romero','71000017'),
(2018,'Thiago','Aguilera','71000018'),
(2019,'Paula','Guerrero','71000019'),
(2020,'Adrián','Rivera','71000020');

-- Población de la tabla 'TIPOPAGO'
INSERT INTO TIPOPAGO (ID, NOMBRE) VALUES
(1,'Efectivo'),
(2,'Tarjeta de Crédito'),
(3,'Tarjeta de Débito'),
(4,'Transferencia Bancaria'),
(5,'QR Codigo');

-- Población de la tabla 'SERVICIO' (precios aproximados en Santa Cruz)
INSERT INTO SERVICIO (ID, NOMBRE, DESCRIPCION, PRECIO) VALUES
(1,'Desayuno Buffet','Variedad de panes, frutas, jugos, huevos, etc.',35.00),
(2,'Almuerzo a la Carta','Platos variados de la cocina local e internacional',60.00),
(3,'Cena a la Carta','Opciones gourmet para la noche',75.00),
(4,'Servicio de Lavandería','Lavado y planchado de ropa',20.00),
(5,'Acceso a Piscina','Uso de la piscina del hotel',30.00),
(6,'Gimnasio','Acceso al gimnasio equipado',100.00),
(7,'Spa - Masaje Relajante','Masaje de relajación de 60 minutos',120.00),
(8,'Tour por la Ciudad','Excursión guiada por los puntos turísticos',150.00),
(9,'Traslado Aeropuerto - Hotel','Recogida desde el aeropuerto Viru Viru',80.00),
(10,'Servicio a la Habitación','Pedidos de comida y bebida a la habitación',15.00);

-- Población de la tabla 'TIPOHABITACION'
INSERT INTO TIPOHABITACION (ID, NOMBRE, DESCRIPCION) VALUES
(1,'Sencilla','Una cama individual'),
(2,'Doble','Dos camas individuales o una cama matrimonial'),
(3,'Matrimonial','Una cama matrimonial grande'),
(4,'Triple','Tres camas individuales o una matrimonial y una individual'),
(5,'Suite','Habitación de lujo con sala de estar y dormitorio separado');

-- Población de la tabla 'ESTADO'
INSERT INTO ESTADO (ID, NOMBRE, DESCRIPCION) VALUES
(1,'Libre','Disponible para reserva u ocupación'),
(2,'Ocupada','Actualmente ocupada por un cliente'),
(3,'Reservada','Ha sido reservada para futuras fechas'),
(4,'En Limpieza','Siendo limpiada por el personal'),
(5,'Fuera de Servicio','No disponible para su uso');

-- Población de la tabla 'HABITACION' (precios aproximados en Santa Cruz)
INSERT INTO HABITACION (NRO, PRECIO, IDTIPOHABITACION, IDESTADO) VALUES 
(101, 150.00, 1, 1), -- Sencilla Libre
(102, 160.00, 1, 2), -- Sencilla Ocupada
(201, 220.00, 2, 3), -- Doble Reservada
(202, 230.00, 2, 1), -- Doble Libre
(301, 250.00, 3, 2), -- Matrimonial Ocupada
(302, 260.00, 3, 1), -- Matrimonial Libre
(401, 300.00, 4, 3), -- Triple Reservada
(402, 310.00, 4, 1), -- Triple Libre
(501, 450.00, 5, 2), -- Suite Ocupada
(502, 460.00, 5, 1), -- Suite Libre
(103, 155.00, 1, 1), -- Sencilla Libre
(203, 225.00, 2, 2), -- Doble Ocupada
(303, 255.00, 3, 3), -- Matrimonial Reservada
(403, 305.00, 4, 1), -- Triple Libre
(503, 455.00, 5, 2), -- Suite Ocupada
(104, 165.00, 1, 1), -- Sencilla Libre
(204, 235.00, 2, 2), -- Doble Ocupada
(304, 265.00, 3, 1), -- Matrimonial Libre
(404, 315.00, 4, 3), -- Triple Reservada
(504, 465.00, 5, 1); -- Suite Libre

-- Población de la tabla 'USUARIO' (relacionando con DATOPERSONAL y ROL)
INSERT INTO USUARIO (ID, NOMBRE, CONTRASEÑA, URLFOTO, IDROL, IDPERSONAL) VALUES
-- Trabajadores
(1,'Ana Pérez','admin123', NULL,1,1001), -- Administrador
(2,'Luis González','recep456', NULL,2,1002), -- Recepcionista
(3,'Carla Rodríguez','limpieza789',NULL,3,1003), -- Personal de Limpieza
(4,'Pedro Mamani','recep101', NULL,2,1004), -- Recepcionista
(5,'Sofía Vargas','limpieza202', NULL,3,1005), -- Personal de Limpieza
(6,'Javier Torres','admin456', NULL,1,1006), -- Administrador
(7,'Daniela Flores','recep789', NULL,2,1007), -- Recepcionista
(8,'Marcos Quispe','limpieza111', NULL,3,1008), -- Personal de Limpieza
(9,'Elena Ruiz','recep222', NULL,2,1009), -- Recepcionista
(10,'Raúl Castro','limpieza333', NULL,3,1010), -- Personal de Limpieza
-- Clientes
(11,'María Suárez','cliente1', NULL,4, 2001),
(12,'Carlos López','cliente2', NULL,4,2002),
(13,'Laura Gutiérrez','cliente3', NULL,4,2003),
(14,'Andrés Silva','cliente4', NULL,4,2004),
(15,'Valentina Rojas','cliente5', NULL,4,2005),
(16,'Gabriel Velasco','cliente6', NULL,4,2006),
(17,'Camila Mendoza','cliente7', NULL,4,2007),
(18,'Sebastián Herrera','cliente8', NULL,4,2008),
(19,'Martina Navarro','cliente9', NULL,4,2009),
(20,'Nicolás Vargas','cliente10', NULL,4,2010),
(21,'Isabella Chávez','cliente11', NULL,4,2011),
(22,'Mateo Miranda','cliente12', NULL,4,2012),
(23,'Renata Flores','cliente13', NULL,4,2013),
(24,'Benjamín Ortiz','cliente14', NULL,4,2014),
(25,'Lucía Jiménez','cliente15', NULL,4,2015),
(26,'Emilio Soto','cliente16', NULL,4,2016),
(27,'Sofía Romero','cliente17', NULL,4,2017),
(28,'Thiago Aguilera','cliente18', NULL,4,2018),
(29,'Paula Guerrero','cliente19', NULL,4,2019),
(30,'Adrián Rivera','cliente20', NULL,4,2020);

-- Población de la tabla 'EMPLEADOSERVICIO' (asignando SERVICIO a empleados)
INSERT INTO EMPLEADOSERVICIO (IDUSUARIO, IDSERVICIO) VALUES
(2, 9),  -- Recepcionista Luis realiza traslados
(2, 10), -- Recepcionista Luis atiende servicio a la habitación
(4, 9),  -- Recepcionista Pedro realiza traslados
(4, 10), -- Recepcionista Pedro atiende servicio a la habitación
(3, 4),  -- Personal de limpieza Carla realiza lavandería
(5, 4),  -- Personal de limpieza Sofía realiza lavandería
(7, 10), -- Recepcionista Daniela atiende servicio a la habitación
(9, 10); -- Recepcionista Elena atiende servicio a la habitación

-- Población de la tabla 'NOTAVENTA' (diferentes clientes con diferentes pagos)
INSERT INTO NOTAVENTA (ID, FECHA, MONTOTOTAL, IDUSUARIO, IDTIPOPAGO) VALUES
(1, '2025-04-01', 200.00, 11, 1), -- María (Efectivo)
(2, '2025-04-02', 480.00, 12, 2), -- Carlos (Tarjeta de Crédito - Habitación + Desayuno)
(3, '2025-04-03', 150.00, 13, 3), -- Laura (Tarjeta de Débito)
(4, '2025-04-04', 350.00, 14, 4), -- Andrés (Transferencia Bancaria - Habitación + Lavandería)
(5, '2025-04-05', 180.00, 15, 5), -- Valentina (QR Code)
(6, '2025-04-06', 520.00, 16, 2), -- Gabriel (Tarjeta de Crédito - Habitación + Cena)
(7, '2025-04-07', 280.00, 17, 1), -- Camila (Efectivo - Habitación + Desayuno)
(8, '2025-04-08', 160.00, 18, 3), -- Sebastián (Tarjeta de Débito)
(9, '2025-04-09', 400.00, 19, 4), -- Martina (Transferencia Bancaria - Habitación + Almuerzo)
(10, '2025-04-10', 210.00, 20, 5), -- Nicolás (QR Code)
(11, '2025-04-01', 60.00, 21, 1), -- Isabella (Almuerzo)
(12, '2025-04-03', 120.00, 22, 2), -- Mateo (Spa)
(13, '2025-04-05', 80.00, 23, 3),  -- Renata (Traslado)
(14, '2025-04-07', 35.00, 24, 4),  -- Benjamín (Desayuno)
(15, '2025-04-09', 75.00, 25, 5),  -- Lucía (Cena)
(16, '2025-04-02', 250.00, 26, 2), -- Emilio (Habitación)
(17, '2025-04-04', 180.00, 27, 1), -- Sofía (Habitación + Lavandería)
(18, '2025-04-06', 50.00, 28, 3),  -- Thiago (Lavandería)
(19, '2025-04-08', 150.00, 29, 4), -- Paula (Tour)
(20, '2025-04-10', 460.00, 30, 5); -- Adrián (Habitación + Desayuno + Cena)

-- Población de la tabla 'DETALLESERVICIO1' (SERVICIO en cada nota de venta)
INSERT INTO DETALLESERVICIO1 (IDNOTAVENTA, IDSERVICIO) VALUES
(2, 1),  -- Carlos (Desayuno)
(4, 4),  -- Andrés (Lavandería)
(6, 3),  -- Gabriel (Cena)
(7, 1),  -- Camila (Desayuno)
(9, 2),  -- Martina (Almuerzo)
(11, 2), -- Isabella (Almuerzo)
(12, 7), -- Mateo (Spa - Masaje)
(13, 9), -- Renata (Traslado)
(14, 1), -- Benjamín (Desayuno)
(15, 3), -- Lucía (Cena)
(17, 4), -- Sofía (Lavandería)
(18, 4), -- Thiago (Lavandería)
(19, 8), -- Paula (Tour)
(20, 1), -- Adrián (Desayuno)
(20, 3), -- Adrián (Cena)
(2, 5),  -- Carlos (Acceso a Piscina - incluido)
(6, 6),  -- Gabriel (Gimnasio - incluido)
(16, 5), -- Emilio (Acceso a Piscina - incluido)
(17, 6); -- Sofía (Gimnasio - incluido)

-- Población de la tabla 'DETALLESERVICIO2' (HABITACION en cada nota de venta)
INSERT INTO DETALLESERVICIO2 (IDNOTAVENTA, NROHABITACION) VALUES
(2, 201), -- Carlos (Habitación Doble Reservada)
(4, 102), -- Andrés (Habitación Sencilla Ocupada)
(6, 301), -- Gabriel (Habitación Matrimonial Ocupada)
(7, 101), -- Camila (Habitación Sencilla Libre)
(9, 202), -- Martina (Habitación Doble Libre)
(10, 302), -- Nicolás (Habitación Matrimonial Libre)
(16, 401), -- Emilio (Habitación Triple Reservada)
(17, 501), -- Sofía (Suite Ocupada)
(20, 103); -- Adrián (Habitación Sencilla Libre)

-- Población de la tabla 'ARTICULOS'
INSERT INTO ARTICULOS (ID, NOMBRE) VALUES
(1, 'Televisor'),
(2, 'Aire Acondicionado'),
(3, 'Secador de Pelo'),
(4, 'Minibar'),
(5, 'Caja Fuerte'),
(6, 'Wi-Fi'),
(7, 'Cafetera');

-- Población de la tabla 'DETALLEHABITACION'
INSERT INTO DETALLEHABITACION (IDARTICULO, IDHABITACION) VALUES
(1, 101), (2, 101), (6, 101), -- Habitación 101 (TV, AC, Wi-Fi)
(1, 102), (2, 102), (6, 102), -- Habitación 102 (TV, AC, Wi-Fi)
(1, 201), (2, 201), (3, 201), (6, 201), -- Habitación 201 (TV, AC, Secador, Wi-Fi)
(1, 202), (2, 202), (3, 202), (6, 202), -- Habitación 202 (TV, AC, Secador, Wi-Fi)
(1, 301), (2, 301), (3, 301), (4, 301), (6, 301), -- Habitación 301 (TV, AC, Secador, Minibar, Wi-Fi)
(1, 302), (2, 302), (3, 302), (4, 302), (6, 302), -- Habitación 302 (TV, AC, Secador, Minibar, Wi-Fi)
(1, 401), (2, 401), (3, 401), (4, 401), (6, 401), -- Habitación 401 (TV, AC, Secador, Minibar, Wi-Fi)
(1, 402), (2, 402), (3, 402), (4, 402), (6, 402), -- Habitación 402 (TV, AC, Secador, Minibar, Wi-Fi)
(1, 501), (2, 501), (3, 501), (4, 501), (5, 501), (6, 501), (7, 501), -- Habitación 501 (TV, AC, Secador, Minibar, Caja Fuerte, Wi-Fi, Cafetera)
(1, 502), (2, 502), (3, 502), (4, 502), (5, 502), (6, 502), (7, 502), -- Habitación 502 (TV, AC, Secador, Minibar, Caja Fuerte, Wi-Fi, Cafetera)
(1, 103), (2, 103), (6, 103),
(1, 203), (2, 203), (3, 203), (6, 203),
(1, 303), (2, 303), (3, 303), (4, 303), (6, 303),
(1, 403), (2, 403), (3, 403), (4, 403), (6, 403),
(1, 503), (2, 503), (3, 503), (4, 503), (5, 503), (6, 503), (7, 503),
(1, 104), (2, 104), (6, 104),
(1, 204), (2, 204), (3, 204), (6, 204),
(1, 304), (2, 304), (3, 304), (4, 304), (6, 304),
(1, 404), (2, 404), (3, 404), (4, 404), (6, 404),
(1, 504), (2, 504), (3, 504), (4, 504), (5, 504), (6, 504), (7, 504);

-- Población de la tabla 'RESERVA' (clientes que han reservado)
INSERT INTO RESERVA (ID, FECHAINI, FECHASAL, IDUSUARIO, IDESTADO) VALUES
(1, '2025-05-01', '2025-05-05', 12, 3), -- Carlos (Reservada)
(2, '2025-05-10', '2025-05-12', 14, 3), -- Andrés (Reservada)
(3, '2025-04-15', '2025-04-20', 16, 3), -- Gabriel (Reservada)
(4, '2025-04-25', '2025-04-28', 19, 3), -- Martina (Reservada)
(5, '2025-06-01', '2025-06-07', 22, 3); -- Mateo (Reservada)

-- Población de la tabla 'DETALLERESERVA'
INSERT INTO DETALLERESERVA (IDRESERVA, IDHABITACION) VALUES
(1, 201), -- Carlos reservó la habitación 201
(2, 102), -- Andrés reservó la habitación 102
(3, 301), -- Gabriel reservó la habitación 301
(4, 401), -- Martina reservó la habitación 401
(5, 501); -- Mateo reservó la habitación 501

SELECT * FROM ROL;
SELECT * FROM DATOPERSONAL;
SELECT * FROM TIPOPAGO;
SELECT * FROM SERVICIO;
SELECT * FROM TIPOHABITACION;
SELECT * FROM ESTADO;
SELECT * FROM HABITACION;
SELECT * FROM USUARIO;
SELECT * FROM EMPLEADOSERVICIO;
SELECT * FROM NOTAVENTA;
SELECT * FROM DETALLESERVICIO1;
SELECT * FROM DETALLESERVICIO2;
SELECT * FROM ARTICULOS;
SELECT * FROM DETALLEHABITACION;
SELECT * FROM RESERVA;
SELECT * FROM DETALLERESERVA;

-- Consulta  1 : Mostrar el NOMBRE completo de todos los usuarios ordenados alfabéticamente por APELIIDO y luego por NOMBRE.
SELECT CONCAT(pd.NOMBRE, ' ', pd.APELIIDO) AS NombreCompleto
FROM USUARIO u
JOIN DATOPERSONAL pd ON u.IDPERSONAL = pd.CI
ORDER BY pd.APELIIDO, pd.NOMBRE;

-- Consulta  2 : Mostrar los nombres de los SERVICIO y su PRECIO, pero solo para aquellos SERVICIO con una descripción que contenga la palabra 'buffet' o 'gourmet'.
SELECT NOMBRE, PRECIO FROM SERVICIO WHERE DESCRIPCION LIKE '%buffet%' OR DESCRIPCION LIKE '%gourmet%';

-- Consulta  3 : Mostrar el número de habitación y su PRECIO, pero solo para las HABITACION que no están en ESTADO 'Ocupada' y tienen un PRECIO superior a 200.
SELECT NRO, PRECIO FROM HABITACION WHERE IDESTADO != (SELECT ID FROM ESTADO WHERE NOMBRE = 'Ocupada') AND PRECIO > 200;
-- Consulta  4 : Mostrar el NOMBRE de los artículos disponibles en más de 5 HABITACION.
SELECT a.NOMBRE
FROM ARTICULOS a
JOIN DETALLEHABITACION dh ON a.ID = dh.IDARTICULO
GROUP BY a.NOMBRE
HAVING COUNT(DISTINCT dh.IDHABITACION) > 5;

-- Consulta  5 (MySQL): Mostrar la FECHA de las notas de venta y el monto total, pero solo para las ventas realizadas en el año 2025 y cuyo monto total sea mayor al promedio de todas las ventas.
SELECT FECHA, MONTOTOTAL FROM NOTAVENTA WHERE YEAR(FECHA) = 2025 AND MONTOTOTAL > (SELECT AVG(MONTOTOTAL) FROM NOTAVENTA);

-- Consulta  6 : Mostrar el NOMBRE del usuario y el número de RESERVA que ha realizado, ordenado por el número de RESERVA de mayor a menor.
SELECT u.NOMBRE AS NombreUsuario, COUNT(r.ID) AS NumeroReservas
FROM USUARIO u
LEFT JOIN RESERVA r ON u.ID = r.IDUSUARIO
GROUP BY u.NOMBRE
ORDER BY NumeroReservas DESC;

-- Consulta  7 : Mostrar el NOMBRE del tipo de habitación y el PRECIO promedio de las HABITACION de ese tipo, solo para los tipos de habitación con un PRECIO promedio superior a 200.
SELECT th.NOMBRE AS TipoHabitacion, AVG(h.PRECIO) AS PrecioPromedio
FROM TIPOHABITACION th
JOIN HABITACION h ON th.ID = h.IDTIPOHABITACION
GROUP BY th.NOMBRE
HAVING AVG(h.PRECIO) > 200;

-- Consulta  8 (MySQL): Mostrar el NOMBRE del servicio y el número de veces que ha sido incluido en las notas de venta, ordenado por la frecuencia de mayor a menor.
SELECT s.NOMBRE AS NombreServicio, COUNT(ds.IDSERVICIO) AS Frecuencia
FROM SERVICIO s
JOIN DETALLESERVICIO1 ds ON s.ID = ds.IDSERVICIO
GROUP BY s.NOMBRE
ORDER BY Frecuencia DESC;

-- Consulta  9 : Mostrar el NOMBRE del artículo y el número de HABITACION en las que está disponible.
SELECT a.NOMBRE AS NombreArticulo, COUNT(DISTINCT dh.IDHABITACION) AS NumeroHabitaciones
FROM ARTICULOS a
JOIN DETALLEHABITACION dh ON a.ID = dh.IDARTICULO
GROUP BY a.NOMBRE;

-- Consulta  10 : Mostrar el NOMBRE del ROL y el número de usuarios que tienen ese ROL.
SELECT r.NOMBRE AS NombreRol, COUNT(u.ID) AS NumeroUsuarios
FROM ROL r
LEFT JOIN USUARIO u ON r.ID = u.IDROL
GROUP BY r.NOMBRE;

-- Consulta  11 : Mostrar el NOMBRE del cliente y el monto total gastado por cada cliente en el hotel.
SELECT u.NOMBRE AS NombreCliente, SUM(nv.MONTOTOTAL) AS MontoTotalGastado
FROM USUARIO u
JOIN NOTAVENTA nv ON u.ID = nv.IDUSUARIO
WHERE u.IDROL = 4 
GROUP BY u.NOMBRE
ORDER BY MontoTotalGastado DESC;

-- Consulta  12 : Mostrar el NOMBRE del tipo de pago y el monto total recaudado con cada tipo de pago.
SELECT tp.NOMBRE AS TipoPago, SUM(nv.MONTOTOTAL) AS MontoTotalRecaudado
FROM TIPOPAGO tp
JOIN NOTAVENTA nv ON tp.ID = nv.IDTIPOPAGO
GROUP BY tp.NOMBRE
ORDER BY MontoTotalRecaudado DESC;

-- Consulta 13 : Mostrar el NOMBRE del empleado y el número de SERVICIO distintos que ofrece.
SELECT u.NOMBRE AS NombreEmpleado, COUNT(DISTINCT es.IDSERVICIO) AS NumeroServiciosOfrecidos
FROM USUARIO u
JOIN EMPLEADOSERVICIO es ON u.ID = es.IDUSUARIO
WHERE u.IDROL != 4 
GROUP BY u.NOMBRE
ORDER BY NumeroServiciosOfrecidos DESC;

-- Consulta 14 : Mostrar el NOMBRE del tipo de habitación y la habitación con el PRECIO más alto de ese tipo.
SELECT th.NOMBRE AS TipoHabitacion, MAX(h.PRECIO) AS PrecioMaximo
FROM TIPOHABITACION th
JOIN HABITACION h ON th.ID = h.IDTIPOHABITACION
GROUP BY th.NOMBRE;

-- Consulta 15 (MySQL): Mostrar el NOMBRE del ESTADO de la reserva y el número de RESERVA en cada ESTADO.r_inner_
SELECT es.NOMBRE AS EstadoReserva, COUNT(r.ID) AS NumeroReservas
FROM ESTADO es
JOIN RESERVA r ON es.ID = r.IDESTADO
GROUP BY es.NOMBRE
ORDER BY NumeroReservas DESC;

-- Consulta  16 : Mostrar el NOMBRE del cliente, la FECHA de la reserva y el número de la habitación reservada, ordenado por la FECHA de inicio de la reserva.
SELECT u.NOMBRE AS NombreCliente, r.FECHAINI AS FechaReserva, h.NRO AS NumeroHabitacion
FROM USUARIO u
JOIN RESERVA r ON u.ID = r.IDUSUARIO
JOIN DETALLERESERVA dr ON r.ID = dr.IDRESERVA
JOIN HABITACION h ON dr.IDHABITACION = h.NRO
ORDER BY r.FECHAINI;

-- Consulta  18 : Mostrar el NOMBRE del cliente, el NOMBRE del servicio que adquirió y el PRECIO del servicio para todas las notas de venta.
SELECT uc.NOMBRE AS NombreCliente, s.NOMBRE AS NombreServicio, s.PRECIO AS PrecioServicio
FROM NOTAVENTA nv
JOIN USUARIO uc ON nv.IDUSUARIO = uc.ID
JOIN DETALLESERVICIO1 ds ON nv.ID = ds.IDNOTAVENTA
JOIN SERVICIO s ON ds.IDSERVICIO = s.ID
WHERE uc.IDROL = 4; 

-- Consulta  19 : Mostrar el NOMBRE del empleado que realizó el servicio, el NOMBRE del servicio realizado y el NOMBRE del cliente que lo solicitó (si la venta incluye SERVICIO).
SELECT ue.NOMBRE AS NombreEmpleado, s.NOMBRE AS NombreServicio, uc.NOMBRE AS NombreCliente
FROM EMPLEADOSERVICIO es
JOIN USUARIO ue ON es.IDUSUARIO = ue.ID
JOIN SERVICIO s ON es.IDSERVICIO = s.ID
JOIN NOTAVENTA nv ON s.ID IN (SELECT IDSERVICIO FROM DETALLESERVICIO1 WHERE IDNOTAVENTA = nv.ID)
JOIN USUARIO uc ON nv.IDUSUARIO = uc.ID
WHERE ue.IDROL != 4 AND uc.IDROL = 4;

-- Consulta  20 : Mostrar el NOMBRE del cliente que realizó una reserva, la FECHA de inicio de la reserva y el número y tipo de la habitación reservada.
SELECT u.NOMBRE AS NombreCliente, r.FECHAINI AS FechaReserva, h.NRO AS NumeroHabitacion, th.NOMBRE AS TipoHabitacion
FROM USUARIO u
JOIN RESERVA r ON u.ID = r.IDUSUARIO
JOIN DETALLERESERVA dr ON r.ID = dr.IDRESERVA
JOIN HABITACION h ON dr.IDHABITACION = h.NRO
JOIN TIPOHABITACION th ON h.IDTIPOHABITACION = th.ID
WHERE u.IDROL = 4; 

-- Consulta  21 : Mostrar el NOMBRE del artículo, el número de la habitación en la que se encuentra y el tipo de habitación.
SELECT a.NOMBRE AS NombreArticulo, h.NRO AS NumeroHabitacion, th.NOMBRE AS TipoHabitacion
FROM ARTICULOS a
JOIN DETALLEHABITACION dh ON a.ID = dh.IDARTICULO
JOIN HABITACION h ON dh.IDHABITACION = h.NRO
JOIN TIPOHABITACION th ON h.IDTIPOHABITACION = th.ID;

-- Consulta  22 : Mostrar el NOMBRE del empleado que ofrece un servicio, el NOMBRE del servicio y el PRECIO del servicio.
SELECT u.NOMBRE AS NombreEmpleado, s.NOMBRE AS NombreServicio, s.PRECIO AS PrecioServicio
FROM USUARIO u
JOIN EMPLEADOSERVICIO es ON u.ID = es.IDUSUARIO
JOIN SERVICIO s ON es.IDSERVICIO = s.ID
WHERE u.IDROL != 4;

-- Consulta  23 : Mostrar el NOMBRE del cliente que realizó una reserva, la FECHA de inicio de la reserva y los nombres de los artículos disponibles en la habitación reservada.
SELECT u.NOMBRE AS NombreCliente, r.FECHAINI AS FechaReserva, GROUP_CONCAT(a.NOMBRE) AS ArticulosEnHabitacion
FROM USUARIO u
JOIN RESERVA r ON u.ID = r.IDUSUARIO
JOIN DETALLERESERVA dr ON r.ID = dr.IDRESERVA
JOIN HABITACION h ON dr.IDHABITACION = h.NRO
JOIN DETALLEHABITACION dh ON h.NRO = dh.IDHABITACION
JOIN ARTICULOS a ON dh.IDARTICULO = a.ID
WHERE u.IDROL = 4
GROUP BY r.ID, u.NOMBRE, r.FECHAINI, h.NRO;

-- Consulta  24 : Mostrar el NOMBRE de cada tipo de habitación y el NOMBRE del artículo más común que se encuentra en HABITACION de ese tipo.
SELECT
    th.NOMBRE AS TipoHabitacion,
    (
        SELECT a.NOMBRE
        FROM HABITACION h_inner
        JOIN DETALLEHABITACION dh_inner ON h_inner.NRO = dh_inner.IDHABITACION
        JOIN ARTICULOS a ON dh_inner.IDARTICULO = a.ID
        WHERE h_inner.IDTIPOHABITACION = th.ID
        GROUP BY a.NOMBRE
        ORDER BY COUNT(*) DESC
        LIMIT 1
    ) AS ArticuloMasComun
FROM TIPOHABITACION th
ORDER BY TipoHabitacion;

-- Subconsulta 25 : Mostrar los nombres de los clientes que han realizado RESERVA para HABITACION de tipo 'Suite'.
SELECT u.NOMBRE
FROM USUARIO u
WHERE u.ID IN (SELECT r.IDUSUARIO
             FROM RESERVA r
             WHERE r.ID IN (SELECT dr.IDRESERVA
                              FROM DETALLERESERVA dr
                              WHERE dr.IDHABITACION IN (SELECT h.NRO
                                                           FROM HABITACION h
                                                           WHERE h.IDTIPOHABITACION = (SELECT th.ID FROM TIPOHABITACION th WHERE th.NOMBRE = 'Suite'))))
  AND u.IDROL = 4;

-- Subconsulta  26 (: Mostrar los nombres de los SERVICIO que nunca han sido incluidos en una nota de venta.
SELECT NOMBRE FROM SERVICIO WHERE ID NOT IN (SELECT DISTINCT IDSERVICIO FROM DETALLESERVICIO1);

-- Subconsulta  27 : Mostrar los nombres de los empleados que ofrecen todos los SERVICIO que tienen un PRECIO inferior a 50.
SELECT u.NOMBRE
FROM USUARIO u
WHERE u.ID IN (SELECT DISTINCT IDUSUARIO FROM EMPLEADOSERVICIO)
  AND NOT EXISTS (SELECT s.ID
                  FROM SERVICIO s
                  WHERE s.PRECIO < 50
                    AND s.ID NOT IN (SELECT es.IDSERVICIO
                                     FROM EMPLEADOSERVICIO es
                                     WHERE es.IDUSUARIO = u.ID))
  AND u.IDROL != 4;

-- Subconsulta  28 : Mostrar los números de las HABITACION que no tienen ningún artículo asociado.
SELECT NRO FROM HABITACION WHERE NRO NOT IN (SELECT DISTINCT IDHABITACION FROM DETALLEHABITACION);

-- Subconsulta  29 : Mostrar los nombres de los clientes que han realizado al menos una compra donde el monto total fue superior al PRECIO de la habitación más cara.
SELECT u.NOMBRE
FROM USUARIO u
WHERE u.ID IN (SELECT nv.IDUSUARIO
             FROM NOTAVENTA nv
             WHERE nv.MONTOTOTAL > (SELECT MAX(PRECIO) FROM HABITACION))
  AND u.IDROL = 4;

-- Subconsulta  30 : Mostrar los nombres de los roles que no tienen ningún usuario asociado.
SELECT NOMBRE FROM ROL WHERE ID NOT IN (SELECT DISTINCT IDROL FROM USUARIO);

-- Subconsulta  31 : Mostrar los números de las HABITACION que están reservadas para el futuro (FECHA de inicio posterior a la FECHA actual).
SELECT h.NRO
FROM HABITACION h
WHERE h.NRO IN (SELECT dr.IDHABITACION
                FROM DETALLERESERVA dr
                WHERE dr.IDRESERVA IN (SELECT r.ID
                                         FROM RESERVA r
                                         WHERE r.FECHAINI > CURDATE()));

-- Subconsulta 32 : Mostrar los nombres de los SERVICIO que están incluidos en todas las notas de venta que tienen un monto total superior a 300.
SELECT s.NOMBRE
FROM SERVICIO s
WHERE NOT EXISTS (SELECT nv.ID
                  FROM NOTAVENTA nv
                  WHERE nv.MONTOTOTAL > 300
                    AND NOT EXISTS (SELECT ds.IDSERVICIO
                                    FROM DETALLESERVICIO1 ds
                                    WHERE ds.IDNOTAVENTA = nv.ID
                                      AND ds.IDSERVICIO = s.ID));

-- Consulta 33 : Mostrar los nombres de los empleados que ofrecen al menos un servicio que tiene un PRECIO inferior al promedio de todos los SERVICIO (para asegurar resultados).
SELECT u.NOMBRE
FROM USUARIO u
JOIN EMPLEADOSERVICIO es ON u.ID = es.IDUSUARIO
JOIN SERVICIO s ON es.IDSERVICIO = s.ID
WHERE u.IDROL != 4
  AND s.PRECIO < (SELECT AVG(PRECIO) FROM SERVICIO)
GROUP BY u.NOMBRE;
