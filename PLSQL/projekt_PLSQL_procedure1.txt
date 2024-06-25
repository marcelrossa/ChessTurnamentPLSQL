--procedura_1
--procedura dodania meczu z warunkami:
--sprawdzenie czy gracz nie gra z samym soba
--sprawdzenie czy stol nie byl uzywany wiecej niz 3 razy
--sprawdzenie czy punkty sa z zakresu [0, 0.5, 1]
--sprawdzenie czy arbiter znaduje sie w tabeli ARBITER

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE AddValidatedMatch (
    p_Gracz_biale IN Mecz_szachowy.Gracz_biale%TYPE,
    p_Gracz_czarne IN Mecz_szachowy.Gracz_czarne%TYPE,
    p_Numer_stolu IN Mecz_szachowy.Numer_stolu%TYPE,
    p_Punkty_biale IN Mecz_szachowy.Punkty_biale%TYPE,
    p_Punkty_czarne IN Mecz_szachowy.Punkty_czarne%TYPE,
    p_Arbiter IN Mecz_szachowy.Arbiter%TYPE
) AS
    v_ID_Mecz Mecz_szachowy.ID_Mecz%TYPE;
    v_Count INT;
BEGIN
    --sprawdz czy grasz z samym soba
    IF p_Gracz_biale = p_Gracz_czarne THEN
        RAISE_APPLICATION_ERROR(-20001, 'Gracz nie może grać z samym sobą.');
    END IF;

    --stol max 3x
    SELECT COUNT(*) INTO v_Count 
    FROM Mecz_szachowy 
    WHERE Numer_stolu = p_Numer_stolu;

    IF v_Count >= 3 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Stół był używany więcej niż 3 razy.');
    END IF;

    --punkty in wartosci 0, 0.5, 1; nie ma innej punktacji
    IF NOT (p_Punkty_biale IN (0, 0.5, 1) AND p_Punkty_czarne IN (0, 0.5, 1)) THEN
        RAISE_APPLICATION_ERROR(-20003, 'Punkty muszą mieć wartość 0, 0.5, 1.');
    END IF;

    --arbiter w ARBITER
    SELECT COUNT(*) INTO v_Count 
    FROM Arbiter 
    WHERE ID_Osoba = p_Arbiter;

    IF v_Count = 0 THEN
        RAISE_APPLICATION_ERROR(-20004, 'Arbiter nie istnieje w tabeli arbiter.');
    END IF;

    --wstawianie
    SELECT NVL(MAX(ID_Mecz), 0) + 1 INTO v_ID_Mecz FROM Mecz_szachowy;

    INSERT INTO Mecz_szachowy (ID_Mecz, Gracz_biale, Gracz_czarne, Numer_stolu, Punkty_biale, Punkty_czarne, Arbiter)
    VALUES (v_ID_Mecz, p_Gracz_biale, p_Gracz_czarne, p_Numer_stolu, p_Punkty_biale, p_Punkty_czarne, p_Arbiter);
    
END;



