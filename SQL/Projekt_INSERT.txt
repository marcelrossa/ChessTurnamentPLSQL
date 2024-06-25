INSERT INTO panstwo (id_panstwo, nazwa) VALUES (1, 'Polska');
INSERT INTO panstwo (id_panstwo, nazwa) VALUES (2, 'Japonia');
INSERT INTO panstwo (id_panstwo, nazwa) VALUES (3, 'Norwegia');

INSERT INTO stol (numer_stolu) VALUES (1);
INSERT INTO stol (numer_stolu) VALUES (2);
INSERT INTO stol (numer_stolu) VALUES (3);
INSERT INTO stol (numer_stolu) VALUES (4);

INSERT INTO klub_szachowy (id_klub, nazwa) VALUES (1,'MagnusClub');
INSERT INTO klub_szachowy (id_klub, nazwa) VALUES (2,'Checkmate_Champions');

INSERT INTO osoba (id_osoba, imie, nazwisko, data_ur, obywatelstwo) VALUES (1, 'Marcel', 'Kowalski', '1980-12-17', 1);
INSERT INTO osoba (id_osoba, imie, nazwisko, data_ur, obywatelstwo) VALUES (2, 'Magnus', 'Baron', '1982-09-12', 3);
INSERT INTO osoba (id_osoba, imie, nazwisko, data_ur, obywatelstwo) VALUES (3, 'Adam', 'Nowak', '1990-01-11', 1);
INSERT INTO osoba (id_osoba, imie, nazwisko, data_ur, obywatelstwo) VALUES (4, 'Hikaru', 'Gola', '1999-07-05', 2);
INSERT INTO osoba (id_osoba, imie, nazwisko, data_ur, obywatelstwo) VALUES (5, 'Szymon', 'Marciniak', '1981-01-07', 1);
INSERT INTO osoba (id_osoba, imie, nazwisko, data_ur, obywatelstwo) VALUES (6, 'Fridtjof', 'Nansen', '1960-02-29', 3);

INSERT INTO szachista (ranking, id_osoba, id_klub) VALUES (2882, 2, 1);
INSERT INTO szachista (ranking, id_osoba, id_klub) VALUES (2851, 1, 1);
INSERT INTO szachista (ranking, id_osoba, id_klub) VALUES (2822, 3, 2);
INSERT INTO szachista (ranking, id_osoba, id_klub) VALUES (2798, 4, 2);

INSERT INTO arbiter (staz, id_osoba) VALUES (11, 5);
INSERT INTO arbiter (staz, id_osoba) VALUES (21, 6);

INSERT INTO mecz_szachowy (id_mecz, gracz_biale, gracz_czarne, numer_stolu, punkty_biale, punkty_czarne, arbiter) VALUES (1, 1, 2, 1, 0.5, 0.5, 5);
INSERT INTO mecz_szachowy (id_mecz, gracz_biale, gracz_czarne, numer_stolu, punkty_biale, punkty_czarne, arbiter) VALUES (2, 3, 4, 2, 0.5, 0.5, 6);
INSERT INTO mecz_szachowy (id_mecz, gracz_biale, gracz_czarne, numer_stolu, punkty_biale, punkty_czarne, arbiter) VALUES (3, 1, 3, 3, 1, 0, 5);
INSERT INTO mecz_szachowy (id_mecz, gracz_biale, gracz_czarne, numer_stolu, punkty_biale, punkty_czarne, arbiter) VALUES (4, 2, 4, 4, 1, 0, 6);
INSERT INTO mecz_szachowy (id_mecz, gracz_biale, gracz_czarne, numer_stolu, punkty_biale, punkty_czarne, arbiter) VALUES (5, 1, 4, 1, 0.5, 0.5, 5);
INSERT INTO mecz_szachowy (id_mecz, gracz_biale, gracz_czarne, numer_stolu, punkty_biale, punkty_czarne, arbiter) VALUES (6, 2, 3, 2, 0, 1, 6);