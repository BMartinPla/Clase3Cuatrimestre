	CREATE TABLE cursos_alumnos (
		curso numeric(6) not null,
		nro_alumno numeric(6) not null,
		estado char(3) -- [ACT/BAJ]
 	 CONSTRAINT pk_cursos_alumnos PRIMARY KEY NONCLUSTERED (curso,nro_alumno))
	;
	--delete cursos_alumnos
	insert into cursos_alumnos values
(1,1049,'ACT'),
(1,1055,'ACT'),
(1,1061,'ACT'),
(1,1065,'ACT'),
(1,1056,'ACT'),
(1,1109,'ACT'),
(1,1102,'ACT'),
(1,1088,'ACT'),
(1,1079,'ACT'),
(1,1069,'ACT'),
(1,1085,'ACT'),
(1,1054,'ACT'),
(1,1068,'ACT'),
(1,1046,'ACT'),
(1,1107,'ACT'),
(1,1067,'ACT'),
(1,1078,'ACT'),
(1,1110,'ACT'),
(1,1092,'ACT');

	insert into cursos_alumnos values
(2,1048,'ACT'),
(2,1056,'ACT'),
(2,1062,'ACT'),
(2,1066,'ACT'),
(2,1057,'ACT'),
(2,1108,'ACT'),
(2,1103,'ACT'),
(2,1085,'ACT'),
(2,1073,'ACT'),
(2,1064,'ACT'),
(2,1086,'ACT'),
(2,1051,'ACT'),
(2,1069,'ACT'),
(2,1042,'ACT'),
(2,1105,'ACT'),
(2,1061,'ACT'),
(2,1070,'ACT'),
(2,1091,'ACT');

	insert into cursos_alumnos values
(4,1048,'ACT'),
(4,1056,'ACT'),
(4,1062,'ACT'),
(4,1066,'ACT'),
(4,1057,'ACT'),
(4,1108,'ACT'),
(4,1103,'ACT'),
(4,1085,'ACT'),
(4,1073,'ACT'),
(4,1064,'ACT'),
(4,1086,'ACT'),
(4,1051,'ACT'),
(4,1069,'ACT'),
(4,1042,'ACT'),
(4,1105,'ACT'),
(4,1061,'ACT');