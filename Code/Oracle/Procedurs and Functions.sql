CREATE OR REPLACE Procedure update_petrol_price
    (petrol_name IN varchar2, petrol_price IN NUMBER)
IS
    petrol_name_exist INTEGER;
    petrol_id INTEGER;
    new_price_id INTEGER;
BEGIN
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
    SELECT COUNT(p.id_paliwa) INTO petrol_name_exist FROM paliwa p
    JOIN historia_cen_paliw hcp using(id_ceny)
    JOIN typ_paliwa tp using(id_typu)
    WHERE tp.nazwa_paliwa = petrol_name;
    
    IF petrol_name_exist = 0 THEN
       raise_application_error(-20001,'Nieprawidlowa nazwa paliwa');
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

--CREATE OR REPLACE Procedure show_product_prices()
--IS
--BEGIN
--    SELECT ID_produktu,nazwa,cena_jednostkowa,ilosc_punktow FROM produkty]_spozywcze;
--END;







