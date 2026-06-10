	CREATE TABLE cursos (
		curso numeric(6) not null,
		anio char(1) not null, -- [1-6]
		turno char(1) not null,	-- [M/T/N]
		comision char(2) not null,	-- Las comisiones se designan con letras mayusculas.
		anio_calendario char(4) not null, 
		descripcion varchar(60) not null,
		estado char(3) -- [ACT/BAJ]
 	 CONSTRAINT pk_curso PRIMARY KEY NONCLUSTERED (curso))
	;

	insert into cursos values
(1,'2','N','A','2026','','ACT'),
(2,'2','T','A','2026','','ACT'),
(3,'2','M','A','2026','','ACT'),
(4,'1','N','A','2026','','ACT'),
(5,'1','N','A','2026','','ACT'),
(6,'1','T','A','2026','','ACT'),
(7,'1','M','A','2026','','ACT');

