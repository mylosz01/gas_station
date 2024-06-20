USE StacjaPaliw;
Go

DROP TABLE IF EXISTS Harmonogram;
go

-- create harmonogram table
CREATE TABLE Harmonogram
(
	ID_wpisu INT IDENTITY(1,1),
	ID_pracownika INT,
	data_rozpoczecia_zmiany DATETIME,
	data_zakonczenia_zmiany DATETIME,
	-- moznaby zrobic procedure liczaco wynagrodzenie pracowniowi za dana zmiane
	CONSTRAINT PK_Harmonogram PRIMARY KEY (ID_wpisu),
	CONSTRAINT CHCK_ID_pracownika CHECK (ID_pracownika IS NOT NULL)
	--sprawdzenie istnienia odpowiadaj¹cych wartoœci nale¿y zrealizowaæ programowo za pomoc¹ triggerów
);

Select * From Pracownicy...[Pracownicy$];


-- SELECT employee schedule
SELECT * FROM Harmonogram;

-- Przyk³adowe dane do tabeli Harmonogram
INSERT INTO [StacjaPaliw].[dbo].[Harmonogram] 
([ID_pracownika], [data_rozpoczecia_zmiany], [data_zakonczenia_zmiany])
VALUES 
    (1, '2024-06-20 08:00:00', DATEADD(HOUR, 8, '2024-06-20 08:00:00')),
    (2, '2024-06-20 09:00:00', DATEADD(HOUR, 8, '2024-06-20 09:00:00')),  
    (3, '2024-06-21 10:00:00', DATEADD(HOUR, 8, '2024-06-21 10:00:00')),  
    (4, '2024-06-21 11:00:00', DATEADD(HOUR, 8, '2024-06-21 11:00:00')),  
    (5, '2024-06-22 12:00:00', DATEADD(HOUR, 8, '2024-06-22 12:00:00'));

INSERT INTO [StacjaPaliw].[dbo].[Harmonogram] ([ID_pracownika], [data_rozpoczecia_zmiany], [data_zakonczenia_zmiany])
VALUES 
    (6, '2024-06-23 07:00:00', DATEADD(HOUR, 8, '2024-06-23 07:00:00')),
    (7, '2024-06-23 14:00:00', DATEADD(HOUR, 8, '2024-06-23 14:00:00')), 
    (8, '2024-06-24 06:00:00', DATEADD(HOUR, 8, '2024-06-24 06:00:00')),
    (9, '2024-06-24 15:00:00', DATEADD(HOUR, 8, '2024-06-24 15:00:00')),
    (10, '2024-06-25 08:00:00', DATEADD(HOUR, 8, '2024-06-25 08:00:00')),
    (11, '2024-06-25 16:00:00', DATEADD(HOUR, 8, '2024-06-25 16:00:00')),
    (12, '2024-06-26 09:00:00', DATEADD(HOUR, 8, '2024-06-26 09:00:00')), 
    (13, '2024-06-26 17:00:00', DATEADD(HOUR, 8, '2024-06-26 17:00:00')),
    (14, '2024-06-27 10:00:00', DATEADD(HOUR, 8, '2024-06-27 10:00:00')), 
    (15, '2024-06-27 18:00:00', DATEADD(HOUR, 8, '2024-06-27 18:00:00')); 

-- Przyk³adowe dane do tabeli Harmonogram bez nachodz¹cych siê zmian
INSERT INTO [StacjaPaliw].[dbo].[Harmonogram] ([ID_pracownika], [data_rozpoczecia_zmiany], [data_zakonczenia_zmiany])
VALUES 
    (1, '2024-06-20 08:00:00', DATEADD(HOUR, 8, '2024-06-20 08:00:00')),  -- Pracownik 1, zmiana od 08:00 do 16:00
    (1, '2024-06-21 08:00:00', DATEADD(HOUR, 8, '2024-06-21 08:00:00')),  -- Pracownik 1, zmiana od 08:00 do 16:00
    (2, '2024-06-20 09:00:00', DATEADD(HOUR, 8, '2024-06-20 09:00:00')),  -- Pracownik 2, zmiana od 09:00 do 17:00
    (2, '2024-06-21 09:00:00', DATEADD(HOUR, 8, '2024-06-21 09:00:00')),  -- Pracownik 2, zmiana od 09:00 do 17:00
    (3, '2024-06-21 10:00:00', DATEADD(HOUR, 8, '2024-06-21 10:00:00')),  -- Pracownik 3, zmiana od 10:00 do 18:00
    (3, '2024-06-22 10:00:00', DATEADD(HOUR, 8, '2024-06-22 10:00:00')),  -- Pracownik 3, zmiana od 10:00 do 18:00
    (4, '2024-06-21 11:00:00', DATEADD(HOUR, 8, '2024-06-21 11:00:00')),  -- Pracownik 4, zmiana od 11:00 do 19:00
    (4, '2024-06-22 11:00:00', DATEADD(HOUR, 8, '2024-06-22 11:00:00')),  -- Pracownik 4, zmiana od 11:00 do 19:00
    (5, '2024-06-22 12:00:00', DATEADD(HOUR, 8, '2024-06-22 12:00:00')),  -- Pracownik 5, zmiana od 12:00 do 20:00
    (5, '2024-06-23 12:00:00', DATEADD(HOUR, 8, '2024-06-23 12:00:00')),  -- Pracownik 5, zmiana od 12:00 do 20:00
    (6, '2024-06-23 07:00:00', DATEADD(HOUR, 8, '2024-06-23 07:00:00')),  -- Pracownik 6, zmiana od 07:00 do 15:00
    (6, '2024-06-24 07:00:00', DATEADD(HOUR, 8, '2024-06-24 07:00:00')),  -- Pracownik 6, zmiana od 07:00 do 15:00
    (7, '2024-06-23 14:00:00', DATEADD(HOUR, 8, '2024-06-23 14:00:00')),  -- Pracownik 7, zmiana od 14:00 do 22:00
    (7, '2024-06-24 14:00:00', DATEADD(HOUR, 8, '2024-06-24 14:00:00')),  -- Pracownik 7, zmiana od 14:00 do 22:00
    (8, '2024-06-24 06:00:00', DATEADD(HOUR, 8, '2024-06-24 06:00:00')),  -- Pracownik 8, zmiana od 06:00 do 14:00
    (8, '2024-06-25 06:00:00', DATEADD(HOUR, 8, '2024-06-25 06:00:00')),  -- Pracownik 8, zmiana od 06:00 do 14:00
    (9, '2024-06-24 15:00:00', DATEADD(HOUR, 8, '2024-06-24 15:00:00')),  -- Pracownik 9, zmiana od 15:00 do 23:00
    (9, '2024-06-25 15:00:00', DATEADD(HOUR, 8, '2024-06-25 15:00:00')),  -- Pracownik 9, zmiana od 15:00 do 23:00
    (10, '2024-06-25 08:00:00', DATEADD(HOUR, 8, '2024-06-25 08:00:00')), -- Pracownik 10, zmiana od 08:00 do 16:00
    (10, '2024-06-26 08:00:00', DATEADD(HOUR, 8, '2024-06-26 08:00:00')), -- Pracownik 10, zmiana od 08:00 do 16:00
    (11, '2024-06-25 16:00:00', DATEADD(HOUR, 8, '2024-06-25 16:00:00')), -- Pracownik 11, zmiana od 16:00 do 00:00
    (11, '2024-06-26 16:00:00', DATEADD(HOUR, 8, '2024-06-26 16:00:00')), -- Pracownik 11, zmiana od 16:00 do 00:00
    (12, '2024-06-26 09:00:00', DATEADD(HOUR, 8, '2024-06-26 09:00:00')), -- Pracownik 12, zmiana od 09:00 do 17:00
    (12, '2024-06-27 09:00:00', DATEADD(HOUR, 8, '2024-06-27 09:00:00')), -- Pracownik 12, zmiana od 09:00 do 17:00
    (13, '2024-06-26 17:00:00', DATEADD(HOUR, 8, '2024-06-26 17:00:00')), -- Pracownik 13, zmiana od 17:00 do 01:00
    (13, '2024-06-27 17:00:00', DATEADD(HOUR, 8, '2024-06-27 17:00:00')), -- Pracownik 13, zmiana od 17:00 do 01:00
    (14, '2024-06-27 10:00:00', DATEADD(HOUR, 8, '2024-06-27 10:00:00')), -- Pracownik 14, zmiana od 10:00 do 18:00
    (14, '2024-06-28 10:00:00', DATEADD(HOUR, 8, '2024-06-28 10:00:00')), -- Pracownik 14, zmiana od 10:00 do 18:00
    (15, '2024-06-27 18:00:00', DATEADD(HOUR, 8, '2024-06-27 18:00:00')), -- Pracownik 15, zmiana od 18:00 do 02:00
    (15, '2024-06-28 18:00:00', DATEADD(HOUR, 8, '2024-06-28 18:00:00')); -- Pracownik 15, zmiana od 18:00 do 02:00

-- function to check if emp can take shift
-- returns -1 no emp, 0 can't shift, 1 good
CREATE OR ALTER FUNCTION is_shift_valid(
@id_emp INT = 0,
@shift_date DATETIME)
RETURNS INT
AS
BEGIN
	
	DECLARE @isValid INT;
	
	--search emp
	SELECT @isValid = COUNT(ID_pracownika) FROM Pracownicy...[Pracownicy$] WHERE ID_pracownika = @id_emp;
	
	-- if emp not exist return 0
	IF @isValid = 0
	BEGIN	
		RETURN -1;
	END;

	-- implement cursor to check shifts
	DECLARE @shift_start DATETIME;
	DECLARE @shift_end DATETIME;

	DECLARE shift_cursor CURSOR FOR
	SELECT data_rozpoczecia_zmiany, data_zakonczenia_zmiany
	FROM dbo.Harmonogram WHERE ID_pracownika = @id_emp;

	OPEN shift_cursor;
	FETCH NEXT FROM shift_cursor INTO @shift_start, @shift_end;

	WHILE @@FETCH_STATUS = 0
	BEGIN
	
		IF @shift_date BETWEEN DATEADD(HOUR,-8,@shift_start) AND DATEADD(HOUR,8, @shift_end)
			BEGIN
				SET @isValid = 0;
				BREAK;
			END;
		
		FETCH NEXT FROM shift_cursor INTO @shift_start, @shift_end;
	END;
	
	CLOSE shift_cursor;
	DEALLOCATE shift_cursor;

	RETURN @isValid;
END;


-- add employee a shift
CREATE OR ALTER PROCEDURE add_shift_employee(
@id_emp INT,
@shift_date DATETIME)
AS
BEGIN
	IF dbo.is_shift_valid(@id_emp, @shift_date) = 0
	BEGIN
		RAISERROR('Invalid shift time or no employee', 16, 1);
	END;
	ELSE
	BEGIN
		INSERT INTO [StacjaPaliw].[dbo].[Harmonogram] ([ID_pracownika], [data_rozpoczecia_zmiany], [data_zakonczenia_zmiany])
		VALUES (@id_emp, @shift_date, DATEADD(HOUR, 8,@shift_date));
		PRINT N'Shift added ' + CAST(@id_emp AS NVARCHAR(10)) + N' at ' + CAST(@shift_date AS NVARCHAR(20));
	END;

END;


CREATE OR ALTER FUNCTION check_employee_on_shift(
@shift_time DATETIME)
RETURNS INT
AS
BEGIN
	
	DECLARE @emp_number INT;

	SELECT @emp_number = COUNT(ID_pracownika) FROM Harmonogram WHERE CONVERT(date,data_rozpoczecia_zmiany) = CONVERT(DATE,@shift_time);

	return @emp_number;
END;


-- TEST IMPLEMENTED FUNCTION AND PROCEDURE
SELECT * FROM Harmonogram WHERE ID_pracownika = 2;
-- employee has already shift
SELECT [dbo].[is_shift_valid](2,'2024-06-20 15:00:00');
-- can take shift
SELECT [dbo].[is_shift_valid](2,'2024-06-22 15:00:00');

-- procedure to add shift
exec dbo.add_shift_employee 2,'2024-06-27 15:00:00';

-- check number of emp on shift
SELECT dbo.check_employee_on_shift('2024-06-20 15:00:00');
