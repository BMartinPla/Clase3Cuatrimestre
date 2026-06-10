create table Pais (
	id integer primary key identity(1,1),
	nombre varchar(256) not null unique
);

create table TipoDocumento(
	id integer primary key identity(1,1),
	pais_id integer not null,
	nombre varchar(256) not null,
	constraint fk_tipodoc_pais foreign key (pais_id) references Pais(id),
	constraint uq_pais_tipodoc unique (pais_id, nombre)
);

create table EstadoCivil (
	id integer primary key identity(1,1),
	nombre varchar(256) not null unique
);

create table Genero (
	id integer primary key identity(1,1),
	nombre varchar(256) not null unique
);

create table TipoContacto (
	id integer primary key identity(1,1),
	nombre varchar(256) not null unique
);

create table Persona (
	id integer primary key identity(1,1),
    apellido varchar(128) not null,
    nombre varchar(128) not null,
    tipodocumento_id integer not null,
    documento varchar(64) not null,
    estadocivil_id integer not null,
    genero_id integer not null,
    fnacto date not null,
    constraint fk_per_tipodoc foreign key (tipodocumento_id) references TipoDocumento(id),
    constraint fk_per_genero foreign key (genero_id) references Genero(id),
    constraint fk_per_estcivil foreign key (estadocivil_id) references EstadoCivil(id),
    constraint chk_fnacto check (fnacto <= cast(getDate() as date))
);

create table Provincia(
	id integer primary key identity(1,1),
	pais_id integer not null,
	nombre varchar(256) not null,
	constraint fk_provincia_pais foreign key (pais_id) references Pais(id),
	constraint uq_pais_provincia unique (pais_id, nombre)
);

create table Localidad(
	id integer primary key identity(1,1),
	provincia_id integer not null,
	nombre varchar(256) not null,
	constraint fk_localidad_provincia foreign key (provincia_id) references Provincia(id),
	constraint uq_provincia_localidad unique (provincia_id, nombre)
);

create table Domicilio (
	id integer primary key identity(1,1),
    localidad_id integer not null,
    direccion varchar(256) not null,
    codpos varchar(16),
	constraint fk_domicilio_localidad foreign key (localidad_id) references Localidad(id),
);

create table ContactoPersona(
	id integer primary key identity(1,1),
    persona_id integer not null,
    tipocontacto_id integer not null,
    contacto varchar(256) not null,
    constraint uq_contacto_persona unique(persona_id, tipocontacto_id, contacto),
    constraint fk_contacto_persona foreign key (persona_id) references Persona(id),
    constraint fk_contacto_tipo foreign key (tipocontacto_id) references TipoContacto(id)
);

create table TipoDomicilio (
	id integer primary key identity(1,1),
	nombre varchar(256) not null unique
);

create table DomicilioPersona(
	id integer primary key identity(1,1),
    persona_id integer not null,
    tipodomicilio_id integer not null,
    domicilio_id integer not null,
    constraint uq_domicilio_persona unique(persona_id, tipodomicilio_id),
    constraint fk_domicilio_persona foreign key (persona_id) references Persona(id),
    constraint fk_domicilio_tipo foreign key (tipodomicilio_id) references TipoDomicilio(id)
);


