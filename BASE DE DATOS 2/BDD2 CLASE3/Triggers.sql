-- Cubrirme que todos los campos nombre queden
-- en mayuscula mas alla de lo que el front end
-- envie.



DROP TRIGGER IF EXISTS [dbo].[TRG_Nombre_Pais];
create trigger TRG_Nombre_Pais
on dbo.Pais
for insert, update
as
Begin
    update Pais set nombre = upper(nombre)
    where id = (select id from inserted);
End;

DROP TRIGGER IF EXISTS [dbo].[TRG_Nombre_Genero];
create trigger TRG_Nombre_Genero
on dbo.Genero
for insert, update
as
Begin
    update Genero set nombre = upper(nombre)
    where id = (select id from inserted);
End;

DROP TRIGGER IF EXISTS [dbo].[TRG_Nombre_EstadoCivil];
create trigger TRG_Nombre_EstadoCivil
on dbo.EstadoCivil
for insert, update
as
Begin
    update EstadoCivil set nombre = upper(nombre)
    where id = (select id from inserted);
End;

DROP TRIGGER IF EXISTS [dbo].[TRG_Nombre_TipoContacto];
create trigger TRG_Nombre_TipoContacto
on dbo.TipoContacto
for insert, update
as
Begin
    update TipoContacto set nombre = upper(nombre)
    where id = (select id from inserted);
End;

DROP TRIGGER IF EXISTS [dbo].[TRG_Nombre_Provincia];
create trigger TRG_Nombre_Provincia
on dbo.Provincia
for insert, update
as
Begin
    update Provincia set nombre = upper(nombre)
    where id = (select id from inserted);
End;

DROP TRIGGER IF EXISTS [dbo].[TRG_Nombre_Localidad];
create trigger TRG_Nombre_Localidad
on dbo.Localidad
for insert, update
as
Begin
    update Localidad set nombre = upper(nombre)
    where id = (select id from inserted);
End;

DROP TRIGGER IF EXISTS [dbo].[TRG_Nombre_TipoDomicilio];
create trigger TRG_Nombre_TipoTRG_Nombre_TipoDomicilioContacto
on dbo.TipoDomicilio
for insert, update
as
Begin
    update TipoDomicilio set nombre = upper(nombre)
    where id = (select id from inserted);
End;