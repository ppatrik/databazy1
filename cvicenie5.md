# 5. cvičenie 16.10.2014
## Používaná databáza a tabuľky
* Databáza Poliklinika

## Ciele cvičenia
* Extrémy a poradia: ALL, MAX, MIN, TOP(n)...ORDER BY, ROW_NUMBER()OVER(ORDER BY ...)
* Funkcie určujúce poradie/RANK: ROW_NUMBER (číselník, jednoduché očíslovanie vrátených riadkov/záznamov), RANK (poradie), DENSE_RANK (stlačené poradie), NTITLE (n častí), spriemernené poradie

## Úlohy
* Usporiadajte lekárov podľa veku zostupne
```SQL
SELECT * FROM Lekari ORDER BY datNar ASC;
```
* Nájdite dátum narodenia najmladšieho/-ej lekára/-ky
```SQL
SELECT TOP 1 datNar FROM Lekari ORDER BY datNar DESC;
```
* Vypíšte aj jeho/jej krstné meno a špecializáciu
```SQL
SELECT TOP 1 datNar, krstne, spec FROM Lekari ORDER BY datNar DESC;
```
* Nájdite dátum narodenia druhého najmladšieho/-ej lekára/-ky
```SQL
SELECT TOP 1 datNar, krstne, spec FROM Lekari
WHERE idL NOT IN (SELECT TOP 1 idL FROM Lekari ORDER BY datNar DESC)
ORDER BY datNar DESC;
```
* Nájdite všetky údaje o treťom/-tej najmladšom/-ej lekárovi/-ke
```SQL
SELECT TOP 1 * FROM Lekari
WHERE idL NOT IN (SELECT TOP 2 idL FROM Lekari ORDER BY datNar DESC)
ORDER BY datNar DESC;
```
* Vráťte prvých troch najmladších
```SQL
SELECT TOP 3 * FROM Lekari ORDER BY datNar DESC;
```
* Usporiadajte lekárov podľa veku zostupne a vráťte aj číselnik ~ poradie
```SQL
SELECT ROW_NUMBER()OVER(ORDER BY datNar ASC) AS poradie, * FROM Lekari;
```
* Vráťte tretieho/-u najmladšieho/-u lekára/-ku
```SQL
SELECT TOP 1 * FROM Lekari
WHERE idL NOT IN (SELECT TOP 2 idL FROM Lekari ORDER BY datNar DESC)
ORDER BY datNar DESC;
```

## Domáca úloha
* Nájdite najmenší mesačný príjem medzi pacientami - Tri riešenia (MIN, ALL, TOP) + 4** ( RANK() OVER ...)
```SQL
SELECT MIN(mesPrijem) AS mesPrijem FROM Pacienti;
--alebo
SELECT mesPrijem FROM Pacienti WHERE mesPrijem <= ALL (SELECT mesPrijem FROM Pacienti WHERE mesPrijem IS NOT NULL);
--alebo
SELECT TOP 1 mesPrijem FROM Pacienti WHERE mesPrijem IS NOT NULL ORDER BY mesPrijem ASC;
--alebo
SELECT tabulka.mesPrijem
FROM (SELECT RANK()OVER(ORDER BY mesPrijem ASC) as poradie, mesPrijem FROM Pacienti WHERE mesPrijem IS NOT NULL) as tabulka
WHERE tabulka.poradie = 1
```
* Vypíšte aj krstné meno pacienta - Tri riešenia (MIN, ALL, TOP)
```SQL
SELECT mesPrijem, krstne FROM Pacienti WHERE mesPrijem IN (SELECT MIN(mesPrijem) AS mesPrijem FROM Pacienti);
--alebo
SELECT mesPrijem, krstne FROM Pacienti WHERE mesPrijem <= ALL (SELECT mesPrijem FROM Pacienti WHERE mesPrijem IS NOT NULL);
--alebo
SELECT TOP 1 mesPrijem, krstne FROM Pacienti WHERE mesPrijem IS NOT NULL ORDER BY mesPrijem ASC;
--alebo
SELECT tabulka.mesPrijem, tabulka.krstne
FROM (SELECT RANK()OVER(ORDER BY mesPrijem ASC) as poradie, mesPrijem, krstne FROM Pacienti WHERE mesPrijem IS NOT NULL) as tabulka
WHERE tabulka.poradie = 1
```
* Nájdite 2. najmenší mesačný príjem medzi pacientami
```SQL
SELECT TOP 1 mesPrijem FROM Pacienti
WHERE mesPrijem NOT IN (SELECT TOP 1 mesPrijem FROM Pacienti WHERE mesPrijem IS NOT NULL ORDER BY mesPrijem)
AND mesPrijem IS NOT NULL
ORDER BY mesPrijem;
```
* Vypíšte aj krstné meno pacienta (alebo s použitím iba ALL)
```SQL
SELECT TOP 1 krstne, mesPrijem FROM Pacienti
WHERE mesPrijem != ALL (SELECT TOP 1 mesPrijem FROM Pacienti WHERE mesPrijem IS NOT NULL ORDER BY mesPrijem)
AND mesPrijem IS NOT NULL
ORDER BY mesPrijem;
```
* Vypíšte krstné meno pacienta s 3. minimálnym prijímom - Dve riešenia MIN, RANK() OVER ... 4**
```SQL
SELECT TOP 1 krstne FROM Pacienti
WHERE mesPrijem != ALL (SELECT TOP 2 mesPrijem FROM Pacienti WHERE mesPrijem IS NOT NULL ORDER BY mesPrijem)
AND mesPrijem IS NOT NULL
ORDER BY mesPrijem;
```
* Usporiadajte pacientov podľa mesacného prijímu a vypíšte aj poradia - Dve riešenia
```SQL
SELECT ROW_NUMBER()OVER(ORDER BY mesPrijem), * FROM Pacienti;
```
* Zbavte sa NULL hodnôt
```SQL
SELECT ROW_NUMBER()OVER(ORDER BY mesPrijem), * FROM Pacienti WHERE mesPrijem IS NOT NULL;
```
