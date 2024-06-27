--Pracownik

USE StacjaPaliw
GO

SELECT CURRENT_USER;


-- Wyświetlenie zmian danego pracownika
	-- pracownik istnieje
	EXEC dbo.show_employee_schedule @emp_id = 2;

	select * from harmonogram where ID_pracownika = 2;

	--pracownik nie istnieje
	EXEC dbo.show_employee_schedule @emp_id = 284;

	select * from harmonogram where ID_pracownika = 284;


--Wyświetlanie cen paliw
SELECT * FROM dbo.petrol_prices;

--Wyświetlanie stanu magazynowego paliw
SELECT * FROM dbo.petrol_stock;

--Wyświetlanie cen produktów
SELECT * FROM dbo.products_prices;

--Wyświetlanie stanu magazynowego produktów
SELECT * FROM dbo.products_stock;



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

	SELECT * FROM OPENQUERY(ZaopatrzenieOracle,'SELECT * FROM ADMINISTRATORORACLE.KLIENCI')
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
	SET @amount_set = -3;

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

	SET @clientID = 270;
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
	SET @amount_set = 639;

	EXEC dbo.add_petrol_transaction
	@client_ID = @clientID,
	@petrol_ID = @petrolID,
	@amount = @amount_set
	
	SELECT * FROM Transakcje_paliwowe
	ORDER BY data_transakcji DESC;

	SELECT * FROM petrol_stock;
	select * from petrol_prices;





-- Stwórz zamówienie paliwowe (make_petrol_order)
	
	--prawidłowe wywołanie
	EXEC dbo.make_petrol_order
	@petrol_name = 'benzyna 95',
	@provider_ID  = 1,
	@petrol_amout = 250,
	@delivery_cost = 2225.00

	SELECT * FROM OPENQUERY(ZaopatrzenieOracle,'Select * from ADMINISTRATORORACLE.Zamowienia_paliwowe');

	--ilość paliwa wartość ujemna
	EXEC dbo.make_petrol_order
	@petrol_name = 'benzyna 95',
	@provider_ID  = 1,
	@petrol_amout = -250,
	@delivery_cost = 2225.00

	SELECT * FROM OPENQUERY(ZaopatrzenieOracle,'Select * from ADMINISTRATORORACLE.Zamowienia_paliwowe');

	--cena dostawy wartość ujemna
	EXEC dbo.make_petrol_order
	@petrol_name = 'benzyna 95',
	@provider_ID  = 1,
	@petrol_amout = 250,
	@delivery_cost = -2225.00

	SELECT * FROM OPENQUERY(ZaopatrzenieOracle,'Select * from ADMINISTRATORORACLE.Zamowienia_paliwowe');

	--paliwo o danej nazwie nie istnieje
	EXEC dbo.make_petrol_order
	@petrol_name = 'a',
	@provider_ID  = 1,
	@petrol_amout = 250,
	@delivery_cost = 2225.00

	SELECT * FROM OPENQUERY(ZaopatrzenieOracle,'Select * from ADMINISTRATORORACLE.Zamowienia_paliwowe');

	--dostawca o podanym ID nie istnieje
	EXEC dbo.make_petrol_order
	@petrol_name = 'benzyna 95',
	@provider_ID  = 20,
	@petrol_amout = 250,
	@delivery_cost = 2225.00

	SELECT * FROM OPENQUERY(ZaopatrzenieOracle,'Select * from ADMINISTRATORORACLE.Zamowienia_paliwowe');
	SELECT * FROM ZaopatrzenieOracle.."ADMINISTRATORORACLE"."DOSTAWCY_PALIWOWI";

	--zamowiono za duzo paliwa (ponad wartosc max)
	EXEC dbo.make_petrol_order
	@petrol_name = 'benzyna 95',
	@provider_ID  = 1,
	@petrol_amout = 750,
	@delivery_cost = 2225.00

	SELECT * FROM OPENQUERY(ZaopatrzenieOracle,'Select * from ADMINISTRATORORACLE.Zamowienia_paliwowe');
	SELECT * FROM dbo.petrol_stock





-- Stwórz zamówienie spożywcze
	
	--prawidłowe wywołanie
	EXEC dbo.make_product_order
	@product_name = 'Gasnica',
	@provider_ID = 9,
	@amount = 15,
	@delivery_cost = 685.00

	SELECT * FROM ZaopatrzenieOracle.."ADMINISTRATORORACLE"."ZAMOWIENIA_SPOZYWCZE";

	--ilość produktów wartośc ujemna
	EXEC dbo.make_product_order
	@product_name = 'Gasnica',
	@provider_ID = 9,
	@amount = -15,
	@delivery_cost = 685.00

	SELECT * FROM ZaopatrzenieOracle.."ADMINISTRATORORACLE"."ZAMOWIENIA_SPOZYWCZE";

	--koszt dostawy wartość ujemna
	EXEC dbo.make_product_order
	@product_name = 'Gasnica',
	@provider_ID = 9,
	@amount = 15,
	@delivery_cost = -685.00

	SELECT * FROM ZaopatrzenieOracle.."ADMINISTRATORORACLE"."ZAMOWIENIA_SPOZYWCZE";

	--produkt o danej nazwie nie istnieje
	EXEC dbo.make_product_order
	@product_name = 'bbb',
	@provider_ID = 9,
	@amount = 15,
	@delivery_cost = 685.00

	SELECT * FROM ZaopatrzenieOracle.."ADMINISTRATORORACLE"."ZAMOWIENIA_SPOZYWCZE";

	--dostawca o danym ID nie istnieje
	EXEC dbo.make_product_order
	@product_name = 'Gasnica',
	@provider_ID = 25,
	@amount = 15,
	@delivery_cost = 685.00

	SELECT * FROM ZaopatrzenieOracle.."ADMINISTRATORORACLE"."ZAMOWIENIA_SPOZYWCZE";
	SELECT * FROM ZaopatrzenieOracle.."ADMINISTRATORORACLE"."DOSTAWCY_SPOZYWCZY";



-- Rejestrowanie nowego klienta (register_client)

	EXEC [dbo].[register_client]
	@name = 'Adrian',
	@surname = 'Stefanowski',
	@email = 'adrianstefanowski@gmail.com';

	SELECT * FROM ZaopatrzenieOracle.."ADMINISTRATORORACLE"."KLIENCI";


-- Aktualizacja stanu paliwa (update_petrol_stock)
	
	--prawidłowe wywołanie
	DECLARE @petrol_name varchar(40);
	declare @new_stock INT;

	Set @petrol_name = 'benzyna 95';
	SET @new_stock = 750;

	EXECUTE (
		'BEGIN ADMINISTRATORORACLE.UPDATE_PETROL_STOCK(:petrol_name, :new_stock); END;',
		@petrol_name, @new_stock
	) AT ZaopatrzenieOracle;
	GO

	SELECT * FROM petrol_stock;


	--ujemna ilość paliwa
	DECLARE @petrol_name varchar(40);
	declare @new_stock INT;

	Set @petrol_name = 'benzyna 95';
	SET @new_stock = -750;

	EXECUTE (
		'BEGIN ADMINISTRATORORACLE.UPDATE_PETROL_STOCK(:petrol_name :new_stock); END;',
		@petrol_name, @new_stock
	) AT ZaopatrzenieOracle;
	GO

	SELECT * FROM petrol_stock;

	--nieprawidłowa nazwa paliwa
	DECLARE @petrol_name varchar(40);
	declare @new_stock INT;

	Set @petrol_name = 'aaa';
	SET @new_stock = 750;

	EXECUTE (
		'BEGIN ADMINISTRATORORACLE.UPDATE_PETROL_STOCK(:petrol_name, :new_stock); END;',
		@petrol_name, @new_stock
	) AT ZaopatrzenieOracle;
	GO

	SELECT * FROM petrol_stock;

	--paliwo ponad limit
	DECLARE @petrol_name varchar(40);
	declare @new_stock INT;

	Set @petrol_name = 'benzyna 95';
	SET @new_stock = 1750;

	EXECUTE (
		'BEGIN ADMINISTRATORORACLE.UPDATE_PETROL_STOCK(:petrol_name, :new_stock); END;',
		@petrol_name, @new_stock
	) AT ZaopatrzenieOracle;
	GO

	SELECT * FROM petrol_stock;



-- Aktualizacja stanu produktu (update_product_stock)
	
	--prawidłowe wywołanie
	DECLARE @product_name varchar(40);
	declare @new_stock INT;

	Set @product_name = 'Hot-dog duzy';
	SET @new_stock = 25;

	EXECUTE (
		'BEGIN ADMINISTRATORORACLE.UPDATE_PRODUCT_STOCK(:product_name, :new_stock); END;',
		@product_name, @new_stock
	) AT ZaopatrzenieOracle;
	GO

	SELECT * FROM products_stock;

	--ujemna ilość produktu
	DECLARE @product_name varchar(40);
	declare @new_stock INT;

	Set @product_name = 'Hot-dog duzy';
	SET @new_stock = -25;

	EXECUTE (
		'BEGIN ADMINISTRATORORACLE.UPDATE_PRODUCT_STOCK(:product_name, :new_stock); END;',
		@product_name, @new_stock
	) AT ZaopatrzenieOracle;
	GO

	SELECT * FROM products_stock;
	
	--Nieprawidłowa nazwa produktu
	DECLARE @product_name varchar(40);
	declare @new_stock INT;

	Set @product_name = 'bbb';
	SET @new_stock = 25;

	EXECUTE (
		'BEGIN ADMINISTRATORORACLE.UPDATE_PRODUCT_STOCK(:product_name, :new_stock); END;',
		@product_name, @new_stock
	) AT ZaopatrzenieOracle;
	GO

	SELECT * FROM products_stock;



