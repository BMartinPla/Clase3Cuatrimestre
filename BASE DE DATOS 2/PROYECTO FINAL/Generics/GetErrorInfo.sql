CREATE PROCEDURE GetErrorInfo 
AS  
BEGIN
    DECLARE @ErrorMessage NVARCHAR(4000),
        @ErrorProcedure NVARCHAR(4000),
        @ErrorNumber INT,
        @ErrorSeverity INT,
        @ErrorLine INT,
        @ErrorState INT;
    DECLARE @OutMessage NVARCHAR(4000);
    SELECT  
        @ErrorNumber = ERROR_NUMBER(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE(),
        @ErrorProcedure = ERROR_PROCEDURE(),
        @ErrorLine = ERROR_LINE(),
        @ErrorMessage = ERROR_MESSAGE();
    SET @OutMessage = CONCAT('Error in', @ErrorProcedure, ', Line', @ErrorLine, ': ', @ErrorMessage);
    RAISERROR (@OutMessage, @ErrorSeverity, @ErrorState);
END;
