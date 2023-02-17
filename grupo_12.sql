-- Actividad de desarrollo (AD-5) realizada con mySQL
DROP DATABASE IF EXISTS AD5;
CREATE DATABASE IF NOT EXISTS AD5;
USE AD5;

CREATE TABLE IF NOT EXISTS CENTROS (
NUMCE INT(4) NOT NULL, NOMCE VARCHAR(25), DIRCE VARCHAR(25),
PRIMARY KEY (NUMCE));

CREATE TABLE IF NOT EXISTS DEPARTAMENTOS (
NUMDE INT(3) NOT NULL, NUMCE INT(4), DIREC INT(3), TIDIR CHAR(1), PRESU INT(3.1), DEPDE INT(3), NOMDE VARCHAR(20),
PRIMARY KEY (NUMDE),
CONSTRAINT FOREIGN KEY (NUMCE) REFERENCES CENTROS(NUMCE),
CONSTRAINT FOREIGN KEY (DEPDE) REFERENCES DEPARTAMENTOS(NUMDE));

CREATE TABLE IF NOT EXISTS EMPLEADOS (
NUMEM INT(3) NOT NULL, EXTEL INT(3), FECNA DATE, FECIN DATE, SALAR INT(5), COMIS INT(3), NUMHI INT(1), NOMEM VARCHAR(10), NUMDE INT(3),
PRIMARY KEY (NUMEM),
CONSTRAINT FOREIGN KEY (NUMDE) REFERENCES DEPARTAMENTOS(NUMDE));

-- Centros
INSERT INTO CENTROS (NUMCE, NOMCE, DIRCE) VALUES
(10, "Sede central", "C/ Atocha 820, Madrid"),
(20, "Relación con clientes", "C/ Atocha 405, Madrid");
-- Tipo de empleados
INSERT INTO DEPARTAMENTOS (NUMDE, NUMCE, DIREC, TIDIR, PRESU, DEPDE, NOMDE) VALUES
(100, 10, 260, "P", 72, null, "Dirección general"),
(110, 20, 180, "P", 90, 100, "Dirección comercial"),
(111, 20, 180, "F", 66, 110, "Sector industrial"),
(112, 20, 270, "P", 54, 110, "Sector servicios"),
(120, 10, 150, "F", 18, 100, "Organización"),
(121, 10, 150, "P", 12, 120, "Personal"),
(122, 10, 350, "P", 36, 120, "Proceso de datos"),
(130, 10, 310, "P", 12, 100, "Finanzas");
-- Insert de empleados
INSERT INTO EMPLEADOS (NUMEM, EXTEL, FECNA, FECIN, SALAR, COMIS, NUMHI, NOMEM, NUMDE) VALUES
(110, 350, '1970-11-10', '1985-02-15', 1800, NULL, 3, "César", 121),
(120, 840, '1968-06-09', '1988-10-01', 1900, 110, 1, "Mario", 112),
(130, 810, '1965-09-09', '1981-02-01', 1500, 110, 2, "Luciano", 112),
(150, 340, '1972-08-10', '1997-01-15', 2600, NULL, 0, "Julio", 121),
(160, 740, '1980-07-09', '2005-11-11', 1800, 110, 2, "Aureo", 111),
(180, 508, '1974-10-18', '1996-03-18', 2800, 50, 2, "Marcos", 110),
(190, 350, '1972-05-12', '1992-02-11', 1750, NULL, 4, "Juliana", 121),
(210, 200, '1970-09-28', '1999-01-22', 1910, NULL, 2, "Pilar", 100),
(240, 760, '1967-02-26', '1989-02-24', 1700, 100, 3, "Lavinia", 111),
(250, 250, '1976-10-27', '1997-03-01', 2700, NULL, 0, "Adriana", 100),
(260, 220, '1973-12-03', '2001-07-12', 720, NULL, 6, "Antonio", 100),
(270, 800, '1975-05-21', '2003-09-10', 1910, 80, 3, "Octavio", 112),
(280, 410, '1978-01-10', '2010-10-08', 1500, NULL, 5, "Dorotea", 130),
(285, 620, '1979-10-25', '2011-02-15', 1910, NULL, 0, "Otilia", 122),
(290, 910, '1967-11-30', '1988-02-14', 1790, NULL, 3, "Gloria", 120),
(310, 480, '1976-11-21', '2001-01-15', 1950, NULL, 0, "Augusto", 130),
(320, 620, '1977-12-25', '2003-02-05', 2400, NULL, 2, "Cornelio", 122),
(330, 850, '1958-08-19', '1980-03-01', 1700, 90, 0, "Amelia", 112),
(350, 610, '1979-04-13', '1999-09-10', 2700, NULL, 1, "Aurelio", 122),
(360, 750, '1978-10-29', '1998-10-10', 1800, 100, 2, "Dorinda", 111),
(370, 360, '1977-06-22', '2000-01-20', 1860, NULL, 1, "Fabiola", 121),
(380, 880, '1978-03-30', '1999-01-01', 1100, NULL, 0, "Micaela", 112),
(390, 500, '1976-02-19', '2010-10-08', 1290, NULL, 1, "Carmen", 110),
(400, 780, '1979-08-18', '2011-11-01', 1150, NULL, 0, "Lucrecia", 111),
(410, 660, '1968-07-14', '1989-10-13', 1010, NULL, 0, "Azucena", 122),
(420, 450, '1966-10-22', '1988-11-19', 2400, NULL, 0, "Claudia", 130),
(430, 650, '1967-10-26', '1988-11-19', 1260, NULL, 1, "Valeriana", 122), 
(440, 760, '1966-09-26', '1986-02-28', 1260, 100, 0, "Livia", 111),
(450, 880, '1966-10-21', '1986-02-28', 1260, 100, 0, "Sabina", 112),
(480, 760, '1965-04-04', '1986-02-28', 1260, 100, 1, "Diana", 111),
(490, 880, '1964-06-06', '1988-01-01', 1090, 100, 0, "Horacio", 112),
(500, 750, '1965-10-08', '1987-01-01', 1200, 100, 0, "Honoria", 111), 
(510, 550, '1966-05-04', '1986-11-01', 1200, NULL, 1, "Rómulo", 110),
(550, 780, '1970-01-10', '1998-01-21', 600, 120, 0, "Sancho", 111);

-- 1.
/*Primero creo la tabla (que llamo Apoyo01) intersección de las tablas EMPLEADOS, DEPARTAMENTOS Y CENTROS;
de campos NUMDE, NOMDE, NOMCE, PRESU, salarmaxpordpto  admitiendo únicamente registros donde PRESU<35, agrupada
por NUMDE y ordenada alfábeticamente por NOMDE.
Segundo hago una consulta de selección sobre Apoyo01 para quedarnos solo con los registros cuyo Salarmaxpordpto>1500*/
CREATE TABLE Apoyo01 SELECT NUMDE, NOMDE, NOMCE, PRESU, MAX(SALAR) as Salarmaxpordpto FROM EMPLEADOS
INNER JOIN DEPARTAMENTOS USING(NUMDE)
INNER JOIN CENTROS USING(NUMCE)
WHERE PRESU<35
GROUP BY NUMDE ORDER BY NOMDE;
SELECT NOMDE, NOMCE, PRESU, Salarmaxpordpto FROM Apoyo01 WHERE salarmaxpordpto>1500;

-- 2.
/*Primero: partir de la tabla DEPARTAMENTOS creo una tabla (que llamo Apoyo02) admitiendo únicamente registros
cuyo DEPDE se corresponde con un departamento cuyo PRESU<30, y ordenada por NUMDE.
Segundo: hago una consulta de selección incorporando a Apoyo2 los campos Nombredptodelquedepende, Presudeldptodelquedepende*/
CREATE TABLE Apoyo02 SELECT NUMDE, NOMDE, DEPDE FROM DEPARTAMENTOS
WHERE DEPDE IN (SELECT NUMDE FROM DEPARTAMENTOS WHERE PRESU<30)
ORDER BY NOMDE;
SELECT Apoyo02.NOMDE, Apoyo02.DEPDE,
DEPARTAMENTOS.NOMDE AS Nombredptodelquedepende,
DEPARTAMENTOS.PRESU AS Presudeldptodelquedepende
FROM Apoyo02
LEFT JOIN DEPARTAMENTOS ON DEPARTAMENTOS.NUMDE=Apoyo02.DEPDE;

-- 3.
/*Primero: a partir de EMPLEADOS creo una tabla (Apoyo03_1) con un único campo y registro y que contiene el salario medio en la empresa.
Segundo: a partir de EMPLEADOS creo una tabla (Apoyo03_2) con un solo campo que es salarioavgdpto (salario medio de cada departamento).
Tercero: a partir de Apoyo03_1 y Apoyo03_2 creo una tabla (Apoyo03_3) como la de Apoyo03_2 pero restriendo sus registros a aquellos donde salarioavgdpto>salarioavg.
Cuarto: hago una consulta de selección incorporando a Apoyo03_3 el campo NOMDE.*/
CREATE TABLE Apoyo03_1 SELECT AVG(SALAR) as Salarioavg FROM EMPLEADOS;
CREATE TABLE Apoyo03_2 SELECT NUMDE, AVG(SALAR) as Salarioavgdpto FROM EMPLEADOS GROUP BY NUMDE;
CREATE TABLE Apoyo03_3 SELECT NUMDE, Salarioavgdpto FROM Apoyo03_2, Apoyo03_1 WHERE Salarioavgdpto>salarioavg;
SELECT NOMDE, Salarioavgdpto FROM Apoyo03_3
LEFT JOIN DEPARTAMENTOS ON Apoyo03_3.NUMDE=DEPARTAMENTOS.NUMDE;

-- 4.
/*Hago una consulta de selección sobre EMPLEADOS admitiendo únicamente registros cuyo NUMDE se corresponde con un director que está en funciones, agrupando
los registros por NUMDE, y proporcionando para cada departamento el n.º total de empleados, su masa salarial, su masa en cuanto a comisiones y el n.º total de hijos.*/
SELECT NUMDE, COUNT(NUMEM), SUM(SALAR), SUM(COMIS), SUM(NUMHI) FROM EMPLEADOS WHERE NUMDE IN (SELECT NUMDE FROM DEPARTAMENTOS WHERE TIDIR='F') GROUP BY NUMDE;

-- 5.
/*Hago una consulta de selección sobre EMPLEADOS admitiendo únicamente registros cuyo NUMDE se corresponde con un PRESU>35, agrupando
los registros por EXTEL, y proporcionando para cada EXTEL el n.º total de empleados*/
SELECT EXTEL, COUNT(NUMEM) FROM EMPLEADOS WHERE NUMDE IN (SELECT NUMDE FROM DEPARTAMENTOS WHERE PRESU>35) GROUP BY EXTEL;

-- 6.
/*Hago una consulta de selección sobre EMPLEADOS admitiendo únicamente registros cuyo NUMEM está en un departamento con director en funciones, ordenando
los registros por NOMEM, y proporcionando para cada NOMEM el n.º total de hijos*/
SELECT NUMEM, NOMEM, NUMHI FROM EMPLEADOS WHERE NUMEM IN (SELECT DIREC FROM DEPARTAMENTOS WHERE TIDIR='F') ORDER BY NOMEM;

-- 7.
/*Primero a partir de EMPLEADOS creo una tabla (Apoyo07_1) que contiene el número de empleados de cada departamente que tiene al menos un empleado
/*Segundo creo una tabla (Apoyo07_2) que contiene el número de empleados de cada departamento (pudiendo ser este número null, es decir 0 empleados);*/
/*Sobre Apoyo07_2 me quedo únicamente con los resgistros que simultáneamente tienen un Numempdpto nulo y un DIREC nulo.*/
CREATE TABLE Apoyo07_1 SELECT NUMDE, COUNT(NOMEM) AS Numempdpto FROM EMPLEADOS GROUP BY NUMDE;
CREATE TABLE Apoyo07_2 SELECT DEPARTAMENTOS.NUMDE, Numempdpto, DIREC FROM DEPARTAMENTOS LEFT JOIN Apoyo07_1 ON DEPARTAMENTOS.NUMDE=Apoyo07_1.NUMDE;
SELECT * FROM Apoyo07_2 WHERE Numempdpto IS NULL AND DIREC IS NULL;

-- 8.
/*Añado un nuevo departamento llamado "Nuevo" cuyo director está en funciones. No se conoce más datos del departamento.
Hay que poner un NUMDE por ser esta clave primaria. Se ha escogido como NUMDE el 140.*/
INSERT INTO DEPARTAMENTOS (NUMDE, NUMCE, DIREC, TIDIR, PRESU, DEPDE, NOMDE) VALUES
(140, null, null, "F", null, null, "Nuevo");

-- 9.
/*Añado un nuevo empleado llamado "Norberto" que no tiene departamento asignado.
Hay que poner un NOMEM por ser esta clave primaria. Se ha escogido como NOMEM el 560.*/
INSERT INTO EMPLEADOS (NUMEM, EXTEL, FECNA, FECIN, SALAR, COMIS, NUMHI, NOMEM, NUMDE) VALUES
(560, 350, '1990-11-10', '2012-02-15', 2100, NULL, 2, "Norberto", NULL);

-- 10.
DROP TABLE Apoyo07_1; DROP TABLE Apoyo07_2;
/*Códigos repetidos del punto 7*/
CREATE TABLE Apoyo07_1 SELECT NUMDE, COUNT(NOMEM) AS Numempdpto FROM EMPLEADOS GROUP BY NUMDE;
CREATE TABLE Apoyo07_2 SELECT DEPARTAMENTOS.NUMDE, Numempdpto, DIREC FROM DEPARTAMENTOS LEFT JOIN Apoyo07_1 ON DEPARTAMENTOS.NUMDE=Apoyo07_1.NUMDE;
/*Sobre Apoyo07_2 me quedo únicamente con los resgistros que tienen un Numempdpto nulo*/
SELECT NUMDE, Numempdpto, DIREC FROM Apoyo07_2 WHERE Numempdpto IS NULL;

-- 11.
/*Primero creo una tabla (Apoyo11) donde aparecen todos los departamentos y para cada departamento se da el nombre de todos sus empleados (si es que tiene alguno)
/*Segundo hago una consulta de selección sobre Apoyo11 quedándome con los registros cuyo NUMEM es NULL.*/
CREATE TABLE Apoyo11 SELECT DEPARTAMENTOS.NUMDE, NOMDE, DIREC, NUMEM, NOMEM FROM DEPARTAMENTOS LEFT JOIN EMPLEADOS ON DEPARTAMENTOS.NUMDE=EMPLEADOS.NUMDE;
SELECT NOMDE, NOMEM FROM Apoyo11 WHERE NUMEM IS NULL;

-- 12.
/*Mismo razonamiento que en el punto 11 pero usando RIGHT JOIN*/
CREATE TABLE Apoyo12 SELECT DEPARTAMENTOS.NUMDE, NOMDE, DIREC, NUMEM, NOMEM FROM EMPLEADOS RIGHT JOIN DEPARTAMENTOS ON DEPARTAMENTOS.NUMDE=EMPLEADOS.NUMDE;
SELECT NOMDE, NOMEM FROM Apoyo12 WHERE NUMEM IS NULL;

-- 13.
/*Primero creo una tabla (Apoyo13) donde aparecen todos los empleados y para cada empleado se da su departamento (si es que tiene uno asignado).
Segundo hago una consulta de selección sobre Apoyo13 quedándome con los registros cuyo NUMDE es NULL.*/
CREATE TABLE Apoyo13 SELECT DEPARTAMENTOS.NUMDE, NOMDE, DIREC, NUMEM, NOMEM FROM EMPLEADOS LEFT JOIN DEPARTAMENTOS ON EMPLEADOS.NUMDE=DEPARTAMENTOS.NUMDE;
SELECT NOMEM, NOMDE FROM Apoyo13 WHERE NUMDE IS NULL;

-- 14.
/*Mismo razonamiento que en el punto 14 pero usando RIGHT JOIN*/
CREATE TABLE Apoyo14 SELECT DEPARTAMENTOS.NUMDE, NOMDE, DIREC, NOMEM FROM DEPARTAMENTOS RIGHT JOIN EMPLEADOS ON EMPLEADOS.NUMDE=DEPARTAMENTOS.NUMDE;
SELECT NOMEM, NOMDE FROM Apoyo14 WHERE NUMDE IS NULL;

-- 15.
-- Nota previa: No existe FULL OUTER JOIN en MySQL. Pongo en su lugar UNION
-- Dado que el enunciado no especifica campos, ponemos * lo cual implica NUMDE, NOMDE, DIREC, NUMEM, NOMEM
SELECT * FROM Apoyo11 WHERE NOMEM IS NULL UNION SELECT * FROM Apoyo13 WHERE NUMDE IS NULL;

-- 16.
-- Dado que el enunciado no especifica campos, pongo por ejemplo NUMDE, NOMDE, DIREC, NUMEM, NOMEM 
SELECT NUMEM, NOMEM, DEPARTAMENTOS.NUMDE, NOMDE, DIREC 
FROM EMPLEADOS INNER JOIN DEPARTAMENTOS ON EMPLEADOS.NUMDE=DEPARTAMENTOS.NUMDE
ORDER BY NUMEM;
/*No salen ni el departamento "Nuevo" ni el empleado "Norberto". Esto se debe a que con INNER JOIN estoy haciendo la intersección de EMPLEADOS (tengan o no
departamento asignado) con DEPARTAMENTOS (tengan o no empleados asignados) lo cual resulta en los empleados que tienen asignado departamento.*/

-- 17.
SELECT NUMEM, NOMEM, DEPARTAMENTOS.NUMDE, NOMDE, DIREC 
FROM EMPLEADOS INNER JOIN DEPARTAMENTOS ON EMPLEADOS.NUMDE=DEPARTAMENTOS.NUMDE
WHERE DEPARTAMENTOS.NUMDE IS NULL ORDER BY NUMEM;
/*No aparece ningún resultado porque la consulta del punto 16 solo proporcionaba los empleados que tienen asignado departamento. La condición
escrita NUMDE IS NULL ya venía implícita en la consulta*/

-- 18.
/*Hacemos una consulta de selección que contiene como registros a todos los empleados e incorporamos como campos datos relativos al departamento de cada empleado.
No saldrán los empleados que no tienen departamento asignado ni los departamentos sin empleados asignados.*/
SELECT NUMEM, NOMEM, DEPARTAMENTOS.NUMDE, NOMDE, DIREC FROM EMPLEADOS NATURAL JOIN DEPARTAMENTOS ORDER BY NUMEM;

-- 19.
/*Hacemos la consulta que nos va a proporcionar absolutamente todos los datos proporcionados por las tablas del enunciado. Cada centro tiene asignados departamentos
y cada departamento tiene asignados empleados, por lo que hay un registro para empleado.
No saldrán los empleados que no tienen departamento asignado ni los departamentos sin empleados asignados.*/
SELECT * FROM CENTROS NATURAL JOIN EMPLEADOS NATURAL JOIN DEPARTAMENTOS;

-- 20.
/*Primero elimino el modo seguro y con ello posibilito la eliminación de registros imponiendo una condición que involucra a claves no primarias.
Segundo procedo a la eliminación de los registros indicados.
Tercero devuelvo a MySQL a su modo seguro.*/
SET SQL_SAFE_UPDATES=0;
DELETE FROM DEPARTAMENTOS WHERE NOMDE = 'Nuevo';
DELETE FROM EMPLEADOS WHERE NOMEM = 'Norberto';
SET SQL_SAFE_UPDATES=1;
/* Otra opción sería haber seguido en modo seguro y haber eliminado los registros pedidos imponiendo una condición que involucra a claves primarias.
DELETE FROM DEPARTAMENTOS WHERE NUMDE = 140;
DELETE FROM EMPLEADOS WHERE NUMEM = 560;*/