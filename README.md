ChessTournamentPLSQL

ChessTournamentPLSQL is a comprehensive database management project designed to handle information for a chess tournament. ♟️🏆 The project includes managing players, referees, their nationalities, chess matches, tables, and chess clubs. It utilizes PL/SQL procedures and triggers to ensure data integrity and automate certain processes. 🚀

Key Features:

Schema Design:

The project is based on an ERD diagram that captures relationships between entities such as players, referees, countries, matches, tables, and clubs. 🌐

Procedures:

AddValidatedMatch: Ensures the integrity of match data by validating players, table usage, points, and referees before inserting a new match. 📝✅

AddPerson: Adds a new person to the database while ensuring the person is not over 100 years old and checks or inserts their country of nationality. 👤🌍

Triggers:

osoba_trigger: Prevents deletion of players, disallows name changes, and ensures unique person entries. 🚫🔄

update_rank: Updates player rankings dynamically after changes in match data. 📈♟️
