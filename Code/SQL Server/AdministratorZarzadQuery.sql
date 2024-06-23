-- AdministratorZarzad
USE StacjaZarzad
GO

SELECT CURRENT_USER;


-- Dzienna suma transakcji dla paliw (show_transaction_analize_daily_fuel)
	EXEC StacjaPaliwLS.StacjaPaliw.dbo.show_transaction_analize_daily_fuel @fuel_id = 1;

-- Dzienna suma transakcji dla produktów (show_transaction_analize_products_daily)
	EXEC StacjaPaliwLS.StacjaPaliw.dbo.show_transaction_analize_products_daily @product_id = 3;

-- Historia cen paliw
	SELECT * FROM StacjaPaliwLS.StacjaPaliw.dbo.view_price_history;

-- Historia cen paliw (procedura)
	EXEC StacjaPaliwLS.StacjaPaliw.dbo.show_history_of_fuel_price @fuel_id = 1;

-- Liczba klientów w danych miesiącach (show_number_of_new_customer)
	EXEC StacjaPaliwLS.StacjaPaliw.dbo.show_number_of_new_customer;

-- Aktualzacja ceny paliwa
		EXEC StacjaPaliwLS.StacjaPaliw.dbo.update_price_of_fuel @fuel_name = 'benzyna 95', @new_price = 3.22;

		StacjaPaliwLS.StacjaPaliw.dbo.SELECT * FROM dbo.petrol_prices;
		GO

-- Aktualizacja punktów za dane paliwo
	EXEC StacjaPaliwLS.StacjaPaliw.dbo.update_points_of_fuel @fuel_name = 'benzyna 95', @new_points = 6;	

	SELECT * FROM StacjaPaliwLS.StacjaPaliw.dbo.petrol_prices;
	GO

-- Statystyki transakcji myjni (show_statistic_car_wash)
	EXEC StacjaPaliwLS.StacjaPaliw.dbo.show_statistic_car_wash;

-- Suma godzin pracy pracowników w poszczególnych miesiącach (show_employee_hours)
	EXEC StacjaPaliwLS.StacjaPaliw.dbo.show_employee_hours @emp_id = 1;

 -- Wypłata wszystkich pracowników w ramach danego miesiąca (show_employee_works_all)
	EXEC StacjaPaliwLS.StacjaPaliw.dbo.show_employee_works_all;
