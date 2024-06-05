
CREATE TABLE Zamowienia_Paliwowe
(
	ID_zamowienia INTEGER,
	ID_typu_paliwa INTEGER,
	ID_dostawcy INTEGER,
	data_zamowienia DATE,
	ilosc_paliwa NUMBER(5,2),
	koszt_dostawy NUMBER(5,2),
	CONSTRAINT PK_Zamowienia_paliwowe PRIMARY KEY(ID_zamowienia),
	--CONSTRAINT FK_Zamowienie_paliwoweXTyp FOREIGN KEY (ID_typu_paliwa) REFERENCES [*œcie¿ka do tabeli w SQL SERVER*](ID_typu),
	CONSTRAINT FK_Zamowienie_paliwoweXTDostawca FOREIGN KEY (ID_dostawcy) REFERENCES Dostawcy_Paliwowi(ID_dostawcy)
);

CREATE TABLE Zamowienia_Spozywcze
(
	ID_zamowienia INTEGER,
	ID_produktu INTEGER,
	ID_dostawcy INTEGER,
	data_zamowienia DATE,
	ilosc INTEGER,
	koszt_dostawy NUMBER(5,2),
	CONSTRAINT PK_Zamowienia_spozywcze PRIMARY KEY(ID_zamowienia),
	CONSTRAINT FK_Zamowienie_spozywczeXProdukt FOREIGN KEY (ID_produktu) REFERENCES Produkty(ID_produktu),
	CONSTRAINT FK_Zamowienie_spozywczeXTDostawca FOREIGN KEY (ID_dostawcy) REFERENCES Dostawcy_Spozywczy(ID_dostawcy)
);

CREATE TABLE Dostawcy_Paliwowi
(
	ID_dostawcy INTEGER,
	nazwa VARCHAR(40),
	kraj VARCHAR(20),
	CONSTRAINT PK_Dostawcy_Paliwowi PRIMARY KEY(ID_dostawcy)
);

CREATE TABLE Dostawcy_Spozywczy
(
	ID_dostawcy INTEGER,
	nazwa VARCHAR(40),
	kraj VARCHAR(20),
	CONSTRAINT PK_Dostawcy_Spozywczy PRIMARY KEY(ID_dostawcy)
);

CREATE TABLE Produkty_spozywcze
(
	ID_produktu INTEGER,
	nazwa VARCHAR(40),
	ilosc_na_stanie INTEGER,
	cena_jednostkowa NUMBER(5,2),
    ilosc_punktow INTEGER,
	CONSTRAINT PK_Produkty PRIMARY KEY(ID_produktu)
);

CREATE TABLE Klienci
(
	ID_klienta INTEGER,
	imie VARCHAR(20),
	nazwisko VARCHAR(40),
	e_mail VARCHAR(40),
	punkty INTEGER,
	data_zalozenia_konta DATE,
	CONSTRAINT PK_Klienci PRIMARY KEY(ID_klienta)
);
