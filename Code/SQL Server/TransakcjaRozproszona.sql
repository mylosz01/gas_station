USE StacjaPaliw;
go

SET xact_abort on;

--TRANSAKCJA ZMIANY PUNKTOW ZA TRANSAKCJĘ PALIWOWA NA PODSTAWIE ZMIANY ILOSCI ZATANKWOANEGO PALIWA



BEGIN DISTRIBUTED TRANSACTION
	DECLARE @transaction_ID INT;
	DECLARE @new_petrol_amount NUMERIC(8,2);
	DECLARE @new_petrol_price NUMERIC(8,2);

	DECLARE @clientID INT;
	DECLARE @sql NVARCHAR(MAX);	
	DECLARE @petrolID INT;
	DECLARE @new_points_for_client INT;

	SET @transaction_ID = 1;
	SET @new_petrol_amount = 60.00; --40
	SET @new_petrol_price = 467.85; --250.03

	UPDATE Transakcje_paliwowe SET ilosc_paliwa = @new_petrol_amount, kwota_transakcji = @new_petrol_price
	WHERE ID_transakcji = @transaction_ID;

	SELECT @clientID = ID_klienta, @petrolID = ID_paliwa FROM Transakcje_paliwowe where
	ID_transakcji = @transaction_ID;

	SELECT @new_points_for_client = (ilosc_punktow * @new_petrol_amount)
	FROM ZaopatrzenieOracle.."ADMINISTRATORORACLE"."PALIWA"
	WHERE ID_paliwa = @petrolID;




	SET @sql = N'UPDATE ADMINISTRATORORACLE.KLIENCI SET PUNKTY = ''' + CAST(@new_points_for_client AS NVARCHAR(15)) + '''
				WHERE ID_KLIENTA = ''' + CAST(@clientID AS NVARCHAR(10)) +''''; 

	EXECUTE (@sql) AT ZaopatrzenieOracle;

COMMIT TRANSACTION

BEGIN DISTRIBUTED TRANSACTION
	INSERT INTO OPENQUERY(Pracownicy,'Select * FROM [Pracownicy$]')
	VALUES(472,'Seweryn','Nowacki','522479364','25');
	INSERT INTO Harmonogram(ID_pracownika,data_rozpoczecia_zmiany,data_zakonczenia_zmiany)
	VALUES(472,'2024-10-10 08:00:00.000','2024-10-10 :16:00:00.000')

COMMIT TRANSACTION


SELECT * FROM Transakcje_paliwowe;
select * from OPENQUERY(ZaopatrzenieOracle,'select * from ADMINISTRATORORACLE.Klienci');
GO

SELECT * FROM HARMONOGRAM

DECLARE @sql NVARCHAR(200);
SET @sql = N'UPDATE ADMINISTRATORORACLE.KLIENCI SET PUNKTY = ''' + CAST(467.85 AS NVARCHAR(10)) + '''
				WHERE ID_KLIENTA = ''' + CAST(10 AS NVARCHAR(10))  +''''; 

	EXECUTE (@sql) AT ZaopatrzenieOracle;

