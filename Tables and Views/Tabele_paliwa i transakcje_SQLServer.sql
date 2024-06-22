CREATE DATABASE StacjaPaliw;
go

use StacjaPaliw;
GO


CREATE TABLE Transakcje_paliwowe
(
	ID_transakcji INT IDENTITY(1,1),
	ID_klienta INT,
	ID_paliwa INT,
	kwota_transakcji NUMERIC(8,2),
	ilosc_paliwa NUMERIC(5,2),
	data_transakcji DATETIME,
	CONSTRAINT PK_Transakcje_paliwowe PRIMARY KEY (ID_transakcji)
	
	--Nie ma możliwości stworzenia FK do tabel z Oracla a zatem w tym miejscu integralność danych sprawdzana triggerami
	--CONSTRAINT FK_Transakcja_paliwoXPaliwo FOREIGN KEY (ID_paliwa) REFERENCES [Ścieżka do tabeli w Oracle](ID_paliwa),
	--CONSTRAINT FK_Transakcja_paliwowaXKlient FOREIGN KEY (ID_klienta) REFERENCES [Ścieżka do tabeli w Oracle](ID_klienta)
	
	--Iloœc punktów przyznawanych za transakcjê w Triggerze / procedurze (liczona na podstawie kwoty / iloœci zatankowanego paliwa)
	
);

INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(10,3,250.03,36.98,'2023-06-06');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(1,1,205.00,32.50,'2023-01-14');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(2,2,303.75,50.00,'2023-02-15');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(3,3,100.80,16.80,'2023-03-10');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(4,4,130.65,20.10,'2023-04-05');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(5,5,160.00,57.14,'2023-05-01');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(6,6,96.00,48.00,'2023-06-03');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(7,1,195.00,30.00,'2023-07-10');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(8,2,220.40,36.74,'2023-08-21');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(9,3,256.00,40.00,'2023-09-12');

INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(10,4,97.50,15.00,'2023-10-05');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(11,5,220.00,75.86,'2023-11-17');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(12,6,240.00,96.00,'2023-12-24');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(13,1,130.00,20.00,'2024-01-11');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(14,2,303.20,50.53,'2024-02-08');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(15,3,254.00,38.74,'2024-03-21');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(16,4,140.00,21.54,'2024-04-05');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(17,5,128.00,45.71,'2024-05-11');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(18,6,210.00,87.50,'2024-06-10');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(19,1,320.50,50.00,'2023-01-18');

INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(20,2,227.50,35.00,'2023-02-25');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(21,3,90.00,14.29,'2023-03-14');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(22,4,102.00,15.69,'2023-04-28');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(23,5,140.00,46.67,'2023-05-07');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(24,6,200.00,80.00,'2023-06-29');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(25,1,180.00,28.57,'2023-07-20');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(26,2,272.25,42.75,'2023-08-13');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(27,3,147.00,22.62,'2023-09-09');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(28,4,156.00,24.00,'2023-10-02');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(29,5,170.00,56.67,'2023-11-06');

INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(30,6,280.00,112.00,'2023-12-15');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(31,1,210.00,33.87,'2024-01-22');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(32,2,330.00,52.38,'2024-02-13');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(33,3,156.00,24.00,'2024-03-16');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(34,4,170.00,26.15,'2024-04-12');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(35,5,155.00,51.67,'2024-05-05');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(36,6,240.00,96.00,'2024-06-01');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(37,1,198.00,31.56,'2023-01-19');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(38,2,260.40,40.00,'2023-02-27');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(39,3,153.60,24.00,'2023-03-25');

INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(40,4,110.00,17.23,'2023-04-17');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(41,5,96.00,32.00,'2023-05-09');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(42,6,198.00,82.50,'2023-06-20');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(43,1,220.00,33.85,'2023-07-24');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(44,2,289.75,44.57,'2023-08-11');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(45,3,240.00,38.10,'2023-09-29');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(46,4,120.00,18.95,'2023-10-13');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(47,5,160.00,53.33,'2023-11-28');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(48,6,150.00,62.50,'2023-12-18');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(49,1,175.00,27.69,'2024-01-16');

INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(1,2,250.00,39.06,'2024-02-21');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(2,3,180.00,28.57,'2024-03-19');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(3,4,160.00,24.62,'2024-04-20');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(4,5,136.00,45.33,'2024-05-10');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(5,6,180.00,75.00,'2024-06-07');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(6,1,115.00,18.26,'2023-01-06');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(7,2,175.00,27.34,'2023-02-09');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(8,3,150.00,23.08,'2023-03-04');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(9,4,120.00,18.46,'2023-04-14');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(10,5,200.00,66.67,'2023-05-19');

INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(11,6,150.00,62.50,'2023-06-23');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(12,1,325.00,50.00,'2023-07-12');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(13,2,237.50,36.54,'2023-08-30');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(14,3,90.00,14.06,'2023-09-08');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(15,4,175.00,26.92,'2023-10-27');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(16,5,138.00,46.00,'2023-11-21');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(17,6,185.00,74.00,'2023-12-19');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(18,1,184.00,28.31,'2024-01-26');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(19,2,300.00,47.62,'2024-02-25');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(20,3,186.00,29.54,'2024-03-22');

INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(21,4,158.00,24.31,'2024-04-18');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(22,5,120.00,40.00,'2024-05-03');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(23,6,160.00,64.00,'2024-06-09');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(24,1,215.00,32.15,'2023-01-07');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(25,2,280.00,44.44,'2023-02-28');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(26,3,180.00,28.13,'2023-03-19');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(27,4,110.00,17.60,'2023-04-25');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(28,5,160.00,53.33,'2023-05-24');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(29,6,250.00,100.00,'2023-06-30');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(30,1,196.00,31.62,'2023-07-28');

INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(31,2,210.00,33.87,'2023-08-14');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(32,3,156.00,24.57,'2023-09-21');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(33,4,128.00,20.00,'2023-10-30');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(34,5,100.00,33.33,'2023-11-19');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(35,6,178.00,74.17,'2023-12-22');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(36,1,115.00,18.15,'2024-01-24');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(37,2,240.00,38.71,'2024-02-12');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(38,3,123.00,19.38,'2024-03-26');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(39,4,180.00,28.13,'2024-04-09');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(40,5,190.00,63.33,'2024-05-13');

INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(41,6,160.00,66.67,'2024-06-06');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(42,1,232.50,37.50,'2023-01-02');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(43,2,279.00,43.80,'2023-02-22');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(44,3,140.00,21.54,'2023-03-23');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(45,4,123.00,18.92,'2023-04-26');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(46,5,150.00,50.00,'2023-05-16');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(47,6,210.00,87.50,'2023-06-27');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(48,1,198.00,31.85,'2023-07-04');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(49,2,269.50,42.27,'2023-08-05');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(1,3,154.50,23.77,'2023-09-13');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(2,4,189.00,29.08,'2023-10-19');

INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(3,5,240.00,80.00,'2023-11-22');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(4,6,230.00,95.83,'2023-12-31');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(5,1,172.00,26.46,'2024-01-27');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(6,2,200.00,31.25,'2024-02-18');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(7,3,139.50,22.00,'2024-03-17');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(8,4,145.00,22.31,'2024-04-21');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(9,5,185.00,61.67,'2024-05-12');
INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) VALUES(10,6,170.00,70.83,'2024-06-08');

--Sprawdzenie
--SELECT ID_PALIWA, kwota_transakcji/ilosc_paliwa as cena_paliwa FROM Transakcje_paliwowe;
--SELECT * FROM dbo.petrol_prices;
--SELECT * FROM Transakcje_paliwowe;

CREATE TABLE Transakcje_spozywcze
(
	ID_transakcji INT IDENTITY(1,1),
	ID_klienta INT,
	ID_produktu INT,
	ilosc INT,
	kwota_transakcji NUMERIC(8,2),
	data_transakcji DATETIME,
	CONSTRAINT PK_Transakcje_Spozywcze PRIMARY KEY (ID_transakcji),

	--Nie ma możliwości stworzenia FK do tabel z Oracla a zatem w tym miejscu integralność danych sprawdzana triggerami
	--CONSTRAINT FK_Transakcja_paliwowaXKlient FOREIGN KEY (ID_klienta) REFERENCES [*œcie¿ka do tabeli w oracle*](ID_klienta),
	--CONSTRAINT FK_Transakcja_paliwowaXProdukt FOREIGN KEY (ID_produktu) REFERENCES [*œcie¿ka do tabeli w oracle*](ID_produktu)

	--Iloœc punktów przyznawanych za transakcjê w Triggerze / procedurze (liczona na podstawie kwoty / typu produktu)
);

INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(NULL,30,2,23.98,'2024-06-06');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(1,1,2,17.98,'2023-01-15');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(NULL,2,3,38.97,'2023-02-11');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(3,3,1,7.99,'2023-03-25');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(4,4,4,43.96,'2023-04-02');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(5,5,2,16.98,'2023-05-12');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(NULL,6,1,17.50,'2023-06-20');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(7,7,1,54.00,'2023-07-14');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(8,8,3,83.97,'2023-08-30');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(9,9,5,29.95,'2023-09-01');

INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(10,10,2,21.98,'2023-10-15');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(NULL,11,4,55.96,'2023-11-23');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(12,12,1,4.99,'2023-12-07');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(13,13,2,9.98,'2023-12-30');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(14,14,1,2.50,'2024-01-16');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(15,15,3,7.50,'2024-02-22');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(NULL,16,4,87.96,'2024-03-05');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(17,17,1,59.99,'2024-03-21');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(18,18,5,49.95,'2024-04-09');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(19,19,1,21.50,'2024-04-26');

INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(20,20,2,15.98,'2024-05-13');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(21,21,3,32.97,'2024-05-27');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(22,22,1,8.50,'2024-06-03');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(23,23,2,23.00,'2024-06-10');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(24,24,4,31.96,'2023-01-09');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(25,25,1,10.99,'2023-02-14');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(NULL,26,3,23.97,'2023-03-29');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(27,27,5,44.95,'2023-04-11');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(28,28,2,10.00,'2023-05-03');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(29,29,4,47.96,'2023-06-25');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(30,30,3,35.97,'2023-07-16');

INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(NULL,31,1,37.99,'2023-08-08');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(32,32,2,83.00,'2023-09-20');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(33,33,3,107.97,'2023-10-29');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(34,34,5,124.95,'2023-11-17');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(NULL,35,4,14.00,'2023-12-23');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(36,36,1,35.99,'2024-01-05');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(37,37,2,89.00,'2024-01-28');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(38,38,5,32.00,'2024-02-12');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(NULL,1,3,26.97,'2024-02-28');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(2,2,1,12.99,'2024-03-21');

INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(3,3,4,31.96,'2024-04-05');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(4,4,2,21.98,'2024-04-27');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(5,5,1,8.49,'2024-05-10');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(6,6,3,52.50,'2024-05-24');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(NULL,7,5,270.00,'2023-01-19');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(8,8,1,27.99,'2023-02-03');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(9,9,4,23.96,'2023-02-28');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(10,10,5,54.95,'2023-03-19');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(11,11,1,13.99,'2023-04-07');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(12,12,3,14.97,'2023-05-23');

INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(NULL,13,4,19.96,'2023-06-10');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(14,14,5,12.50,'2023-07-21');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(15,15,2,5.00,'2023-08-30');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(16,16,1,21.99,'2023-09-15');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(NULL,17,3,179.97,'2023-10-25');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(17,18,2,19.98,'2023-11-07');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(18,19,5,107.50,'2023-12-29');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(19,20,4,31.96,'2024-01-18');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(20,21,1,10.99,'2024-02-09');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(NULL,22,2,17.00,'2024-03-01');

INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(21,23,3,34.50,'2024-03-18');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(22,24,4,31.96,'2024-04-08');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(23,25,1,10.99,'2024-04-26');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(24,26,5,39.95,'2024-05-15');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(25,27,3,26.97,'2024-05-30');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(NULL,28,2,10.00,'2024-06-07');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(26,29,1,11.99,'2023-01-13');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(27,30,4,47.96,'2023-02-04');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(28,31,5,189.95,'2023-03-26');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(29,32,3,124.50,'2023-04-09');
INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji) VALUES(NULL,33,2,71.98,'2023-05-11');

--SPRAWDZENIE
--SELECT * FROM Transakcje_spozywcze;

--SELECT TS.ID_PRODUKTU,P.NAZWA, TS.KWOTA_TRANSAKCJI/TS.ILOSC AS CENA_ZA_SZTUKE,P.CENA_JEDNOSTKOWA
--FROM Transakcje_spozywcze AS TS
--left join OPENQUERY(ZaopatrzenieOracle,'SELECT * FROM ADMINISTRATORORACLE.PRODUKTY_SPOZYWCZE') AS P
--ON P.ID_produktu = TS.ID_produktu;

CREATE TABLE Harmonogram
(
	ID_wpisu INT IDENTITY(1,1),
	ID_pracownika INT,
	data_rozpoczêcia_zmiany DATETIME,
	data_zakoñczenia_zmiany DATETIME,
	-- mo¿naby zrobiæ procedurê licz¹c¹ wynagrodzenie pracowniowi za dan¹ zmianê
	CONSTRAINT PK_Harmonogram PRIMARY KEY (ID_wpisu),
	CONSTRAINT CHCK_ID_pracownika CHECK (ID_pracownika IS NOT NULL)
	--sprawdzenie istnienia odpowiadających wartości należy zrealizować programowo za pomocą triggerów
);

Select * From Pracownicy...[Pracownicy$];
