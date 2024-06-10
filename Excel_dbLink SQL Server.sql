	use StacjaPaliw
	go

	sp_configure 'show_advanced_options', 1
	GO
	RECONFIGURE WITH OverRide
	GO

	sp_configure 'Ad Hoc Distributed Queries', 1
	GO
	RECONFIGURE WITH OverRide
	GO
	
	EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'AllowInProcess', 1 
	GO 
	EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'DynamicParameters', 1 
	GO 

	EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.16.0', N'AllowInProcess', 1 
	GO 
	EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.16.0', N'DynamicParameters', 1 
	GO 

	USE [master]
	GO
	EXEC master.dbo.sp_addlinkedserver 
	@server = N'Pracownicy', 
	@srvproduct=N'Excel',
	@provider=N'Microsoft.ACE.OLEDB.12.0', 
	@datasrc=N'C:\Pracownicy.xlsx',
	@provstr=N'Excel 12.0;HDR=YES'
	GO

	
	EXEC master.dbo.sp_addlinkedsrvlogin 
	@rmtsrvname = N'Pracownicy', 
	@useself = N'False',
	@locallogin = NULL, 
	@rmtuser = NULL,
	@rmtpassword = NULL
	GO

	--	USE [master]
	--GO
	--EXEC master.dbo.sp_addlinkedserver 
	--@server = N'Listy', 
	--@srvproduct=N'Excel',
	--@provider=N'Microsoft.ACE.OLEDB.12.0', 
	--@datasrc=N'C:\listy.xls',
	--@provstr=N'Excel 12.0;HDR=YES'
	--GO

	--EXEC master.dbo.sp_addlinkedsrvlogin 
	--@rmtsrvname = N'Listy', 
	--@useself = N'False',
	--@locallogin = NULL, 
	--@rmtuser = NULL,
	--@rmtpassword = NULL
	--GO

	SELECT * FROM Pracownicy...[Pracownicy$];

	--Select * from Listy...[oceny_do_www$]
