--wyzwalacz_2
--aktualizuje ranking szachistow po zmianach w tabeli MECZ_SZACHOWY

SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER update_rank
AFTER INSERT OR UPDATE OR DELETE ON Mecz_szachowy
FOR EACH ROW
DECLARE
    v_random_points_biale NUMBER;
    v_random_points_czarne NUMBER;
BEGIN
    --generowanie pkt (miedzy 8 a 16)
    v_random_points_biale := ROUND(DBMS_RANDOM.VALUE(8, 16));
    v_random_points_czarne := ROUND(DBMS_RANDOM.VALUE(8, 16));
    
    IF INSERTING OR UPDATING THEN
        --upd gracza bialego
        UPDATE Szachista
        SET Ranking = Ranking + v_random_points_biale
        WHERE ID_Osoba = :new.Gracz_biale;
        
        --upd gracza czarnego
        UPDATE Szachista
        SET Ranking = Ranking + v_random_points_czarne
        WHERE ID_Osoba = :new.Gracz_czarne;
    ELSIF DELETING THEN
        --upd gracza bialego
        UPDATE Szachista
        SET Ranking = Ranking - v_random_points_biale
        WHERE ID_Osoba = :old.Gracz_biale;
        
        --upd gracza czarnego
        UPDATE Szachista
        SET Ranking = Ranking - v_random_points_czarne
        WHERE ID_Osoba = :old.Gracz_czarne;
    END IF;
END;



