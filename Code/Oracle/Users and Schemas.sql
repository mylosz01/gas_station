-- instancja: STACJA PALIW
    /*Administrator*/
    CREATE USER AdministratorOracle IDENTIFIED BY 123;
    
    GRANT ALL PRIVILEGES TO AdministratorOracle;
    
    /*Administrator*/
    
    /*Menadzer*/
    CREATE USER MenadzerOracle IDENTIFIED BY 123;
    
    GRANT CREATE SESSION TO MenadzerOracle;
    GRANT CONNECT TO MenadzerOracle;
    
    GRANT SELECT ON ADMINISTRATORORACLE.DOSTAWCY_PALIWOWI TO MenadzerOracle;
    GRANT SELECT ON ADMINISTRATORORACLE.DOSTAWCY_SPOZYWCZY TO MenadzerOracle;
    GRANT SELECT ON ADMINISTRATORORACLE.HISTORIA_CEN_PALIW TO MenadzerOracle;
    GRANT SELECT ON ADMINISTRATORORACLE.KLIENCI TO MenadzerOracle;
    GRANT SELECT ON ADMINISTRATORORACLE.PALIWA TO MenadzerOracle;
    GRANT SELECT ON ADMINISTRATORORACLE.PRODUKTY_SPOZYWCZE TO MenadzerOracle;
    GRANT SELECT ON ADMINISTRATORORACLE.TYP_PALIWA TO MenadzerOracle;
    GRANT SELECT ON ADMINISTRATORORACLE.ZAMOWIENIA_PALIWOWE TO MenadzerOracle;
    GRANT SELECT ON ADMINISTRATORORACLE.ZAMOWIENIA_SPOZYWCZE TO MenadzerOracle;
    
    GRANT EXECUTE ON ADMINISTRATORORACLE.set_product_points TO MenadzerOracle;
    GRANT EXECUTE ON ADMINISTRATORORACLE.set_product_price TO MenadzerOracle;
    GRANT EXECUTE ON ADMINISTRATORORACLE.update_petrol_points TO MenadzerOracle;
    GRANT EXECUTE ON ADMINISTRATORORACLE.update_petrol_price TO MenadzerOracle;
    
    /*Menadzer*/
    
    /*Pracownik*/
    CREATE USER PracownikOracle IDENTIFIED BY 123;
    
    GRANT CREATE SESSION TO PracownikOracle;
    GRANT CONNECT TO PracownikOracle;
    
    GRANT SELECT ON ADMINISTRATORORACLE.DOSTAWCY_PALIWOWI TO PracownikOracle;
    GRANT SELECT ON ADMINISTRATORORACLE.DOSTAWCY_SPOZYWCZY TO PracownikOracle;
    GRANT SELECT ON ADMINISTRATORORACLE.HISTORIA_CEN_PALIW TO PracownikOracle;
    GRANT SELECT ON ADMINISTRATORORACLE.KLIENCI TO PracownikOracle;
    GRANT SELECT ON ADMINISTRATORORACLE.PALIWA TO PracownikOracle;
    GRANT SELECT ON ADMINISTRATORORACLE.PRODUKTY_SPOZYWCZE TO PracownikOracle;
    GRANT SELECT ON ADMINISTRATORORACLE.TYP_PALIWA TO PracownikOracle;
    GRANT SELECT ON ADMINISTRATORORACLE.ZAMOWIENIA_PALIWOWE TO PracownikOracle;
    GRANT SELECT ON ADMINISTRATORORACLE.ZAMOWIENIA_SPOZYWCZE TO PracownikOracle;
    
    GRANT UPDATE ON ADMINISTRATORORACLE.PRODUKTY_SPOZYWCZE TO PracownikOracle;
    GRANT UPDATE ON ADMINISTRATORORACLE.KLIENCI TO PracownikOracle;
    GRANT UPDATE ON ADMINISTRATORORACLE.PALIWA TO PracownikOracle;
    
    GRANT INSERT ON ADMINISTRATORORACLE.ZAMOWIENIA_PALIWOWE TO PracownikOracle;
    GRANT INSERT ON ADMINISTRATORORACLE.ZAMOWIENIA_SPOZYWCZE TO PracownikOracle;
    GRANT INSERT ON ADMINISTRATORORACLE.KLIENCI TO PracownikOracle;
    
    GRANT EXECUTE ON ADMINISTRATORORACLE.UPDATE_PETROL_STOCK TO PracownikOracle;
    GRANT EXECUTE ON ADMINISTRATORORACLE.UPDATE_PRODUCT_STOCK TO PracownikOracle;
    
     /*Pracownik*/
    
    

-- instancja: MYJNIA
CREATE USER Myjnia IDENTIFIED BY 123;

GRANT CREATE SESSION TO Myjnia;
GRANT CREATE TABLE TO Myjnia;
GRANT CREATE PROCEDURE TO Myjnia;
GRANT CREATE SEQUENCE TO Myjnia;
GRANT CREATE VIEW TO Myjnia;
GRANT CREATE TRIGGER TO Myjnia;
GRANT CREATE SYNONYM TO Myjnia;

--GRANT ALL PRIVILEGES TO Myjnia;

ALTER USER Myjnia QUOTA unlimited ON users;

--je�eli wywali blad �e uprawienia nie zostaly przyznane to dobrze
REVOKE SELECT ANY TABLE FROM Myjnia;
REVOKE INSERT ANY TABLE FROM Myjnia;
REVOKE UPDATE ANY TABLE FROM Myjnia;
REVOKE DELETE ANY TABLE FROM Myjnia;

GRANT CREATE DATABASE LINK TO Myjnia;

CREATE PUBLIC DATABASE LINK StacjaPubliczny
CONNECT TO AdministratorOracle IDENTIFIED BY "123"
USING '(DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = localhost)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SID = orcl)
    )
  )';

