# 1. cvičenie 18.9.2014

## Ciele cvičenia
*  Vytvorenie tabuľky (CREATE TABLE)
*  Odstránenie tabuľky (DROP TABLE)
*  Vloženie záznamov do tabuľky (INSERT)
*  Výpis záznamov (SELECT)
*  Usporiadanie záznamov (ORDER BY, ASCending, DESCending)
*  Alias (AS)
*  Stĺpcové funkcie (konkatenácia, SUBSTRING, LEN)
*  Podmienky (WHERE, AND, OR, NOT, BETWEEN, IN, LIKE)

## Úlohy

* Odstráňte tabuľku osoby (ak existuje)
```SQL
IF OBJECT_ID (N'dbo.Osoba') IS NOT NULL
BEGIN
	DROP TABLE dbo.Osoba
END
GO
```
* Vytvorte tabuľku osoby
```SQL
CREATE TABLE Osoba ( 
	id               INT         NOT NULL PRIMARY KEY, 
	meno             VARCHAR(10) NOT NULL, 
	priezvisko       VARCHAR(20) NOT NULL, 
	rodne_priezvisko VARCHAR(20), 
	dat_nar          DATETIME    NOT NULL, 
	dat_smrti        DATETIME, 
	pohlavie         CHAR(4)     NOT NULL CHECK (pohlavie IN ('m','z')),
	vyska            DEC(4,1)    CHECK (vyska BETWEEN 30.0 AND 250.0),
	vaha             DEC(4,1),
	otec          INT,
	matka         INT
);
```
* Vložte záznam do tabuľky
```SQL
INSERT Osoba VALUES(1, 'Adam',    'Prvy',       NULL,        '1918.5.11', '1968.10.1', 'm', 180.0, 80.0, NULL, NULL)
INSERT Osoba VALUES(2, 'Eva',     'Prva',      'Druha',      '1919.1.9',  '1988.7.22', 'z', 160.0, 60.0, NULL, NULL)
INSERT Osoba VALUES(3, 'Zoly',    'Mudry',      NULL,        '1918.4.7',  '1990.9.23', 'm', 175.5, 75,   NULL, NULL)
INSERT Osoba VALUES(4, 'NASta',   'Kovacova',  'Rostova',    '1928.2.5',  '1965.3.11', 'z', 155.0, 99,   NULL, NULL)
INSERT Osoba VALUES(5, 'Jozef',   'Urban',      NULL,        '1922.10.19', NULL,       'm', 199.5, Null, NULL, NULL)
INSERT Osoba VALUES(6, 'Maria',   'Urbanova',  'Novakova',   '1937.12.8',  NULL,       'z', 172.5, 57.5, 1,    2   )
INSERT Osoba VALUES(7, 'Patrik',  'Novak',     'Novak',      '1945.6.19',  NULL,       'm', 182.5, 89.5, 1,    2   )
INSERT Osoba VALUES(8, 'Patricia','Novakova',  'Haluskova',  '1952.1.8',   NULL,       'z', 143.5, 35,   NULL, NULL)
INSERT Osoba VALUES(9, 'Michal',  'Kovac',     'Kovac',      '1942.4.10',  NULL,       'm', 167.0, 88,   3,    2   )
INSERT Osoba VALUES(10,'Roman',   'Kovac',     'Kovac',      '1948.5.20',  NULL,       'm', 179.5, 78.5,  3,   4   )
INSERT Osoba VALUES(11,'Peter',   'Horvath',   'Horvath',    '1959.7.2',  '2000.12.31','m', 193.0, 110.5,NULL, NULL)
INSERT Osoba VALUES(12,'Lucia',   'Horvathova','Urbanova',   '1959.1.13',  NULL,       'z', 156.5, 45.5, 5,    6   )
INSERT Osoba VALUES(13,'Urban',   'Urban',     'Urban',      '1957.3.31',  NULL,       'm', 138.2, 24.5, 5,    6   )
INSERT Osoba VALUES(14,'DASa',    'Novakova',  'Novakova',   '1970.7.17',  NULL,       'z', 167.0, 55.0, 7,    8   )
INSERT Osoba VALUES(15,'Viera',   'Silna',     'Novakova',   '1973.2.13',  NULL,       'z', 169.5, 63.0, 7,    8   )
INSERT Osoba VALUES(16,'Vladimir','Silny',     'Silny',      '1974.8.1',  '2002.12.4', 'm', 175.5, 73.0, NULL, NULL)
INSERT Osoba VALUES(17,'Milena',  'Slaba',     'Slaba',      '1979.9.14',  NULL,       'z', 164.0, 64.0, NULL, NULL)
INSERT Osoba VALUES(18,'Jan',     'Horvath',   'Horvath',    '1982.1.16',  NULL,       'm', 159.5, 65.5, 11,   12  )
INSERT Osoba VALUES(19,'Zuzana',  'Silna',     'Silna',      '2002.3.1',   NULL,       'z', 158.5, 60.0, 16,   15  )
INSERT Osoba VALUES(20,'Zuzana',  'Slaba',     'Slaba',      '1999.12.16', NULL,       'z', 171.5, 54.5, 16,   17  )
```
* Vypíšte meno, priezvisko a pohlavie
```SQL
SELECT meno, priezvisko, pohlavie FROM Osoba;
```
* Vypíšte meno a priezvisko do jedného stĺpca
```SQL
SELECT meno + ' ' + priezvisko AS 'Meno a Priezvisko' FROM Osoba;
```
* Zoraďte záznamy podľa priezviska
```SQL
SELECT * FROM Osoba ORDER BY priezvisko;
```
* Zoraďte záznamy podľa priezviska zostupne
```SQL
SELECT * FROM Osoba ORDER BY priezvisko ASC;
```
* Zoraďte záznamy podľa priezviska vzostupne
```SQL
SELECT * FROM Osoba ORDER BY priezvisko DESC;
```
* Zoraďte záznamy podľa priezviska vzostupne a podľa mena zostupne
```SQL
SELECT * FROM Osoba ORDER BY priezvisko DESC, meno ASC;
```
* Vypíšte meno,priezvisko a pohlavie zoradené podľa priezviska a mena
```SQL
SELECT meno, priezvisko, pohlavie FROM Osoba ORDER BY priezvisko, meno;
```
* Zistite dĺžky mien
```SQL
SELECT meno, LEN(meno) FROM Osoba;
```
* Výpíšte prvý znak z mena, bodku a priezvisko
```SQL
SELECT SUBSTRING(meno, 1, 1) + '. ' + priezvisko FROM Osoba;
```
* Vypíšte meno a priezvisko do jedného stĺpca a zoradte záznamy
```SQL
SELECT meno + ' ' + priezvisko AS 'Meno a Priezvisko' FROM Osoba ORDER BY 1;
```
* Vypíšte meno a priezvisko (v jednom stĺpci) a pohlavie s názvom "sex", ktoré majú id menšie ako 4 a sú zoradené podľa prvého stĺpca
```SQL
SELECT meno + ' ' + priezvisko AS 'Meno a Priezvisko', pohlavie AS sex FROM Osoba WHERE id < 4 ORDER BY 1;
```
* Vypíšte mužov menších ako 180, ktorí sa narodili pred dátumom 13.1.1980
```SQL
SELECT * FROM Osoba WHERE pohlavie='m' AND vyska<180 AND dat_nar < '1980-01-13';
```
* Vypíšte osoby, ktoré nemajú meno Ján
```SQL
SELECT * FROM Osoba WHERE meno != 'Jan';
```
* Vypíšte osoby, ktorých výška je 167, 169 a 182 centimetrov
```SQL
SELECT * FROM Osoba WHERE vyska IN (167, 169, 182);
```
* Vypíšte osoby, ktorých váha je medzi 50 a 80 kilogramami
```SQL
SELECT * FROM Osoba WHERE vaha BETWEEN 50 AND 80;
```
* Vypíšte osoby, ktorých priezviská začínajú na slovo Novák
```SQL
SELECT * FROM Osoba WHERE priezvisko LIKE 'Novak%';
```
* Vypíšte osoby, ktorých priezviská obsahujú slová ová
```SQL
SELECT * FROM Osoba WHERE priezvisko LIKE '%ova%';
```
* Vypíšte osoby, ktorých priezviská končia na slovo ová + ľubovoľný znak
```SQL
SELECT * FROM Osoba WHERE SUBSTRING(priezvisko, 1, LEN(priezvisko)-1) LIKE '%ova';
# alebo
SELECT * FROM Osoba WHERE priezvisko LIKE '%ova_';
```
* Vypíšte osoby, ktorých priezviská obsahujú znaky o a á
```SQL
SELECT * FROM Osoba WHERE priezvisko LIKE '%o%' OR priezvisko LIKE '%a%';
```
* Vypíšte osoby, ktorých priezviská obsahujú znak K bez ohľadu na veľké a malé písmená
```SQL
SELECT * FROM Osoba WHERE LOWER(priezvisko) LIKE '%k%';
```
* Vypíšte osoby, ktorých priezviská obsahujú práve 5 znakov
```SQL
SELECT * FROM Osoba WHERE LEN(priezvisko) = 5;
# alebo
SELECT * FROM Osoba WHERE priezvisko LIKE '_____';
```
