--CREATE PROCEDURE PRODUCTS_TRANSACTION_HISTORY
--	@client_ID INT
--AS
--BEGIN
--    SELECT EmployeeID, FirstName, LastName, Department
--    FROM Employees
--    WHERE Department = @Department;
--END;

--SELECT  FROM transakcje_spzywcze 
--ROZWINĄĆ JAK POJAWIĄ SIĘ TABELE Z TRANSAKCJAMI

CREATE PROCEDURE check_loyalty_points(
@client_ID INT, 
@points INT OUTPUT
)
AS 
	Declare @client_exist INT
BEGIN
	SELECT @client_exist = COUNT(ID_klienta) FROM ZaopatrzenieOracle.."ADMINISTRATORORACLE"."KLIENCI"
	WHERE ID_klienta = @client_ID;
	
	IF @client_exist = 0
	BEGIN
		RAISERROR('Klient o danym ID nie istnieje', 16,1);
		RETURN;
	END

	SELECT @points = punkty FROM ZaopatrzenieOracle.."ADMINISTRATORORACLE"."KLIENCI"
	WHERE ID_klienta = @client_ID;
    
END;


CREATE PROCEDURE add_points_to_client(
@client_ID INT,@points_to_add INT
)
AS
	DECLARE @client_exist INT;
BEGIN
	SELECT @client_exist = COUNT(ID_klienta) FROM ZaopatrzenieOracle.."ADMINISTRATORORACLE"."KLIENCI"
	WHERE ID_klienta = @client_ID;
	
	IF @client_exist = 0
	BEGIN
		RAISERROR('Klient o danym ID nie istnieje', 16,1);
		RETURN;
	END

	UPDATE ZaopatrzenieOracle.."ADMINISTRATORORACLE"."KLIENCI" SET punkty=punkty+@points_to_add
	WHERE ID_klienta = @client_ID
	OPTION  (RECOMPILE);
END;

CREATE PROCEDURE hire_employee(
@emp_ID INT,
@name VARCHAR(30),
@surname VARCHAR(30),
@phone_number VARCHAR(30),
@salary NUMERIC)
AS
	DECLARE @id_busy INT
BEGIN
	IF @salary < 0
	BEGIN
		RAISERROR('Wartość pensji nie może być mniejsza od 0', 16,1);
	END
	SELECT @id_busy = COUNT(ID_pracownika) FROM Pracownicy...[Pracownicy$]
	WHERE ID_pracownika = @emp_ID;
	IF @id_busy > 0
	BEGIN
		RAISERROR('Istnieje już pracownik o wskazanym ID', 16,1);
		RETURN;
	END
	
	INSERT INTO OPENQUERY(Pracownicy,'Select * FROM [Pracownicy$]')
	VALUES(@emp_ID,@name,@surname,@phone_number,@salary);

END;


CREATE PROCEDURE make_petrol_order(
@petrol_name VARCHAR(30),
@provider_ID INT,
@petrol_amout NUMERIC,
@delivery_cost NUMERIC
)
AS
	DECLARE @petrol_exist INT
	DECLARE @price_ID INT
	DECLARE @provider_exist INT
	DECLARE @current_petrol_amount INT
	DECLARE @max_petrol_amount INT
BEGIN

	IF @delivery_cost < 0
	BEGIN
		RAISERROR('Cena dostawy nie moze byc wartoscia ujemna',16,1);
		RETURN;
	END

	SELECT @petrol_exist = COUNT(ID_typu) FROM ZaopatrzenieOracle.."ADMINISTRATORORACLE"."TYP_PALIWA"
	WHERE nazwa_paliwa = @petrol_name
	IF @petrol_exist = 0
	BEGIN
		RAISERROR('Paliwo o wskazanej nazwie nie istnieje', 16,1);
		RETURN;
	END
	
	SELECT @provider_exist = COUNT(ID_dostawcy) FROM ZaopatrzenieOracle.."ADMINISTRATORORACLE"."DOSTAWCY_PALIWOWI"
	WHERE ID_dostawcy = @provider_ID

	IF @provider_exist = 0
	BEGIN
		RAISERROR('Dostawca o wskazanym identyfikatorze nie istnieje', 16,1);
		RETURN;
	END

	SELECT @current_petrol_amount = p.ilosc_w_litrach,@max_petrol_amount = p.maksymalna_ilosc,@price_ID = p.ID_ceny
	FROM
	OPENQUERY(ZaopatrzenieOracle,'SELECT * FROM PALIWA') AS p
	LEFT JOIN OPENQUERY(ZaopatrzenieOracle, 'Select * from HISTORIA_CEN_PALIW') as hcp ON p.ID_ceny=hcp.ID_ceny
	LEFT JOIN OPENQUERY(ZaopatrzenieOracle, 'SELECT * FROM TYP_PALIWA') as tp ON hcp.ID_typu = tp.ID_typu
	WHERE tp.nazwa_paliwa = @petrol_name
	OPTION (RECOMPILE)


	IF @current_petrol_amount + @petrol_amout >= @max_petrol_amount
	BEGIN
		RAISERROR('Proba zamówienia zbyt duzej ilosci paliwa', 16,1);
		RETURN;
	END

	INSERT INTO OPENQUERY(ZaopatrzenieOracle,'Select ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy FROM ZAMOWIENIA_PALIWOWE')
	VALUES
	(@price_ID,@provider_ID,GETDATE(),@petrol_amout,@delivery_cost)
	OPTION (RECOMPILE);

	--INSERT INTO ZaopatrzenieOracle.."ADMINISTRATORORACLE"."ZAMOWIENIA_PALIWOWE" 
	--(ID_ceny,ID_dostawcy,data_zamowienia,ilosc_paliwa,koszt_dostawy)
	--VALUES
	--(@price_ID,@provider_ID,GETDATE(),@petrol_amout,@delivery_cost)
	--OPTION (RECOMPILE);

END;


CREATE PROCEDURE make_product_order(
@product_name VARCHAR(40),
@provider_ID INT,
@amount INT,
@delivery_cost NUMERIC
)
AS
	DECLARE @product_exist INT
	DECLARE @provider_exist INT
	DECLARE @product_ID INT
BEGIN
	IF @delivery_cost < 0
	BEGIN
		RAISERROR('Cena dostawy nie moze byc wartoscia ujemna',16,1);
		RETURN;
	END

	SELECT @product_exist = COUNT(ID_produktu) FROM OPENQUERY(ZaopatrzenieOracle,'Select * from Produkty_Spozywcze')
	WHERE nazwa = @product_name;

	IF @product_exist = 0
	BEGIN
		RAISERROR('Dany produkt nie istnieje',16,1);
		RETURN;
	END

	SELECT @provider_exist = COUNT(ID_dostawcy) FROM OPENQUERY(ZaopatrzenieOracle,'Select * from Dostawcy_spozywczy')
	WHERE ID_DOSTAWCY = @provider_ID;

	SELECT @product_ID = ID_produktu 
	FROM OPENQUERY(ZaopatrzenieOracle, 'Select * from Produkty_spozywcze')
	WHERE nazwa = @product_name;

	IF @provider_exist = 0
	BEGIN
		RAISERROR('Dostawca o podanym ID nie istnieje',16,1);
		RETURN;
	END

	INSERT INTO OPENQUERY(ZaopatrzenieOracle,'Select ID_produktu,ID_dostawcy,data_zamowienia,ilosc,koszt_dostawy FROM Zamowienia_spozywcze')
	VALUES(@product_ID,@provider_ID,GETDATE(),@amount,@delivery_cost)
	OPTION (RECOMPILE);

END;


CREATE PROCEDURE add_petrol_transaction(
@client_ID INT,
@petrol_ID INT,
@amount INT
)
AS
	DECLARE @client_exist INT
	DECLARE @petrol_exist INT
	DECLARE @petrol_amount INT
	DECLARE @petrol_max_amount INT 
	DECLARE @petrol_value NUMERIC(5,2)
	DECLARE @points_to_add INT
BEGIN

	IF @amount <= 0
	BEGIN
		RAISERROR('Ilosc paliwa musi byc wartoscia dodatnia',16,1);
		RETURN;
	END

	IF @client_ID IS NOT NULL
	BEGIN
		SELECT @client_exist = COUNT(ID_klienta) FROM OPENQUERY(ZaopatrzenieOracle,'Select * from ADMINISTRATORORACLE.Klienci')
			WHERE ID_klienta = @client_ID;

		IF @client_exist = 0
		BEGIN
			RAISERROR('Klient o podanym ID nie istnieje',16,1);
			RETURN;
		END
	END

	SELECT @petrol_exist = COUNT(ID_paliwa) FROM OPENQUERY(ZaopatrzenieOracle,'Select * from ADMINISTRATORORACLE.Paliwa')
		WHERE ID_paliwa = @petrol_ID;

	IF @petrol_exist = 0
	BEGIN
		RAISERROR('Paliwo o podanym ID nie istnieje',16,1);
		RETURN;
	END

	SELECT @petrol_amount = ILOSC_W_LITRACH, @petrol_max_amount = MAKSYMALNA_ILOSC FROM OPENQUERY(ZaopatrzenieOracle,'Select * from ADMINISTRATORORACLE.Paliwa')
		WHERE ID_paliwa = @petrol_ID;

	--KRYTYCZNY POZIOM PALIWA W DYSTRYBUTORZE
	IF @petrol_amount - @amount <= @petrol_max_amount * 0.05 --wartosc ustawiona na sztywno 5% z maksa
	BEGIN
		RAISERROR('Krytyczny poziom paliwa w dystrybutorze. Zaleca się zamowienie paliwa',16,1);
		RETURN;
	END

	--odjęcie paliwa powiązanego z transakcją
	UPDATE OPENQUERY(ZaoptrzenieOracle,'SELECT * FROM ADMINISTRATORORACLE.PALIWA')
	SET ILOSC_W_LITRACH = @petrol_amount - @amount
	WHERE ID_PALIWA = @petrol_ID;

	SELECT @petrol_value = @amount * HCP.CENA, @points_to_add = @amount *  P.ILOSC_PUNKTOW
	FROM OPENQUERY(ZaopatrzenieOracle,'SELECT * FROM ADMINISTRATORORACLE.PALIWA') AS P
	JOIN OPENQUERY(ZaopatrzenieOracle,'SELECT * FROM ADMINISTRATORORACLE.HISTORIA_CEN_PALIW') AS HCP
	ON P.ID_CENY = HCP.ID_CENY
	WHERE P.ID_PALIWA = @petrol_ID;

	INSERT INTO Transakcje_paliwowe(ID_klienta,ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji) 
		VALUES(@client_ID,@petrol_ID,@petrol_value,@amount,GETDATE());

	IF @client_ID IS NOT NULL
	BEGIN
		EXEC [dbo].[add_points_to_client]
		@client_ID = @client_ID,
		@points_to_add = @points_to_add;
	END
END;


CREATE PROCEDURE add_product_transaction(
@client_ID INT,
@product_ID INT,
@amount INT
)
AS
	DECLARE @client_exist INT
	DECLARE @product_exist INT
	DECLARE @products_amount INT
	DECLARE @products_value NUMERIC(5,2)
	DECLARE @points_to_add INT
BEGIN

	IF @amount <= 0
	BEGIN
		RAISERROR('Ilosc produktow musi byc wartoscia dodatnia',16,1);
		RETURN;
	END

	IF @client_ID IS NOT NULL
	BEGIN
		SELECT @client_exist = COUNT(ID_klienta) FROM OPENQUERY(ZaopatrzenieOracle,'Select * from ADMINISTRATORORACLE.Klienci')
			WHERE ID_klienta = @client_ID;

		IF @client_exist = 0
		BEGIN
			RAISERROR('Klient o podanym ID nie istnieje',16,1);
			RETURN;
		END
	END

	SELECT @product_exist = COUNT(ID_produktu) FROM OPENQUERY(ZaopatrzenieOracle,'Select * from ADMINISTRATORORACLE.Produkty_spozywcze')
		WHERE ID_produktu = @product_ID;

	IF @product_exist = 0
	BEGIN
		RAISERROR('Produkt o podanym ID nie istnieje',16,1);
		RETURN;
	END

	SELECT @products_amount = ILOSC_NA_STANIE FROM OPENQUERY(ZaopatrzenieOracle,'Select * from ADMINISTRATORORACLE.Produkty_spozywcze')
		WHERE ID_produktu = @product_ID;

	--BRAKUJE PRODUKTÓW DO SKOMPLETOWANIA ZAMÓWIENIA
	IF @products_amount - @amount < 0
	BEGIN
		RAISERROR('Brakuje produktow do skompletowania zamowienia. Zaleca się zamowienia produktow',16,1);
		RETURN;
	END

	--odjęcie produktów powiązanych z transakcją

	UPDATE ZaopatrzenieOracle.."ADMINISTRATORORACLE"."PRODUKTY_SPOZYWCZE"
	SET ILOSC_NA_STANIE = ILOSC_NA_STANIE - @amount
	WHERE ID_PRODUKTU = @product_ID;


	SELECT @products_value = @amount * CENA_JEDNOSTKOWA, @points_to_add = @amount *  ILOSC_PUNKTOW
	FROM OPENQUERY(ZaopatrzenieOracle,'SELECT * FROM ADMINISTRATORORACLE.Produkty_spozywcze')
	WHERE P.ID_PRODUKTU = @product_ID;

	INSERT INTO Transakcje_spozywcze(ID_klienta,ID_produktu,ilosc,kwota_transakcji,data_transakcji)
		VALUES(@client_ID,@product_ID,@amount,@products_value,GETDATE());

	IF @client_ID IS NOT NULL
	BEGIN
		EXEC [dbo].[add_points_to_client]
		@client_ID = @client_ID,
		@points_to_add = @points_to_add;
	END
END;

CREATE PROCEDURE client_petrol_transaction_history
(
	@client_ID INT
)
AS
BEGIN
	DECLARE @client_petrol_transactions TABLE
	(
	ID_paliwa INT,
	kwota_transakcji SMALLMONEY,
	ilosc_paliwa NUMERIC(5,2),
	data_transakcji DATETIME
	);

	INSERT INTO @client_petrol_transactions(ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji)
	SELECT ID_paliwa,kwota_transakcji,ilosc_paliwa,data_transakcji
	FROM Transakcje_paliwowe
	WHERE ID_klienta = @client_ID;

	SELECT * FROM @client_petrol_transactions;
END;





CREATE PROCEDURE client_products_transaction_history
(
	@client_ID INT
)
AS
BEGIN
	DECLARE @client_products_transactions TABLE
	(
	ID_produktu INT,
	ilosc INT,
	kwota_transakcji SMALLMONEY,
	data_transakcji DATETIME
	);

	INSERT INTO @client_products_transactions(ID_produktu,ilosc,kwota_transakcji,data_transakcji)
	SELECT ID_produktu,ilosc,kwota_transakcji,data_transakcji
	FROM Transakcje_spozywcze
	WHERE ID_klienta = @client_ID;

	SELECT * FROM @client_products_transactions;
END;





