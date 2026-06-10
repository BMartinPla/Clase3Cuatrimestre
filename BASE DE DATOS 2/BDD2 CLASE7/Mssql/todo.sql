create table Provincia (
       id integer primary key identity(1,1),
       nombre varchar(256) not null);

create table Departamento (
       id integer primary key identity(1,1),
       provincia_id integer not null,
       nombre varchar(256) not null,
    constraint fk_depto_provincia foreign key (provincia_id) references Provincia(id),
    constraint uq_provincia_depto unique(provincia_id, nombre));

create table Localidad (
       id integer primary key identity(1,1),
       depto_id integer not null,
       nombre varchar(256) not null,
    constraint fk_local_depto_id foreign key (depto_id) references Departamento(id),
    constraint uq_depto_localidad unique(depto_id, nombre));

create table Energia_electrica(id integer primary key identity(1,1), nombre varchar(256) not null unique);
create table Efluentes_cloacales(id integer primary key identity(1,1), nombre varchar(256) not null unique);
create table Agua_corriente(id integer primary key identity(1,1), nombre varchar(256) not null unique);
create table Cocina(id integer primary key identity(1,1), nombre varchar(256) not null unique);
create table Calefaccion(id integer primary key identity(1,1), nombre varchar(256) not null unique);

insert into energia_electrica(nombre) select distinct energia_electrica from Barrios;
insert into efluentes_cloacales(nombre) select distinct efluentes_cloacales from Barrios;
insert into agua_corriente(nombre) select distinct agua_corriente from Barrios;
insert into cocina(nombre) select distinct cocina from Barrios;
insert into calefaccion(nombre) select distinct calefaccion from Barrios;

insert into Provincia (nombre)
select distinct provincia
from Barrios p
order by provincia;

insert into Departamento(provincia_id, nombre)
select distinct pr.id, ba.departamento
from Barrios ba
inner join Provincia pr
    on pr.nombre = ba.provincia
order by pr.id, ba.departamento;

insert into Localidad(depto_id, nombre)
select distinct de.id, ba.localidad
from Barrio ba
inner join Departamento de
    on ba.departamento = de.nombre
inner join Provincia pr
    on ba.provincia = pr.nombre
   and ba.departamento = de.nombre
order by de.id, ba.localidad;

