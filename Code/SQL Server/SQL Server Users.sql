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
/* Menadzer */

/* Pracownik */
/* Pracownik */

/* Klient */
/* Klient */

/*Zarzad*/
/*Zarzad*/
