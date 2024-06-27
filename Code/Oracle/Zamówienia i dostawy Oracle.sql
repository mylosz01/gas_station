
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
INSERT INTO Dostawcy_Paliwowi(nazwa,kraj) VALUES('PGNiG S.A.','Polska');
INSERT INTO Dostawcy_Paliwowi(nazwa,kraj) VALUES('Yara International ASA','Norwegia');
COMMIT;

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
INSERT INTO Dostawcy_Spozywczy(nazwa,kraj) VALUES('Moje Auto','Polska'); --akcesoria samochodowe
INSERT INTO Dostawcy_Spozywczy(nazwa,kraj) VALUES('K2','USA'); --kosmetyki samochodowe
INSERT INTO Dostawcy_Spozywczy(nazwa,kraj) VALUES('OGNIOCHRON S.A.','Polska'); --akcesoria samochodowe
INSERT INTO Dostawcy_Spozywczy(nazwa,kraj) VALUES('Plak','Polska'); --kosmetyki samochodowe
INSERT INTO Dostawcy_Spozywczy(nazwa,kraj) VALUES('PepsiCo Inc.','USA'); --napoje i chipsy
INSERT INTO Dostawcy_Spozywczy(nazwa,kraj) VALUES('¯ywiec Zdrój S.A.','Polska'); --woda
INSERT INTO Dostawcy_Spozywczy(nazwa,kraj) VALUES('Car-Freshner Corporation','USA'); --kosmetyki samochodowe
INSERT INTO Dostawcy_Spozywczy(nazwa,kraj) VALUES('Sir William''s Tea ','Polska'); --herbata
INSERT INTO Dostawcy_Spozywczy(nazwa,kraj) VALUES('Nestlé S.A.','Szwajcaria'); --kawa
COMMIT;


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
    VALUES('Hot-dog maly',20,8.99,100);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Hot-dog duzy',15,12.99,120);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Kanapka',22,7.99,100);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Zapiekanka',15,10.99,110);    
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Gasnica',10,6.40,75);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Chusteczki do kokpitu',45,8.49,90);
    ---
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('K2 ROTON 0.7L',15,17.50,140);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Lina holownicza',12,54.00,370);   
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Nabyszczacz do kokpitu',35,27.99,200);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Sok 0.33L',55,5.99,60);    
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Napoj Pepsi 0.5L',70,10.99,110);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Napoj Pepsi 1.5L',48,13.99,130);    
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Woda niegazowana 1.5L',65,4.99,50);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Woda gazowana 1.5L',59,4.99,50);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Woda niegazowana 0.5L',62,2.50,20);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Woda gazowana 0.5L',54,2.50,20);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Plyn do spryskiwaczy 5L',70,21.99,180);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Plyn do chlodnicy 5L',34,59.99,400);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Wunder-Baum',105,9.99,110);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Woda destylowana 5L',35,21.50,150);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Kawa czarna 0.33L',95,7.99,90);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Kawa czarna 0.5L',95,10.99,110);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Kawa latte 0.33L',95,8.50,90);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Kawa latte 0.5L',95,11.50,110);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Goraca czekolada 0.33L',100,7.99,90);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Goraca czekolada 0.5L',100,10.99,110);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Hebrata 0.33L',105,7.99,90);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Hebrata 0.5L',105,8.99,90);      
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Zeton do odkurzacza',49,5.00,50);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Chipsy Lay''s Zielona Cebulka 140g ',63,11.99,100);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Chipsy Lay''s Papryka 140g ',66,11.99,100);       
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Uchwyt na telefon ',13,37.99,265);     
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Zarowka H7',49,41.50,350);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Klucz do kol',7,35.99,155);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Samochdowa mapa Polski',30,24.99,190);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Batonik',70,3.50,25);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Pióra do wycieraczek samochodowych',35,35.99,250);
INSERT INTO Produkty_spozywcze(nazwa,ilosc_na_stanie,cena_jednostkowa,ilosc_punktow)
    VALUES('Okulary przeciwsloneczne',15,44.50,350); 
COMMIT;    


-- Dla kawy, herbaty i goracej czekolady robic sprawdzenie przy odejmowaniu ilosci (ta sama wartosc dla duzej i malej tyle ze mala odejmuje 2)

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

INSERT INTO Historia_cen_paliw(ID_typu,data_ceny,cena) VALUES(1,TO_TIMESTAMP('2024-01-15 10:45:30','YYYY-MM-DD HH24:MI:SS'),6.23);
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
	ID_klienta INTEGER GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1),
	imie VARCHAR(20),
	nazwisko VARCHAR(40),
	e_mail VARCHAR(40),
	punkty INTEGER,
	data_zalozenia_konta DATE,
	CONSTRAINT PK_Klienci PRIMARY KEY(ID_klienta)
);
COMMIT;

INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Karolina','Kowal','karolinakowal@gmail.com',2500,'2018-03-15');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('£ukasz','Bielecki','lukaszbielecki@wp.pl',2400,'2018-06-21');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Rados³aw','Krajewski','radoslawkrajewski@poczta.onet.pl',2300,'2018-08-30');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Justyna','Urban','justynaurban@gmail.com',2200,'2018-11-10');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Kinga','Nowakowska','kinganowakowska@wp.pl',2100,'2019-01-25');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Grzegorz','Piekarski','grzegorzpiekarski@poczta.onet.pl',2000,'2019-03-05');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Sylwia','Sadowska','sylwiasadowska@gmail.com',1900,'2019-05-15');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Wojciech','Lisowski','wojciechlisowski@wp.pl',1800,'2019-07-11');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Gabriela','Mróz','gabrielamroz@poczta.onet.pl',1700,'2019-09-19');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Mateusz','Kubiak','mateuszkubiak@gmail.com',1600,'2019-11-23');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Natalia','Stasiak','nataliastasiak@wp.pl',1500,'2020-01-14');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Krzysztof','Chmiel','krzysztofchmiel@poczta.onet.pl',1450,'2020-03-22');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Ewelina','Cieœlik','ewelinacieslik@gmail.com',1400,'2020-05-09');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Dominik','Matusiak','dominikmatusiak@wp.pl',1350,'2020-07-28');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Agnieszka','Kurowska','agnieszkakurowska@poczta.onet.pl',1300,'2020-09-17');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Jacek','Marek','jackmarek@gmail.com',1250,'2020-11-04');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Izabela','Zalewska','izabelazalewska@wp.pl',1200,'2021-01-27');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Dawid','Wrona','dawidwrona@poczta.onet.pl',1150,'2021-03-19');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Barbara','Weso³owska','barbarawesolowska@gmail.com',1100,'2021-05-05');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Miko³aj','Tomczyk','mikolajtomczyk@wp.pl',1050,'2021-07-15');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Gabriela','Krupa','gabrielakrupa@poczta.onet.pl',1000,'2021-09-01');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Marek','Ko³odziej','marekkolodziej@gmail.com',950,'2021-11-28');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Marzena','Czarnecka','marzenaczarnecka@wp.pl',900,'2022-01-12');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Kamil','Piasecki','kamilpiasecki@poczta.onet.pl',850,'2022-03-09');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Beata','Michalak','beatamichalak@gmail.com',800,'2022-05-15');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Patryk','Musia³','patrykmusial@wp.pl',750,'2022-07-19');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Dorota','Olejniczak','dorotaolejniczak@poczta.onet.pl',700,'2022-09-23');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Przemys³aw','Kozie³','przemyslawkoziel@gmail.com',650,'2022-11-30');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Alicja','Gajda','alicjagajda@wp.pl',600,'2023-01-27');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Karol','Malec','karolmalec@poczta.onet.pl',550,'2023-03-22');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Kamila','Kot','kamilakot@gmail.com',500,'2023-05-18');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Piotr','Sowa','piotrsowa@wp.pl',450,'2023-07-29');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Jolanta','Mroczek','jolantamroczek@poczta.onet.pl',400,'2023-09-13');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Mariusz','Drozd','mariuszdrozd@gmail.com',350,'2023-11-27');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Sebastian','Kasprzak','sebastiankasprzak@wp.pl',300,'2024-01-10');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Anna','Marciniak','annamarciniak@poczta.onet.pl',250,'2024-03-15');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Emil','Zych','emilzych@gmail.com',200,'2024-05-12');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Ewa','Oleksy','ewaoleksy@wp.pl',150,'2024-07-19');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Rafa³','Augustyniak','rafalaugustyniak@poczta.onet.pl',100,'2024-09-21');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Adrian','Barañski','adrianbaranski@gmail.com',90,'2024-10-03');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Monika','¯ak','monikazak@wp.pl',80,'2024-10-17');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Micha³','Górski','michalgorski@poczta.onet.pl',70,'2024-11-01');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Marta','Leœniak','martalesniak@gmail.com',60,'2024-11-15');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Zbigniew','Kurek','zbigniewkurek@wp.pl',50,'2024-11-25');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('El¿bieta','Maj','elzbietamaj@poczta.onet.pl',40,'2024-12-03');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Robert','Konieczny','robertkonieczny@gmail.com',30,'2024-12-11');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Paulina','Or³owska','paulinaorlowska@wp.pl',20,'2024-12-19');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Tomasz','W³odarczyk','tomaszwlodarczyk@poczta.onet.pl',10,'2024-12-27');
INSERT INTO Klienci(imie,nazwisko,e_mail,punkty,data_zalozenia_konta) VALUES ('Iwona','Nowicka','iwonanowicka@gmail.com',0,'2024-12-31');
COMMIT;

CREATE TABLE Zamowienia_Spozywcze
(
	ID_zamowienia INTEGER GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1),
	ID_produktu INTEGER,
	ID_dostawcy INTEGER,
	data_zamowienia DATE,
	ilosc INTEGER,
	koszt_dostawy NUMBER(8,2),
	CONSTRAINT PK_Zamowienia_spozywcze PRIMARY KEY(ID_zamowienia),
	CONSTRAINT FK_Zamowienie_spozywczeXProdukt FOREIGN KEY (ID_produktu) REFERENCES Produkty_spozywcze(ID_produktu),
	CONSTRAINT FK_Zamowienie_spozywczeXTDostawca FOREIGN KEY (ID_dostawcy) REFERENCES Dostawcy_Spozywczy(ID_dostawcy)
);
COMMIT;
--czerwiec
--jedzenie
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (1,5,'2024-06-02',30,1200.00);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (2,5,'2024-06-01',30,1200.00);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (3,2,'2024-05-29',30,1150.00);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (4,2,'2024-05-28',30,1150.00);
--napoje
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (12,12,'2024-05-26',30,950.00);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (13,12,'2024-05-23',60,990.50);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (9,4,'2024-05-22',60,990.50);
--pepsi co
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (29,11,'2024-05-21',15,1300.00);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (30,11,'2024-05-20',15,1300.00);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (10,11,'2024-05-19',30,1300.00);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (11,11,'2024-05-18',20,1300.00);
--akcesoria samochodowe
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (18,13,'2024-05-16',60,965.00);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (6,8,'2024-05-14',25,999.99);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (8,7,'2024-05-06',20,1075.00);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (5,7,'2024-05-05',30,1075.00);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (38,9,'2024-05-02',20,1015.90);
--kwiecien
--jedzenie
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (1,5,'2024-04-02',30,1200);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (2,5,'2024-04-01',30,1200.00);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (3,2,'2024-03-29',30,1150.00);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (4,2,'2024-03-28',30,1150.00);
--napoje
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (12,12,'2024-03-24',30,950.00);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (13,12,'2024-03-23',60,990.50);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (9,4,'2024-03-22',60,990.50);
--pepsi co
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (29,11,'2024-03-21',15,1300);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (30,11,'2024-03-20',15,1300);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (10,11,'2024-03-19',30,1300);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (11,11,'2024-03-18',20,1300);
--akcesoria samochodowe
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (18,13,'2024-03-16',60,965.00);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (6,8,'2024-03-14',25,999.99);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (8,7,'2024-03-06',20,1075.00);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (5,7,'2024-03-05',30,1075.00);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (38,9,'2024-03-02',20,1015.90);
--luty
--jedzenie
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (1,5,'2024-02-02',30,1200);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (2,5,'2024-02-01',30,1200.00);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (3,2,'2024-01-29',30,1150.00);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (4,2,'2024-01-28',30,1150.00);
--napoje
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (12,12,'2024-01-26',30,950.00);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (13,12,'2024-01-23',60,990.50);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (9,4,'2024-01-22',60,990.50);
--pepsi co
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (29,11,'2024-01-21',15,1300);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (30,11,'2024-01-20',15,1300);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (10,11,'2024-01-19',30,1300);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (11,11,'2024-01-18',20,1300);
--akcesoria samochodowe
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (18,13,'2024-01-16',60,965.00);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (6,8,'2024-01-14',25,999.99);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (8,7,'2024-01-05',20,1075.00);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (5,7,'2024-01-06',30,1075.00);
INSERT INTO zamowienia_spozywcze(id_produktu,id_dostawcy,data_zamowienia,ilosc,koszt_dostawy) 
    VALUES (38,9,'2024-01-02',20,1015.90);
COMMIT;    
----Sprawdzenie
--select zs.id_zamowienia,p.nazwa,d.nazwa from zamowienia_spozywcze zs
--LEFT JOIN produkty_spozywcze p using(ID_produktu)
--LEFT JOIN dostawcy_spozywczy d using(ID_dostawcy);




CREATE TABLE Zamowienia_Paliwowe
(
	ID_zamowienia INTEGER GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1),
	ID_ceny INTEGER,
	ID_dostawcy INTEGER,
	data_zamowienia DATE,
	ilosc_paliwa NUMBER(8,2),
	koszt_dostawy NUMBER(8,2),
	CONSTRAINT PK_Zamowienia_paliwowe PRIMARY KEY(ID_zamowienia),
	CONSTRAINT FK_Zamowienie_paliwoweXCena FOREIGN KEY (ID_ceny) REFERENCES Historia_Cen_Paliw(ID_ceny) ON DELETE CASCADE,
	CONSTRAINT FK_Zamowienie_paliwoweXTDostawca FOREIGN KEY (ID_dostawcy) REFERENCES Dostawcy_Paliwowi(ID_dostawcy)
);
COMMIT;

--SPRAWDZENIE
----ilo?ciowy stan paliwa na stacji
--select P.ID_PALIWA, TP.NAZWA_paliwa, P.ILOSC_W_LITRACH, P.MAKSYMALNA_ILOSC, hcp.data_ceny from paliwa P
--LEFT JOIN HISTORIA_CEN_PALIW HCP USING(ID_CENY)
--LEFT JOIN TYP_PALIWA TP ON HCP.id_typu = tp.id_typu;
--
----HISTORIA CEN Z NAZWAMI;
--SELECT hcp.ID_CENY,tp.nazwa_paliwa,hcp.DATA_CENY,hcp.cena FROM Historia_Cen_Paliw hcp
--JOIN Typ_Paliwa tp using(ID_typu)
--WHERE DATA_CENY > '2024-03-01';


--CZERWIEC & LIPIEC 2023
INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(1,1,'2023-06-17',450,2550.00); --95 450
INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(2,1,'2023-06-27',250,1547.50); --98 250
INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(3,6,'2023-06-30',150,577.35); --AddBlue 150
INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(4,5,'2023-07-03',480,1234.88); --LPG 480
INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(5,2,'2023-07-12',150,999.26); --premium Diesel 150
INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(6,2,'2023-07-18',450,2521.55); --standard diesel 450

--SIERPIEÑ & WRZESIEÑ 2023
INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(11,5,'2023-08-11',480,1236.83); --LPG 480
INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(12,1,'2023-08-18',250,1637.93); --98 250
INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(13,2,'2023-08-22',450,2526.50); --standard Diesel 450
INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(16,1,'2023-09-18',450,2460.67); --95 450
INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(20,2,'2023-09-29',150,1056.19); --premium diesel 150
INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(22,6,'2023-10-02',150,630.00); --Ad Blue 150 


-- PA?DZNIERNIK & LISTOPAD 2023
INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(23,2,'2023-10-07',150,2618.88); --standard diesel 150
INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(25,5,'2023-10-24',480,1325.97); --LPG 480
INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(27,1,'2023-10-30',450,2435.23); --95 450
INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(28,1,'2023-11-02',250,1660.22); --98 250

-- STYCZEÑ

INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(29,2,'2024-01-11',150,1110.02); --premium diesel 150
INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(30,2,'2024-01-15',450,2579.18); --standard diesel 450
INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(31,6,'2024-01-18',150,718.48); --AdBlue 150
INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(32,4,'2024-01-21',450,2478.70); --95 450
INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(33,4,'2024-01-25',250,1669.42); --98 250
INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(34,5,'2024-01-28',500,1378.75); --LPG 500   

-- MARZEC & KWIECIEÑ        

INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(41,4,'2024-03-09',150,1183.91); --98 150
INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(42,5,'2024-03-12',400,1163.12); -- LPG 400
INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(43,1,'2024-03-15',400,2305.80); --95 400
INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(44,2,'2024-05-23',150,1145.80); --premium diesel 150
INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(46,3,'2024-04-04',400,2404.36); --standard diesel 400
INSERT INTO zamowienia_paliwowe(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
    VALUES(47,6,'2024-04-10',150,791.21); --AddBlue 150 
COMMIT;

-- Create view to show fuel order history
CREATE OR REPLACE VIEW show_order_fuel_history
AS
    SELECT Zam.id_zamowienia, Hist.Id_typu, Hist.cena, Dos_pal.nazwa ,Zam.data_zamowienia,
    Zam.ilosc_paliwa, Zam.koszt_dostawy
    FROM zamowienia_paliwowe Zam
    JOIN historia_cen_paliw  Hist 
    ON Zam.id_ceny = Hist.id_ceny
    JOIN dostawcy_paliwowi Dos_pal
    ON Dos_pal.id_dostawcy = Zam.ID_Dostawcy;
    
SELECT * FROM show_order_fuel_history