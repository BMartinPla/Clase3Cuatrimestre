-------------------------------------------------------------------
-- Ejemplo de Stored Procedure para select
-------------------------------------------------------------------

DROP PROCEDURE IF EXISTS dbo.S_BarriosPorProvincia;

CREATE PROCEDURE dbo.S_BarriosPorProvincia
    @id int
AS
BEGIN
    SET NOCOUNT ON; -- Prevents extra "rows affected" messages
    SELECT 
        b.nombre as Barrio, 
        l.nombre as Localidad , 
        d.nombre as Departamento, 
        p.nombre as Provincia
    FROM Barrio b
    INNER JOIN Localidad l
    	ON l.id = b.localidad_id
    INNER JOIN Departamento d
    	ON d.id = l.depto_id 
    INNER JOIN Provincia p 
    	ON p.id = d.provincia_id
		AND p.id = @id;
END;

-- Vemos los barrios de Tierra del Fuego
exec S_BarriosPorProvincia @id=23

-------------------------------------------------------------------
-- Ejemplo de Stored Procedure para select con mas de un parametro
-------------------------------------------------------------------
DROP PROCEDURE IF EXISTS dbo.S_BarriosPorDepartamento;

CREATE PROCEDURE dbo.S_BarriosPorDepartamento
    @departamento_id int
AS
BEGIN
    SET NOCOUNT ON; -- Prevents extra "rows affected" messages
    SELECT 
        b.nombre as Barrio, 
        l.nombre as Localidad , 
        d.nombre as Departamento, 
        p.nombre as Provincia
    FROM Barrio b
    INNER JOIN Localidad l
    	ON l.id = b.localidad_id
    INNER JOIN Departamento d
    	ON d.id = l.depto_id 
    INNER JOIN Provincia p 
    	ON p.id = d.provincia_id
    WHERE d.id = @departamento_id
	ORDER BY 1,2;
END;

-- Vemos los barrios del Departamento de San Nicolas
exec S_BarriosPorDeaprtamento @id=79 -- Es San Nicolas

-------------------------------------------------------------------
-- Ejemplo de Stored Procedure para mensajes de error
-------------------------------------------------------------------
DROP PROCEDURE IF EXISTS dbo.S_Error;

CREATE PROCEDURE S_Error
AS
BEGIN
    SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage;
END;

-------------------------------------------------------------------
-- Ejemplo de Stored Procedure para insert
-------------------------------------------------------------------
DROP PROCEDURE IF EXISTS dbo.I_AguaCorriente;

CREATE PROCEDURE dbo.I_AguaCorriente
    @nombre NVARCHAR(128),
    @id int OUTPUT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Agua_Corriente(nombre)
        VALUES (@nombre);

        SET @id = SCOPE_IDENTITY();
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS ErrorProcedure;
    END CATCH
END;

-- Como probar en SQL Studio: (Atentos a que los datos pueden variar)
declare @id int -- declarar la vble que sera output
exec dbo.I_AguaCorriente @nombre='Juntar MUCHA Agua de Lluvia', @id=@id output -- Poner output!!
select @id -- Podemos ver el ultimo id creado

-- Nota: Si ejecutamos esto mas de una vez con el mismo nombre,
-- se viola la UNIQUE de la columna nombre de la table y se ejecuta 
-- la stored procedure ERROR_PROCEDURE y vemos el error.


-------------------------------------------------------------------
-- Ejemplo de Stored Procedure para update
-------------------------------------------------------------------
DROP PROCEDURE IF EXISTS dbo.U_AguaCorriente;

CREATE PROCEDURE dbo.U_AguaCorriente
    @id int,
    @nombre NVARCHAR(128)
AS
BEGIN
    BEGIN TRY
        UPDATE Agua_Corriente
        SET nombre = @nombre
        WHERE id = @id;
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS ErrorProcedure;
    END CATCH
END;

-- Pruaba: Sacar el id de la que ingresamos antes:
select * from Agua_corriente where id = 17; -- Cambiar el Nro por le ultimo q insertamos
exec U_AguaCorriente @id=17, @nombre="Ojala Para de llover"
select * from Agua_corriente where id = 17;


-------------------------------------------------------------------
-- Ejemplo de Stored Procedure para delete
-------------------------------------------------------------------
DROP PROCEDURE IF EXISTS dbo.D_AguaCorriente;

CREATE PROCEDURE dbo.D_AguaCorriente
    @id int
AS
BEGIN
    BEGIN TRY
        DELETE Agua_corriente WHERE id = @id;
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE() AS ErrorProcedure;
    END CATCH
END;

-- Pruaba: Sacar data para ver que borramos:
select * from Agua_corriente prder by id desc;
exec D_AguaCorriente @id=17
select * from Agua_corriente where id = 17; -- No deberia devolver nada


select 
	sum(cantidad_viviendas) AS TotalViviendas,
	sum(cantidad_familias) as TotalFamilias,
	max(superficie_m2)
from Barrio;