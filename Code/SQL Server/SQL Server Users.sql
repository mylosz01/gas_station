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

/* Menadzer */

/* Pracownik */
/* Pracownik */

/* Klient */
/* Klient */

/*Zarzad*/
/*Zarzad*/
