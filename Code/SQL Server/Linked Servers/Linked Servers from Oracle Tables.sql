﻿SELECT @@VERSION;
/*NA POCZĄTEK:
Należy pobrać ze strony Oracle DB Clienta. Tam szukamy pliku OraOLEDB19.dll (Albo 12; zależy od wersji)
Należy go zarejestrować aby uzyskać dostęp do Providera OraOLEDB19.Oracle.
W tym celu orientujemy terminal z prawami administratora na folder z plikiem i wywołujemy polecenie regsvr32 OraOLEDB19.dll
Należy się upewnić że mamy dostęp na Windowsie do Oracle z maszyny wirtualnej (Ustawiony wyjątek Firewall w Oracle Linux)
Należy się upewnić co do adresu IP na którym łączy się z Internetem maszyny wirtualna (wykorzystujemy polecenie ip addr w konsoli)
*/

	sp_configure 'show_advanced_options', 1
	GO
	RECONFIGURE WITH OverRide
	GO

	sp_configure 'Ad Hoc Distributed Queries', 1
	GO
	RECONFIGURE WITH OverRide
	GO
	
	EXEC master.dbo.sp_MSset_oledb_prop N'OraOLEDB.Oracle', N'AllowInProcess', 1 
	GO 
	EXEC master.dbo.sp_MSset_oledb_prop N'OraOLEDB.Oracle', N'DynamicParameters', 1 
	GO 

	EXEC master.dbo.sp_MSset_oledb_prop N'OraOLEDB.Oracle', N'AllowInProcess', 1 
	GO 
	EXEC master.dbo.sp_MSset_oledb_prop N'OraOLEDB.Oracle', N'DynamicParameters', 1 
	GO 

EXEC master.dbo.sp_addlinkedserver 
	@server = N'ZaopatrzenieOracle',
    @provider = N'OraOLEDB.Oracle', --sterownik OLEDB który znajdziemy w server object
    @srvproduct = N'Oracle',
	@datasrc = N'(DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.162.166)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SID = orcl)
    )
  )' --wykorzysstujemy uchwyt TNS (sprawdzamy w NET MANAGER),
	go 

EXEC master.dbo.sp_addlinkedsrvlogin
    @rmtsrvname = N'ZaopatrzenieOracle',
	@useself = N'False',
    @locallogin = N'sa',
	@rmtuser = N'AdministratorOracle',
    @rmtpassword = N'123'

EXEC master.dbo.sp_addlinkedsrvlogin
    @rmtsrvname = N'ZaopatrzenieOracle',
	@useself = N'False',
    @locallogin = N'Administrator',
	@rmtuser = N'AdministratorOracle', 
    @rmtpassword = N'123'

EXEC master.dbo.sp_addlinkedsrvlogin
    @rmtsrvname = N'ZaopatrzenieOracle',
	@useself = N'False',
    @locallogin = N'Menadzer',
	@rmtuser = N'MenadzerOracle', 
    @rmtpassword = N'123'

EXEC master.dbo.sp_addlinkedsrvlogin
    @rmtsrvname = N'ZaopatrzenieOracle',
	@useself = N'False',
    @locallogin = N'Pracownik',
	@rmtuser = N'PracownikOracle', 
    @rmtpassword = N'123'

EXEC master.dbo.sp_addlinkedsrvlogin
    @rmtsrvname = N'ZaopatrzenieOracle',
	@useself = N'False',
    @locallogin = N'Klient',
	@rmtuser = N'Klient', 
    @rmtpassword = N'123'

EXEC master.dbo.sp_addlinkedsrvlogin
    @rmtsrvname = N'ZaopatrzenieOracle',
	@useself = N'False',
    @locallogin = N'Zarzad',
	@rmtuser = N'ZarzadOracle', 
    @rmtpassword = N'123'

EXEC master.dbo.sp_addlinkedsrvlogin
    @rmtsrvname = N'ZaopatrzenieOracle',
	@useself = N'False',
    @locallogin = N'AdministratorZarzad',
	@rmtuser = N'ZarzadOracle', 
    @rmtpassword = N'123'


-- do wywoływania procedur z Oracle na SQL Serverze
USE [master]
GO
EXEC master.dbo.sp_serveroption @server=N'ZaopatrzenieOracle', @optname=N'rpc', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'ZaopatrzenieOracle', @optname=N'rpc out', @optvalue=N'true'
GO


SELECT * 
FROM ZaopatrzenieOracle.."ADMINISTRATORORACLE"."PALIWA";
go

SELECT * FROM OPENQUERY(ZaopatrzenieOracle, 'SELECT * FROM KLIENCI');