# 4. cvičenie 9.10.2014
## Používaná databáza a tabuľky
* Databáza Poliklinika

## Ciele cvičenia
* Vnútorné dopyty
* Kvantifikátory (SOME, ANY, ALL, EXISTS)
* Spojenie tabuliek

## Úlohy

* Oboznámte sa s tabuľkami Pacienti, Lekari, Navstevy z databázy Poliklinika
```SQL
SELECT * FROM Pacienti;
SELECT * FROM Lekari;
SELECT * FROM Navstevy;
```
* Zistite ID pacientov, ktorí už kedysi navštívili lekára s ID 1
```SQL
SELECT DISTINCT idP FROM Navstevy WHERE idL = 1;
```
* Zistite ID pacientov a počet ich návštev s ID 1
```SQL
SELECT DISTINCT idP, COUNT(idP) FROM Navstevy WHERE idL = 1 GROUP BY idP;
```
* Zistite ID pacientov, ktorí už kedysi navštívili lekára so špecializáciou Ocny
```SQL
SELECT DISTINCT idP FROM Navstevy WHERE idL IN (SELECT idL FROM Lekari WHERE spec = 'Ocny');
```
* Zistite aj počty návštev
```SQL
SELECT idP, COUNT(idP) FROM Navstevy WHERE idL IN (SELECT idL FROM Lekari WHERE spec = 'Ocny') GROUP BY idP;
```
* Zistite ID pacientov, ktorí už kedysi navštívili zubného lekára. Okrem ID uveďte aj dátum návštevy
```SQL
```
* Zistite iba počet všetkých návštev u zubného lekára
```SQL
```
* Zistite mená pacientov, ktorí už navštívili zubného lekára. Vráťte aj meno lekára
```SQL
```
* Zistite mená pacientov, ktorí už navštívili lekára Ota alebo Imra. Uveďte aj mena lekárov a výsledok zoraďte podľa mien lekárov, pacientov
```SQL
```
* Vráťte mená pacientov, ktorí už navštívili lekára Ota a Imra
```SQL
```
