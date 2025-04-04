CREATE DATABASE UNIVERSIDAD2025;
USE UNIVERSIDAD2025;

CREATE TABLE ALUMNO (
	REGISTRO INTEGER NOT NULL PRIMARY KEY,
    CI INTEGER NOT NULL,
    NOMBRE VARCHAR(50) NOT NULL,
    DIRECCION VARCHAR(60),
    SEXO CHAR NOT NULL,
    ESTADOCIVIL CHAR NOT NULL,
    TIPOSANGRE VARCHAR(4),
    TELEFONO INTEGER
);

INSERT INTO ALUMNO VALUES (111,3451235,'Joaquin Chumacero', 'Urb. Las palmas', 'm', 's', 'orh+', NULL);
INSERT INTO ALUMNO VALUES (222,7571234,'Saturnino Mamani', 'Calle landivar Nro 20', 'm', 'c', NULL, 7321919);
INSERT INTO ALUMNO VALUES (333,8785678,'Fabiola Mendez', 'Calle landivar Nro 300', 'f', 's', 'orh+', 7321888);
INSERT INTO ALUMNO VALUES (444,7993456,'Carlos Camacho', NULL , 'm', 's', 'orh+', 7788889);
INSERT INTO ALUMNO VALUES (555,7594561,'Patricia Aguilera', 'Av. Junin', 'f', 'c', 'orh+', 73129376);
INSERT INTO ALUMNO VALUES (777,7594888,'Juan Perez', 'Av. Junin Nro 200', 'm', 'v', 'orh+', 73129111);

SELECT * FROM ALUMNO;

-- Mostrar los alumnos masculinos (hombres)
SELECT * FROM ALUMNO
WHERE SEXO = 'm';

-- Mostrar las alumnas femininas (mujeres)
SELECT * FROM ALUMNO
WHERE SEXO = 'f';

-- Mostrar el registro y el nombre de las alumnas casadas 
SELECT REGISTRO, NOMBRE
FROM ALUMNO
WHERE SEXO='f' AND ESTADOCIVIL='c';

-- Mostrar todos los alumnos dónde su nombre comienza con cache C
SELECT * FROM ALUMNO
WHERE NOMBRE LIKE 'C%';

-- Mostrar los alumnos que tienen teléfono
SELECT * FROM ALUMNO
WHERE TELEFONO IS NOT NULL;

-- Mostrar los alumnos que no tienen dirección o aquellos que no tienen telefono
SELECT * FROM ALUMNO
WHERE DIRECCION IS NULL OR TELEFONO IS NULL;

-- Mostrar todos los alumnos solteros
SELECT * FROM ALUMNO
WHERE ESTADOCIVIL='s';

-- Mostrar todos los alumnos solteros de manera ascendente por nombre
SELECT * FROM ALUMNO
WHERE ESTADOCIVIL='s'
ORDER BY NOMBRE ASC;

-- Mostrar todos los alumnos solteros de manera descendente por nombre
SELECT * FROM ALUMNO
WHERE ESTADOCIVIL='s'
ORDER BY NOMBRE DESC;

-- Mostrar la cantidad de alumnos varones
SELECT COUNT(*) FROM ALUMNO
WHERE SEXO='m';

-- Mostrar solteros y viudos
SELECT * FROM ALUMNO
WHERE ESTADOCIVIL='s' OR ESTADOCIVIL='v';

-- Mostrar solteros y viudad usando tuplas
SELECT * FROM ALUMNO
WHERE ESTADOCIVIL IN ('s','v');

-- Cambiar el nombre
UPDATE ALUMNO
SET NOMBRE = 'Joaquin Chumager'
WHERE REGISTRO=444;

-- Eliminar la tabla o la base de datos
DROP TABLE ALUMNO;
DROP DATABASE UNIVERSIDAD2025;

-- Agregar atributo a la tabla
ALTER TABLE ALUMNO
ADD COLUMN FECHANACIMIENTO DATE NOT NULL
DEFAULT '1000-01-01';

-- Quitar atributo de la tabla
ALTER TABLE ALUMNO
DROP COLUMN FECHANACIMIENTO;

SELECT * FROM ALUMNO;

-- Actualizar fecha
UPDATE ALUMNO
SET FECHANACIMIENTO='2001-1-20'
WHERE REGISTRO=222;