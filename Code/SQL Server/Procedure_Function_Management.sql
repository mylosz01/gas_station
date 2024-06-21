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
CREATE OR ALTER VIEW view_price_history
AS
	SELECT ID_TYPU, DATA_CENY, CENA FROM OPENQUERY(ZaopatrzenieOracle,'SELECT * FROM historia_cen_paliw');


CREATE OR ALTER PROCEDURE show_history_of_fuel_price(
@fuel_id INT = 1)
AS
BEGIN
	SELECT DATA_CENY, CENA FROM view_price_history
	WHERE ID_TYPU = @fuel_id
	ORDER BY DATA_CENY DESC;
END;

EXEC dbo.show_history_of_fuel_price @fuel_id = 1;

-- check orders of products/fuel
CREATE OR ALTER PROCEDURE show_orders_of_fuel(
@fuel_id INT = 1)
AS
BEGIN
	SELECT * 
	FROM OPENQUERY(ZaopatrzenieOracle,'SELECT * FROM show_order_fuel_history')
	WHERE ID_TYPU = @fuel_id;
END;

EXEC show_orders_of_fuel @fuel_id = 2;

-- check number of customers
CREATE OR ALTER PROCEDURE show_number_of_new_customer
AS
BEGIN
	SELECT YEAR(DATA_ZALOZENIA_KONTA) AS 'Year', MONTH(DATA_ZALOZENIA_KONTA) AS 'Month',
	COUNT(ID_KLIENTA) AS 'Number Of Customers'
	FROM ZaopatrzenieOracle.."ADMINISTRATORORACLE"."KLIENCI"
	GROUP BY YEAR(DATA_ZALOZENIA_KONTA), MONTH(DATA_ZALOZENIA_KONTA)
	ORDER BY YEAR(DATA_ZALOZENIA_KONTA) DESC, MONTH(DATA_ZALOZENIA_KONTA) ASC;
END;

EXEC dbo.show_number_of_new_customer;


-- update price of fuel
CREATE OR ALTER PROCEDURE update_price_of_fuel(
@fuel_name VARCHAR(MAX),
@new_price NUMERIC(3,2)
)
AS
BEGIN
	DECLARE @sql NVARCHAR(MAX);
	SET @sql = N'
BEGIN 
    update_petrol_price(''' + @fuel_name + ''', ' + CAST(@new_price AS NVARCHAR) + '); 
END;';
	EXECUTE(@sql) AT [ZaopatrzenieOracle]
END;

EXEC update_price_of_fuel @fuel_name = 'benzyna 95', @new_price = 3.22;


-- update points petrol
CREATE OR ALTER PROCEDURE update_points_of_fuel(
@fuel_name VARCHAR(MAX),
@new_points INT
)
AS
BEGIN
	DECLARE @sql NVARCHAR(MAX);
	SET @sql = N'
BEGIN 
    update_petrol_points(''' + @fuel_name + ''', ' + CAST(@new_points AS NVARCHAR) + '); 
END;';
	EXECUTE(@sql) AT [ZaopatrzenieOracle]
END;

EXEC update_points_of_fuel @fuel_name = 'benzyna 95', @new_points = 99;