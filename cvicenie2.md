# 2. cvičenie 25.9.2014
## Používaná databáza a tabuľky
* Databáza UPJS

## Ciele cvičenia
* CASE
* Dátumové funkcie (YEAR, MONTH, DAY, GETDATE, DATENAME, DATEPART, DATEDIFF, DATEADD, SET DATEFIRST, SET LANGUAGE, ...)

## Úlohy
* Vypíšte meno a priezvisko (do jedného sĺpca) a pohlavie Muz, Zena alebo neurčené
```SQL
SELECT meno + ' ' + priezvisko AS 'Meno a Priezvisko', 
CASE pohlavie 
  WHEN 'm' THEN 'Muž' 
  WHEN 'z' THEN 'Žena' 
  ELSE 'nezname' 
END AS pohlavie FROM student;
```
* Vypíšte študentov, ktorí nemajú určený dátum narodenia
```SQL
SELECT * FROM student WHERE datum_narodenia IS NULL;
```
* Vypíšte študentov, ktorí majú určený dátum narodenia
```SQL
SELECT * FROM student WHERE datum_narodenia IS NOT NULL;
```
* Kto sa narodil pred rokom 1981? Vypíšte priezvisko, meno a dátum narodenia
```SQL
SELECT priezvisko, meno, datum_narodenia FROM student WHERE YEAR(datum_narodenia) < 1981;
```
* Kto sa narodil v rokoch 1980 a 1985? Vypíšte priezvisko, meno a dátum narodenia
```SQL
SELECT priezvisko, meno, datum_narodenia FROM student WHERE YEAR(datum_narodenia) BETWEEN 1980 AND 1985;
```
* Kto má narodeniny medzi 10. septembrom a 30.septembrom?
```SQL
SELECT priezvisko, meno, datum_narodenia FROM student WHERE MONTH(datum_narodenia) = 9 AND DAY(datum_narodenia) BETWEEN 10 AND 30;
```
* Vypíšte dnešný dátum
```SQL
SELECT GETDATE();
```
* Vráťte anglický názov dnešného dňa
```SQL
SELECT DATENAME(dw, GETDATE());
```
* Vráťte slovenský názov dnešného dňa
```SQL
SET LANGUAGE 'Slovak';
SELECT DATENAME(dw, GETDATE());
```
* Vráťte poradové číslo dnešného dňa v týždni
```SQL
SELECT DATEPART(dw, GETDATE());
```
* Kto sa aký deň týždňa narodil?
```SQL
SELECT *, DATENAME(dw, datum_narodenia) as 'Narodeny v dni' FROM student;
```
* Kto sa koľkatý deň týždňa narodil?
```SQL
SELECT *, DATEPART(dw, datum_narodenia) as 'Narodeny v dni' FROM student;
```
* Kto sa narodil v utorok (2. deň týždňa)?
```SQL
SELECT *, DATENAME(dw, datum_narodenia) as 'Narodeny v dni' FROM student WHERE DATEPART(dw, datum_narodenia) = 2;
```
* Kto koľko má rokov?
```SQL
SELECT * , DATEDIFF(yy, datum_narodenia, GETDATE()) AS vek FROM student;
```
* Koľkatý je dnešný deň roka?
> OPRAVIŤ!
```SQL
SELECT DATEDIFF(dd, YEAR(GETDATE()) + '-01-01', GETDATE());
```
* Vypíšte zajtrajší dátum
```SQL
```
* Vypíšte názov zajtrajšieho dňa
```SQL
```
