SET SERVEROUTPUT ON;

SELECT
    id_typu,
    nazwa_paliwa
FROM
    typ_paliwa;
    
select * from paliwa;
SELECT * FROM HISTORIA_CEN_PALIW;

CREATE TABLE test2
(
    test_id INTEGER GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1),
    text VARCHAR(20)
);
commit; 

select * from test2;
drop table test2;
INSERT INTO TEST2(text) VALUES('AAA');
INSERT INTO TEST2(text) VALUES('BBB');
INSERT INTO TEST2(text) VALUES('CCC');
delete test2 where text = 'BBB';

var val INTEGER;

select * INTO val from test2
where test_id = (Select Max(test_id) FROM TEST2);

SELECT * FROM VAL;

select p.id_paliwa FROM paliwa p
JOIN historia_cen_paliw hcp using(id_ceny)
JOIN typ_paliwa tp using(id_typu)
WHERE tp.nazwa_paliwa = 'benzyna 95'

select count(p.id_paliwa) FROM paliwa p
JOIN historia_cen_paliw hcp using(id_ceny)
JOIN typ_paliwa tp using(id_typu)
WHERE tp.nazwa_paliwa = 'benzyna 98'

EXEC update_petrol_prices('benzyna 95', '7,98');
EXEC update_petrol_points('benzyna 95', 12);

--DEBUGOWANIE KOMENDY ZMIANY CENY PALIWA

DECLARE
  PETROL_NAME VARCHAR2(200);
  PETROL_PRICE NUMBER;
BEGIN
  PETROL_NAME := 'LPG';
  PETROL_PRICE := 2.52;

  UPDATE_PETROL_PRICE(
    PETROL_NAME => PETROL_NAME,
    PETROL_PRICE => PETROL_PRICE
  );
END;

Select p.ID_paliwa,tp.nazwa_paliwa,hcp.cena, p.ilosc_punktow,hcp.data_ceny FROM
Paliwa p
LEFT JOIN Historia_cen_paliw hcp
ON p.ID_ceny = hcp.ID_ceny
LEFT JOIN Typ_paliwa tp
ON tp.ID_typu = hcp.ID_typu;


--SELECTY DO TABEL:


select * from PALIWA;
select * from historia_cen_paliw;
select * from klienci;
SELECT * FROM DOSTAWCY_PALIWOWI;

select * from zamowienia_paliwowe

select * from typ_paliwa;

select * from zamowienia_spozywcze
SELECT * FROM DOSTAWCY_SPOZYWCZY;

select id_produktu,cena_jednostkowa From produkty_spozywcze;

SELECT * FROM PRODUKTY_SPOZYWCZE;



