-- Klient

USE StacjaPaliw
GO

SELECT CURRENT_USER;



-- Historia transakcji paliwowych (client_petrol_transaction_history)
EXEC dbo.client_petrol_transaction_history
@client_ID = 10;



-- Historia transakcji spożywyczych (client_products_transaction_history)
EXEC dbo.client_products_transaction_history
@client_ID = 10;


-- Liczba zgromadzonych punktów (check_loyalty_points)
	
	--prawidłowe wywołanie
	EXEC [dbo].[check_loyalty_points] 
	@client_ID = 15

	--klient nie istnieje
	EXEC [dbo].[check_loyalty_points] 
	@client_ID = 470;