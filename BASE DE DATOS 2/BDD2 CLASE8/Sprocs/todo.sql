use Barrios2;

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
create table Clasificacion_barrio(id integer primary key identity(1,1), nombre varchar(256) not null unique);

----------------------------------------------------------
--- Ojo con esto !!!!
-- Al principio, me asegure de user Barrios2 como base.
-- Despues, fui creando en ordern, todas las tablas.
-- YA tenia importado el archivo csv en la Base Barrios.
-- Con el SELECT INTO lo que hago es crear la tabla
-- Barrios en la base Barrios2 con todas las filas.
-- RE POWER!!!!
-- Deespues vienen todos los inserts como ya hicimos.
----------------------------------------------------------
select * into Barrios from Barrios.dbo.Barrios;

insert into energia_electrica(nombre) select distinct energia_electrica from Barrios;
insert into efluentes_cloacales(nombre) select distinct efluentes_cloacales from Barrios;
insert into agua_corriente(nombre) select distinct agua_corriente from Barrios;
insert into cocina(nombre) select distinct cocina from Barrios;
insert into calefaccion(nombre) select distinct calefaccion from Barrios;
insert into Clasificacion_barrio(nombre) select distinct clasificacion_barrio from Barrios;

insert into Provincia (nombre)
select distinct provincia
from Barrios p
order by provincia;
select * from Provincia;

insert into Departamento(provincia_id, nombre)
select distinct pr.id, ba.departamento
from Barrios ba
inner join Provincia pr
    on pr.nombre = ba.provincia
order by pr.id, ba.departamento;

insert into Localidad(depto_id, nombre)
select distinct de.id, ba.localidad
from Barrios ba
inner join Departamento de
    on ba.departamento = de.nombre
inner join Provincia pr
    on ba.provincia = pr.nombre
   and ba.departamento = de.nombre
order by de.id, ba.localidad;

create table Barrio ( 
	id int primary key identity(1,1),
	nombre varchar(512) not null,
	localidad_id int not null,
	cantidad_viviendas int not null default 0,
	cantidad_familias int not null default 0,
	energia_electrica_id int not NULL,
	efluentes_cloacales_id int not null,
	agua_corriente_id int not null,
	cocina_id int not null,
	calefaccion_id int not null,
	clasificacion_barrio_id int not null,
	titulo_propiedad_sn char(1) not null check(titulo_propiedad_sn in ('S','N')) default 'N',
    superficie int not null default 0,
	constraint fk_barrio_localidad foreign key (localidad_id) references Localidad(id),
	constraint fk_barrio_energia_elec foreign key (energia_electrica_id) references Energia_electrica(id),
	constraint fk_barrio_efluentes foreign key (efluentes_cloacales_id) references Efluentes_cloacales(id),
	constraint fk_barrio_agua_corriente foreign key (agua_corriente_id) references Agua_corriente(id),
	constraint fk_barrio_cocina foreign key (cocina_id) references Cocina(id),
	constraint fk_barrio_calefaccion foreign key (calefaccion_id) references Calefaccion(id),
	constraint fk_barrio_clasificacion foreign key (clasificacion_barrio_id) references Clasificacion_barrio(id)
);

insert into Barrio (
	nombre,
	localidad_id,
	cantidad_viviendas,
	cantidad_familias,
	energia_electrica_id,
	efluentes_cloacales_id,
	agua_corriente_id,
	cocina_id,
	calefaccion_id,
	clasificacion_barrio_id,
	titulo_propiedad_sn,
    superficie)
select 
	ba.nombre_barrio,
	lo.id,
	ba.cantidad_viviendas_aproximadas ,
	ba.cantidad_familias_aproximada,
	ee.id,
	ec.id,
	ac.id, 
	co.id, 
	ca.id, 
	cb.id,
	case ba.titulo_propiedad
		when 'NO' then 'N'
		when 'SI' then 'S'
		else 'N'
	end ,
    ba.superficie_m2
from Barrios ba 
inner join Localidad lo
	on lo.nombre = ba.Localidad
inner join Departamento de
	on de.id = lo.depto_id
	and de.nombre = ba.departamento
inner join Provincia pr 
	on pr.id = de.provincia_id
	and pr.nombre = ba.provincia
inner join Energia_electrica ee   
	on ee.nombre = ba.energia_electrica 
inner join Efluentes_cloacales ec
	on ec.nombre = ba.efluentes_cloacales 
inner join Agua_corriente ac
	on ac.nombre = ba.agua_corriente 
inner join Cocina co 
	on co.nombre = ba.cocina 
inner join Calefaccion ca
	on ca.nombre = ba.calefaccion 
inner join Clasificacion_barrio cb 
	on cb.nombre = ba.clasificacion_barrio;

-- A ver si anduvo.    
select * from Barrio;

-- Totalizadores
select top 1 nombre, max(superficie) as M2 from Barrio b 
group by nombre
order by 2 desc; 

select top 1 nombre, max(b.cantidad_viviendas) as Viviendas from Barrio b 
group by nombre
order by 2 desc; 

select top 1 nombre, max(b.cantidad_familias) as Fmilias from Barrio b 
group by nombre
order by 2 desc; 
