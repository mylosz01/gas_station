USE StacjaZarzad;
GO

SELECT * FROM Transakcje_paliwowe;

SELECT * FROM Transakcje_spozywcze;

SELECT * 
FROM ZaopatrzenieOracle.."ADMINISTRATORORACLE"."PALIWA";
go

-- show number and sum price of transactions daily (fuel)
CREATE OR ALTER PROCEDURE show_transaction_analize_daily_fuel
AS
BEGIN

	SELECT COUNT(ID_transakcji) AS NumberOfTransaction, ID_paliwa, data_transakcji
	FROM Transakcje_paliwowe
	GROUP BY data_transakcji, ID_paliwa;

END;

EXEC show_transaction_analize_daily_fuel;

-- show number and sum price of transactions daily (products)

-- show history of specific fuel price

-- check orders of products/fuel

-- check number of customers

-- update price of fuel

-- update points petrol

