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



-- Ustalenie nowej ceny produktu (set_product_price)
	
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


-- Ustalenie nowej liczby punktow dla produktu(set_product_points)
	
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

