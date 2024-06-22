
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


--Dodanie transakcji --testowanie

	-- prawidlowa transakcja
	DECLARE @clientID INT;
	DECLARE @petrolID INT;
	DECLARE @amount_set INT;

	SET @clientID = 10;
	SET @petrolID = 5;
	SET @amount_set = 35;

	EXEC dbo.add_petrol_transaction
	@client_ID = @clientID,
	@petrol_ID = @petrolID,
	@amount = @amount_set

	
	SELECT * FROM Transakcje_paliwowe
	ORDER BY data_transakcji DESC;

	-- ujemna ilosc paliwa
	DECLARE @clientID INT;
	DECLARE @petrolID INT;
	DECLARE @amount_set INT;

	SET @clientID = 10;
	SET @petrolID = 5;
	SET @amount_set = -35;

	EXEC dbo.add_petrol_transaction
	@client_ID = @clientID,
	@petrol_ID = @petrolID,
	@amount = @amount_set
	
	SELECT * FROM Transakcje_paliwowe
	ORDER BY data_transakcji DESC;

	-- KLIENTA NIE MA W BAZIE DANYCH
	DECLARE @clientID INT;
	DECLARE @petrolID INT;
	DECLARE @amount_set INT;

	SET @clientID = 225;
	SET @petrolID = 5;
	SET @amount_set = 35;

	EXEC dbo.add_petrol_transaction
	@client_ID = @clientID,
	@petrol_ID = @petrolID,
	@amount = @amount_set

	
	SELECT * FROM Transakcje_paliwowe
	ORDER BY data_transakcji DESC;

	
	-- ID klienta zdefiniowane jako NULL
	DECLARE @clientID INT;
	DECLARE @petrolID INT;
	DECLARE @amount_set INT;

	SET @clientID = NULL;
	SET @petrolID = 5;
	SET @amount_set = 35;

	EXEC dbo.add_petrol_transaction
	@client_ID = @clientID,
	@petrol_ID = @petrolID,
	@amount = @amount_set

	
	SELECT * FROM Transakcje_paliwowe
	ORDER BY data_transakcji DESC;


	-- PALIWA NIE MA W BAZIE DANYCH
	DECLARE @clientID INT;
	DECLARE @petrolID INT;
	DECLARE @amount_set INT;

	SET @clientID = 10;
	SET @petrolID = 50;
	SET @amount_set = 35;

	EXEC dbo.add_petrol_transaction
	@client_ID = @clientID,
	@petrol_ID = @petrolID,
	@amount = @amount_set

	SELECT * FROM Transakcje_paliwowe
	ORDER BY data_transakcji DESC;

	--zamówienie paliwa ponad dostępną ilosc
	DECLARE @clientID INT;
	DECLARE @petrolID INT;
	DECLARE @amount_set INT;

	SET @clientID = 10;
	SET @petrolID = 5;
	SET @amount_set = 1000;

	EXEC dbo.add_petrol_transaction
	@client_ID = @clientID,
	@petrol_ID = @petrolID,
	@amount = @amount_set

	
	SELECT * FROM Transakcje_paliwowe
	ORDER BY data_transakcji DESC;

	SELECT * FROM petrol_stock;
	
	
	-- zamowienie paliwa tak ze zostawilo by krytyczna ilosc
	DECLARE @clientID INT;
	DECLARE @petrolID INT;
	DECLARE @amount_set INT;

	SET @clientID = 10;
	SET @petrolID = 5;
	SET @amount_set = 609;

	EXEC dbo.add_petrol_transaction
	@client_ID = @clientID,
	@petrol_ID = @petrolID,
	@amount = @amount_set
	
	SELECT * FROM Transakcje_paliwowe
	ORDER BY data_transakcji DESC;

	SELECT * FROM petrol_stock;
	select * from petrol_prices;

-- Dodanie produktu -- testowanie

select * from ZaopatrzenieOracle.."ADMINISTRATORORACLE"."PRODUKTY_SPOZYWCZE"
SELECT * FROM products_stock;
SELECT * FROM products_prices;

	--transakcja prawidlowa
	
	DECLARE @clientID INT;
	DECLARE @productID INT;
	DECLARE @amount_set INT;

	SET @clientID = 10;
	SET @productID = 2;
	SET @amount_set = 3;

	EXEC dbo.add_product_transaction
	@client_ID = @clientID,
	@product_ID = @productID,
	@amount = @amount_set

	SELECT * FROM Transakcje_spozywcze
	ORDER BY data_transakcji DESC;

	SELECT * FROM products_stock;
	SELECT * FROM products_prices;

	
	SELECT * FROM OPENQUERY(ZaopatrzenieOracle,'SELECT * FROM KLIENCI')
	WHERE ID_klienta = 10;

	--UPDATE ZaopatrzenieOracle.."ADMINISTRATORORACLE"."PRODUKTY_SPOZYWCZE"
	--SET ILOSC_NA_STANIE = 15
	--WHERE ID_PRODUKTU = 2;

	--ujemna ilosc produktu
	DECLARE @clientID INT;
	DECLARE @productID INT;
	DECLARE @amount_set INT;

	SET @clientID = 10;
	SET @productID = 2;
	SET @amount_set = 3;

	EXEC dbo.add_product_transaction
	@client_ID = @clientID,
	@product_ID = @productID,
	@amount = @amount_set

	SELECT * FROM Transakcje_spozywcze
	ORDER BY data_transakcji DESC;


	--klienta nie ma w bazie danych
	DECLARE @clientID INT;
	DECLARE @productID INT;
	DECLARE @amount_set INT;

	SET @clientID = 225;
	SET @productID = 2;
	SET @amount_set = 3;

	EXEC dbo.add_product_transaction
	@client_ID = @clientID,
	@product_ID = @productID,
	@amount = @amount_set

	SELECT * FROM Transakcje_spozywcze
	ORDER BY data_transakcji DESC;

	--zamowienie klienta od ID ustawionym jako NULL
	DECLARE @clientID INT;
	DECLARE @productID INT;
	DECLARE @amount_set INT;

	SET @clientID = NULL;
	SET @productID = 2;
	SET @amount_set = 3;

	EXEC dbo.add_product_transaction
	@client_ID = @clientID,
	@product_ID = @productID,
	@amount = @amount_set

	SELECT * FROM Transakcje_spozywcze
	ORDER BY data_transakcji DESC;

	SELECT * FROM products_stock;

	--zamowienie na wiecej produktow niz jest na stanie
	DECLARE @clientID INT;
	DECLARE @productID INT;
	DECLARE @amount_set INT;

	SET @clientID = 10;
	SET @productID = 2;
	SET @amount_set = 225;

	EXEC dbo.add_product_transaction
	@client_ID = @clientID,
	@product_ID = @productID,
	@amount = @amount_set

	SELECT * FROM Transakcje_spozywcze
	ORDER BY data_transakcji DESC;



--client_petrol_transaction_history --testowanie
SELECT ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji FROM Transakcje_paliwowe WHERE ID_klienta = 10;

EXEC dbo.client_petrol_transaction_history
@client_ID = 10;

--client_products_transaction_history
SELECT ID_produktu,ilosc,kwota_transakcji,data_transakcji FROM Transakcje_spozywcze WHERE ID_klienta = 10;

EXEC dbo.client_products_transaction_history
@client_ID = 10;

UPDATE OPENQUERY(ZaopatrzenieOracle,'SELECT * FROM ADMINISTRATORORACLE.PALIWA')
	SET ILOSC_W_LITRACH = 740
	WHERE ID_PALIWA = 5;

SELECT * FROM petrol_stock;
