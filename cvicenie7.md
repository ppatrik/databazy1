# 7. cvičenie 30.10.2014

## Ciele cvičenia
* Vnorené dopyty

## Úlohy
* Uvažujme polikliniku. Nájdite id takých pacientov, ich krstné mená, mesacné príjmy a id lekára, ktorí u lekára nezaplatili žiaden poplatok (t. j. ich poplatok je null). Vráťte aj priemernú sumu peňazí, ktorá vychádza na jedného rodinného príslušníka s tým, že v prípade, ak pacientov mesačný príjem je aspoň 20 000, tak má štvorčlennú rodinu, ak jeho príjem je aspoň 10 000 ale mensi ako 20 000, tak ma dvojčlennú rodinu, inak je to študent (v tom prípade vráťte len jeho mesačný príjem).
```sql
SELECT p.idP, p.krstne, p.mesPrijem, n.idL, CASE
    WHEN p.mesPrijem >= 20000 THEN p.mesPrijem/4
    WHEN p.mesPrijem >= 10000 THEN p.mesPrijem/2
    ELSE p.mesPrijem
END AS 'priemerny prijem'
FROM Navstevy AS n
JOIN Pacienti AS p ON (p.idP = n.idP)
WHERE n.poplatok IS NULL
```
* Vráťte mená pacientov, ktorí navštívili lekára v párny mesiac a zaplatili poplatok menší ako 350.
```sql
SELECT p.krstne
FROM Navstevy AS n
JOIN Pacienti AS p ON (p.idP = n.idP)
WHERE MONTH(n.den)%2 = 0
AND n.poplatok < 350
```
* Nájdite informácie o lekárovi, ktorý v mesiaci máj ošetril pacienta, ktorý mal najvyšši mesačný príjem spomedzi všetkých pacientov, ktorí boli v máji u lekára.
```sql
SELECT n.idL
FROM Navstevy AS n
JOIN Lekari AS l ON (l.idL = n.idL)
WHERE MONTH(n.den)=5
AND n.idP = (
    SELECT TOP 1 idP FROM Pacienti WHERE idP IN (
        SELECT idP FROM Navstevy WHERE MONTH(den)=5
    ) ORDER BY mesPrijem DESC
)
```
* Vypíšte sumu všetkých poplatkov vybraných podľa jednotlivých špecializácií.
```sql
SELECT l.spec, SUM(n.poplatok)
FROM Navstevy AS n
JOIN Lekari AS l ON (l.idL = n.idL)
GROUP BY l.spec
```
* Zistite koľko návštev mal jednotlivý lekár od pacientov s mesačným príjmom väčším ako 10000 a zoraďte ich od najmenšieho počtu k najväčšiemu.
```sql
```
* Zistite meno, špecializaciu a vek! (nie dátum narodenia) všetkých lekárov, ktorí od pacientov vybrali na sumárnych poplatkoch viac ako 2000.
```sql
```
* Zistite počty návštev jednotlivých pacientiek.
```sql
```
* Zistite sumy, ktoré zaplatili dokopy jednotlivé pacientky.
```sql
```
* Zistite priemerný poplatok za návštevu jednotlivých pacientok.
```sql
```
