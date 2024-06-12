
CREATE TABLE Dostawcy_Paliwowi
(
	ID_dostawcy INTEGER GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1),
	nazwa VARCHAR(40),
	kraj VARCHAR(20),
	CONSTRAINT PK_Dostawcy_Paliwowi PRIMARY KEY(ID_dostawcy)
);
COMMIT;
INSERT INTO Dostawcy_Paliwowi(nazwa,kraj) VALUES('Rafineria w Plocku','Polska');
INSERT INTO Dostawcy_Paliwowi(nazwa,kraj) VALUES('Rafineria w Litvinowie','Czechy');
INSERT INTO Dostawcy_Paliwowi(nazwa,kraj) VALUES('Rafineria w Kralupach nad Vltavou','Czechy');
INSERT INTO Dostawcy_Paliwowi(nazwa,kraj) VALUES('Rafineria w Mozejkach','Litwa');

CREATE TABLE Dostawcy_Spozywczy
(
	ID_dostawcy INTEGER GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1),
	nazwa VARCHAR(40),
	kraj VARCHAR(20),
	CONSTRAINT PK_Dostawcy_Spozywczy PRIMARY KEY(ID_dostawcy)
);
COMMIT;
INSERT INTO Dostawcy_Spozywczy(nazwa,kraj) VALUES('WML','Polska');
INSERT INTO Dostawcy_Spozywczy(nazwa,kraj) VALUES('Nowel','Polska'); --pieczywo mrozone
INSERT INTO Dostawcy_Spozywczy(nazwa,kraj) VALUES('Stokson','Polska'); --piekarnia
INSERT INTO Dostawcy_Spozywczy(nazwa,kraj) VALUES('Bracia Sadownicy','Polska'); --produkty owocowe (musy, soki etc._
INSERT INTO Dostawcy_Spozywczy(nazwa,kraj) VALUES('Zaklady Miesne Stanislawow','Polska'); --wêdliny, kielbasy parowki etc.
INSERT INTO Dostawcy_Spozywczy(nazwa,kraj) VALUES('Milka','Szwajcaria'); --goraca czekolada
INSERT INTO Dostawcy_Spozywczy(nazwa,kraj) VALUES('VERVA','Polska'); --doczytaæ kto odpowiedzialny za produkcjê.
INSERT INTO Dostawcy_Spozywczy(nazwa,kraj) VALUES('Stop Cafe','Polska'); --doczytaæ kto odpowiedzialny za produkcjê.
INSERT INTO Dostawcy_Spozywczy(nazwa,kraj) VALUES('Moje Auto','Polska'); --akcesoria samochodowe

CREATE TABLE Produkty_spozywcze
(
	ID_produktu INTEGER GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1),
	nazwa VARCHAR(40),
	ilosc_na_stanie INTEGER,
	cena_jednostkowa NUMBER(5,2),
    ilosc_punktow INTEGER,
	CONSTRAINT PK_Produkty PRIMARY KEY(ID_produktu)
);
COMMIT;
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('hot-dog maly',20,8.99,100)
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('hot-dog duzy',15,12.99,120)
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('gasnica',10,,100)
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('hot-dog maly',20,8.99,100)    


CREATE TABLE Typ_Paliwa
(
	ID_typu INTEGER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
	nazwa_paliwa VARCHAR(20),
	CONSTRAINT PK_typ_paliwa PRIMARY KEY (ID_typu)
);
COMMIT;

INSERT INTO Typ_Paliwa(nazwa_paliwa) VALUES('benzyna 95');
INSERT INTO Typ_Paliwa(nazwa_paliwa) VALUES('benzyna 98');
INSERT INTO Typ_Paliwa(nazwa_paliwa) VALUES('standard diesel'); 
INSERT INTO Typ_Paliwa(nazwa_paliwa) VALUES('premium diesel'); 
INSERT INTO Typ_Paliwa(nazwa_paliwa) VALUES('LPG');
INSERT INTO Typ_Paliwa(nazwa_paliwa) VALUES('Add Blue');
COMMIT;

CREATE TABLE Historia_cen_paliw
(
	ID_ceny INTEGER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
	ID_typu INTEGER,
	data_ceny TIMESTAMP,
	cena NUMBER(5,2),
	CONSTRAINT PK_Ceny PRIMARY KEY (ID_ceny),
	CONSTRAINT FK_CenaXTyp FOREIGN KEY (ID_typu) REFERENCES Typ_Paliwa(ID_typu) ON DELETE CASCADE
);
COMMIT;

INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(1,TO_TIMESTAMP('2024-01-15 10:45:30','YYYY-MM-DD HH24:MI:SS'),'YYYY-MM-DD HH24:MI:SS'),6.23);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(1,TO_TIMESTAMP('2024-02-28 14:22:10','YYYY-MM-DD HH24:MI:SS'),6.48);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(1,TO_TIMESTAMP('2024-03-10 09:15:55','YYYY-MM-DD HH24:MI:SS'),6.35);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(1,TO_TIMESTAMP('2024-04-21 18:05:42','YYYY-MM-DD HH24:MI:SS'),6.57);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(1,TO_TIMESTAMP('2024-05-30 11:30:25','YYYY-MM-DD HH24:MI:SS'),6.44);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(1,TO_TIMESTAMP('2024-06-14 16:18:07','YYYY-MM-DD HH24:MI:SS'),6.51);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(1,TO_TIMESTAMP('2024-07-19 13:55:12','YYYY-MM-DD HH24:MI:SS'),6.29);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(1,TO_TIMESTAMP('2024-08-22 07:50:38','YYYY-MM-DD HH24:MI:SS'),6.38);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(1,TO_TIMESTAMP('2024-09-03 21:35:45','YYYY-MM-DD HH24:MI:SS'),6.60);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(1,TO_TIMESTAMP('2024-10-27 19:42:21','YYYY-MM-DD HH24:MI:SS'),6.22);

INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(2,TO_TIMESTAMP('2024-01-20 10:34:56','YYYY-MM-DD HH24:MI:SS'),7.01);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(2,TO_TIMESTAMP('2024-02-14 15:47:23','YYYY-MM-DD HH24:MI:SS'),7.15);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(2,TO_TIMESTAMP('2024-03-05 09:11:45','YYYY-MM-DD HH24:MI:SS'),7.22);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(2,TO_TIMESTAMP('2024-04-17 13:25:36','YYYY-MM-DD HH24:MI:SS'),7.07);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(2,TO_TIMESTAMP('2024-05-11 18:54:09','YYYY-MM-DD HH24:MI:SS'),7.28);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(2,TO_TIMESTAMP('2024-06-23 07:38:42','YYYY-MM-DD HH24:MI:SS'),6.99);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(2,TO_TIMESTAMP('2024-07-29 22:12:31','YYYY-MM-DD HH24:MI:SS'),7.13);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(2,TO_TIMESTAMP('2024-08-16 16:45:55','YYYY-MM-DD HH24:MI:SS'),7.21);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(2,TO_TIMESTAMP('2024-09-05 12:50:14','YYYY-MM-DD HH24:MI:SS'),7.05);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(2,TO_TIMESTAMP('2024-10-30 20:22:07','YYYY-MM-DD HH24:MI:SS'),7.17);


INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(3,TO_TIMESTAMP('2024-01-12 08:14:22','YYYY-MM-DD HH24:MI:SS'),6.52);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(3,TO_TIMESTAMP('2024-02-25 17:45:33','YYYY-MM-DD HH24:MI:SS'),6.73);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(3,TO_TIMESTAMP('2024-03-30 11:24:45','YYYY-MM-DD HH24:MI:SS'),6.67);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(3,TO_TIMESTAMP('2024-04-18 14:56:08','YYYY-MM-DD HH24:MI:SS'),6.59);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(3,TO_TIMESTAMP('2024-05-22 19:30:21','YYYY-MM-DD HH24:MI:SS'),6.76);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(3,TO_TIMESTAMP('2024-06-10 07:22:14','YYYY-MM-DD HH24:MI:SS'),6.68);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(3,TO_TIMESTAMP('2024-07-15 22:18:37','YYYY-MM-DD HH24:MI:SS'),6.70);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(3,TO_TIMESTAMP('2024-08-19 15:45:29','YYYY-MM-DD HH24:MI:SS'),6.57);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(3,TO_TIMESTAMP('2024-09-27 12:35:50','YYYY-MM-DD HH24:MI:SS'),6.62);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(3,TO_TIMESTAMP('2024-10-05 18:42:11','YYYY-MM-DD HH24:MI:SS'),6.75);


INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(4,TO_TIMESTAMP('2024-01-10 11:23:45','YYYY-MM-DD HH24:MI:SS'),6.84);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(4,TO_TIMESTAMP('2024-02-25 14:35:22','YYYY-MM-DD HH24:MI:SS'),6.97);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(4,TO_TIMESTAMP('2024-03-18 08:50:11','YYYY-MM-DD HH24:MI:SS'),6.89);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(4,TO_TIMESTAMP('2024-04-13 17:22:34','YYYY-MM-DD HH24:MI:SS'),6.94);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(4,TO_TIMESTAMP('2024-05-29 21:30:45','YYYY-MM-DD HH24:MI:SS'),7.01);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(4,TO_TIMESTAMP('2024-06-05 19:45:57','YYYY-MM-DD HH24:MI:SS'),6.85);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(4,TO_TIMESTAMP('2024-07-08 13:40:20','YYYY-MM-DD HH24:MI:SS'),6.92);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(4,TO_TIMESTAMP('2024-08-20 09:15:40','YYYY-MM-DD HH24:MI:SS'),6.88);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(4,TO_TIMESTAMP('2024-09-27 11:25:18','YYYY-MM-DD HH24:MI:SS'),6.98);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(4,TO_TIMESTAMP('2024-10-14 15:55:05','YYYY-MM-DD HH24:MI:SS'),7.00);


INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(5,TO_TIMESTAMP('2024-01-22 09:14:23','YYYY-MM-DD HH24:MI:SS'),2.75);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(5,TO_TIMESTAMP('2024-02-16 12:45:32','YYYY-MM-DD HH24:MI:SS'),2.89);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(5,TO_TIMESTAMP('2024-03-07 16:30:45','YYYY-MM-DD HH24:MI:SS'),2.64);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(5,TO_TIMESTAMP('2024-04-11 14:22:55','YYYY-MM-DD HH24:MI:SS'),2.95);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(5,TO_TIMESTAMP('2024-05-15 20:30:12','YYYY-MM-DD HH24:MI:SS'),2.72);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(5,TO_TIMESTAMP('2024-06-29 06:14:38','YYYY-MM-DD HH24:MI:SS'),2.80);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(5,TO_TIMESTAMP('2024-07-21 19:50:27','YYYY-MM-DD HH24:MI:SS'),2.91);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(5,TO_TIMESTAMP('2024-08-08 13:35:09','YYYY-MM-DD HH24:MI:SS'),2.67);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(5,TO_TIMESTAMP('2024-09-14 17:42:18','YYYY-MM-DD HH24:MI:SS'),2.98);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(5,TO_TIMESTAMP('2024-10-20 11:25:34','YYYY-MM-DD HH24:MI:SS'),2.83);


INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(6,TO_TIMESTAMP('2024-01-13 08:24:15','YYYY-MM-DD HH24:MI:SS'),3.45);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(6,TO_TIMESTAMP('2024-02-22 14:35:40','YYYY-MM-DD HH24:MI:SS'),3.60);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(6,TO_TIMESTAMP('2024-03-18 09:10:22','YYYY-MM-DD HH24:MI:SS'),3.33);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(6,TO_TIMESTAMP('2024-04-05 18:25:48','YYYY-MM-DD HH24:MI:SS'),3.82);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(6,TO_TIMESTAMP('2024-05-12 12:14:55','YYYY-MM-DD HH24:MI:SS'),3.54);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(6,TO_TIMESTAMP('2024-06-28 21:45:19','YYYY-MM-DD HH24:MI:SS'),3.70);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(6,TO_TIMESTAMP('2024-07-17 15:30:43','YYYY-MM-DD HH24:MI:SS'),3.48);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(6,TO_TIMESTAMP('2024-08-21 11:25:30','YYYY-MM-DD HH24:MI:SS'),3.66);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(6,TO_TIMESTAMP('2024-09-30 13:55:52','YYYY-MM-DD HH24:MI:SS'),3.29);
INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(6,TO_TIMESTAMP('2024-10-25 19:14:11','YYYY-MM-DD HH24:MI:SS'),3.75);
COMMIT;

-- paliwo maj i czerwiec
--SELECT * FROM Historia_cen_paliw
--WHERE data_ceny BETWEEN '2024-05-01' AND '2024-06-10'


CREATE TABLE Paliwa
(
	ID_paliwa INTEGER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
	ID_ceny INTEGER,
	ilosc_w_litrach INTEGER,
	maksymalna_ilosc INTEGER,
	ilosc_punktow INTEGER, --iloœæ punktów za litr
	CONSTRAINT PK_Paliwa PRIMARY KEY (ID_paliwa),
	CONSTRAINT FK_PaliwoXCenaPaliwa FOREIGN KEY (ID_ceny) REFERENCES Historia_cen_paliw(ID_ceny) ON DELETE CASCADE
);
COMMIT;

INSERT INTO Paliwa(ID_ceny,ilosc_w_litrach,maksymalna_ilosc,ilosc_punktow) VALUES(5,550,1200,4); -- benzyna 95
INSERT INTO Paliwa(ID_ceny,ilosc_w_litrach,maksymalna_ilosc,ilosc_punktow) VALUES(15,390,500,7); -- benzyna 98
INSERT INTO Paliwa(ID_ceny,ilosc_w_litrach,maksymalna_ilosc,ilosc_punktow) VALUES(25,480,1000,3); -- standard diesel
INSERT INTO Paliwa(ID_ceny,ilosc_w_litrach,maksymalna_ilosc,ilosc_punktow) VALUES(36,320,400,7); -- premium diesel
INSERT INTO Paliwa(ID_ceny,ilosc_w_litrach,maksymalna_ilosc,ilosc_punktow) VALUES(45,740,1200,2); -- LPG
INSERT INTO Paliwa(ID_ceny,ilosc_w_litrach,maksymalna_ilosc,ilosc_punktow) VALUES(55,120,400,1); -- adBlue
COMMIT;


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
COMMIT;

CREATE TABLE Zamowienia_Spozywcze
(
	ID_zamowienia INTEGER,
	ID_produktu INTEGER,
	ID_dostawcy INTEGER,
	data_zamowienia DATE,
	ilosc INTEGER,
	koszt_dostawy NUMBER(5,2),
	CONSTRAINT PK_Zamowienia_spozywcze PRIMARY KEY(ID_zamowienia),
	CONSTRAINT FK_Zamowienie_spozywczeXProdukt FOREIGN KEY (ID_produktu) REFERENCES Produkty_spozywcze(ID_produktu),
	CONSTRAINT FK_Zamowienie_spozywczeXTDostawca FOREIGN KEY (ID_dostawcy) REFERENCES Dostawcy_Spozywczy(ID_dostawcy)
);
COMMIT;

CREATE TABLE Zamowienia_Paliwowe
(
	ID_zamowienia INTEGER,
	ID_paliwa INTEGER,
	ID_dostawcy INTEGER,
	data_zamowienia DATE,
	ilosc_paliwa NUMBER(5,2),
	koszt_dostawy NUMBER(5,2),
	CONSTRAINT PK_Zamowienia_paliwowe PRIMARY KEY(ID_zamowienia),
	CONSTRAINT FK_Zamowienie_paliwoweXTyp FOREIGN KEY (ID_paliwa) REFERENCES Paliwa(ID_paliwa) ON DELETE CASCADE,
	CONSTRAINT FK_Zamowienie_paliwoweXTDostawca FOREIGN KEY (ID_dostawcy) REFERENCES Dostawcy_Paliwowi(ID_dostawcy)
);
COMMIT;

