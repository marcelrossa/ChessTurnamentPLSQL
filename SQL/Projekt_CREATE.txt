-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-06-15 21:32:23.309

-- tables
-- Table: Arbiter
CREATE TABLE Arbiter (
    Staz integer  NOT NULL,
    ID_Osoba smallint  NOT NULL,
    CONSTRAINT Arbiter_pk PRIMARY KEY (ID_Osoba)
) ;

-- Table: Klub_szachowy
CREATE TABLE Klub_szachowy (
    ID_klub smallint  NOT NULL,
    Nazwa varchar2(50)  NOT NULL,
    CONSTRAINT Klub_szachowy_pk PRIMARY KEY (ID_klub)
) ;

-- Table: Mecz_szachowy
CREATE TABLE Mecz_szachowy (
    ID_Mecz smallint  NOT NULL,
    Gracz_biale smallint  NOT NULL,
    Gracz_czarne smallint  NOT NULL,
    Numer_stolu smallint  NOT NULL,
    Punkty_biale float(3)  NOT NULL,
    Punkty_czarne float(3)  NOT NULL,
	Arbiter smallint NOT NULL,
    CONSTRAINT Mecz_szachowy_pk PRIMARY KEY (ID_Mecz)
) ;

-- Table: Osoba
CREATE TABLE Osoba (
    ID_Osoba smallint  NOT NULL,
    Imie varchar2(30)  NOT NULL,
    Nazwisko varchar2(30)  NOT NULL,
    Data_ur date  NOT NULL,
    Obywatelstwo smallint  NOT NULL,
    CONSTRAINT Osoba_pk PRIMARY KEY (ID_Osoba)
) ;

-- Table: Panstwo
CREATE TABLE Panstwo (
    ID_Panstwo smallint  NOT NULL,
    Nazwa varchar2(50)  NOT NULL,
    CONSTRAINT Panstwo_pk PRIMARY KEY (ID_Panstwo)
) ;

-- Table: Stol
CREATE TABLE Stol (
    Numer_stolu smallint  NOT NULL,
    CONSTRAINT Stol_pk PRIMARY KEY (Numer_stolu)
) ;

-- Table: Szachista
CREATE TABLE Szachista (
    Ranking integer  NOT NULL,
    ID_Osoba smallint  NOT NULL,
    ID_klub smallint  NOT NULL,
    CONSTRAINT Szachista_pk PRIMARY KEY (ID_Osoba)
) ;

-- foreign keys
-- Reference: Arbiter_Osoba (table: Arbiter)
ALTER TABLE Arbiter ADD CONSTRAINT Arbiter_Osoba
    FOREIGN KEY (ID_Osoba)
    REFERENCES Osoba (ID_Osoba);

-- Reference: Mecz_szachowy_Stol (table: Mecz_szachowy)
ALTER TABLE Mecz_szachowy ADD CONSTRAINT Mecz_szachowy_Stol
    FOREIGN KEY (Numer_stolu)
    REFERENCES Stol (Numer_stolu);

-- Reference: Mecz_szachowy_biale (table: Mecz_szachowy)
ALTER TABLE Mecz_szachowy ADD CONSTRAINT Mecz_szachowy_biale
    FOREIGN KEY (Gracz_biale)
    REFERENCES Szachista (ID_Osoba);

-- Reference: Mecz_szachowy_czarne (table: Mecz_szachowy)
ALTER TABLE Mecz_szachowy ADD CONSTRAINT Mecz_szachowy_czarne
    FOREIGN KEY (Gracz_czarne)
    REFERENCES Szachista (ID_Osoba);

-- Reference: Szachista_Klub_szachowy (table: Szachista)
ALTER TABLE Szachista ADD CONSTRAINT Szachista_Klub_szachowy
    FOREIGN KEY (ID_klub)
    REFERENCES Klub_szachowy (ID_klub);

-- Reference: Szachista_Osoba (table: Szachista)
ALTER TABLE Szachista ADD CONSTRAINT Szachista_Osoba
    FOREIGN KEY (ID_Osoba)
    REFERENCES Osoba (ID_Osoba);

-- Reference: Szachista_Panstwo (table: Osoba)
ALTER TABLE Osoba ADD CONSTRAINT Szachista_Panstwo
    FOREIGN KEY (Obywatelstwo)
    REFERENCES Panstwo (ID_Panstwo);

-- End of file.

