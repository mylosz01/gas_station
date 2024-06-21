CREATE TABLE Programy_mycia
(
    ID_programu INT GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1),
    nazwa VARCHAR(20),
    cena NUMBER(5,2),
    opis VARCHAR(200)
);

INSERT INTO Programy_mycia(nazwa,cena,opis) VALUES('Express',18.99,'mycie zasadnicze, mycie kol, suszenie');
INSERT INTO Programy_mycia(nazwa,cena,opis) VALUES('Podstawowy',22.99,'aktywna piana, mycie zasadnicze, mycie kó³, suszenie');
INSERT INTO Programy_mycia(nazwa,cena,opis) VALUES('Srebrny',26.99,'aktywna piana, mycie zasadnicze, mycie kó³, zabezpieczenie woskiem, suszenie');
INSERT INTO Programy_mycia(nazwa,cena,opis) VALUES('Zloty',29.99,'aktywna piana, mycie zasadnicze, mycie kó³, chemiczne mycie felg, mycie podwozia, zabezpieczenie woskiem, suszenie');
INSERT INTO Programy_mycia(nazwa,cena,opis) VALUES('Premium Max',36.99,
    'aktywna piana, trzykrotne mycie zasadnicze, mycie kó³, chemiczne mycie felg, mycie podwozia, 
    zabezpieczenie woskiem, dodatkowa pow³oka molekularna, suszenie z podwójnym suszeniem ty³u');
COMMIT;

SELECT count(*) FROM Programy_mycia;

CREATE TABLE Transakcje_myjni
(
    ID_transakcji INT GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1),
    ID_programu INT,
    ID_klienta INT,
    data_transakcji TIMESTAMP
);

INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(1,1,'2014-07-02 06:14');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(1,1,'2024-01-03 14:22');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(2,3,'2024-01-15 10:45');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(3,5,'2024-01-22 09:13');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(4,7,'2024-01-27 16:30');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(5,9,'2024-01-29 19:55');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(1,11,'2024-02-04 08:22');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(2,13,'2024-02-10 14:37');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(3,15,'2024-02-18 11:25');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(4,17,'2024-02-24 20:15');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(5,19,'2024-02-28 09:45');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(1,21,'2024-03-06 12:50');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(2,23,'2024-03-12 08:30');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(3,25,'2024-03-18 10:45');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(4,27,'2024-03-24 16:55');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(5,29,'2024-03-30 15:35');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(1,31,'2024-04-05 13:45');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(2,33,'2024-04-12 11:10');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(3,35,'2024-04-18 09:55');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(4,37,'2024-04-24 14:25');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(5,39,'2024-04-29 18:30');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(1,41,'2024-05-03 16:50');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(2,43,'2024-05-11 12:15');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(3,45,'2024-05-17 14:40');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(4,47,'2024-05-22 17:55');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(5,1,'2024-05-28 15:30');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(1,2,'2024-06-02 11:45');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(2,4,'2024-06-05 09:30');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(3,6,'2024-06-08 18:40');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(4,8,'2024-06-10 14:20');
INSERT INTO Transakcje_myjni(ID_programu,ID_klienta,data_transakcji) VALUES(5,10,'2024-06-12 16:50');
COMMIT;

--swoje widzi
select * from transakcje_myjni
-- cudzych nie widzi
select * from administratororacle.klienci;

-- LINKOWANIE DO AdministratorOracle:
    -- link prywatny

CREATE DATABASE LINK StacjaPrywatny
CONNECT TO AdministratorOracle IDENTIFIED BY "123"
USING '(DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = localhost)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SID = orcl)
    )
  )';
  
  -- link publiczny tworzony jest w "Users and Schemas.sql" na uprawnieniach admina. 
  -- Myjnia nie mo¿e tworzyæ linków publicznych.

--polaczenie z linku prywatnego
SELECT * from klienci@StacjaPrywatny;

--polaczenie z linku publicznego
SELECT * from klienci@StacjaPubliczny;

-- Widok ze Ÿródlem rozporoszonym
CREATE OR REPLACE VIEW Rozszerzone_Transakcje_Myjni AS
SELECT pm.nazwa nazwa_programu,k.imie,k.nazwisko,tm.data_transakcji
FROM Transakcje_Myjni tm
LEFT JOIN Programy_Mycia pm USING(ID_programu)
LEFT JOIN klienci@StacjaPrywatny k USING(ID_klienta);

DROP VIEW Rozszerzone_transakcje_myjni;

--Trigger Instead Of do wprowadzania danych do widoku

create or replace TRIGGER Rozszerzone_Transakcje_Myjni_trigger
INSTEAD OF INSERT ON Rozszerzone_Transakcje_Myjni
FOR EACH ROW
DECLARE
    program_exist INT;
    client_exist INT;
BEGIN
    --sprawdzenie czy istnieje dany program myjni
  SELECT COUNT(*) INTO program_exist FROM programy_mycia WHERE nazwa=:NEW.NAZWA_PROGRAMU;
  IF  program_exist = 0 THEN
    raise_application_error(-20001,'Program mycia nie istnieje w bazie danych');
    RETURN;
  END IF;

  --dodanie transakcji dla myjni (klient istnieje w bazie lub nie)
  SELECT COUNT(*) INTO client_exist FROM klienci@StacjaPubliczny WHERE IMIE = :NEW.IMIE AND NAZWISKO = :NEW.NAZWISKO;
  IF client_exist = 0 THEN
    INSERT INTO TRANSAKCJE_MYJNI(ID_PROGRAMU,ID_KLIENTA,DATA_TRANSAKCJI) 
    VALUES ((SELECT ID_PROGRAMU FROM PROGRAMY_MYCIA WHERE NAZWA = :NEW.NAZWA_PROGRAMU FETCH FIRST 1 ROW ONLY),NULL,SYSDATE);
  ELSE
    INSERT INTO TRANSAKCJE_MYJNI(ID_PROGRAMU,ID_KLIENTA,DATA_TRANSAKCJI) 
    VALUES ((SELECT ID_PROGRAMU FROM PROGRAMY_MYCIA WHERE NAZWA = :NEW.NAZWA_PROGRAMU FETCH FIRST 1 ROW ONLY),
        (SELECT ID_KLIENTA FROM KLIENCI@StacjaPubliczny WHERE IMIE=:NEW.IMIE AND NAZWISKO = :NEW.NAZWISKO FETCH FIRST 1 ROW ONLY),SYSDATE);
  END IF;
END;

--prawidlowa transakcja
INSERT INTO ROZSZERZONE_TRANSAKCJE_MYJNI(NAZWA_PROGRAMU,IMIE,NAZWISKO,DATA_TRANSAKCJI) 
    VALUES('Podstawowy','Emil','Zych',SYSDATE);

select * from rozszerzone_transakcje_myjni
    order by Data_Transakcji;

select * from transakcje_myjni;    
    
--nieprawidlowy program
INSERT INTO ROZSZERZONE_TRANSAKCJE_MYJNI(NAZWA_PROGRAMU,IMIE,NAZWISKO,DATA_TRANSAKCJI) 
    VALUES('aaa','Emil','Zych',SYSDATE);
    
select * from rozszerzone_transakcje_myjni
    order by Data_Transakcji;

select * from transakcje_myjni;    

--nieprawidlowe dane osobowe
INSERT INTO ROZSZERZONE_TRANSAKCJE_MYJNI(NAZWA_PROGRAMU,IMIE,NAZWISKO,DATA_TRANSAKCJI) 
    VALUES('Podstawowy','aaa','bbb',SYSDATE);   

select * from rozszerzone_transakcje_myjni
    order by Data_Transakcji;

select * from transakcje_myjni;






