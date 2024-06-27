--wyzwalacz_1
--nie pozwoli usunac osoby, ktora jest szachista.
--nie pozwoli zmienic imienia osoby.
--nie pozwoli wstawic osoby, ktora juz istnieje (po imieniu i nazwisku).

SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER osoba_trigger
BEFORE INSERT OR UPDATE OR DELETE ON Osoba
FOR EACH ROW
DECLARE
    v_count INT;
BEGIN
    IF DELETING THEN
        SELECT COUNT(*) INTO v_count FROM Szachista WHERE ID_Osoba = :old.ID_Osoba;
        IF v_count > 0 THEN
            RAISE_APPLICATION_ERROR(-20100, 'Nie można usunąć osoby, która jest szachistą.');
        END IF;
    ELSIF UPDATING THEN
        IF :old.Imie != :new.Imie THEN
            :new.Imie := :old.Imie;
            dbms_output.put_line('Nie wolno zmieniać imienia!');
        END IF;
    ELSIF INSERTING THEN
        SELECT COUNT(*) INTO v_count FROM Osoba WHERE Imie = :new.Imie AND Nazwisko = :new.Nazwisko;
        IF v_count > 0 THEN
            RAISE_APPLICATION_ERROR(-20100, 'Osoba już istnieje!');
        END IF;
    END IF;
END;

