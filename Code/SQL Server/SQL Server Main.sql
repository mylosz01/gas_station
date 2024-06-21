
-- wywołanie sprawdzenia punktów dla klienta
USE [StacjaPaliw]
GO
DECLARE @pointsOut INT;

EXEC check_loyalty_points
    @client_ID = 5,
    @points = @pointsOut OUTPUT;

Select @pointsOut as 'User Points'

select * from ZaopatrzenieOracle.."ADMINISTRATORORACLE"."KLIENCI"

--dodawania klientowi punktów
USE [StacjaPaliw]
GO

EXEC [dbo].[add_points_to_client]
    @client_ID = 5,
    @points_to_add = 75;

select * from ZaopatrzenieOracle.."ADMINISTRATORORACLE"."KLIENCI"
WHERE ID_klienta = 5;

--OPENROWSET

--Oracle
SELECT ora.*
	FROM OPENROWSET(
		'OraOLEDB.Oracle',
		'(DESCRIPTION =
		(ADDRESS_LIST =
		  (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.162.166)(PORT = 1521))
		)
		(CONNECT_DATA =
		  (SID = orcl)
		)
		)';
		'AdministratorOracle';
		'123',
		'Select * from ADMINISTRATORORACLE.PALIWA'
	) as ora
	GO

-- Excel
SELECT * 
FROM OPENROWSET('Microsoft.ACE.OLEDB.16.0', 
'Excel 12.0;Database=C:\Pracownicy.xlsx;', Pracownicy$);



SELECT CURRENT_USER;

--Dodanie pracownika (Excel)
EXEC [dbo].[hire_employee]
@emp_ID = 15,
@name = 'Stefan',
@surname = 'Wisniewski',
@phone_number = '428624798',
@salary = 15;

SELECT * FROM OPENQUERY(Pracownicy,'Select * from [Pracownicy$]');

-- Stwórz zamówienie paliwowe - testowanie
EXEC dbo.make_petrol_order
@petrol_name = 'benzyna 95',
@provider_ID  = '20',
@petrol_amout = 250,
@delivery_cost = 2225.00

SELECT * FROM OPENQUERY(ZaopatrzenieOracle,'Select * from Zamowienia_paliwowe');

-- Stwórz zamówienie spożywcze
EXEC dbo.make_product_order
@product_name = 'Gasnica',
@provider_ID = 9,
@amount = 15,
@delivery_cost = 685.00


SELECT * FROM OPENQUERY(ZaopatrzenieOracle,'Select * from Zamowienia_spozywcze');
DELETE FROM OPENQUERY(ZaopatrzenieOracle,'Select * from Zamowienia_spozywcze')
WHERE ID_ZAMOWIENIA = 61;


--Ustawienie ceny paliwa - testowanie

DECLARE @petrol_name varchar(20);
declare @new_price NUMERIC(8,2);

Set @petrol_name = 'LPG';
SET @new_price = 2.25;

EXECUTE (
    'BEGIN ADMINISTRATORORACLE.UPDATE_PETROL_PRICE(:pertol_name, :new_price); END;',
    @petrol_name, @new_price
) AT ZaopatrzenieOracle;
GO


SELECT * FROM dbo.petrol_prices;
GO


--Ustawienie punktów za dane paliwo -testowanie

DECLARE @petrol_name varchar(20);
declare @new_points INT;

Set @petrol_name = 'LPG';
SET @new_points = 3;

EXECUTE (
    'BEGIN ADMINISTRATORORACLE.UPDATE_PETROL_POINTS(:pertol_name, :new_price); END;',
    @petrol_name, @new_points
) AT ZaopatrzenieOracle;
GO


SELECT * FROM TRANSAKCJE_PALIWOWE;


--Dodanie transakcji --testowanie
-- Dodanie produktu -- testowanie

--client_petrol_transaction_history --testowanie
SELECT ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji FROM Transakcje_paliwowe WHERE ID_klienta = 10;

EXEC dbo.client_petrol_transaction_history
@client_ID = 10;

--client_products_transaction_history
SELECT ID_produktu,ilosc,kwota_transakcji,data_transakcji FROM Transakcje_spozywcze WHERE ID_klienta = 10;

EXEC dbo.client_products_transaction_history
@client_ID = 10;
