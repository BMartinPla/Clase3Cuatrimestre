
.mode csv
.import provincias.csv Provincia_Base

.import departamentos.csv Departamento_Base

.import localidades.csv Localidad_Base

.import paises2016geom10.csv Pais_Base


create table Pais (
       id integer primary key autoincrement,
       nombre varchar(256) not null unique);

create table Provincia (
       id integer primary key autoincrement,
       pais_id integer not null,
       nombre varchar(256) not null,
    constraint fk_pais_provincia foreign key (pais_id) references Pais(id),
    constraint uq_provincia_pais unique(pais_id, nombre));

create table Departamento (
       id integer primary key autoincrement,
       provincia_id integer not null,
       nombre varchar(256) not null,
    constraint fk_depto_provincia foreign key (provincia_id) references Provincia(id),
    constraint uq_provincia_depto unique(provincia_id, nombre));

create table Localidad (
       id integer primary key autoincrement,
       depto_id integer not null,
       nombre varchar(256) not null,
    constraint fk_local_depto_id foreign key (depto_id) references Departamento(id),
    constraint uq_depto_localidad unique(depto_id, nombre));



insert into Pais (nombre)
select distinct upper(etiqueta) from Pais_Base where length(etiqueta) > 0 order by etiqueta;


insert into Provincia (pais_id, nombre)
select pa.id, upper(pr.nombre) 
from Provincia_base pr 
inner join Pais pa
where pa.nombre = 'ARGENTINA'
order by pr.nombre;

insert into Departamento(provincia_id, nombre)
select pr.id, upper(de.nombre)
from Departamento_Base de
inner join Provincia pr
    on upper(de.provincia_nombre) = pr.nombre
order by pr.id, de.nombre;

insert into Localidad(depto_id, nombre)
select de.id, upper(lo.nombre)
from Localidad_Base lo
inner join Departamento de
    on upper(lo.departamento_nombre) = de.nombre
inner join Provincia pr
    on upper(lo.provincia_nombre) = pr.nombre
    and de.provincia_id = pr.id
where categoria = 'Localidad simple'
order by pr.id, lo.nombre;


drop table Pais_Base;
drop table Provincia_Base;
drop table Departamento_Base;
drop table Localidad_Base;

.mode box 

select pr.id, pr.nombre, count(*) as Localidades
from Provincia pr
inner join Departamento de
    on de.provincia_id = pr.id
inner join Localidad lo
    on lo.depto_id = de.id
group by pr.id, pr.nombre
order by pr.id;



--select de.id, upper(lo.nombre), count(*)
--from Localidad_Base lo
--inner join Departamento de
--    on upper(lo.departamento_nombre) = de.nombre
--inner join Provincia pr
--    on upper(lo.provincia_nombre) = pr.nombre
--    and de.provincia_id = pr.id
--group by de.id, upper(lo.nombre)
--having count(*) > 1;


SELECT nombre FROM pais WHERE nombre LIKE 'I%';

SELECT nombre from localidad where nombre like 'SANTA%';

SELECT count(*) from localidad where nombre like 'SANTA%';

select pr.nombre, lo.nombre, count(*)
from localidad lo
inner join Departamento de
    on de.id = lo.depto_id
inner join Provincia pr
    on pr.id = de.provincia_id
group by pr.nombre, lo.nombre;

select pr.nombre, lo.nombre, count(*)
from localidad lo
inner join Departamento de
    on de.id = lo.depto_id
inner join Provincia pr
    on pr.id = de.provincia_id
where lo.nombre like 'SANTA%'
group by pr.nombre, lo.nombre;

create view SantasView
as
select pr.nombre as Provincia, lo.nombre as Localidad, count(*) as Cuantas
from localidad lo
inner join Departamento de
    on de.id = lo.depto_id
inner join Provincia pr
    on pr.id = de.provincia_id
where lo.nombre like 'SANTA%'
group by pr.nombre, lo.nombre;

.schema SantasView;

select * from SantasView;

select provincia, count(*) from SantasView group by Provincia;

select provincia, localidad from SantasView;

create view SantantoView
as
select pr.nombre as Provincia, lo.nombre as Localidad, count(*) as Cuantas
from localidad lo
inner join Departamento de
    on de.id = lo.depto_id
inner join Provincia pr
    on pr.id = de.provincia_id
where lo.nombre like 'SAN %'
group by pr.nombre, lo.nombre;

.schema SantantoView;

select * from SantantoView;

select provincia, count(*) from SantantoView group by Provincia;

select provincia, localidad from SantantoView;

create view BuenosAiresView
as
select pr.nombre as Provincia, lo.nombre as Localidad
from localidad lo
inner join Departamento de
    on de.id = lo.depto_id
inner join Provincia pr
    on pr.id = de.provincia_id
where pr.nombre like 'Buenos Aires'
group by pr.nombre, lo.nombre;

create view CordobaView
as
select pr.nombre as Provincia, lo.nombre as Localidad
from localidad lo
inner join Departamento de
    on de.id = lo.depto_id
inner join Provincia pr
    on pr.id = de.provincia_id
where pr.nombre like 'Córdoba'
group by pr.nombre, lo.nombre;

create view SantaFeView
as
select pr.nombre as Provincia, lo.nombre as Localidad
from localidad lo
inner join Departamento de
    on de.id = lo.depto_id
inner join Provincia pr
    on pr.id = de.provincia_id
where pr.nombre like 'Santa Fé'
group by pr.nombre, lo.nombre;

create view NeuquenView
as
select pr.nombre as Provincia, lo.nombre as Localidad
from localidad lo
inner join Departamento de
    on de.id = lo.depto_id
inner join Provincia pr
    on pr.id = de.provincia_id
where pr.nombre like 'Neuquén'
group by pr.nombre, lo.nombre;

create view FormosaView
as
select pr.nombre as Provincia, lo.nombre as Localidad
from localidad lo
inner join Departamento de
    on de.id = lo.depto_id
inner join Provincia pr
    on pr.id = de.provincia_id
where pr.nombre like 'Formosa'
group by pr.nombre, lo.nombre;

create view DptoBuenosAiresView
as
select pr.nombre as Provincia, de.nombre as Departamento, lo.nombre as Localidad
from localidad lo
inner join Departamento de
    on de.id = lo.depto_id
inner join Provincia pr
    on pr.id = de.provincia_id
where pr.nombre like 'Buenos Aires'
group by pr.nombre, de.nombre, lo.nombre;

create view DptoSanLuisView
as
select pr.nombre as Provincia, de.nombre as Departamento, lo.nombre as Localidad
from localidad lo
inner join Departamento de
    on de.id = lo.depto_id
inner join Provincia pr
    on pr.id = de.provincia_id
where pr.nombre like 'San Luis'
group by pr.nombre, de.nombre, lo.nombre;

create view DptoSanJuanView
as
select pr.nombre as Provincia, de.nombre as Departamento, lo.nombre as Localidad
from localidad lo
inner join Departamento de
    on de.id = lo.depto_id
inner join Provincia pr
    on pr.id = de.provincia_id
where pr.nombre like 'San Juan'
group by pr.nombre, de.nombre, lo.nombre;

create view CountDptoBAView
as
select pr.nombre as Provincia, de.nombre as Departamento, count(lo.nombre) as Cantidad
from localidad lo
inner join Departamento de
    on de.id = lo.depto_id
inner join Provincia pr
    on pr.id = de.provincia_id
where pr.nombre like 'Buenos Aires'
group by pr.nombre, de.nombre;

create view CountDptoSLView
as
select pr.nombre as Provincia, de.nombre as Departamento, count(lo.nombre) as Cantidad
from localidad lo
inner join Departamento de
    on de.id = lo.depto_id
inner join Provincia pr
    on pr.id = de.provincia_id
where pr.nombre like 'San Luis'
group by pr.nombre, de.nombre;

create view CountDptoSJView
as
select pr.nombre as Provincia, de.nombre as Departamento, count(lo.nombre) as Cantidad
from localidad lo
inner join Departamento de
    on de.id = lo.depto_id
inner join Provincia pr
    on pr.id = de.provincia_id
where pr.nombre like 'San Juan'
group by pr.nombre, de.nombre;