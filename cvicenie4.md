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
SELECT idP, den FROM Navstevy WHERE idL IN (SELECT idL FROM Lekari WHERE spec = 'Zubny');
```
* Zistite iba počet všetkých návštev u zubného lekára
```SQL
SELECT count(*) AS pocetNavstevLekara FROM Navstevy WHERE idL IN (SELECT idL FROM Lekari WHERE spec = 'Zubny');
```
* Zistite mená pacientov, ktorí už navštívili zubného lekára. Vráťte aj meno lekára
```SQL
SELECT p.krstne AS pacient, l.krstne AS lekar 
FROM Navstevy n
JOIN Pacienti p ON n.idP=p.idP
JOIN Lekari l ON n.idL=l.idL 
WHERE n.idL IN (SELECT idL FROM Lekari WHERE spec = 'Zubny');
```
* Zistite mená pacientov, ktorí už navštívili lekára Ota alebo Imra. Uveďte aj mena lekárov a výsledok zoraďte podľa mien lekárov, pacientov
```SQL
SELECT p.krstne AS pacient, l.krstne AS lekar 
FROM Navstevy n
JOIN Pacienti p ON n.idP=p.idP
JOIN Lekari l ON n.idL=l.idL 
WHERE n.idL IN (SELECT idL FROM Lekari WHERE krstne = 'Oto' OR krstne = 'Imro')
ORDER BY l.krstne ASC, p.krstne ASC;
```
* Vráťte mená pacientov, ktorí už navštívili lekára Ota a Imra
```SQL
SELECT DISTINCT p.krstne AS pacient
FROM Navstevy n
JOIN Pacienti p ON n.idP=p.idP
WHERE n.idL IN (SELECT idL FROM Lekari WHERE krstne = 'Oto' OR krstne = 'Imro');
```
