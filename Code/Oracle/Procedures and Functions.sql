create or replace Procedure update_petrol_price
    (petrol_name IN varchar2, petrol_price IN NUMBER)
IS
    petrol_name_exist INTEGER;
    petrol_id INTEGER;
    new_price_id INTEGER;
BEGIN

    IF petrol_price < 0 THEN
        raise_application_error(-20001,'Cena nie moze byc mniejsza od 0');
        RETURN;
    END IF;

    SELECT COUNT(p.id_paliwa) INTO petrol_name_exist FROM paliwa p
    JOIN historia_cen_paliw hcp using(id_ceny)
    JOIN typ_paliwa tp using(id_typu)
    WHERE tp.nazwa_paliwa = petrol_name;

    IF petrol_name_exist = 0 THEN
       raise_application_error(-20001,'Nieprawidlowa nazwa paliwa');
       RETURN;
    END IF;

    SELECT p.id_paliwa INTO petrol_id FROM paliwa p
    JOIN historia_cen_paliw hcp using(id_ceny)
    JOIN typ_paliwa tp using(id_typu)
    WHERE tp.nazwa_paliwa = petrol_name;

    INSERT INTO Historia_Cen_Paliw(ID_typu,data_ceny,cena) VALUES(petrol_id,CURRENT_DATE,petrol_price);
    SELECT ID_ceny INTO new_price_id FROM Historia_Cen_Paliw
    WHERE ID_ceny = (SELECT MAX(ID_ceny) FROM Historia_Cen_Paliw);

    UPDATE Paliwa SET ID_ceny = new_price_id WHERE ID_paliwa = petrol_id;

    COMMIT;
    dbms_output.put_line('Cena Paliwa zostala zaktualizowana');
END;




CREATE OR REPLACE Procedure update_petrol_points
    (petrol_name IN varchar2, petrol_points IN NUMBER)
IS
    petrol_name_exist INTEGER;
    petrol_id INTEGER;
    new_points_id INTEGER;
BEGIN

    IF petrol_points < 0 THEN
        raise_application_error(-20001,'Ilosc punktow nie moze byc mniejsza od 0');
        RETURN;
    END IF;
    
    SELECT COUNT(p.id_paliwa) INTO petrol_name_exist FROM paliwa p
    JOIN historia_cen_paliw hcp using(id_ceny)
    JOIN typ_paliwa tp using(id_typu)
    WHERE tp.nazwa_paliwa = petrol_name;
    
    IF petrol_name_exist = 0 THEN
       raise_application_error(-20001,'Nieprawidlowa nazwa paliwa');
       RETURN;
    END IF;
    
    SELECT p.id_paliwa INTO petrol_id FROM paliwa p
    JOIN historia_cen_paliw hcp using(id_ceny)
    JOIN typ_paliwa tp using(id_typu)
    WHERE tp.nazwa_paliwa = petrol_name;
    
    UPDATE Paliwa SET ilosc_punktow = petrol_points
    WHERE ID_paliwa = petrol_id;
    
    COMMIT;
    
    dbms_output.put_line('Punkty dla danego paliwa zostaly zaktualizowane');
END;

create or replace PROCEDURE set_product_price
    (product_name IN VARCHAR2, new_product_price IN NUMBER)
IS
    product_name_exist INT;
    previous_price NUMBER;
BEGIN

    IF new_product_price < 0 THEN
        raise_application_error(-20001,'Cena nie moze byc mniejsza od 0');
        RETURN;
    END IF;

    SELECT COUNT(*) INTO product_name_exist FROM produkty_spozywcze
    WHERE NAZWA = product_name;

    IF product_name_exist = 0 THEN
        raise_application_error(-20001,'Nieprawidlowa nazwa produktu');
        RETURN;
    END IF;

    --Sprawdzenie czy zmiana ceny mniejsza niz 50% poprzedniej
    SELECT CENA_JEDNOSTKOWA INTO previous_price
    FROM PRODUKTY_SPOZYWCZE WHERE 
    NAZWA = product_name
    FETCH FIRST 1 ROW ONLY;

    IF ABS(new_product_price - previous_price) > 0.5 * previous_price THEN
        raise_application_error(-20001,'Zmiana ceny nie moze byc wieksza niz 50% wartosci poprzedniej ceny');
        RETURN;
    END IF;

    UPDATE PRODUKTY_SPOZYWCZE SET CENA_JEDNOSTKOWA = new_product_price
    WHERE NAZWA = product_name;

    COMMIT;

    dbms_output.put_line('Cena produktu zostala zaktualizowana');

END;




CREATE OR REPLACE PROCEDURE set_product_points
    (product_name IN VARCHAR2, new_points IN INTEGER)
IS
    product_exist INT;
BEGIN
    IF new_points < 0 THEN
            raise_application_error(-20001,'Liczba punktow nie moze byc ujemna');
            RETURN;
    END IF;
    
    SELECT COUNT(*) INTO product_exist FROM produkty_spozywcze
    WHERE NAZWA = product_name;
    
    IF product_exist = 0 THEN
       raise_application_error(-20001,'Nieprawidlowa nazwa produktu');
       RETURN; 
    END IF;
    
    UPDATE Produkty_spozywcze SET ILOSC_PUNKTOW = new_points
    WHERE NAZWA = product_name;
    
    COMMIT;
    
    dbms_output.put_line('Ilosc punktow dla danego produktu zostala zaktualizowana');
END;


SELECT * FROM PRODUKTY_SPOZYWCZE;






