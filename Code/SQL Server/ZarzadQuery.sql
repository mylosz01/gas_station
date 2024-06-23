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

	Set @petrol_name = 'LPG';
	SET @new_points = 3;

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






