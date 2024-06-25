--1
--KTO WYGRAL TURNIEJ?
SELECT gracz, SUM(punkty) AS suma_punktow
FROM
(
  SELECT gracz_biale AS gracz, punkty_biale AS punkty FROM mecz_szachowy
  UNION ALL
  SELECT gracz_czarne AS gracz, punkty_czarne AS punkty FROM mecz_szachowy
) razem
GROUP BY gracz
ORDER BY suma_punktow DESC;

--2
-- Z JAKIEGO KRAJU POCHODZI GRACZ Z NAJMNIEJSZA ILOSCIA PUNKTOW?
SELECT p.nazwa AS panstwo_pochodzenia
FROM mecz_szachowy m
JOIN szachista s ON m.gracz_biale = s.id_osoba OR m.gracz_czarne = s.id_osoba
JOIN osoba o ON s.id_osoba = o.id_osoba
JOIN panstwo p ON o.obywatelstwo = p.id_panstwo
GROUP BY p.nazwa
ORDER BY SUM(COALESCE(m.punkty_biale, 0) + COALESCE(m.punkty_czarne, 0)) ASC
FETCH FIRST 1 ROW ONLY;

--3
--PODAJ DANE OSOB URODZONYCH MIEDZY ROKIEM 1979 A 1983
SELECT *
FROM osoba
WHERE EXTRACT(YEAR FROM data_ur) BETWEEN 1979 AND 1983;

--4
--PODAJ DANE OSOB KTORE MAJA OBYWATELSTWO TAKIE JAK OSOBA O NAZWISKU 'MARCINIAK' ORAZ NALEZA DO KLUBU SZACHOWEGO O NAZWIE 'MagnusClub'
SELECT o.*
FROM osoba o
JOIN szachista s ON o.id_osoba = s.id_osoba
JOIN klub_szachowy k ON s.id_klub = k.id_klub
JOIN osoba o2 ON o2.nazwisko = 'Marciniak'
WHERE o.obywatelstwo = o2.obywatelstwo AND k.nazwa = 'MagnusClub';

--5
--PODAJ DANE ORAZ NAZWE PANSTWA GRACZA KTOREGO ARBITREM W TURNIEJU BYLA OSOBA ZE STAZEM POWYZEJ 15 LAT
SELECT UNIQUE o.*, p.nazwa AS panstwo
FROM osoba o
JOIN szachista s ON o.id_osoba = s.id_osoba
JOIN mecz_szachowy m ON s.id_osoba = m.gracz_biale OR s.id_osoba = m.gracz_czarne
JOIN arbiter a ON a.id_osoba = m.arbiter
JOIN panstwo p ON o.obywatelstwo = p.id_panstwo
WHERE a.staz > 15;

--6
--WYSWIETL WSZYSTKIE MECZE KTORE BYLY GRANE PRZY STOLE '2' I JEDNOCZESNIE BYLY SEDZIOWANE PRZEZ OSOBE O NAZWISKU 'NANSEN'
SELECT m.*
FROM mecz_szachowy m
JOIN osoba o ON m.arbiter = o.id_osoba
WHERE numer_stolu = 2 AND o.nazwisko LIKE 'Nansen';

--7
--PODAJ SERDNIA LICZBE PUNKTOW GRACZY BIALYCH FIGUR Z CALEGO TURNIEJU ZAOKRAGLONA DO DZIESIATEK
SELECT ROUND(AVG(punkty_biale),2) as "srednia liczba punktow"
FROM mecz_szachowy;

--8
--PODAJ IMIE I NAZWISKO GRACZA, KTOREGO LICZBA ZDOBYTYCH PUNKTOW PRZEKRACZA SREDNIA ZDOBYTYCH PUNKTOW PRZEZ GRACZY CZARNYCH FIGUR W CALYM TURNIEJU
SELECT o.imie, o.nazwisko
FROM osoba o
JOIN szachista s ON o.id_osoba = s.id_osoba
WHERE (
  SELECT AVG(m.punkty_czarne)
  FROM mecz_szachowy m
  WHERE s.id_osoba = m.gracz_czarne
) < (
  SELECT SUM(COALESCE(m.punkty_czarne, 0))
  FROM mecz_szachowy m
  WHERE s.id_osoba = m.gracz_czarne
);

--9
--PODAJ ILOSC ZAGRANYCH MECZY PRZY STOLE '1', '3' ORAZ '4'
SELECT COUNT(*) AS ilosc_meczy
FROM mecz_szachowy
WHERE numer_stolu IN ('1', '3', '4');

--10
--PODAJ IMIE, NAZWISKO I DATE URODZENIA SZACHISTY KTOREGO ARBITREM 3 RAZY BYL 'SZYMON'
SELECT o.imie, o.nazwisko, o.data_ur
FROM osoba o
JOIN szachista s ON o.id_osoba = s.id_osoba
JOIN mecz_szachowy m ON (s.id_osoba = m.gracz_biale OR s.id_osoba = m.gracz_czarne)
JOIN osoba o2 ON m.arbiter = o2.id_osoba
WHERE o2.imie = 'Szymon'
GROUP BY o.imie, o.nazwisko, o.data_ur
HAVING COUNT(*) = 3;