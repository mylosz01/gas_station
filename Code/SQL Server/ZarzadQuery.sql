-- Zarzad
USE StacjaPaliw
GO

SELECT CURRENT_USER;


-- Dzienna suma transakcji dla paliw (show_transaction_analize_daily_fuel)
	EXEC show_transaction_analize_daily_fuel @fuel_id = 1;

-- Dzienna suma transakcji dla produktów (show_transaction_analize_products_daily)
	EXEC show_transaction_analize_products_daily @product_id = 3;

-- Historia cen paliw
	SELECT * FROM view_price_history;

-- Historia cen paliw (procedura)
	EXEC dbo.show_history_of_fuel_price @fuel_id = 1;

-- Liczba klientów w danych miesiącach (show_number_of_new_customer)
	EXEC dbo.show_number_of_new_customer;

-- Aktualzacja ceny paliwa
	--1) 
		EXEC update_price_of_fuel @fuel_name = 'benzyna 95', @new_price = 3.22;
	--2) 
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



-- Aktualizacja punktów za dane paliwo
	--1) 
	EXEC update_points_of_fuel @fuel_name = 'benzyna 95', @new_points = 6;	
	--2)DECLARE @petrol_name varchar(20);
	DECLARE @petrol_name varchar(20);
	declare @new_points INT;

	Set @petrol_name = 'benzyna 95';
	SET @new_points = 5;

	EXECUTE (
		'BEGIN ADMINISTRATORORACLE.UPDATE_PETROL_POINTS(:pertol_name, :new_price); END;',
		@petrol_name, @new_points
	) AT ZaopatrzenieOracle;
	GO

	SELECT * FROM dbo.petrol_prices;
	GO

-- Statystyki transakcji myjni (show_statistic_car_wash)
	EXEC show_statistic_car_wash;

-- Suma godzin pracy pracowników w poszczególnych miesiącach (show_employee_hours)
	EXEC show_employee_hours @emp_id = 1;

 -- Wypłata wszystkich pracowników w ramach danego miesiąca (show_employee_works_all)
	EXEC show_employee_works_all;

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






