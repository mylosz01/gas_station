use StacjaPaliw
go


CREATE OR ALTER PROCEDURE delete_client
(
	@name VARCHAR(40), -- nazwa klienta
	@surname VARCHAR(50), -- nazwisko klienta
	@id INT -- ID klienta
) 
AS
	DECLARE @sql NVARCHAR(MAX);
BEGIN
	IF @id IS NOT NULL
		BEGIN
			DECLARE @client_exists INT;
			SELECT @client_exists = COUNT(*) FROM ZaopatrzenieOracle.."ADMINISTRATORORACLE"."KLIENCI" WHERE ID_klienta = @id;
			IF @client_exists < 1
			BEGIN
				RAISERROR('Cannot find client to delete', 16, 1);
			END
			
			SET @sql = N'DELETE FROM ADMINISTRATORORACLE.KLIENCI WHERE ID_klienta = ' + CAST(@id AS VARCHAR);
			EXEC (@sql) AT ZaopatrzenieOracle;
			
			BEGIN DISTRIBUTED TRANSACTION;
			UPDATE Transakcje_paliwowe SET ID_klienta = NULL WHERE ID_klienta = @id;
			UPDATE Transakcje_spozywcze SET ID_klienta = NULL WHERE ID_klienta = @id;
			COMMIT TRANSACTION;
		END
	ELSE
		BEGIN
			DECLARE @client_by_name_id INT;
			
			IF @name IS NULL OR @surname IS NULL
			BEGIN
				RAISERROR('Cannot find client to delete', 16, 1);
			END
			
			SELECT @client_by_name_id = ID_klienta FROM ZaopatrzenieOracle.."ADMINISTRATORORACLE"."KLIENCI" WHERE imie =  @name AND nazwisko = @surname
			
			IF @client_by_name_id IS NULL
			BEGIN
				RAISERROR('Cannot find client to delete', 16, 1);
			END
			
			SET @sql = N'DELETE FROM ADMINISTRATORORACLE.KLIENCI WHERE imie = ''' + CAST(@name AS VARCHAR(30)) + ''' AND nazwisko = ''' + CAST(@surname AS VARCHAR(50)) + '''';
			EXEC (@sql) AT ZaopatrzenieOracle;
			
			BEGIN DISTRIBUTED TRANSACTION
			UPDATE Transakcje_paliwowe SET ID_klienta = NULL WHERE ID_klienta = @client_by_name_id;
			UPDATE Transakcje_spozywcze SET ID_klienta = NULL WHERE ID_klienta = @client_by_name_id;
			COMMIT TRANSACTION;
		END
END;

SELECT * FROM OPENQUERY(ZaopatrzenieOracle, 'SELECT * FROM "ADMINISTRATORORACLE"."KLIENCI"');

EXEC dbo.delete_client 
@name = 'Karolina', 
@surname = 'Kowal',
@id = NULL

select * from Transakcje_paliwowe;

EXEC dbo.register_client
@name = 'Karolina', 
@surname = 'Kowal',
@email = 'karolinakowal@gmail.com'
