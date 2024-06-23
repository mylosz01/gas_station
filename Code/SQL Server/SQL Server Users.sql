/* Administrator */

USE [master]
GO
CREATE LOGIN [Administrator] WITH PASSWORD=N'123', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO

USE [StacjaPaliw]
GO
CREATE USER [Administrator] FOR LOGIN [Administrator] WITH DEFAULT_SCHEMA=[dbo]
GO

ALTER SERVER ROLE [bulkadmin] ADD MEMBER [Administrator]
GO

USE [StacjaPaliw]
GO
ALTER ROLE [db_owner] ADD MEMBER [Administrator]
GO

--uprawnienia do procedur i funkcji
use [StacjaPaliw]
GO
GRANT EXECUTE TO Administrator;

/* Administrator */

/* Menadzer */

USE [master]
GO
CREATE LOGIN [Menadzer] WITH PASSWORD=N'123', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO

USE [StacjaPaliw]
GO
CREATE USER [Menadzer] FOR LOGIN [Menadzer] WITH DEFAULT_SCHEMA=[dbo]
GO

GRANT SELECT ON dbo.show_employees TO Menadzer;
GO
GRANT SELECT ON dbo.petrol_prices TO Menadzer;
GO
GRANT SELECT ON [dbo].[petrol_stock] TO Menadzer;
GO
GRANT SELECT ON [dbo].[products_prices] TO Menadzer;
GO
GRANT SELECT ON [dbo].[products_stock] TO Menadzer;
GO

GRANT EXECUTE ON [dbo].[hire_employee] TO Menadzer;
GRANT EXECUTE ON [dbo].[add_shift_employee] TO Menadzer;
GRANT EXECUTE ON [dbo].[delete_employee_shift] TO Menadzer;
GRANT EXECUTE ON [dbo].[show_employee_schedule] TO Menadzer;

GRANT EXECUTE ON [dbo].[is_shift_valid] TO Menadzer;
GRANT EXECUTE ON [dbo].[check_employee_on_shift] TO Menadzer;

GRANT SELECT ON [dbo].[Harmonogram] TO Menadzer;

/* Menadzer */

/* Pracownik */
USE [master]
GO
CREATE LOGIN [Pracownik] WITH PASSWORD=N'123', DEFAULT_DATABASE=[StacjaPaliw], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO

USE [StacjaPaliw]
GO
CREATE USER [Pracownik] FOR LOGIN [Pracownik] WITH DEFAULT_SCHEMA=[dbo]
GO

GRANT EXECUTE ON [dbo].[add_product_transaction] TO Pracownik;
GRANT EXECUTE ON [dbo].[add_petrol_transaction] TO Pracownik;
GRANT EXECUTE ON [dbo].[make_product_order] TO Pracownik;
GRANT EXECUTE ON [dbo].[make_petrol_order] TO Pracownik;
GRANT EXECUTE ON [dbo].[show_employee_schedule] TO Pracownik;
GRANT EXECUTE ON [dbo].[add_points_to_client] TO Pracownik;
GRANT EXECUTE ON [dbo].[register_client] TO Pracownik;

GRANT SELECT ON Harmonogram TO Pracownik;
GRANT SELECT ON Transakcje_spozywcze TO Pracownik;
GRANT SELECT ON Transakcje_paliwowe TO Pracownik;

GRANT SELECT ON dbo.petrol_prices TO Pracownik;
GRANT SELECT ON dbo.petrol_stock TO Pracownik;
GRANT SELECT ON dbo.products_prices TO Pracownik;
GRANT SELECT ON dbo.products_stock TO Pracownik;
--GRANT EXECUTE ON [dbo].[register_client] TO Pracownik

/* Pracownik */

/* Klient */
USE [master]
GO
CREATE LOGIN [Klient] WITH PASSWORD=N'123', DEFAULT_DATABASE=[StacjaPaliw], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO

USE [StacjaPaliw]
GO
CREATE USER [Klient] FOR LOGIN [Klient] WITH DEFAULT_SCHEMA=[dbo]
GO

GRANT EXECUTE ON [dbo].[check_loyalty_points] TO Klient;
GRANT EXECUTE ON [dbo].[client_petrol_transaction_history] TO Klient
GRANT EXECUTE ON [dbo].[client_products_transaction_history] TO Klient

/* Klient */

/*Zarzad*/
USE [master]
GO
CREATE LOGIN [Zarzad] WITH PASSWORD=N'123', DEFAULT_DATABASE=[StacjaPaliw], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO

USE [StacjaPaliw]
GO
CREATE USER [Zarzad] FOR LOGIN [Zarzad] WITH DEFAULT_SCHEMA=[dbo]
GO

GRANT SELECT ON HARMONOGRAM TO ZARZAD;
GRANT SELECT ON TRANSAKCJE_PALIWOWE TO ZARZAD;
GRANT SELECT ON TRANSAKCJE_SPOZYWCZE TO ZARZAD;

GRANT SELECT ON dbo.show_employees TO ZARZAD;
GO
GRANT SELECT ON dbo.petrol_prices TO ZARZAD;
GO
GRANT SELECT ON [dbo].[petrol_stock] TO ZARZAD;
GO
GRANT SELECT ON [dbo].[products_prices] TO ZARZAD;
GO
GRANT SELECT ON [dbo].[products_stock] TO ZARZAD;
GO

GRANT SELECT ON [dbo].[view_price_history] TO ZARZAD;

GRANT EXECUTE ON [dbo].[show_transaction_analize_daily_fuel] TO ZARZAD;
GRANT EXECUTE ON [dbo].[show_transaction_analize_products_daily] TO ZARZAD;
GRANT EXECUTE ON [dbo].[show_number_of_new_customer] TO ZARZAD;
GRANT EXECUTE ON [dbo].[update_price_of_fuel] TO ZARZAD;
GRANT EXECUTE ON [dbo].[update_points_of_fuel] TO ZARZAD;
GRANT EXECUTE ON [dbo].[show_statistic_car_wash] TO ZARZAD;
GRANT EXECUTE ON [dbo].[show_employee_hours] TO ZARZAD;
GRANT EXECUTE ON [dbo].[show_employee_works_all] TO ZARZAD;
GRANT EXECUTE ON [dbo].[show_history_of_fuel_price] TO ZARZAD;
--GRANT EXECUTE ON  TO ZARZAD;
--GRANT EXECUTE ON  TO ZARZAD;

/*Zarzad*/
