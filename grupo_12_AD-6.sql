-- Código desarrollado con MySQL
drop database if exists AD6;
create database if not exists AD6;
use AD6;

/*Las 24 tablas se han creado en este orden:
ComunidadAutónoma, ParqueNatural, CA_PN, Alojamiento, Excursión, Visitante, E_V, A_V,
Especie, Animal, Vegetal, Mineral, Area, E_A, Entrada, Personal, Convervador, Vigilante,
Vehiculo, Investigador, Gestor, Proyecto, I_P;*/

CREATE TABLE IF NOT EXISTS ComunidadAutonoma (
CodCA tinyint(2) unsigned, Nombre varchar(20), OrgResponsable varchar(30)
);
ALTER TABLE ComunidadAutonoma ADD PRIMARY KEY (CodCA);

CREATE TABLE IF NOT EXISTS ParqueNatural (
CodPN tinyint(2) unsigned not null, Nombre varchar(30), FechaDeclaracion date
);
ALTER TABLE ParqueNatural ADD PRIMARY KEY (CodPN);

CREATE TABLE IF NOT EXISTS CA_PN (
CodCA tinyint(2) unsigned not null, CodPN tinyint(2) unsigned, Superficie int(6)
);
ALTER TABLE CA_PN
ADD PRIMARY KEY (CodCA, CodPN),
ADD FOREIGN KEY (CodCA) REFERENCES ComunidadAutonoma(CodCA),
ADD FOREIGN KEY (CodPN) REFERENCES ParqueNatural(CodPN);

CREATE TABLE IF NOT EXISTS Alojamiento (
CodAlojamiento char(4) not null, Categoria varchar(20), Capacidad int(4), CodPN tinyint(2) unsigned
);
ALTER TABLE Alojamiento 
ADD PRIMARY KEY (CodAlojamiento),
ADD FOREIGN KEY (CodPN) REFERENCES ParqueNatural(CodPN);

CREATE TABLE IF NOT EXISTS Excursion (
CodExcursion char(5) not null, Fecha date, hora time, aPie boolean, CodAlojamiento char(4)
);
ALTER TABLE Excursion
ADD PRIMARY KEY (CodExcursion),
ADD FOREIGN KEY (CodAlojamiento) REFERENCES Alojamiento(CodAlojamiento);

CREATE TABLE IF NOT EXISTS Visitante (
DNI char(9) not null, Nombre varchar(30), Domicilio varchar(35), Profesion varchar(20)
);
ALTER TABLE Visitante
ADD PRIMARY KEY (DNI);

CREATE TABLE IF NOT EXISTS E_V (
CodExcursion char(5) not null, DNI char(9) not null
);
ALTER TABLE E_V
ADD PRIMARY KEY (DNI, CodExcursion),
ADD FOREIGN KEY (DNI) REFERENCES Visitante(DNI),
ADD FOREIGN KEY (CodExcursion) REFERENCES Excursion(CodExcursion);

CREATE TABLE IF NOT EXISTS A_V (
CodAlojamiento char(4) not null, DNI char(9), FechaInicio date, FechaFin date
);
ALTER TABLE A_V
ADD PRIMARY KEY (CodAlojamiento, DNI, FechaInicio),
ADD FOREIGN KEY (DNI) REFERENCES Visitante(DNI),
ADD FOREIGN KEY (CodAlojamiento) REFERENCES Alojamiento(CodAlojamiento);

CREATE TABLE IF NOT EXISTS Especie (
CodEspecie int(6) not null, NombreCientifico varchar(35), NombreVulgar varchar(30)
);
ALTER TABLE Especie ADD PRIMARY KEY (CodEspecie); 

CREATE TABLE IF NOT EXISTS Animal (
CodEspecie int(6) not null, Alimentacion varchar(20), PeriodoCelo varchar(12)
);
ALTER TABLE Animal
ADD PRIMARY KEY (CodEspecie),
ADD FOREIGN KEY (CodEspecie) REFERENCES Especie(CodEspecie);

CREATE TABLE IF NOT EXISTS Vegetal (
CodEspecie int(6) not null, Floracion varchar(12), periodoFloracion varchar(24)
);
ALTER TABLE Vegetal
ADD PRIMARY KEY (CodEspecie),
ADD FOREIGN KEY (CodEspecie) REFERENCES Especie(CodEspecie);

CREATE TABLE IF NOT EXISTS Mineral (
CodEspecie int(6) not null, Tipo varchar(20)
);
ALTER TABLE Mineral
ADD PRIMARY KEY (CodEspecie),
ADD FOREIGN KEY (CodEspecie) REFERENCES Especie(CodEspecie);

CREATE TABLE IF NOT EXISTS Area (
NombreA varchar(25) not null, Extension int(8), CodPN tinyint(2) unsigned not null
);
ALTER TABLE Area
ADD PRIMARY KEY (NombreA),
ADD FOREIGN KEY (CodPN) REFERENCES ParqueNatural(CodPN);

CREATE TABLE IF NOT EXISTS E_A (
CodEspecie int(6)not null, CodArea varchar(25) not null, CantIndividuos int (4)
);
ALTER TABLE E_A
ADD PRIMARY KEY (CodEspecie, CodArea),
ADD FOREIGN KEY (CodEspecie) REFERENCES Especie(CodEspecie),
ADD FOREIGN KEY (CodArea) REFERENCES Area(NombreA);

CREATE TABLE IF NOT EXISTS Entrada (
CodEntrada int(4) not null, CodPN tinyint(2) unsigned);
ALTER TABLE Entrada
ADD PRIMARY KEY (CodEntrada),
ADD FOREIGN KEY (CodPN) REFERENCES ParqueNatural(CodPN);

CREATE TABLE IF NOT EXISTS Personal (
DNI char(9) not null, NSS int(12) not null unique, Nombre Varchar(25) not null, Direccion Varchar(30),
TfnoDomicilio int(9), TfnoMovil int(9), Sueldo decimal(6,2), CodPN tinyint(2) unsigned
);
ALTER TABLE Personal
ADD PRIMARY KEY (DNI),
ADD FOREIGN KEY (CodPN) REFERENCES ParqueNatural(CodPN);

CREATE TABLE IF NOT EXISTS Conservador (
DNI char(9) not null, Tarea varchar(30), NombreA varchar(25) not null);
ALTER TABLE Conservador
ADD PRIMARY KEY (DNI),
ADD FOREIGN KEY (DNI) REFERENCES Personal(DNI),
ADD FOREIGN KEY (NombreA) REFERENCES Area(NombreA);

CREATE TABLE IF NOT EXISTS Vigilante (
DNI char(9) not null, NombreA varchar(25) not null
);
ALTER TABLE Vigilante
ADD PRIMARY KEY (DNI),
ADD FOREIGN KEY (DNI) REFERENCES Personal(DNI),
ADD FOREIGN KEY (NombreA) REFERENCES Area(NombreA);

CREATE TABLE IF NOT EXISTS Vehiculo (
Matricula  char(9) not null, tipo Varchar(20), DNI char(9) not null unique
);
ALTER TABLE Vehiculo
ADD PRIMARY KEY (Matricula),
ADD FOREIGN KEY (DNI) REFERENCES Vigilante(DNI);

CREATE TABLE IF NOT EXISTS Investigador (
DNI char(9) not null, Titulacion varchar(25), CodEntrada int(4) not null);
ALTER TABLE Investigador
ADD PRIMARY KEY (DNI),
ADD FOREIGN KEY (DNI) REFERENCES Personal(DNI);

CREATE TABLE IF NOT EXISTS Gestor (
DNI char(9) not null, CodEntrada int(4) not null
);
ALTER TABLE Gestor
ADD PRIMARY KEY (DNI),
ADD FOREIGN KEY (DNI) REFERENCES Personal(DNI),
ADD FOREIGN KEY (CodEntrada) REFERENCES Entrada(CodEntrada);

CREATE TABLE IF NOT EXISTS Proyecto (
CodProy int(8) not null, Presupuesto int(10), FechaInicio DATE not null,
FechaFin DATE not null, CodEspecie int(6)
);
ALTER TABLE Proyecto
ADD PRIMARY KEY (CodProy),
ADD FOREIGN KEY (CodEspecie) REFERENCES Especie(CodEspecie);

CREATE TABLE IF NOT EXISTS I_P (
CodProy int(8) not null, DNI char(9)not null
);
ALTER TABLE I_P
ADD PRIMARY KEY (DNI, CodProy),
ADD FOREIGN KEY (CodProy) REFERENCES Proyecto(CodProy),
ADD FOREIGN KEY (DNI) REFERENCES Investigador(DNI);

INSERT INTO ParqueNatural(CodPN, Nombre, FechaDeclaracion) values
   (1,'Picos de Europa','1918-07-24'),
   (2,'Ordesa y Monte Perdido','1918-08-16'),
   (3,'Teide','1954-01-22'),
   (4,'Caldera de Taburiente','1954-10-06');

/*Del modelo se deduce que un visitante tendrá entre 1 y n alojamientos (porque sola la tabla
alojamientos nos lleva al CodPN que visita) y hará entre 0 y n excursiones.*/
INSERT INTO Visitante(DNI, Nombre, Domicilio, Profesion) values
   ('00000001R','Abel','C/ Arenal, 1','Albañil'),
   ('00000002W','Beatriz','C/ Batel, 2','bailarina'),
   ('00000003A','Carlos','C/ Cactus, 3','camionero'),
   ('00000004G','Dorleta','C/ Delicias, 4', 'decoradora'),
   ('00000005M','Esteban','C/ Ercilla, 5', 'electricista'),
   ('00000006Y','Flora','C/ Faro, 6', 'florista'),
   ('00000007F','Gabriel','C/ Genova, 7', 'ganadero');

/*Cada parque natural puede tener de 0 a n alojamientos*/
INSERT INTO Alojamiento(CodAlojamiento, Categoria, Capacidad, CodPN) values
   ('A001',null,null,1), ('A002',null,null,2), ('A003',null,null,2),
   ('A004',null,null,2), ('A005',null,null,1), ('A006',null,null,2),
   ('A007',null,null,3), ('A008',null,null,3), ('A009',null,null,3);
/*Obsérvese que el ParqueNatural 4 no tiene alojamientos, luego nadie visitará este parque, porque
de acuerdo al modelo, solo visita un parque aquel que previamente se aloja*/
   
INSERT INTO A_V (CodAlojamiento, DNI, FechaInicio, FechaFin) values
('A001','00000001R', '2000-01-01', null),
('A001','00000002W', '2000-01-01', null),
('A002','00000001R', '2000-01-02', null), 
('A003','00000002W', '2000-01-02', null),
('A003','00000003A', '2000-01-03', null),
('A003','00000001R', '2000-01-03', null),
('A004','00000003A', '2000-01-04', null),
('A004','00000004G', '2000-01-04', null),
('A005','00000001R', '2000-01-04', null),
('A006','00000004G', '2000-01-04', null),
('A007','00000004G', '2000-01-04', null),
('A007','00000005M', '2000-01-04', null),
('A007','00000001R', '2000-01-05', null),
('A007','00000006Y', '2000-01-05', null),
('A008','00000004G', '2000-01-08', null),
('A008','00000005M', '2000-01-08', null);
-- Obsérvese que el alojamiento A009 no está asociado a ningún visitante.

/*Cada alojamiento puede tener de 0 a n excursiones*/
INSERT INTO Excursion(CodExcursion, Fecha, Hora, aPie, CodAlojamiento) values
   ('EX001','2000-01-10',null,true,'A001'), ('EX002','2000-01-10',null,true,'A001'), ('EX003','2000-01-10',null,false,'A001'),
   ('EX004','2000-01-11',null,false,'A002'), ('EX005','2000-01-11',null,true,'A002'), ('EX006','2000-01-11',null,true,'A003'),
   ('EX007','2000-01-12',null,false,'A005'), ('EX008','2000-01-12',null,true,'A008'), ('EX009','2000-01-12',null,false,'A008'),
   ('EX010','2000-01-13',null,false,'A004'), ('EX011','2000-01-13',null,true,'A006'), ('EX012','2000-01-13',null,false,'A007');
-- Obsérvese que los alojamientos A011 a A018 no hace excursiones

drop view if exists Visitantesapie;
create view Visitantesapie (Visitante_DNI, Visitante_Nombre, CodAlojamiento, CodPN, Fecha, aPie) as
SELECT Visitante.DNI, Nombre, Alojamiento.CodAlojamiento, CodPN, Fecha, aPie FROM Visitante
INNER JOIN A_V USING(DNI)
INNER JOIN Alojamiento USING(CodAlojamiento)
INNER JOIN Excursion USING(CodAlojamiento)
where aPie=true
order by DNI;

INSERT INTO ComunidadAutonoma (CodCA, Nombre, OrgResponsable) values
		(2,'Aragón',null), (3,'Asturias',null), (5,'Canarias',null),
        (6,'Cantabria',null), (7,'Castilla y León',null);
        
INSERT INTO CA_PN (CodCA,CodPN,Superficie) values
		(2,2,null),(3,1,null),(5,3,null),(5,4,null), (6,1,null),(7,1,null);

INSERT INTO Especie(CodEspecie,NombreCientifico,NombreVulgar) values
   -- Animales
   (000001,'Aquila chrysaetos','Águila real'),
   (000002,'Capra pyrenaica victoriae','Cabra montés occidental'),
   (000003,'Gypaetus barbatus','Quebrantahuesos'),
   (000004,'Rupicapra pyrenaica','Rebeco pirenaico'),
   (000005,'Tetrao urogallus','Urogallo occidental'),
   -- Vegetales
   (000011,'Fagus sylvatica','Haya común'),
   (000012,'Pinus sylvestris','Pino silvestre'),
   (000013,'Corylus avellana','Avellano europeo'),
   (000014,'Ilex aquifolium','Acebo'),
   (000015,'Echium wildpretii','Tajinese rojo'),
   (000016,'Pinus canariensis','Pino canario');
   
INSERT INTO Animal(CodEspecie,Alimentacion,PeriodoCelo) values
	(000001,'Carnivoro',null),(000002,'Hervíbora',null),
	(000003,'Carnivoro',null),(000004,'Hervíboro',null),
	(000005,'Omnívoro',null);

INSERT INTO Vegetal(CodEspecie,Floracion,PeriodoFloracion) values
	(000011,NULL,null),(000012,null,null),
	(000013,NULL,null),(000014,null,null), (000015,null,null), (000016,null,null);

/*Cada parque natural puede abarcar varias áreas;*/
INSERT INTO Area(NombreA,Extension,CodPN) values
   ('Asturias',null,1),('León',null,1), ('Cantabria',null,1),
   ('Sobrarbe',null,2),('Tenerife',null,3), ('La Palma',null,4);
        
INSERT INTO E_A (CodEspecie,CodArea,CantIndividuos) values
   (000001,'Sobrarbe',null),(000002,'Asturias',null), (000003,'Asturias',null),
   (000004,'Asturias',null), (000005,'Cantabria',null),
   (000011,'Asturias',null), (000011,'Sobrarbe',null),  
   (000012,'Asturias',null), (000013,'Asturias',null), 
   (000014,'Asturias',null), (000015,'Tenerife',null), (000016,'La Palma',null);
        
INSERT INTO Personal(DNI,NSS,Nombre,Direccion,TfnoDomicilio,TfnoMovil,Sueldo,CodPN) values
   ('17385142W',0123456789,'Juan','C/Galicia 72',953350876,671334423,1543.54,1),
   ('46315232D',987654321,'Maria','C/Madrid 92',953452936,655857680,2032.96,2),
   ('92415331O',247674328,'Jose','C/Marbella 96',953422959,613827680,2532.87,3),
   ('76315262L',886654322,'Alfredo','C/Asturias 2',923355231,795637280,1932.96,4);
            
