	CREATE TABLE cursos_materias (
		curso numeric(6) not null,
		materia numeric(6) not null,
		estado char(3) -- [ACT/BAJ]
 	 CONSTRAINT pk_cursos_materias PRIMARY KEY NONCLUSTERED (curso,materia))
	;

--Materias de 4 comisiones de Primer anio
	insert cursos_materias values 
(4,1,'ACT'),
(4,2,'ACT'),
(4,3,'ACT'),
(4,4,'ACT'),
(4,5,'ACT'),
(4,6,'ACT'),
(4,7,'ACT'),
(5,1,'ACT'),
(5,2,'ACT'),
(5,3,'ACT'),
(5,4,'ACT'),
(5,5,'ACT'),
(5,6,'ACT'),
(5,7,'ACT'),
(6,1,'ACT'),
(6,2,'ACT'),
(6,3,'ACT'),
(6,4,'ACT'),
(6,5,'ACT'),
(6,6,'ACT'),
(6,7,'ACT'),
(7,1,'ACT'),
(7,2,'ACT'),
(7,3,'ACT'),
(7,4,'ACT'),
(7,5,'ACT'),
(7,6,'ACT'),
(7,7,'ACT');

--Materias de 3 comisiones de segundo anio
	insert cursos_materias values 
(1,8,'ACT'),
(1,9,'ACT'),
(1,10,'ACT'),
(1,11,'ACT'),
(1,12,'ACT'),
(2,8,'ACT'),
(2,9,'ACT'),
(2,10,'ACT'),
(2,11,'ACT'),
(2,12,'ACT'),
(3,8,'ACT'),
(3,9,'ACT'),
(3,10,'ACT'),
(3,11,'ACT'),
(3,12,'ACT');