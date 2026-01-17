--
-- File generated with SQLiteStudio v3.4.17 on Sat Jan 17 19:47:42 2026
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: books
CREATE TABLE IF NOT EXISTS books (
    isbn TEXT PRIMARY KEY,
    title TEXT NOT NULL,
    author TEXT NOT NULL,
    copies_total INTEGER DEFAULT 1,
    copies_available INTEGER DEFAULT 1
);
INSERT INTO books (isbn, title, author, copies_total, copies_available) VALUES ('978123', 'The Da Vinci Code', 'Dan Brown', 1, 1);
INSERT INTO books (isbn, title, author, copies_total, copies_available) VALUES ('978456', 'You''ve Reached Sam', 'Dustin Thao', 2, 2);
INSERT INTO books (isbn, title, author, copies_total, copies_available) VALUES ('978789', 'Lore Olympus', 'Rachel Smythe', 5, 3);
INSERT INTO books (isbn, title, author, copies_total, copies_available) VALUES ('978246', 'People We Meet On Vacation', 'Emily Henry', 2, 0);
INSERT INTO books (isbn, title, author, copies_total, copies_available) VALUES ('978100', 'Northern Light', 'January Andrews', 1, 0);

-- Table: loans
CREATE TABLE IF NOT EXISTS loans (loan_id INTEGER PRIMARY KEY AUTOINCREMENT, patron_id TEXT NOT NULL, isbn TEXT NOT NULL, borrowed_at TEXT NOT NULL, due_at TEXT NOT NULL, returned_at TEXT, late_penalty INTEGER, FOREIGN KEY (patron_id) REFERENCES patrons (patron_id), FOREIGN KEY (isbn) REFERENCES books (isbn));
INSERT INTO loans (loan_id, patron_id, isbn, borrowed_at, due_at, returned_at, late_penalty) VALUES (1, 'BEA001225', '978123', '2025-12-31T08:22:42.386840', '2026-01-14T08:22:42.387294', '2025-12-31T08:48:51.214688', NULL);
INSERT INTO loans (loan_id, patron_id, isbn, borrowed_at, due_at, returned_at, late_penalty) VALUES (2, 'LAN980208', '978456', '2025-12-31T08:53:20.895593', '2026-01-14T08:53:20.895711', '2026-01-10T20:21:38.855649', 0);
INSERT INTO loans (loan_id, patron_id, isbn, borrowed_at, due_at, returned_at, late_penalty) VALUES (3, 'KIN020819', '978789', '2026-01-10T15:20:15.286232', '2026-01-24T15:20:15.295864', '2026-01-15T13:15:06.692822', 0);
INSERT INTO loans (loan_id, patron_id, isbn, borrowed_at, due_at, returned_at, late_penalty) VALUES (4, 'WAR080518', '978123', '2026-01-10T18:07:12.080619', '2026-01-24T18:07:12.081427', '2026-01-15T19:37:19.220131', 0);
INSERT INTO loans (loan_id, patron_id, isbn, borrowed_at, due_at, returned_at, late_penalty) VALUES (8, 'STE951212', '978789', '2026-01-15T19:36:23.172736', '2026-01-29T19:36:23.172776', '2026-01-16T16:24:18.520273', 0);
INSERT INTO loans (loan_id, patron_id, isbn, borrowed_at, due_at, returned_at, late_penalty) VALUES (10, 'WAR080518', '978246', '2026-01-16T16:30:42.847891', '2026-01-30T16:30:42.847920', NULL, NULL);

-- Table: patrons
CREATE TABLE IF NOT EXISTS patrons (
    patron_id TEXT PRIMARY KEY,
    full_name TEXT NOT NULL,
    dob TEXT NOT NULL,
    gender TEXT NOT NULL
);
INSERT INTO patrons (patron_id, full_name, dob, gender) VALUES ('BEA001225', 'Wren Beaumont', '2000-12-25', 'f');
INSERT INTO patrons (patron_id, full_name, dob, gender) VALUES ('LAN980208', 'Crew Lancaster', '1998-02-08', 'm');
INSERT INTO patrons (patron_id, full_name, dob, gender) VALUES ('KIN020819', 'Caden King', '2002-08-19', 'm');
INSERT INTO patrons (patron_id, full_name, dob, gender) VALUES ('WAR080518', 'Juliette Ella Warner', '2008-05-18', 'f');
INSERT INTO patrons (patron_id, full_name, dob, gender) VALUES ('STE951212', 'Nora Stephens', '1995-12-12', 'f');

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
