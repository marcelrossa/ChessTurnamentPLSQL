--procedura 1 AddPerson
AddPerson('Jan', 'Nowak', TO_DATE('1985-05-15', 'YYYY-MM-DD'), 'Polska');
AddPerson('Marek', 'Kowalski', TO_DATE('1975-03-20', 'YYYY-MM-DD'), 'Niemcy');

--cof
DELETE FROM Osoba WHERE Imie = 'Jan' AND Nazwisko = 'Nowak';
DELETE FROM Osoba WHERE Imie = 'Marek' AND Nazwisko = 'Kowalski';
DELETE FROM Panstwo WHERE Nazwa = 'Niemcy';


--procedura 2 AddValidatedMatch
AddValidatedMatch(1, 2, 1, 1, 0, 5);
AddValidatedMatch(3, 4, 1, 0.5, 0.5, 5);
AddValidatedMatch(5, 6, 1, 1, 0, 5);
AddValidatedMatch(7, 8, 1, 0, 1, 5);

--cof
DELETE FROM Mecz_szachowy WHERE Gracz_biale = 1 AND Gracz_czarne = 2 AND Numer_stolu = 1 AND Punkty_biale = 1 AND Punkty_czarne = 0;
DELETE FROM Mecz_szachowy WHERE Gracz_biale = 3 AND Gracz_czarne = 4 AND Numer_stolu = 1 AND Punkty_biale = 0.5 AND Punkty_czarne = 0.5;
DELETE FROM Mecz_szachowy WHERE Gracz_biale = 5 AND Gracz_czarne = 6 AND Numer_stolu = 1 AND Punkty_biale = 1 AND Punkty_czarne = 0;
DELETE FROM Mecz_szachowy WHERE Gracz_biale = 7 AND Gracz_czarne = 8 AND Numer_stolu = 1 AND Punkty_biale = 0 AND Punkty_czarne = 1;

--wyzwalacz 1 osoba_trigger
DELETE FROM Osoba WHERE ID_Osoba = 1; --usuniecie szachisty
UPDATE Osoba SET Imie = 'Piotr' WHERE ID_Osoba = 1; --zmiana imienia
INSERT INTO Osoba (ID_Osoba, Imie, Nazwisko, Data_ur, Obywatelstwo) --dodanie osoby ktora nie istnieje (dziala)
VALUES ((SELECT NVL(MAX(ID_Osoba), 0) + 1 FROM Osoba), 'Anna', 'Kowalska', TO_DATE('1985-05-15', 'YYYY-MM-DD'), 1);
INSERT INTO Osoba (ID_Osoba, Imie, Nazwisko, Data_ur, Obywatelstwo) --dodanie osoby ktora istnieje (nie dziala)
VALUES ((SELECT NVL(MAX(ID_Osoba), 0) + 1 FROM Osoba), 'Anna', 'Kowalska', TO_DATE('1985-05-15', 'YYYY-MM-DD'), 1);

-cof
DELETE FROM Osoba WHERE Imie = 'Anna' AND Nazwisko = 'Kowalska';

--wyzwalacz 2 update_rank
INSERT INTO Mecz_szachowy (ID_Mecz, Gracz_biale, Gracz_czarne, Numer_stolu, Punkty_biale, Punkty_czarne, Arbiter)
VALUES (10, 1, 2, 1, 1, 0, 5);

--cof
DELETE FROM Mecz_szachowy WHERE ID_Mecz = 10;
