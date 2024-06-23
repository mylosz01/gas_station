DROP DATABASE IF EXISTS StacjaZarzad;
GO

CREATE DATABASE StacjaZarzad;
GO

USE StacjaZarzad;
GO

USE [master]
GO
CREATE LOGIN [AdministratorZarzad] WITH PASSWORD=N'123', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO

USE [StacjaZarzad]
GO
CREATE USER [AdministratorZarzad] FOR LOGIN [AdministratorZarzad] WITH DEFAULT_SCHEMA=[dbo]
GO

ALTER SERVER ROLE [bulkadmin] ADD MEMBER [AdministratorZarzad]
GO

USE [StacjaZarzad]
GO
ALTER ROLE [db_owner] ADD MEMBER [AdministratorZarzad]
GO

SELECT CURRENT_USER;

--TEST
SELECT * FROM Pracownicy...[Pracownicy$];
SELECT * FROM ZaopatrzenieOracle.."ADMINISTRATORORACLE"."PALIWA";


-- Linked Server do zarządu
EXEC master.dbo.sp_addlinkedserver 
	@server = N'StacjaPaliwLS',
    @provider = N'SQLOLEDB',
    @srvproduct = N'',
	@datasrc = N'LAPTOP-09T53UPI' -- nazwa serwera, z którego linkujemy

	EXEC sp_addlinkedsrvlogin
    @rmtsrvname = N'StacjaPaliwLS', -- ta sama nazwa linku jak przy dodawaniu
	@useself = N'false',
    @locallogin = N'AdministratorZarzad',
	@rmtuser = N'Zarzad',
    @rmtpassword = N'123';

USE [master]
GO
EXEC master.dbo.sp_serveroption @server=N'StacjaPaliwLS', @optname=N'rpc', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'StacjaPaliwLS', @optname=N'rpc out', @optvalue=N'true'
GO


	SELECT*
	FROM StacjaPaliwLS.StacjaPaliw.dbo.petrol_prices;

-- configure replication on instance between StacjaPaliw and StacjaZarzad;
-- configure to send every 2 minutes
-- check replication