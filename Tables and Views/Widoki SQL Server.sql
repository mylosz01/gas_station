
--PRACOWNIKA

--Produkty na stanie
CREATE VIEW products_stock AS
SELECT * FROM 
OPENQUERY(ZaopatrzenieOracle,'SELECT ID_produktu,nazwa,ilosc_na_stanie FROM ADMINISTRATORORACLE.produkty_spozywcze');
GO

SELECT * FROM products_stock;


--Ceny produktów
CREATE VIEW products_prices AS
SELECT * FROM
OPENQUERY(ZaopatrzenieOracle,'SELECT ID_produktu,nazwa,cena_jednostkowa,ilosc_punktow FROM ADMINISTRATORORACLE.produkty_spozywcze');
GO

SELECT * FROM products_prices;

--Paliwa na stanie
CREATE VIEW petrol_stock AS
Select p.ID_paliwa,tp.nazwa_paliwa,p.ilosc_w_litrach,p.maksymalna_ilosc, ROUND((p.ilosc_w_litrach/p.maksymalna_ilosc * 100),2) as procent
FROM
ZaopatrzenieOracle.."ADMINISTRATORORACLE"."PALIWA" p
LEFT JOIN OPENQUERY(ZaopatrzenieOracle,'SELECT * FROM ADMINISTRATORORACLE.Historia_cen_paliw') hcp
ON p.ID_ceny = hcp.ID_ceny
LEFT JOIN ZaopatrzenieOracle.."ADMINISTRATORORACLE"."TYP_PALIWA" tp
ON tp.ID_typu = hcp.ID_typu;

SELECT * FROM petrol_stock;


CREATE VIEW petrol_prices AS
Select p.ID_paliwa,tp.nazwa_paliwa,hcp.cena, p.ilosc_punktow,hcp.data_ceny
FROM
ZaopatrzenieOracle.."ADMINISTRATORORACLE"."PALIWA" p
LEFT JOIN OPENQUERY(ZaopatrzenieOracle,'SELECT * FROM ADMINISTRATORORACLE.Historia_cen_paliw') hcp
ON p.ID_ceny = hcp.ID_ceny
LEFT JOIN ZaopatrzenieOracle.."ADMINISTRATORORACLE"."TYP_PALIWA" tp
ON tp.ID_typu = hcp.ID_typu;

SELECT * FROM petrol_prices;

CREATE VIEW show_employees AS
SELECT * FROM OPENQUERY(Pracownicy,'Select * from [Pracownicy$]');

select * from show_employees;
