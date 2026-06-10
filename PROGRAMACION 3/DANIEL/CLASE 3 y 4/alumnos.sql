	CREATE TABLE alumnos (
		nro_alumno numeric(6) not null,
		apellido char(60) not null,
		nombre char(50) not null,
		dni char(9) not null,
		nro_legajo char(6) null,
		fecha_nacimiento datetime not null,
		sexo char(1) not null,
		telefono char(13) null,
		mail char(120) null,
		calle char(60)  null,
		nro char(20)  null,
		unidad char(15)  null,
		cod_postal char(4) null,
		estado char(3) not null,
		observaciones varchar(255) null,
 	 CONSTRAINT pk_alumnos PRIMARY KEY NONCLUSTERED (nro_alumno))
	;