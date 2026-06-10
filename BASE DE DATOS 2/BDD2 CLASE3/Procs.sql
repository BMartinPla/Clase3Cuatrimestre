DROP Procedure IF EXISTS [dbo].[I_Pais];
create procedure I_Pais
    @nombre varchar(256),
    @id int output
as
Begin
    Begin try
        insert into Pais(nombre) values (@nombre);
        set @id = SCOPE_IDENTITY();
    end try
    Begin catch
        set @id = -1
        SELECT
            @id as RetCode,
            ERROR_NUMBER() AS ErrorNumber,
            ERROR_STATE() AS ErrorState,
            ERROR_SEVERITY() AS ErrorSeverity,
            ERROR_PROCEDURE() AS ErrorProcedure,
            ERROR_LINE() AS ErrorLine,
            ERROR_MESSAGE() AS ErrorMessage;
    End catch
End;

----------------------------------------
--- Pruebas
----------------------------------------
declare @id int
exec I_pais 'chile', @id output
select @id;
select * from Pais p

----------------------------------------
-- Insertar paises con la procedure
----------------------------------------
Begin
    declare @id int
    exec I_Pais 'Argentina', @id output
    exec I_Pais 'Bolivia', @id output
    exec I_Pais 'Brasil', @id output
    exec I_Pais 'Chile', @id output
    exec I_Pais 'Colombia', @id output
    exec I_Pais 'Ecuador', @id output
    exec I_Pais 'Guyana', @id output
    exec I_Pais 'Paraguay', @id output
    exec I_Pais 'Perú', @id output
    exec I_Pais 'Surinam', @id output
    exec I_Pais 'Uruguay', @id output
    exec I_Pais 'Venezuela', @id output
End

----------------------------------------
-- Select con procedure
----------------------------------------
DROP Procedure IF EXISTS [dbo].[S_Pais];

create procedure S_Pais
    @id int = NULL,
    @nombre varchar(256) = NULL
as
Begin
    select id, nombre
    from Pais
    where id = isnull(@id, id)
      and nombre = isnull(upper(@nombre), nombre);
End;

-----------------------------
-- Pruebas
-----------------------------
exec s_pais
exec s_pais @id = 1
exec s_pais @nombre='chiLE'

----------------------------------------
-- Delete con procedure
----------------------------------------
DROP Procedure IF EXISTS [dbo].[D_Pais];

create procedure D_Pais
    @id int = NULL,
    @nombre varchar(256) = NULL
as
Begin
    if @id is not null
        Begin
            delete from Pais where id = @id
        End
    else if @nombre is not null
        Begin
            delete from Pais where nombre = upper(@nombre);
        End;
End;

----------------------------------------
-- Delete con procedure
----------------------------------------
exec d_pais @id=27
exec s_pais
exec d_pais @nombre = 'guyana'
exec s_pais
