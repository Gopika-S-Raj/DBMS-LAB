CREATE DATABASE FAG;
USE FAG;
CREATE TABLE MOVIES(TITLE VARCHAR(20),DIRECTOR VARCHAR(20),MYEAR INT,RATING FLOAT,PRIMARY KEY(TITLE));
INSERT INTO MOVIES(TITLE,DIRECTOR,MYEAR,RATING)VALUES('FARGO','COEN',1996,8.2);
INSERT INTO MOVIES(TITLE,DIRECTOR,MYEAR,RATING)VALUES('RAISING ARIZONA','COEN',1987,7.6);
INSERT INTO MOVIES(TITLE,DIRECTOR,MYEAR,RATING)VALUES('SPIDERMAN','RAIMI',2002,7.4);
INSERT INTO MOVIES(TITLE,DIRECTOR,MYEAR,RATING)VALUES('WONDERBOYS','HANSON',2000,7.6);
SELECT * FROM MOVIES;
SELECT * FROM MOVIES WHERE MYEAR>1997;
SELECT TITLE FROM MOVIES WHERE DIRECTOR='HANSON' AND  MYEAR>1997;
SELECT TITLE,RATING FROM MOVIES;
USE FAG;
CREATE TABLE ACTORS(ACTOR VARCHAR(20),AYEAR INT,PRIMARY KEY(ACTOR));
INSERT INTO ACTORS(ACTOR,AYEAR)VALUES('CAGE',1964);
INSERT INTO ACTORS(ACTOR,AYEAR)VALUES('HANKS',1956);
INSERT INTO ACTORS(ACTOR,AYEAR)VALUES('MAGUIRE',1975);
INSERT INTO ACTORS(ACTOR,AYEAR)VALUES('MCDORMAND',1957);
SELECT * FROM ACTORS;
USE FAG;
CREATE TABLE DIRECT(DIRECTOR VARCHAR(20),DYEAR INT,PRIMARY KEY(DIRECTOR));
INSERT INTO DIRECT(DIRECTOR,DYEAR)VALUES('COEN',1954);
INSERT INTO DIRECT(DIRECTOR,DYEAR)VALUES('HANSON',1945);
INSERT INTO DIRECT(DIRECTOR,DYEAR)VALUES('RAIMI',1959);
SELECT * FROM DIRECT;
USE FAG;

CREATE TABLE ACT(ACTOR VARCHAR(20),TITLE VARCHAR(20),FOREIGN KEY(TITLE) REFERENCES MOVIES(TITLE) ON DELETE CASCADE );
INSERT INTO ACT(ACTOR,TITLE)VALUES('CAGE','RAISING ARIZONA');
INSERT INTO ACT(ACTOR,TITLE)VALUES('MAGUIRE','SPIDERMAN');
INSERT INTO ACT(ACTOR,TITLE)VALUES('MAGUIRE','WONDERBOYS');
INSERT INTO ACT(ACTOR,TITLE)VALUES('MCDORMAND','FARGO');
INSERT INTO ACT(ACTOR,TITLE)VALUES('MCDORMAND','RAISING ARIZONA');
INSERT INTO ACT(ACTOR,TITLE)VALUES('MCDORMAND','WONDERBOYS');
SELECT * FROM ACT;

SELECT MOVIES.DIRECTOR,ACT.ACTOR FROM MOVIES INNER JOIN ACT ON MOVIES.TITLE=ACT.TITLE;
SELECT MOVIES.TITLE FROM MOVIES INNER JOIN ACT ON MOVIES.TITLE=ACT.TITLE WHERE DIRECTOR='COEN' AND ACTOR='MCDORMAND';

