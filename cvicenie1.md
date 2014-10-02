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
IF OBJECT_ID (N'dbo.Vztah') IS NOT NULL
BEGIN
	DROP TABLE dbo.Vztah
END
GO
```
* Vytvorte tabuľku osoby
```SQL
CREATE TABLE Osoby ( 
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
```
* Vypíšte meno, priezvisko a pohlavie
```SQL
```
* Vypíšte meno a priezvisko do jedného stĺpca
```SQL
```
* Zoraďte záznamy podľa priezviska
```SQL
```
* Zoraďte záznamy podľa priezviska zostupne
```SQL
```
* Zoraďte záznamy podľa priezviska vzostupne
```SQL
```
* Zoraďte záznamy podľa priezviska vzostupne a podľa mena zostupne
```SQL
```
* Vypíšte meno,priezvisko a pohlavie zoradené podľa priezviska a mena
```SQL
```
* Zistite dĺžky mien
```SQL
```
* Výpíšte prvý znak z mena, bodku a priezvisko
```SQL
```
* Vypíšte meno a priezvisko do jedného stĺpca a zoradte záznamy
```SQL
```
* Vypíšte meno a priezvisko (v jednom stĺpci) a pohlavie s názvom "sex", ktoré majú id menšie ako 4 a sú zoradené podľa prvého stĺpca
```SQL
```
* Vypíšte mužov menších ako 180, ktorí sa narodili pred dátumom 13.1.1980
```SQL
```
* Vypíšte osoby, ktoré nemajú meno Ján
```SQL
```
* Vypíšte osoby, ktorých výška je 167, 169 a 182 centimetrov
```SQL
```
* Vypíšte osoby, ktorých váha je medzi 50 a 80 kilogramami
```SQL
```
* Vypíšte osoby, ktorých priezviská začínajú na slovo Novák
```SQL
```
* Vypíšte osoby, ktorých priezviská obsahujú slová ová
```SQL
```
* Vypíšte osoby, ktorých priezviská končia na slovo ová + ľubovoľný znak
```SQL
```
* Vypíšte osoby, ktorých priezviská obsahujú znaky o a á
```SQL
```
* Vypíšte osoby, ktorých priezviská obsahujú znak K bez ohľadu na veľké a malé písmená
```SQL
```
* Vypíšte osoby, ktorých priezviská obsahujú práve 5 znakov
```SQL
```
