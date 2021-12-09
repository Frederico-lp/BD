.nullvalue NULL

PRAGMA foreign_keys=ON;

DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Notification;
DROP TABLE IF EXISTS Subscription;
DROP TABLE IF EXISTS CreditCard;
DROP TABLE IF EXISTS Show;
DROP TABLE IF EXISTS Movie;
DROP TABLE IF EXISTS Serie;
DROP TABLE IF EXISTS Season;
DROP TABLE IF EXISTS Episode;
DROP TABLE IF EXISTS Genre;
DROP TABLE IF EXISTS Following;
DROP TABLE IF EXISTS Comment;
DROP TABLE IF EXISTS Watched;
DROP TABLE IF EXISTS ShowGenre;

CREATE TABLE User(
    id INT PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    birth DATE,
    fullName TEXT,
    subActive BOOL NOT NULL,
    id_Subscription INT REFERENCES Subscription
);

CREATE TABLE Notification(
    id INT PRIMARY KEY,
    content TEXT NOT NULL,
    id_User INT REFERENCES User
);

CREATE TABLE Subscription(
    id INT PRIMARY KEY,
    initDate DATE NOT NULL,
    endDate DATE NOT NULL,
    id_CreditCard INT NOT NULL UNIQUE REFERENCES CreditCard,

    CONSTRAINT validDates CHECK (DATE(initDate) < DATE(endDate)),
    CONSTRAINT numMonthsSubscribed CHECK () -- Não está a funcionar
);

CREATE TABLE CreditCard(
    id INT PRIMARY KEY,
    cardNumber INT(16,0) NOT NULL UNIQUE, 
    securityNumber INT(3,0) NOT NULL,
    name TEXT NOT NULL UNIQUE,
    expireDate DATE NOT NULL,

    CONSTRAINT cardNumberSize CHECK (cardNumber > 999999999999999),
    CONSTRAINT securityNumberSize CHECK (securityNumber > 99),
    CONSTRAINT expiringDate CHECK (expireDate > DATE('now'))
);

CREATE TABLE Show(
    id INT PRIMARY KEY,
    name TEXT NOT NULL,
    launchDate DATE NOT NULL,
    synopsis TEXT NOT NULL,
    rating FLOAT NOT NULL,

    CONSTRAINT ratings CHECK (rating >= 0.0 AND rating <= 10.0)
);

CREATE TABLE Movie(
    id INT PRIMARY KEY REFERENCES Show,
    duration TIME NOT NULL,

    CONSTRAINT validDuration CHECK (duration != '00:00:00')
);

CREATE TABLE Serie(
    id INT PRIMARY KEY REFERENCES Show
);

CREATE TABLE Season(
    id INT PRIMARY KEY,
    number INT NOT NULL,
    id_Serie INT REFERENCES Serie,

    CONSTRAINT seasonNumber CHECK (number > 0)
);

CREATE TABLE Episode(
    id INT PRIMARY KEY,
    number INT NOT NULL,
    name TEXT NOT NULL,
    duration TIME NOT NULL,
    launchDate DATE NOT NULL,
    id_Season INT REFERENCES Season,

    CONSTRAINT validDuration CHECK (duration != '00:00:00')
);

CREATE TABLE Genre(
    id INT PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE Following(
    id_Serie INT REFERENCES Serie,
    id_User INT REFERENCES User,

    PRIMARY KEY(id_Serie, id_User)
);

CREATE TABLE Comment(
    id_Episode INT REFERENCES Episode,
    id_User INT REFERENCES User,
    cDate DATE NOT NULL,
    content TEXT NOT NULL,

    PRIMARY KEY(id_Episode, id_User)
);

CREATE TABLE Watched(
    id_Episode INT REFERENCES Episode,
    id_User INT REFERENCES User,
    wdate DATE NOT NULL,

    PRIMARY KEY(id_Episode, id_User)
);

CREATE TABLE ShowGenre(
    id_Show INT REFERENCES Show,
    id_Genre INT REFERENCES Genre,

    PRIMARY KEY(id_Show, id_Genre)
);
