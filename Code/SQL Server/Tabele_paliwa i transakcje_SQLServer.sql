CREATE DATABASE StacjaPaliw;
go

use StacjaPaliw;
GO


CREATE TABLE Transakcje_paliwowe
(
	ID_transakcji INT,
	ID_klienta INT,
	ID_paliwa INT,
	kwota_transakcji SMALLMONEY,
	data_transakcji DATETIME,
	ilosc_paliwa NUMERIC(5,2),
	CONSTRAINT PK_Transakcje_paliwowe PRIMARY KEY (ID_transakcji),
	--CONSTRAINT FK_Transakcja_paliwoXPaliwo FOREIGN KEY (ID_paliwa) REFERENCES [Ścieżka do tabeli w Oracle](ID_paliwa),
	--CONSTRAINT FK_Transakcja_paliwowaXKlient FOREIGN KEY (ID_klienta) REFERENCES [Ścieżka do tabeli w Oracle](ID_klienta)
	
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
	CONSTRAINT CHCK_ID_pracownika CHECK (ID_pracownika IS NOT NULL)
	--sprawdzenie istnienia odpowiadających wartości należy zrealizować programowo za pomocą triggerów
);

Select * From Pracownicy...[Pracownicy$];
