# 3. cvičenie 2.10.2014

## Používaná databáza a tabuľky
* Databáza Poliklinika

## Ciele cvičenia
* Agregačné funkcie (COUNT, MAX, MIN, AVG, SUM, GROUP BY, HAVING)
* Manipulácia so záznamami (INSERT, UPDATE, DELETE)

## Úlohy
* Nájdite meno pacienta s najväčším prijímom (z tabuľky Pacienti)
```SQL
SELECT TOP 1 krstne FROM Pacienti ORDER BY mesPrijem DESC;
#alebo
SELECT krstne FROM Pacienti WHERE mesPrijem = (SELECT MAX(mesPrijem) FROM Pacienti);
```
* Koľko pacientov navštívilo lekára s idL 3 (z tabuľky Navstevy)?
```SQL
SELECT COUNT(idL) AS 'Pocet návštev lekára' FROM Navstevy WHERE idL = 3 GROUP BY idL;
```
* Koľko pacientov navštívilo jednotlivých lekárov (z tabuľky Navstevy)?
```SQL
SELECT idL, COUNT(idL) AS 'Pocet návštev podla lekára' FROM Navstevy GROUP BY idL;
```
* Vypíšte lekárov, ktorých navšívili viac ako 3 pacienti
```SQL
SELECT idL FROM Navstevy GROUP BY idL HAVING COUNT(idL) > 3;
```
* Koľko návštev absolvovali jednotliví pacienti (z tabuľky Navstevy)?
```SQL
SELECT idP, COUNT(idP) AS 'Pocet návštev podla pacienta' FROM Navstevy GROUP BY idP;
```
* Koľko návštev absolvovali jednotliví pacienti u jednotlivých lekárov?
```SQL
SELECT idP, idL, COUNT(idL) AS 'Pocet návštev' FROM Navstevy GROUP BY idP, idL;
```
* Vypíšte pacientov s prijíjmom väčším ako 10000
```SQL
SELECT * FROM Pacienti WHERE mesPrijem > 10000;
```
* Vypíšte pacientov, u ktorých príjem je uvedený
```SQL
SELECT * FROM Pacienti WHERE mesPrijem IS NULL;
```
* Vypíšte všetky návštevy medzi 5.7.2008 a 9.9.2008
```SQL
SELECT * FROM Navstevy WHERE den BETWEEN '2008-07-05' AND '2008-09-09';
```
* Vypíšte počet návštev medzi 5.7.2008 a 9.9.2008
```SQL
SELECT COUNT(*) AS 'Počet návštev v období' FROM Navstevy WHERE den BETWEEN '2008-07-05' AND '2008-09-09';
```
* Vypíšte ktorý lekár koľko návštev mal medzi 5.7.2008 a 9.9.2008
```SQL
SELECT idL, COUNT(idL) AS 'Počet návštev v období' FROM Navstevy WHERE den BETWEEN '2008-07-05' AND '2008-09-09' GROUP BY idL;
```
* Ktorá návšteva bola prvá?
```SQL
SELECT MIN(den) FROM Navstevy;
```
* Vypíšte každý údaj o prvej návšteve
```SQL
SELECT * FROM Navstevy WHERE den = (SELECT MIN(den) FROM Navstevy);
```
* Zistite "minimum" pohlavia (OsobaVztah.Osoba)
```SQL
USE OsobaVztah;
SELECT top 1 pohlavie, COUNT(pohlavie) FROM Osoba GROUP BY pohlavie ORDER BY 2 ASC;
```
* Zistite "maximum" mena (OsobaVztah.Osoba)
```SQL
SELECT top 1 meno, COUNT(meno) FROM Osoba GROUP BY meno ORDER BY 2 DESC;
```
