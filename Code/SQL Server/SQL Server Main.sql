
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
-- Zatrudnianie pracownika (hire_employee)
		
		--prawidłowe wywołanie
		EXEC [dbo].[hire_employee]
		@emp_ID = 225,
		@name = 'Alina',
		@surname = 'Nowak',
		@phone_number = '428624798',
		@salary = 15;

		SELECT * FROM dbo.show_employees;

		--pensja ujemna
		EXEC [dbo].[hire_employee]
		@emp_ID = 230,
		@name = 'Robert',
		@surname = 'Nowicki',
		@phone_number = '521798628',
		@salary = -15;

		SELECT * FROM dbo.show_employees;

		--pracownik z danym ID już istnieje
		EXEC [dbo].[hire_employee]
		@emp_ID = 1,
		@name = 'Robert',
		@surname = 'Nowicki',
		@phone_number = '521798628',
		@salary = 15;
		
		SELECT * FROM dbo.show_employees;

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

SELECT COUNT(ID_pracownika) FROM Pracownicy...[Pracownicy$] WHERE ID_pracownika = 450;


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


--Dodanie transakcji paliwa

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

-- Dodanie transakcji produktu -- testowanie

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



-- set_product_price
	
	-- prawidlowe wywolanie
	DECLARE @product_name varchar(40);
	declare @new_price NUMERIC(5,2);

	Set @product_name = 'Hot-dog duzy';
	SET @new_price = 9.50;

	EXECUTE (
		'BEGIN ADMINISTRATORORACLE.SET_PRODUCT_PRICE(:product_name, :new_price); END;',
		@product_name, @new_price
	) AT ZaopatrzenieOracle;
	GO

	SELECT * FROM products_prices;

	--ujemna cena
	DECLARE @product_name varchar(40);
	declare @new_price NUMERIC(5,2);

	Set @product_name = 'Hot-dog duzy';
	SET @new_price = -8.50;

	EXECUTE (
		'BEGIN ADMINISTRATORORACLE.SET_PRODUCT_PRICE(:product_name, :new_price); END;',
		@product_name, @new_price
	) AT ZaopatrzenieOracle;
	GO

	SELECT * FROM products_prices;

	--produkt o danej nazwie nie istnieje
	DECLARE @product_name varchar(40);
	declare @new_price NUMERIC(5,2);

	Set @product_name = 'aaa';
	SET @new_price = 8.50;

	EXECUTE (
		'BEGIN ADMINISTRATORORACLE.SET_PRODUCT_PRICE(:product_name, :new_price); END;',
		@product_name, @new_price
	) AT ZaopatrzenieOracle;
	GO

	SELECT * FROM products_prices;

	--zmiana ceny wieksza niz 50% poprzedniej wartosci
	DECLARE @product_name varchar(40);
	declare @new_price NUMERIC(5,2);

	Set @product_name = 'Hot-dog duzy';
	SET @new_price = 17.99;

	EXECUTE (
		'BEGIN ADMINISTRATORORACLE.SET_PRODUCT_PRICE(:product_name, :new_price); END;',
		@product_name, @new_price
	) AT ZaopatrzenieOracle;
	GO

	SELECT * FROM products_prices;


--set_product_points
	
	--prawidlowe wywolanie
	DECLARE @product_name varchar(40);
	declare @new_points INT;

	Set @product_name = 'Hot-dog duzy';
	SET @new_points = 250;

	EXECUTE (
		'BEGIN ADMINISTRATORORACLE.SET_PRODUCT_POINTS(:product_name, :new_points); END;',
		@product_name, @new_points
	) AT ZaopatrzenieOracle;
	GO

	SELECT * FROM products_prices;

	--liczba punktow ujemna
	DECLARE @product_name varchar(40);
	declare @new_points INT;

	Set @product_name = 'Hot-dog duzy';
	SET @new_points = -130;

	EXECUTE (
		'BEGIN ADMINISTRATORORACLE.SET_PRODUCT_POINTS(:product_name, :new_points); END;',
		@product_name, @new_points
	) AT ZaopatrzenieOracle;
	GO

	SELECT * FROM products_prices;

	--produkt nie istnieje
	DECLARE @product_name varchar(40);
	declare @new_points INT;

	Set @product_name = 'aaa';
	SET @new_points = 270;

	EXECUTE (
		'BEGIN ADMINISTRATORORACLE.SET_PRODUCT_POINTS(:product_name, :new_points); END;',
		@product_name, @new_points
	) AT ZaopatrzenieOracle;
	GO

	SELECT * FROM products_prices;

--Dodanie pracownika na zmianie
		--poprawne dodanie
		exec dbo.add_shift_employee @id_emp = 2, @shift_date = '2024-08-27 15:00:00';
		
		SELECT * FROM HARMONOGRAM
		ORDER BY ID_WPISU DESC;
		
		--za dużo pracowników na zmianie
		exec dbo.add_shift_employee @id_emp = 2, @shift_date = '2024-06-27 15:00:00';
		
		SELECT * FROM HARMONOGRAM
		ORDER BY ID_WPISU DESC;

		--Czy pracownik jest w bazie danych
		exec dbo.add_shift_employee @id_emp = 430, @shift_date = '2024-09-27 15:00:00';
		
		SELECT * FROM HARMONOGRAM
		ORDER BY ID_WPISU DESC;

		--Czy prawidlowy czas zmiany (odstęp pomiędzy zmianami)
		exec dbo.add_shift_employee @id_emp = 2, @shift_date = '2024-08-27 16:00:00';
		
		SELECT * FROM HARMONOGRAM
		ORDER BY ID_WPISU DESC;



-- Usuwanie pracownika ze zmiany
	-- prawidłowe ID zmiany
	EXEC dbo.delete_employee_shift @shift_id = 48;

	SELECT * FROM HARMONOGRAM WHERE ID_WPISU =48;

	-- nieprawidłowe ID zmiany
	EXEC dbo.delete_employee_shift @shift_id = 48;

	SELECT * FROM HARMONOGRAM WHERE ID_WPISU =48;



-- Wyświetlanie zmian danego pracownika
	
	-- pracownik istnieje
	EXEC dbo.show_employee_schedule @emp_id = 2;

	select * from harmonogram where ID_pracownika = 2;

	--pracownik nie istnieje
	EXEC dbo.show_employee_schedule @emp_id = 284;

	select * from harmonogram where ID_pracownika = 284;
