create procedure S_TipoDocumento
@id int = null,
@nombre varchar(128) = null,
@paisid int = null,
@nombrepais varchar(128) = null
as
Begin
	select
		tipodocumentoid,
		tipodocumento,
		pais_id,
		nombrepais
	from vTipoDocumento td
	where tipodocumentoid = isnull(@id, tipodocumentoid)
		and tipodocumento = isnull(@nombre, tipodocumento)
		and pais_id = isnull(@paisid, pais_id)
		and nombrepais = isnull(@nombrepais, nombrepais)
End; 

EXEC S_TipoDocumento @paisid=1

select * from TipoDocumento

-- Buscar País
create procedure S_PAIS
@id int = null,
@nombre varchar(128) = null
As
Begin
 	select id, nombre
 	from Pais 
 	where id = isnull(@id, id)
 	  and nombre = isnull(@nombre, nombre)
	order by nombre;
END;

-- Buscar Provincia
create procedure S_Provincia
@id int = null,
@nombre varchar(128) = null,
@paisid int = null,
@nombrepais varchar(128) = null
As
Begin
 	select pr.id, pr.nombre, pa.id as paisid, pa.nombre as nombrepais
 	from Provincia pr
    inner join Pais pa
       on pr.pais_id = pa.id
 	where pr.id = isnull(@id, pr.id)
 	  and pr.nombre = isnull(@nombre, pr.nombre)
      and pa.id = isnull(@paisid, pa.id)
      and pa.nombre = isnull(@nombrepais, pa.nombre)
	order by pa.nombre, pr.nombre;
END;

-- Buscar Estado Civil
CREATE PROCEDURE [dbo].[S_EstadoCivil]
    @estadocivilid int = null,
    @estadocivil varchar(128) = null
AS
BEGIN
    SELECT estadocivilid, estadocivil
    FROM vEstadoCivil
    WHERE estadocivilid = ISNULL(@estadocivilid, estadocivilid)
      AND estadocivil = ISNULL(@estadocivil, estadocivil);
END;
GO

-- Buscar Género
CREATE PROCEDURE [dbo].[S_Genero]
    @generoid int = null,
    @genero varchar(128) = null
AS
BEGIN
    SELECT generoid, genero
    FROM vGenero
    WHERE generoid = ISNULL(@generoid, generoid)
      AND genero = ISNULL(@genero, genero);
END;
GO

-- Buscar Tipo de Contacto
CREATE PROCEDURE [dbo].[S_TipoContacto]
    @tipocontactoid int = null,
    @tipocontacto varchar(128) = null
AS
BEGIN
    SELECT tipocontactoid, tipocontacto
    FROM vTipoContacto
    WHERE tipocontactoid = ISNULL(@tipocontactoid, tipocontactoid)
      AND tipocontacto = ISNULL(@tipocontacto, tipocontacto);
END;
GO

-- Buscar Tipo de Domicilio
CREATE PROCEDURE [dbo].[S_TipoDomicilio]
    @tipodomicilioid int = null,
    @tipodomicilio varchar(128) = null
AS
BEGIN
    SELECT tipodomicilioid, tipodomicilio
    FROM vTipoDomicilio
    WHERE tipodomicilioid = ISNULL(@tipodomicilioid, tipodomicilioid)
      AND tipodomicilio = ISNULL(@tipodomicilio, tipodomicilio);
END;
GO

-- Buscar Localidad
CREATE PROCEDURE [dbo].[S_Localidad]
    @localidadid int = null,
    @localidad varchar(128) = null,
    @provincia_id int = null,
    @nombreprovincia varchar(128) = null,
    @pais_id int = null,
    @nombrepais varchar(128) = null
AS
BEGIN
    SELECT localidadid, localidad, provincia_id, nombreprovincia, pais_id, nombrepais
    FROM vLocalidad
    WHERE localidadid = ISNULL(@localidadid, localidadid)
      AND localidad = ISNULL(@localidad, localidad)
      AND provincia_id = ISNULL(@provincia_id, provincia_id)
      AND nombreprovincia = ISNULL(@nombreprovincia, nombreprovincia)
      AND pais_id = ISNULL(@pais_id, pais_id)
      AND nombrepais = ISNULL(@nombrepais, nombrepais);
END;
GO

-- Buscar Persona
CREATE PROCEDURE [dbo].[S_Persona]
    @personaid int = null,
    @nombre varchar(128) = null,
    @apellido varchar(128) = null,
    @documento varchar(64) = null,
    @fnacto date = null,
    @tipodocumento_id int = null,
    @nombretipodocumento varchar(128) = null,
    @genero_id int = null,
    @nombregenero varchar(128) = null,
    @estadocivil_id int = null,
    @nombreestadocivil varchar(128) = null
AS
BEGIN
    SELECT 
        personaid, nombre, apellido, documento, fnacto, 
        tipodocumento_id, nombretipodocumento, 
        genero_id, nombregenero, 
        estadocivil_id, nombreestadocivil
    FROM vPersona
    WHERE personaid = ISNULL(@personaid, personaid)
      AND nombre = ISNULL(@nombre, nombre)
      AND apellido = ISNULL(@apellido, apellido)
      AND documento = ISNULL(@documento, documento)
      AND fnacto = ISNULL(@fnacto, fnacto)
      AND tipodocumento_id = ISNULL(@tipodocumento_id, tipodocumento_id)
      AND nombretipodocumento = ISNULL(@nombretipodocumento, nombretipodocumento)
      AND genero_id = ISNULL(@genero_id, genero_id)
      AND nombregenero = ISNULL(@nombregenero, nombregenero)
      AND estadocivil_id = ISNULL(@estadocivil_id, estadocivil_id)
      AND nombreestadocivil = ISNULL(@nombreestadocivil, nombreestadocivil);
END;
GO

-- Buscar Contacto
CREATE PROCEDURE [dbo].[S_Contacto]
    @contactoid int = null,
    @contacto varchar(256) = null,
    @tipocontacto_id int = null,
    @nombretipocontacto varchar(128) = null,
    @persona_id int = null,
    @nombrepersona varchar(128) = null,
    @apellidopersona varchar(128) = null
AS
BEGIN
    SELECT 
        contactoid, contacto, 
        tipocontacto_id, nombretipocontacto, 
        persona_id, nombrepersona, apellidopersona
    FROM vContacto
    WHERE contactoid = ISNULL(@contactoid, contactoid)
      AND contacto = ISNULL(@contacto, contacto)
      AND tipocontacto_id = ISNULL(@tipocontacto_id, tipocontacto_id)
      AND nombretipocontacto = ISNULL(@nombretipocontacto, nombretipocontacto)
      AND persona_id = ISNULL(@persona_id, persona_id)
      AND nombrepersona = ISNULL(@nombrepersona, nombrepersona)
      AND apellidopersona = ISNULL(@apellidopersona, apellidopersona);
END;
GO

-- Buscar Domicilio
CREATE PROCEDURE [dbo].[S_Domicilio]
    @domicilioid int = null,
    @direccion varchar(256) = null,
    @codpos varchar(16) = null,
    @localidad_id int = null,
    @nombrelocalidad varchar(128) = null,
    @provincia_id int = null,
    @nombreprovincia varchar(128) = null,
    @pais_id int = null,
    @nombrepais varchar(128) = null
AS
BEGIN
    SELECT 
        domicilioid, direccion, codpos, 
        localidad_id, nombrelocalidad, 
        provincia_id, nombreprovincia, 
        pais_id, nombrepais
    FROM vDomicilio
    WHERE domicilioid = ISNULL(@domicilioid, domicilioid)
      AND direccion = ISNULL(@direccion, direccion)
      AND codpos = ISNULL(@codpos, codpos)
      AND localidad_id = ISNULL(@localidad_id, localidad_id)
      AND nombrelocalidad = ISNULL(@nombrelocalidad, nombrelocalidad)
      AND provincia_id = ISNULL(@provincia_id, provincia_id)
      AND nombreprovincia = ISNULL(@nombreprovincia, nombreprovincia)
      AND pais_id = ISNULL(@pais_id, pais_id)
      AND nombrepais = ISNULL(@nombrepais, nombrepais);
END;
GO

-- Buscar DomicilioPersona
CREATE PROCEDURE [dbo].[S_DomicilioPersona]
    @domiciliopersonaid int = null,
    @tipodomicilio_id int = null,
    @nombretipodomicilio varchar(128) = null,
    @persona_id int = null,
    @nombrepersona varchar(128) = null,
    @apellidopersona varchar(128) = null,
    @domicilio_id int = null,
    @direcciondomicilio varchar(256) = null,
    @nombrelocalidad varchar(128) = null
AS
BEGIN
    SELECT 
        domiciliopersonaid, 
        tipodomicilio_id, nombretipodomicilio, 
        persona_id, nombrepersona, apellidopersona, 
        domicilio_id, direcciondomicilio, nombrelocalidad
    FROM vDomicilioPersona
    WHERE domiciliopersonaid = ISNULL(@domiciliopersonaid, domiciliopersonaid)
      AND tipodomicilio_id = ISNULL(@tipodomicilio_id, tipodomicilio_id)
      AND nombretipodomicilio = ISNULL(@nombretipodomicilio, nombretipodomicilio)
      AND persona_id = ISNULL(@persona_id, persona_id)
      AND nombrepersona = ISNULL(@nombrepersona, nombrepersona)
      AND apellidopersona = ISNULL(@apellidopersona, apellidopersona)
      AND domicilio_id = ISNULL(@domicilio_id, domicilio_id)
      AND direcciondomicilio = ISNULL(@direcciondomicilio, direcciondomicilio)
      AND nombrelocalidad = ISNULL(@nombrelocalidad, nombrelocalidad);
END;
GO
