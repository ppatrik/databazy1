# 5. cvičenie 16.10.2014
## Používaná databáza a tabuľky
* Databáza Poliklinika

## Ciele cvičenia
* Extrémy a poradia: ALL, MAX, MIN, TOP(n)...ORDER BY, ROW_NUMBER()OVER(ORDER BY ...)
* Funkcie určujúce poradie/RANK: ROW_NUMBER (číselník, jednoduché očíslovanie vrátených riadkov/záznamov), RANK (poradie), DENSE_RANK (stlačené poradie), NTITLE (n častí), spriemernené poradie

## Úlohy
* Usporiadajte lekárov podľa veku zostupne
```SQL
```
* Nájdite dátum narodenia najmladšieho/-ej lekára/-ky
```SQL
```
* Vypíšte aj jeho/jej krstné meno a špecializáciu
```SQL
```
* Nájdite dátum narodenia druhého najmladšieho/-ej lekára/-ky
```SQL
```
* Nájdite všetky údaje o treťom/-tej najmladšom/-ej lekárovi/-ke
```SQL
```
* Vráťte prvých troch najmladších
```SQL
```
* Usporiadajte lekárov podľa veku zostupne a vráťte aj číselnik ~ poradie
```SQL
```
* Vráťte tretieho/-u najmladšieho/-u lekára/-ku
```SQL
```

## Domáca úloha
* Nájdite najmenší mesačný príjem medzi pacientami - Tri riešenia (MIN, ALL, TOP) + 4** ( RANK() OVER ...)
```SQL
```
* Vypíšte aj krstné meno pacienta - Tri riešenia (MIN, ALL, TOP)
```SQL
```
* Nájdite 2. najmenší mesačný príjem medzi pacientami
```SQL
```
* Vypíšte aj krstné meno pacienta (alebo s použitím iba ALL)
```SQL
```
* Vypíšte krstné meno pacienta s 3. minimálnym prijímom - Dve riešenia MIN, RANK() OVER ... 4**
```SQL
```
* Usporiadajte pacientov podľa mesacného prijímu a vypíšte aj poradia - Dve riešenia
```SQL
```
* Zbavte sa NULL hodnôt
```SQL
```
