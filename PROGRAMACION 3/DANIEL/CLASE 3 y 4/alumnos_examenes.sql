CREATE TABLE alumnos_examenes (
	curso numeric(6) not null,
	materia numeric(6) not null,
	fecha datetime not null,
	nro_alumno numeric(6) not null,
	nota numeric(3) not null,
 	CONSTRAINT pk_alumnos_examenes PRIMARY KEY NONCLUSTERED (curso,materia,fecha))
;

insert into alumnos_examenes values
(1,8,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1049,2),
(1,9,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1049,8),
(1,10,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1049,5),
(1,11,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1049,8),
(1,8,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1049,8),
(1,8,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1049,2),
(1,12,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1049,8),
(1,12,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1049,5),
(1,9,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1049,7),
(1,10,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1049,8),

(1,10,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1061,4),
(1,10,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1061,7),
(1,10,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1061,6),
(1,9,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1061,8),
(1,8,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1061,9),
(1,11,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1061,1),
(1,12,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1061,7),
(1,12,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1061,4),
(1,11,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1061,6),
(1,8,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1061,2),

(1,8,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1055,7),
(1,8,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1055,4),
(1,8,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1055,2),
(1,3,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1055,9),
(1,11,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1055,7),
(1,9,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1055,4),
(1,12,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1055,2),
(1,12,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1055,9),
(1,9,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1055,2),
(1,9,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1055,9),

(1,6,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1065,7),
(1,4,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1065,2),
(1,2,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1065,8),

(1,8,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1109,2),
(1,11,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1109,2),

(4,1,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1042,4),
(4,1,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1042,7),
(4,1,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1042,6),
(4,3,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1042,8),
(4,6,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1042,9),
(4,4,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1042,1),
(4,2,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1042,7),
(4,2,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1042,4),
(4,5,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1042,6),
(4,5,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1042,9),

(4,1,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1108,4),
(4,1,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1108,7),
(4,3,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1108,8),
(4,6,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1108,9),
(4,4,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1108,1),
(4,2,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1108,7),
(4,5,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1108,6),
(4,5,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1108,9);

insert into alumnos_examenes values
(2,10,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1073,8),
(2,9,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1073,8),
(2,8,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1073,9),
(2,11,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1073,7),
(2,12,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1073,9),
(2,8,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1073,8),
(1,6,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1051,7),
(1,4,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1051,9),
(1,2,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1051,8)
;

insert into alumnos_examenes values
(2,10,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1085,8),
(2,9,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1085,8),
(2,8,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1085,9),
(2,11,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1085,8),
(2,12,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1085,9),
(2,8,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1085,8),
(1,6,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1064,8),
(1,4,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1064,9),
(1,2,dateadd(day,(FLOOR(RAND() * (100 - 1 + 1)) + 1) * -1,getdate()),1064,9)
;
