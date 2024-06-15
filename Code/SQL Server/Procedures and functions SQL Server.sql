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



