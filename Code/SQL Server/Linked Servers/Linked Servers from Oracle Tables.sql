SELECT @@VERSION;
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
    (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.0.14)(PORT = 1521))
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
	@rmtuser = N'AdministratorOracle', --wykorzystujemy dane logowania z Oracle (musimy daæ false, ¿eby da³o siê zamapowaæ konto)
    @rmtpassword = N'123'

EXEC master.dbo.sp_addlinkedsrvlogin
    @rmtsrvname = N'ZaopatrzenieOracle',
	@useself = N'False',
    @locallogin = N'Administrator',
	@rmtuser = N'AdministratorOracle', --wykorzystujemy dane logowania z Oracle (musimy daæ false, ¿eby da³o siê zamapowaæ konto)
    @rmtpassword = N'123'

SELECT * 
FROM ZaopatrzenieOracle.."ADMINISTRATORORACLE"."PALIWA";
go