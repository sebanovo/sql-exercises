CREATE DATABASE MALLAINFORMATICA;
USE MALLAINFORMATICA;

CREATE TABLE MATERIA
(
	SIGLA VARCHAR(6) NOT NULL PRIMARY KEY,
    NOMBRE VARCHAR(50) NOT NULL,
    SEMESTRE TINYINT NOT NULL
);

CREATE TABLE PRERREQUISITO
(
	SIGLAMAT VARCHAR(6) NOT NULL,
    SIGLAPRE VARCHAR(6) NOT NULL,
    PRIMARY KEY (SIGLAMAT, SIGLAPRE),
    FOREIGN KEY (SIGLAMAT)
		REFERENCES MATERIA(SIGLA)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
	FOREIGN KEY (SIGLAPRE)
		REFERENCES MATERIA(SIGLA)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Materias
INSERT INTO MATERIA VALUES('MAT101', 'CALCULO I',1);
INSERT INTO MATERIA VALUES('INF119', 'ESTRUCTURAS DISCRETAS',1);
INSERT INTO MATERIA VALUES('INF110', 'INTRODUCCION A LA INFORMATICA',	1);
INSERT INTO MATERIA VALUES('FIS100', 'FISICA I',	1);
INSERT INTO MATERIA VALUES('LIN100', 'INGLES TECNICO I',	1);
INSERT INTO MATERIA VALUES('MAT102', 'CALCULO II',	2);
INSERT INTO MATERIA VALUES('MAT103', 'ALGEBRA LINEAL',	2);
INSERT INTO MATERIA VALUES('INF120', 'PROGRAMACION I',	2);
INSERT INTO MATERIA VALUES('FIS102', 'FISICA II',	2);
INSERT INTO MATERIA VALUES('LIN101', 'INGLES TECNICO II',2);
INSERT INTO MATERIA VALUES('MAT207', 'ECUACIONES DIFERENCIALES',	3);
INSERT INTO MATERIA VALUES('INF210', 'PROGRAMACION II',	3);
INSERT INTO MATERIA VALUES('INF211', 'ARQUITECTURA DE COMPUTADORAS',	3);
INSERT INTO MATERIA VALUES('FIS200', 'FISICA III',	3);
INSERT INTO MATERIA VALUES('ADM100', 'ADMINISTRACION',	3);
INSERT INTO MATERIA VALUES('MAT202', 'PROBABILIDADES Y ESTADISTICAS I',	4);
INSERT INTO MATERIA VALUES('MAT205', 'METODOS NUMERICOS',	4);
INSERT INTO MATERIA VALUES('INF220', 'ESTRUCTURA DE DATOS I',	4);
INSERT INTO MATERIA VALUES('INF221', 'PROGRAMACION ENSAMBLADOR',	4);
INSERT INTO MATERIA VALUES('ADM200', 'CONTABILIDAD',	4);
INSERT INTO MATERIA VALUES('MAT302', 'PROBABILIDADES Y ESTADISTICAS II',	5);
INSERT INTO MATERIA VALUES('INF318', 'PROGRAMACION LOGICA Y FUNCIONAL',	5);
INSERT INTO MATERIA VALUES('INF310', 'ESTRUCTURA DE DATOS II',	5);
INSERT INTO MATERIA VALUES('INF312', 'BASE DE DATOS I',	5);
INSERT INTO MATERIA VALUES('INF319', 'LENGUAJES FORMALES',	5);
INSERT INTO MATERIA VALUES('MAT329', 'INVESTIGACION OPERATIVA I',	6);
INSERT INTO MATERIA VALUES('INF342', 'SISTEMAS DE INFORMACION I',	6);
INSERT INTO MATERIA VALUES('INF323', 'SISTEMAS OPERATIVOS I',	6);
INSERT INTO MATERIA VALUES('INF322', 'BASE DE DATOS II',	6);
INSERT INTO MATERIA VALUES('INF329', 'COMPILADORES',	6);
INSERT INTO MATERIA VALUES('MAT419', 'INVESTIGACION OPERATIVA II',	7);
INSERT INTO MATERIA VALUES('INF418', 'INTELIGENCIA ARTIFICIAL',	7);
INSERT INTO MATERIA VALUES('INF413', 'SISTEMAS OPERATIVOS II',	7);
INSERT INTO MATERIA VALUES('INF433', 'REDES I',	7);
INSERT INTO MATERIA VALUES('INF412', 'SISTEMAS DE INFORMACION II',	7);
INSERT INTO MATERIA VALUES('ECO449', 'PREPARACION Y EVALUACION DE PROYECTOS', 8);
INSERT INTO MATERIA VALUES('INF428', 'SISTEMAS EXPERTOS',	8);
INSERT INTO MATERIA VALUES('INF442', 'SISTEMAS DE INFORMACION GEOGRAFICA',	8);
INSERT INTO MATERIA VALUES('INF423', 'REDES II',	8);
INSERT INTO MATERIA VALUES('INF422', 'INGENIERIA DE SOFTWARE I',	8);
INSERT INTO MATERIA VALUES('INF511', 'TALLER DE GRADO I',	9);
INSERT INTO MATERIA VALUES('INF512', 'INGENIERIA DE SOFTWARE II',	9);
INSERT INTO MATERIA VALUES('INF513', 'TECNOLOGIA WEB',	9);
INSERT INTO MATERIA VALUES('INF552', 'ARTECTURA DE SOFTWARE',	9);
INSERT INTO MATERIA VALUES('GRL001', 'MODALIDAD DE TITULACION LICENCIATURA',	10);

-- Materías electivas
INSERT INTO MATERIA VALUES('ELC101', 'MODELACION Y SIMULACION DE SISTEMAS',	5);
INSERT INTO MATERIA VALUES('ELC102', 'PROGRAMACION GRAFICA',	5);
INSERT INTO MATERIA VALUES('ELC103', 'TOPICOS AVANZADOS DE PROGRAMACION',	6);
INSERT INTO MATERIA VALUES('ELC104', 'PROGRAMACION DE APLICACIONES DE TIEMPO REAL',	6);
INSERT INTO MATERIA VALUES('ELC105', 'SISTEMAS DISTRIBUIDOS',	7);
INSERT INTO MATERIA VALUES('ELC106', 'INTERACCION HOMBRE COMPUTADOR',	7);
INSERT INTO MATERIA VALUES('ELC107', 'CRIPTOGRAFIA Y SEGURIDAD',	8);
INSERT INTO MATERIA VALUES('ELC108', 'CONTROL Y AUTOMATIZACION',	8);

-- Prerrequisitos
INSERT INTO PRERREQUISITO VALUES('MAT102', 'MAT101');
INSERT INTO PRERREQUISITO VALUES('MAT103', 'INF119');
INSERT INTO PRERREQUISITO VALUES('INF120', 'INF110');
INSERT INTO PRERREQUISITO VALUES('FIS102', 'FIS100');
INSERT INTO PRERREQUISITO VALUES('LIN101', 'LIN100');
INSERT INTO PRERREQUISITO VALUES('MAT207', 'MAT102');
INSERT INTO PRERREQUISITO VALUES('INF210', 'MAT103');
INSERT INTO PRERREQUISITO VALUES('INF210', 'INF120');
INSERT INTO PRERREQUISITO VALUES('INF211', 'INF120');
INSERT INTO PRERREQUISITO VALUES('INF211', 'FIS102');
INSERT INTO PRERREQUISITO VALUES('FIS200', 'FIS102');
INSERT INTO PRERREQUISITO VALUES('MAT202', 'MAT102');
INSERT INTO PRERREQUISITO VALUES('MAT205', 'MAT207');
INSERT INTO PRERREQUISITO VALUES('INF220', 'INF210');
INSERT INTO PRERREQUISITO VALUES('INF221', 'INF211');
INSERT INTO PRERREQUISITO VALUES('ADM200', 'ADM100');
INSERT INTO PRERREQUISITO VALUES('MAT302', 'MAT202');
INSERT INTO PRERREQUISITO VALUES('INF318', 'INF220');
INSERT INTO PRERREQUISITO VALUES('INF310', 'INF220');
INSERT INTO PRERREQUISITO VALUES('INF312', 'INF220');
INSERT INTO PRERREQUISITO VALUES('INF319', 'INF220');
INSERT INTO PRERREQUISITO VALUES('MAT329', 'MAT302');
INSERT INTO PRERREQUISITO VALUES('INF342', 'INF312');
INSERT INTO PRERREQUISITO VALUES('INF323', 'INF310');
INSERT INTO PRERREQUISITO VALUES('INF322', 'INF312');
INSERT INTO PRERREQUISITO VALUES('INF329', 'INF310');
INSERT INTO PRERREQUISITO VALUES('INF329', 'INF319');
INSERT INTO PRERREQUISITO VALUES('MAT419', 'MAT329');
INSERT INTO PRERREQUISITO VALUES('INF418', 'INF318');
INSERT INTO PRERREQUISITO VALUES('INF418', 'INF310');
INSERT INTO PRERREQUISITO VALUES('INF413', 'INF323');
INSERT INTO PRERREQUISITO VALUES('INF433', 'INF323');
INSERT INTO PRERREQUISITO VALUES('INF412', 'INF342');
INSERT INTO PRERREQUISITO VALUES('INF412', 'INF322');
INSERT INTO PRERREQUISITO VALUES('ECO449', 'MAT419');
INSERT INTO PRERREQUISITO VALUES('INF428', 'INF418');
INSERT INTO PRERREQUISITO VALUES('INF428', 'INF412');
INSERT INTO PRERREQUISITO VALUES('INF442', 'INF412');
INSERT INTO PRERREQUISITO VALUES('INF423', 'INF433');
INSERT INTO PRERREQUISITO VALUES('INF422', 'INF412');
INSERT INTO PRERREQUISITO VALUES('INF511', 'ECO449');
INSERT INTO PRERREQUISITO VALUES('INF511', 'INF422');
INSERT INTO PRERREQUISITO VALUES('INF512', 'INF428');
INSERT INTO PRERREQUISITO VALUES('INF513', 'INF442');
INSERT INTO PRERREQUISITO VALUES('INF552', 'INF423');
INSERT INTO PRERREQUISITO VALUES('GRL001', 'INF513');
INSERT INTO PRERREQUISITO VALUES('GRL001', 'INF511');
INSERT INTO PRERREQUISITO VALUES('GRL001', 'INF512');
INSERT INTO PRERREQUISITO VALUES('GRL001', 'INF513');
INSERT INTO PRERREQUISITO VALUES('GRL001', 'INF552');

-- Que materias son prerrequisitos para llevar arquitectura de computadoras
SELECT MATERIAPRE.SIGLA, MATERIAPRE.NOMBRE
FROM MATERIA , PRERREQUISITO, MATERIA MATERIAPRE
WHERE MATERIA.SIGLA = PRERREQUISITO.SIGLAMAT
AND PRERREQUISITO.SIGLAPRE = MATERIAPRE.SIGLA
AND MATERIA.NOMBRE = 'ARQUITECTURA DE COMPUTADORAS';

-- anidado
SELECT SIGLA, NOMBRE
FROM MATERIA
WHERE SIGLA IN
(
	SELECT SIGLAPRE
    FROM PRERREQUISITO
    WHERE SIGLAMAT IN
    (
		SELECT SIGLA
        FROM MATERIA
        WHERE NOMBRE = 'ARQUITECTURA DE COMPUTADORAS'
	)
);

-- De que materias es prerrequisito es ESTRUCTURA DE DATOS II
SELECT MATSIGUEN.SIGLA, MATSIGUEN.NOMBRE
FROM PRERREQUISITO R, MATERIA MATPRE, MATERIA MATSIGUEN
WHERE MATPRE.SIGLA = R.SIGLAPRE
AND  R.SIGLAMAT = MATSIGUEN.SIGLA
AND MATPRE.NOMBRE = 'ESTRUCTURA DE DATOS II';

-- anidada
SELECT SIGLA, NOMBRE
FROM MATERIA
WHERE SIGLA IN
(
	SELECT SIGLAMAT
    FROM PRERREQUISITO
    WHERE SIGLAPRE IN
    (
		SELECT SIGLA
        FROM MATERIA
        WHERE NOMBRE = 'ESTRUCTURA DE DATOS II'
	)
);

-- MOSTRAR LAS MATERIAS QUE NO TIENEN PRERREQUISITOS
-- version chatgpt
SELECT M.SIGLA, M.NOMBRE
FROM MATERIA M
WHERE NOT EXISTS (
  SELECT 1
  FROM PRERREQUISITO P
  WHERE P.SIGLAMAT = M.SIGLA
);

-- anidada
SELECT SIGLA, NOMBRE
FROM MATERIA
WHERE SIGLA NOT IN
(
	SELECT SIGLAMAT
    FROM PRERREQUISITO
);