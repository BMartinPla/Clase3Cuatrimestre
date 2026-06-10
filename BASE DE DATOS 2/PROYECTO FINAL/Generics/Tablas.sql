create table Pais (
    id INTEGER primary key identity(1,1),
    nombre varchar(128) not null unique);

create table Genero (
    id INTEGER primary key identity(1,1),
    nombre varchar(128) not null unique);

create table EstadoCivil (
    id INTEGER primary key identity(1,1),
    nombre varchar(128) not null unique);

create table TipoDomicilio (
    id INTEGER primary key identity(1,1),
    nombre varchar(128) not null unique);

create table TipoContacto (
    id INTEGER primary key identity(1,1),
    nombre varchar(128) not null unique);

create table TipoDocumento (
    id INTEGER primary key identity(1,1),
    pais_id INTEGER not null,
    nombre varchar(128) not null unique,
    constraint fk_tdoc_pais foreign key
        (pais_id) references Pais(id));

create table Provincia (
    id INTEGER primary key identity(1,1),
    pais_id INTEGER not null,
    nombre varchar(128) not null,
    constraint fk_pcia_pais foreign key
        (pais_id) references Pais(id),
    constraint unq_provincia unique(pais_id, nombre));

create table Localidad (
    id INTEGER primary key identity(1,1),
    provincia_id INTEGER not null,
    nombre varchar(128) not null unique,
    constraint fk_loc_pcia foreign key
        (provincia_id) references Provincia(id),
    constraint unq_localidad unique(provincia_id, nombre));

create table Domicilio (
    id INTEGER primary key identity(1,1),
    localidad_id INTEGER not null,
    direccion varchar(256) not null,
    codpos varchar(16),
    constraint fk_dom_loc foreign key (localidad_id)
        references Localidad(id));

create table Persona (
    id INTEGER primary key identity(1,1),
    apellido varchar(128) not null,
    nombre varchar(128) not null,
    tipodocumento_id INTEGER not null,
    documento varchar(64) not null,
    genero_id INTEGER not null,
    estadocivil_id INTEGER not null,
    fnacto date not null,
    constraint fk_per_tdoc foreign key (tipodocumento_id) 
        references TipoDocumento(id),
    constraint fk_per_gen foreign key (genero_id)
        references Genero(id),
    constraint fk_per_eciv foreign key (estadocivil_id)
        references EstadoCivil(id),
    constraint unq_persona unique(tipodocumento_id, documento));

create table Contacto (
    id INTEGER primary key identity(1,1),
    tipocontacto_id INTEGER not null,
    persona_id INTEGER not null,
    contacto varchar(256) not null,
    constraint fk_cont_tipo foreign key (tipocontacto_id)
        references TipoContacto(id),
    constraint fk_cont_pers foreign key (persona_id)
        references Persona(id));

create table DomicilioPersona (
    id INTEGER primary key identity(1,1),
    tipodomicilio_id INTEGER not null,
    domicilio_id INTEGER not null,
    persona_id INTEGER not null,
    constraint fk_domper_tipo foreign key (tipodomicilio_id)
        references TipoDomicilio(id),
    constraint fk_domper_dom foreign key (domicilio_id)
        references Domicilio(id),
    constraint fk_domper_per foreign key (persona_id)
        references Persona(id));
