CREATE TABLE localidades (
	cod_postal char(4) not null,
	descripcion char(80) not null,
	desc_corta char(12) not null,
	provincia char(2) not null,
 CONSTRAINT pk_localidades PRIMARY KEY NONCLUSTERED (cod_postal))
;