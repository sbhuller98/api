SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY','')); 
#Not sure if I need the above line
CREATE DATABASE IF NOT EXISTS Crm;
USE Crm;

CREATE TABLE Client(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    login CHAR(30) NOT NULL UNIQUE,
    pwd CHAR(30) NOT NULL,
    birthDate DATE,
    name CHAR(40) NOT NULL,
    notes CHAR(250)
);

CREATE TABLE People(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    cid INT,
    email CHAR(30),
    name CHAR(50) NOT NULL,
    number CHAR(20),
    address CHAR(100),
    notes CHAR(250),
    relationship CHAR(20) NOT NULL,
    FOREIGN KEY(cid) REFERENCES Client(cid)
);

CREATE TABLE Places(
    plid INT PRIMARY KEY AUTO_INCREMENT,
    cid INT,
    email CHAR(30),
    name CHAR(50) NOT NULL,
    number CHAR(20),
    address CHAR(100) NOT NULL,
    businessDesc CHAR(30) NOT NULL,
    notes CHAR(250),
    FOREIGN KEY(cid) REFERENCES Client(cid)
);



CREATE TABLE DEALS(
    did INT PRIMARY KEY AUTO_INCREMENT,
    pid INT,
    cid INT,
    plid INT,
    amount Real,
    type CHAR(20) NOT NULL,
    status CHAR(15) NOT NULL,
    notes CHAR(250),
    FOREIGN KEY (cid) REFERENCES People(pid),
    FOREIGN KEY(pid) REFERENCES Client(cid),
    FOREIGN KEY(plid) REFERENCES Places(plid)
);

#Inserts for clients
INSERT INTO client(cid, login, pwd, birthDate, name, notes) VALUES (1, 'sukh', 'Sukh123', '1956-05-02', 'Sukh Bhuller', 'The first account');

INSERT INTO client(cid, login, pwd, birthDate, name, notes) VALUES (2, 'navi', 'Navi123', '1972-04-1', 'Navi Gangster', 'The second account');

#Inserts for Places
INSERT INTO places(plid, cid, email, name, number, address, businessDesc, notes) VALUES (1, 1, 'sukhb@email.com', 'House', '605-555-5454', '8846 76 A Ave, Surrey, BC, v5k03d', 'just a house', 'first palce created');

INSERT INTO places(plid, cid, email, name, number, address, businessDesc, notes) VALUES (2, 1, 'navi@email.com', 'Her house', '605-777-5454', '4576 76 A Ave, Surrey, BC, v5k03d', 'just her house', 'second palce created');

INSERT INTO places(plid, cid, email, name, number, address, businessDesc, notes) VALUES (3, 2, 'imthean@email.com', 'Mansion', '605-555-0000', '8846 52ST, Vancouver, BC, v5k03d', 'just a mansion', 'third palce created');

#Inserts for people
INSERT INTO people(pid, cid, email, name, number, address, notes, relationship) VALUES (1, 1, 'canada@north.com', 'Surjit', '585-564-7924', '4445 87 st, burnaby, bc', 'the first person created', 'supplier');

INSERT INTO people(pid, cid, email, name, number, address, notes, relationship) VALUES (2, 1, 'canada@south.com', 'Gurmit', '585-454-7924', '4445 11 st, burnaby, bc', 'the second person created', 'worker');

INSERT INTO people(pid, cid, email, name, number, address, notes, relationship) VALUES (3, 2, 'usa@south.com', 'Harman', '000-564-7924', '4445 00 st, burnaby, bc', 'the third person created', 'warehouse');

#Inserts for deals
INSERT INTO deals(did, pid, cid, plid, amount, type, status, notes) VALUES (1, 1, 1, 1, 45.6, 'Sending', 'Completed', 'for lumber purchase');

INSERT INTO deals(did, pid, cid, plid, amount, type, status, notes) VALUES (2, 2, 1, 2, 45.6, 'Receiving', 'IN progress', 'for car sale');