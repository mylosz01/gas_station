USE StacjaZarzad;
GO

SELECT * FROM Transakcje_paliwowe;

SELECT * FROM Transakcje_spozywcze;

SELECT * 
FROM ZaopatrzenieOracle.."ADMINISTRATORORACLE"."PALIWA";
go

-- show number and sum price of transactions daily (fuel)
CREATE OR ALTER PROCEDURE show_transaction_analize_daily_fuel
(@fuel_id INT = 1)
AS
BEGIN

	SELECT data_transakcji, COUNT(ID_transakcji) AS NumberOfTransaction,
	SUM(kwota_transakcji) AS SumOfTransaction, SUM(ilosc_paliwa) SumOfFuel
	FROM Transakcje_paliwowe
	WHERE ID_paliwa = @fuel_id
	GROUP BY data_transakcji
	ORDER BY data_transakcji DESC;

END;

EXEC show_transaction_analize_daily_fuel @fuel_id = 1;

-- show number and sum price of transactions daily (products)
CREATE OR ALTER PROCEDURE show_transaction_analize_products_daily
(@product_id INT = 1)
AS
BEGIN
	SELECT data_transakcji, COUNT(ID_transakcji) AS NumberOfTransaction, COUNT(ilosc) AS NumberOfSoldProducts, SUM(kwota_transakcji) AS SumOfTransaction
	FROM Transakcje_spozywcze
	WHERE ID_produktu = @product_id
	GROUP BY data_transakcji
	ORDER BY data_transakcji DESC;
END;

EXEC show_transaction_analize_products_daily @product_id = 3;

-- show history of specific fuel price

-- check orders of products/fuel

-- check number of customers

-- update price of fuel

-- update points petrol

