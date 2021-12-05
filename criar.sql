.mode columns
.headers on
.nullvalue NULL

PRAGMA foreign_keys=ON;
--BEGIN TRANSACTION;

DROP TABLE IF EXISTS User;
CREATE TABLE User(
    id INT PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    birth DATE,
    fullName TEXT,
    subActibe BOOL,
    id_Subscription INT REFERENCES Subscription
);

DROP TABLE IF EXISTS Notification;
CREATE TABLE Notification(
    id INT PRIMARY KEY,
    content TEXT NOT NULL,
    id_User INT REFERENCES User

);

DROP TABLE IF EXISTS Subscription;
CREATE TABLE Subscription(
    id INT PRIMARY KEY,
    initDate DATE,
    endDate DATE,
    id_CreditCard INT REFERENCES CreditCard

    CONSTRAINT dates CHECK (initDate < endDate)
);

DROP TABLE IF EXISTS CreditCard;
CREATE TABLE CreditCard(
    id INT PRIMARY KEY,
    cardNumber INT(16,0),    --<= 8 digits
    securityNumber INT(4,0),
    name TEXT NOT NULL,
    expireDate DATE

    CONSTRAINT cardNumberSize CHECK (cardNumber > 999999999999999)
    CONSTRAINT securityNumberSize CHECK (securityNumber > 999)
    CONSTRAINT expiringDate CHECK (expireDate > DATE('now'))
);

DROP TABLE IF EXISTS Show;
CREATE TABLE Show(
    id INT PRIMARY KEY,
    name TEXT NOT NULL,
    launchDate DATE,
    synopsis TEXT,
    rating INT,

    CONSTRAINT ratings CHECK (rating >= 0 AND rating <= 5)
);

DROP TABLE IF EXISTS Movie;
CREATE TABLE Movie(
    id INT PRIMARY KEY REFERENCES Show,
    duration TIME,
);

DROP TABLE IF EXISTS Serie;
CREATE TABLE Serie(
    id INT PRIMARY KEY REFERENCES Show
);

DROP TABLE IF EXISTS Season;
CREATE TABLE Season(
    id INT PRIMARY KEY,
    number INT,
    id_Serie INT REFERENCES Serie

    CONSTRAINT seasonNumber CHECK (number > 0)
);

DROP TABLE IF EXISTS Episode;
CREATE TABLE Episode(
    id INT PRIMARY KEY,
    number INT,
    name TEXT NOT NULL,
    duration TIME,
    launchDate DATE,
    id_Season INT REFERENCES Season
);

DROP TABLE IF EXISTS Genre;
CREATE TABLE Genre(
    id INT PRIMARY KEY,
    name TEXT
);


DROP TABLE IF EXISTS Following;
CREATE TABLE Following(
    id_Serie INT REFERENCES Serie,
    id_User INT REFERENCES User,

    PRIMARY KEY(id_Serie, id_User),
);

DROP TABLE IF EXISTS Comment;
CREATE TABLE Comment(
    id_Episode INT REFERENCES Episode,
    id_User INT REFERENCES User,
    cDate DATE DEFAULT DATE('now'),
    content TEXT NOT NULL,

    PRIMARY KEY(id_Serie, id_User),  
);

DROP TABLE IF EXISTS Watched;
CREATE TABLE Watched(
    id_Episode INT REFERENCES Episode,
    id_User INT REFERENCES User,
    wdate DATE DEFAULT DATE('now'),

    PRIMARY KEY(id_Serie, id_User),
);

DROP TABLE IF EXISTS ShowGenre;
CREATE TABLE ShowGenre(
    id_Show INT REFERENCES Show,
    id_Genre INT REFERENCES Genre,

    PRIMARY KEY(id_Serie, id_User),    
);









--COMMIT TRANSACTION;
--PRAGMA foreign_keys = ON;
