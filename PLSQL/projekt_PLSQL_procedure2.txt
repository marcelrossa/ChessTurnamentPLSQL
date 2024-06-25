--procedura_2
--dodanie osoby do tabeli OSOBA z warunkami:
--osoba nie moze miec wiecej niz 100 lat
--sprawdzenie czy nazwa kraju znajduje sie w PANSTWO; jesli nie => dodajemy PANSTWO;

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE AddPerson (
    p_Imie IN Osoba.Imie%TYPE,
    p_Nazwisko IN Osoba.Nazwisko%TYPE,
    p_Data_ur IN Osoba.Data_ur%TYPE,
    p_Obywatelstwo IN Panstwo.Nazwa%TYPE
) AS
    v_ID_Panstwo Panstwo.ID_Panstwo%TYPE;
    v_Age INT;
BEGIN
    --oblicz wiek
    v_Age := EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM p_Data_ur);

    --sprawdz czy wiek > 100
    IF v_Age > 100 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Wiek osoby nie może przekraczać 100 lat.');
    END IF;

    --sprawdz czy nazwa_kraju w PANSTWO
    SELECT ID_Panstwo INTO v_ID_Panstwo
    FROM Panstwo
    WHERE Nazwa = p_Obywatelstwo;

    --;jesli nie => dodaj panstwo do PANSTWO
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            SELECT NVL(MAX(ID_Panstwo), 0) + 1 INTO v_ID_Panstwo FROM Panstwo;
            INSERT INTO Panstwo (ID_Panstwo, Nazwa) VALUES (v_ID_Panstwo, p_Obywatelstwo);
    
    --wstawianie
    INSERT INTO Osoba (ID_Osoba, Imie, Nazwisko, Data_ur, Obywatelstwo)
    VALUES ((SELECT NVL(MAX(ID_Osoba), 0) + 1 FROM Osoba), p_Imie, p_Nazwisko, p_Data_ur, v_ID_Panstwo);
    
END;