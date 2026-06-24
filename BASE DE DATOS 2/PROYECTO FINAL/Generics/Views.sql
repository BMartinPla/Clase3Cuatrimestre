-- Vista de Pais
create view vPais as
select id as paisid, nombre
from Pais;

select * from vPais

-- Vista de Estado Civil
CREATE VIEW [dbo].[vEstadoCivil] AS
SELECT 
    id AS estadocivilid, 
    nombre AS estadocivil
FROM EstadoCivil;
GO

-- Vista de Género
CREATE VIEW [dbo].[vGenero] AS
SELECT 
    id AS generoid, 
    nombre AS genero
FROM Genero;
GO

-- Vista de Tipo de Contacto
CREATE VIEW [dbo].[vTipoContacto] AS
SELECT 
    id AS tipocontactoid, 
    nombre AS tipocontacto
FROM TipoContacto;
GO

-- Vista de Tipo de Domicilio
CREATE VIEW [dbo].[vTipoDomicilio] AS
SELECT 
    id AS tipodomicilioid, 
    nombre AS tipodomicilio
FROM TipoDomicilio;
GO

-- Vistas complejas
create view vTipoDocumento as
select
	td.id as tipodocumentoid,
	td.nombre as tipodocumento,
	p.id as pais_id,
	p.nombre as nombrepais
from TipoDocumento td
inner join Pais p
	on td.pais_id = p.id;

select * from vTipoDocumento

-- Vista de Provincia
CREATE VIEW [dbo].[vProvincia] AS
SELECT
    pr.id AS provinciaid,
    pr.nombre AS provincia,
    p.id AS pais_id,
    p.nombre AS nombrepais
FROM Provincia pr
INNER JOIN Pais p ON pr.pais_id = p.id;
GO

-- Vista de Localidad (Se trae también Provincia y País para que quede completa)
CREATE VIEW [dbo].[vLocalidad] AS
SELECT
    l.id AS localidadid,
    l.nombre AS localidad,
    pr.id AS provincia_id,
    pr.nombre AS nombreprovincia,
    p.id AS pais_id,
    p.nombre AS nombrepais
FROM Localidad l
INNER JOIN Provincia pr ON l.provincia_id = pr.id
INNER JOIN Pais p ON pr.pais_id = p.id;
GO

-- Vista de Persona
CREATE VIEW [dbo].[vPersona] AS
SELECT
    p.id AS personaid,
    p.nombre AS nombre,
    p.apellido AS apellido,
    p.documento AS documento,
    p.fnacto AS fnacto,
    td.id AS tipodocumento_id,
    td.nombre AS nombretipodocumento,
    g.id AS genero_id,
    g.nombre AS nombregenero,
    ec.id AS estadocivil_id,
    ec.nombre AS nombreestadocivil
FROM Persona p
INNER JOIN TipoDocumento td ON p.tipodocumento_id = td.id
INNER JOIN Genero g ON p.genero_id = g.id
INNER JOIN EstadoCivil ec ON p.estadocivil_id = ec.id;
GO

-- Vista de Contacto
CREATE VIEW [dbo].[vContacto] AS
SELECT
    c.id AS contactoid,
    c.contacto AS contacto,
    tc.id AS tipocontacto_id,
    tc.nombre AS nombretipocontacto,
    p.id AS persona_id,
    p.nombre AS nombrepersona,
    p.apellido AS apellidopersona
FROM Contacto c
INNER JOIN TipoContacto tc ON c.tipocontacto_id = tc.id
INNER JOIN Persona p ON c.persona_id = p.id;
GO

-- Vista de Domicilio
CREATE VIEW [dbo].[vDomicilio] AS
SELECT
    d.id AS domicilioid,
    d.direccion AS direccion,
    d.codpos AS codpos,
    l.id AS localidad_id,
    l.nombre AS nombrelocalidad,
    pr.id AS provincia_id,
    pr.nombre AS nombreprovincia,
    p.id AS pais_id,
    p.nombre AS nombrepais
FROM Domicilio d
INNER JOIN Localidad l ON d.localidad_id = l.id
INNER JOIN Provincia pr ON l.provincia_id = pr.id
INNER JOIN Pais p ON pr.pais_id = p.id;
GO

-- Vista de Domicilio de Persona (Asociación N a N)
CREATE VIEW [dbo].[vDomicilioPersona] AS
SELECT
    dp.id AS domiciliopersonaid,
    td.id AS tipodomicilio_id,
    td.nombre AS nombretipodomicilio,
    p.id AS persona_id,
    p.nombre AS nombrepersona,
    p.apellido AS apellidopersona,
    d.id AS domicilio_id,
    d.direccion AS direcciondomicilio,
    l.nombre AS nombrelocalidad
FROM DomicilioPersona dp
INNER JOIN TipoDomicilio td ON dp.tipodomicilio_id = td.id
INNER JOIN Persona p ON dp.persona_id = p.id
INNER JOIN Domicilio d ON dp.domicilio_id = d.id
INNER JOIN Localidad l ON d.localidad_id = l.id;
GO