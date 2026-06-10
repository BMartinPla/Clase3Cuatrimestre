	CREATE TABLE materias (
		materia numeric(6) not null,
		descripcion char(160) not null,
		desc_corta char(60) not null,
		anio char(1) not null,
		estado char(3) not null,
 	 CONSTRAINT pk_materias PRIMARY KEY NONCLUSTERED (materia))
	;

	insert into materias values
(1,'Sistemas Procesamiento Datos','SISTEMA DATOS','1','ACT'),
(2,'Ingles I','INGLES I','1','ACT'),
(3,'Arquitectura y Sistemas Operativos I','ARRQUI. I','1','ACT'),
(4,'Laboratorio I','LABO I','1','ACT'),
(5,'Estadistica','ESTADISTICA I','1','ACT'),
(6,'Programación I','PRG I','1','ACT'),
(7,'Programación II','PRG II','1','ACT'),
(8,'Programación III','PRG III','2','ACT'),
(9,'Programación IV','PRG IV','2','ACT'),
(10,'Organizacion Empresarial','ORGANIZACION','2','ACT'),
(11,'Organizacion Contable','CONTABLE','2','ACT'),
(12,'Operatvia','OPERATIVA','2','ACT');

