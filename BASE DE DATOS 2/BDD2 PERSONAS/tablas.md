# Personas

Persona
    - id
    - apellido
    - nombre
    - tipoDocumento
    - documento
    - tipoContacto
    - contacto
    - genero 
    - direccion
    - fnac
    - estCivil

create table persona (
    id int not null primary key identity(1,1),
    nombre 
) 

create table pais (
    id int not null primary key identity(1,1),
    nombre varchar(128) not null
)

create table tipoDocumento (
    id int not null primary key identity(1,1),
    pais_id int not null,
    nombre varchar(128) not null

    constraint fk_tdoc_pais foreign key (pais_id) references Pais(id),
    constraint unq_tdoc unique(pais_id, nombre)
)

create table genero (
    id int not null primary key identity(1,1),
    nombre varchar(128) not null
)

create table estCivil (
    id int not null primary key identity(1,1),
    nombre varchar(128) not null
)

create table tipoContacto (
    id int not null primary key identity(1,1),
    nombre varchar(128) not null
)

create table contacto (
    id int not null primary key identity(1,1),
    tipoContacto_id int not null,
    persona_id int not null,
    nombre varchar(128) not null,

    constraint fk_cont_tipo foreign key (tipoContacto_id) references tipoContacto(id),
    constraint fk_cont_persona foreign key (persona_id) references persona(id),
    constraint unq_contacto unique (persona_id, tipoContacto_id, nombre)
)