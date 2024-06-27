--Menadzer Query
USE StacjaPaliw
go

SELECT CURRENT_USER;
GO

--Wyświetlanie pracowników
SELECT * FROM dbo.show_employees;

--Wyświetlanie cen paliw
SELECT * FROM dbo.petrol_prices;

--Wyświetlanie stanu magazynowego paliw
SELECT * FROM dbo.petrol_stock;

--Wyświetlanie cen produktów
SELECT * FROM dbo.products_prices;

--Wyświetlanie stanu magazynowego produktów
SELECT * FROM dbo.products_stock;




SELECT * FROM dbo.petrol_prices;
GO


	SELECT * FROM products_prices;

	-- Zatrudnianie pracownika (hire_employee)
		
		--prawidłowe wywołanie
		EXEC [dbo].[hire_employee]
		@emp_ID = 227,
		@name = 'Krystian',
		@surname = 'Zamojski',
		@phone_number = '652901123',
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
	EXEC dbo.delete_employee_shift @shift_id = 46;

	SELECT * FROM HARMONOGRAM WHERE ID_WPISU =46;

	-- nieprawidłowe ID zmiany
	EXEC dbo.delete_employee_shift @shift_id = 48;

	SELECT * FROM HARMONOGRAM WHERE ID_WPISU =48;

-- Wyświetlanie zmian danego pracownika
	
	-- pracownik istnieje
	EXEC dbo.show_employee_schedule @emp_id = 15;

	select * from harmonogram where ID_pracownika = 15;

	--pracownik nie istnieje
	EXEC dbo.show_employee_schedule @emp_id = 284;

	select * from harmonogram where ID_pracownika = 284;



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





