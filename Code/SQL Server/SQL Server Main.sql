﻿
--Sprawdzenie działania
SELECT * 
FROM ZaopatrzenieOracle.."ADMINISTRATORORACLE"."PALIWA";
go

DECLARE @petrol_name varchar(20);
declare @new_price NUMERIC(8,2);

Set @petrol_name = 'LPG'

EXECUTE (
    'BEGIN ADMINISTRATORORACLE.UPDATEPETROLPOINTS(:pertol_name, :new_price); END;',
    @petrol_name, @new_price
) AT ORACLE_LINK;


-- wywołanie sprawdzenia punktów dla klienta
USE [StacjaPaliw]
GO
DECLARE @pointsOut INT;

EXEC check_loyalty_points
    @client_ID = 5,
    @points = @pointsOut OUTPUT;

Select @pointsOut as 'User Points'

select * from ZaopatrzenieOracle.."ADMINISTRATORORACLE"."KLIENCI"

--dodawania klientowi punktów

USE [StacjaPaliw]
GO

EXEC [dbo].[add_points_to_client]
    @client_ID = 5,
    @points_to_add = 75;

select * from ZaopatrzenieOracle.."ADMINISTRATORORACLE"."KLIENCI"
WHERE ID_klienta = 5;



--obecnie open rowset dla konta innego niż sa nie działa. 
--Nie ma w rejestrze sterowników możliwości ustawienia DisallowAdHocAccess, 
--a próba ustawienia przez Management Studio zwraca odmowę dostępu.
--https://microsoft.public.sqlserver.security.narkive.com/9ehq909L/non-sa-users-get-access-denied-in-ole-db-query


EXEC [dbo].[hire_employee]
@emp_ID = 15,
@name = 'Stefan',
@surname = 'Wisniewski',
@phone_number = '428624798',
@salary = 15;

SELECT * FROM OPENQUERY(Pracownicy,'Select * from [Pracownicy$]');

-- Stwórz zamówienie paliwowe - testowanie

EXEC dbo.make_petrol_order
@petrol_name = 'benzyna 95',
@provider_ID  = '20',
@petrol_amout = 250,
@delivery_cost = 2225.00

SELECT * FROM OPENQUERY(ZaopatrzenieOracle,'Select * from Zamowienia_paliwowe');

-- Stwórz zamówienie spożywcze
EXEC dbo.make_product_order
@product_name = 'Gasnica',
@provider_ID = 9,
@amount = 15,
@delivery_cost = 685.00


SELECT * FROM OPENQUERY(ZaopatrzenieOracle,'Select * from Zamowienia_spozywcze');
DELETE FROM OPENQUERY(ZaopatrzenieOracle,'Select * from Zamowienia_spozywcze')
WHERE ID_ZAMOWIENIA = 61;
