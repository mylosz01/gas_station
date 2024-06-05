CREATE DATABASE StacjaPaliw;
go

use StacjaPaliw;
GO

CREATE TABLE Typ_Paliwa --?
(
	ID_typu INT,
	nazwa_paliwa varchar(20),
	CONSTRAINT PK_typ_paliwa PRIMARY KEY (ID_typu)
);

INSERT INTO Typ_Paliwa VALUES 
(1,'benzyna 95'), 
(2,'benzyna 98'), 
(3,'standard diesel'), 
(4,'premium diesel'), 
(5,'LPG'),
(6,'Add Blue')

CREATE TABLE Historia_cen_paliw
(
	ID_ceny INT,
	data_ceny DATETIME,
	cena SMALLMONEY,
	CONSTRAINT PK_Ceny PRIMARY KEY (ID_ceny)
);

CREATE TABLE Paliwa
(
	ID_paliwa INT,
	ID_typu INT,
	ID_ceny INT,
	nazwa VARCHAR(30),
	ilosc_w_litrach NUMERIC(5,2),
	maksymalna_ilosc NUMERIC(5,2),
	ilosc_punktow INT,
	CONSTRAINT PK_Paliwa PRIMARY KEY (ID_paliwa),
	CONSTRAINT FK_PaliwoXTyp FOREIGN KEY (ID_typu) REFERENCES Typ_Paliwa(ID_typu),
	CONSTRAINT FK_PaliwoXCenaPaliwa FOREIGN KEY (ID_ceny) REFERENCES Historia_cen_paliw(ID_ceny)
);

CREATE TABLE Transakcje_paliwowe
(
	ID_transakcji INT,
	ID_klienta INT,
	ID_typu_paliwa INT,
	kwota_transakcji SMALLMONEY,
	data_transakcji DATETIME,
	ilosc_paliwa NUMERIC(5,2),
	CONSTRAINT PK_Transakcje_paliwowe PRIMARY KEY (ID_transakcji),
	CONSTRAINT FK_Transakcja_paliwoXTyp FOREIGN KEY (ID_typu_paliwa) REFERENCES Typ_Paliwa(ID_typu),
	--CONSTRAINT FK_Transakcja_paliwowaXKlient FOREIGN KEY (ID_klienta) REFERENCES [*œcie¿ka do tabeli w oracle*](ID_klienta)
	
	--Iloœc punktów przyznawanych za transakcjê w Triggerze / procedurze (liczona na podstawie kwoty / iloœci zatankowanego paliwa)
	
);

CREATE TABLE Transakcje_spozywcze
(
	ID_transakcji INT,
	ID_klienta INT,
	ID_produktu INT,
	kwota_transakcji SMALLMONEY,
	data_transakcji DATETIME,
	ilosc INT,
	CONSTRAINT PK_Transakcje_Spozywcze PRIMARY KEY (ID_transakcji),
	--CONSTRAINT FK_Transakcja_paliwowaXKlient FOREIGN KEY (ID_klienta) REFERENCES [*œcie¿ka do tabeli w oracle*](ID_klienta),
	--CONSTRAINT FK_Transakcja_paliwowaXProdukt FOREIGN KEY (ID_produktu) REFERENCES [*œcie¿ka do tabeli w oracle*](ID_produktu)

	--Iloœc punktów przyznawanych za transakcjê w Triggerze / procedurze (liczona na podstawie kwoty / typu produktu)
);

CREATE TABLE Harmonogram
(
	ID_wpisu INT,
	ID_pracownika INT,
	data_rozpoczêcia_zmiany DATETIME,
	data_zakoñczenia_zmiany DATETIME,
	-- mo¿naby zrobiæ procedurê licz¹c¹ wynagrodzenie pracowniowi za dan¹ zmianê
	CONSTRAINT PK_Harmonogram PRIMARY KEY (ID_wpisu),
	--CONSTRAINT FK_HarmonogramXPracownik FOREIGN KEY (ID_pracownika) REFERENCES [*œcie¿ka do tabeli excela*](ID_pracownika),
);
