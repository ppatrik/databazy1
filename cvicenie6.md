# 6. cvičenie 23.10.2014
## Používaná databáza a tabuľky
* Databáza Poliklinika

## Ciele cvičenia
* Vnorené dopyty
* Spriemernené poradie
* Vonkajšie spojenia (LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL OUTER JOIN)
* Agregačné funkcie

## Úlohy
* Nájdite krstné meno pacienta s 2. najmenším mesačným príjmom a vypíšte aj mesačný príjem s použitím ALL
```SQL
SELECT TOP 1 * FROM Pacienti
WHERE mesPrijem != ALL (SELECT TOP 1 mesPrijem FROM Pacienti WHERE mesPrijem IS NOT NULL ORDER BY mesPrijem)
AND mesPrijem IS NOT NULL
ORDER BY mesPrijem;
```
* Usporiadajte poplatky 300 a 500 z tabuľky Navstevy vzostupne. Uveďte aj číslo riadkov (číselník) a vypočítajte spriemernené poradia
```SQL
SELECT ROW_NUMBER() OVER (ORDER BY poplatok), NTILE (3) OVER (ORDER BY poplatok), * FROM Navstevy WHERE poplatok IN (300, 500) ORDER BY poplatok ASC;
```
* Sumárny poplatok v jednotlivých mesiacoch
```SQL
SELECT s.mesiac, SUM(s.poplatok) 
FROM (SELECT MONTH(den) as mesiac, poplatok FROM Navstevy) as s
GROUP BY s.mesiac;
-- alebo
SELECT MONTH(den) as mesiac, SUM(poplatok) FROM Navstevy GROUP BY den
```
* Počet poplatkov/pacientov v jednotlivých mesiacoch
```SQL
SELECT MONTH(den) as mesiac, COUNT(poplatok) FROM Navstevy GROUP BY den
```
* Priemerný poplatok v jednotlivých mesiacoch
```SQL
SELECT MONTH(den) as mesiac, AVG(poplatok) FROM Navstevy GROUP BY den
```
* Minimálny a maximálny poplatok jednotlivých pacientov. Uveďte aj ID
```SQL
-- maximum
SELECT TOP 1 idP, idL, poplatok as maximum FROM Navstevy WHERE poplatok IN (SELECT MAX(poplatok) FROM Navstevy);
-- minimum
SELECT TOP 1 idP, idL, poplatok as minimum FROM Navstevy WHERE poplatok IN (SELECT MIN(poplatok) FROM Navstevy);
```
* Vráťte iba tých pacientov, u ktorých minimálny poplatok sa nerovná maximálnemu (stĺpce pomenujte mini, maxi)
```SQL
SELECT p.idP, p.krstne, MIN(n.poplatok) as mini, MAX(n.poplatok) as maxi 
FROM Pacienti as p
JOIN Navstevy as n ON (n.idP = p.idP)
GROUP BY p.idP, p.krstne
HAVING MIN(n.poplatok) <> MAX(n.poplatok)
```
* Vráťte iba tých pacientov, u ktorých minimálny poplatok sa nerovná maximálnemu - filter sformulujte pomocou mini, maxi
```SQL
SELECT * FROM (
SELECT p.idP, p.krstne, MIN(n.poplatok) as mini, MAX(n.poplatok) as maxi 
FROM Pacienti as p
JOIN Navstevy as n ON (n.idP = p.idP)
GROUP BY p.idP, p.krstne
) AS s
WHERE mini <> maxi
```
* ID pacienta, ktorý zaplatil maximálny poplatok (použite iba tabuľku Navstevy)
```SQL
SELECT idP, poplatok
FROM Navstevy
WHERE poplatok = (SELECT MAX(poplatok) FROM Navstevy)
```
* ID pacienta, ktorý zaplatil najviac krát poplatok (použite iba tabuľku Navstevy)
```SQL
SELECT TOP 1 idP, COUNT(poplatok) as poplatok 
FROM Navstevy 
GROUP BY idP
ORDER BY poplatok DESC 
```
* Vráťte sumárny poplatok podľa ID pacientov (použite iba tabuľku Navstevy)
```SQL
SELECT idP, SUM(poplatok) FROM Navstevy 
```
* ID a krstné meno pacienta, ktorý zaplatil najväčší poplatok
```SQL
SELECT idP, krstne 
FROM Pacienti 
WHERE idP = (
	SELECT idP
	FROM Navstevy
	WHERE poplatok = (
		SELECT MAX(poplatok) 
		FROM Navstevy
	)
)
```
* ID pacienta, ktorý v auguste zaplatil najväčší poplatkok
```SQL
SELECT TOP 1 idP FROM Navstevy WHERE MONTH(den)=8 ORDER BY poplatok DESC
```
* Pacienti, ktorí v momente zaplatenia poplatku zarábaju 100-krát viac ako daný poplatok
```SQL
SELECT * 
FROM Pacienti AS p
JOIN Navstevy AS n ON (p.idP = n.idP)
WHERE p.mesPrijem >= n.poplatok*100
```
* Lekári, ktorí liečili pacienta s mesačným príjmom vyšším ako 30000
```SQL
SELECT DISTINCT l.* 
FROM Lekari AS l
JOIN Navstevy AS n ON (l.idL = n.idL)
JOIN Pacienti AS p ON (p.idP = n.idP)
WHERE p.mesPrijem > 30000
```
* Počet pacientov u jednotlivých lekárov
```SQL
SELECT l.idL, COUNT(DISTINCT n.idP)
FROM Lekari AS l 
JOIN Navstevy AS n ON(n.idL = l.idL)
GROUP BY l.idL
```
* Počet pacientov u jednotlivých lekárov - aj meno lekára
```SQL
SELECT l.idL, l.krstne, COUNT(DISTINCT n.idP)
FROM Lekari AS l 
JOIN Navstevy AS n ON(n.idL = l.idL)
GROUP BY l.idL, l.krstne
```
* Počet pacientov u jednotlivých špecialistov
```SQL
SELECT l.spec, COUNT(DISTINCT n.idP)
FROM Navstevy AS n
JOIN Lekari AS l ON (n.idL = l.idL)
GROUP BY l.spec
ORDER BY l.spec ASC
```
* Počet pacientov u dvoch špecialistov očný alebo interný
```SQL
SELECT l.spec, COUNT(DISTINCT n.idP)
FROM Navstevy AS n
JOIN Lekari AS l ON (n.idL = l.idL)
WHERE l.spec IN ('Ocny', 'Interny')
GROUP BY l.spec
ORDER BY l.spec ASC
```
* Počet pacientov u očného podľa poplatkov
```SQL
SELECT n.poplatok, COUNT(DISTINCT n.idP)
FROM Navstevy AS n
WHERE n.idL = (SELECT idL FROM Lekari WHERE spec='Ocny')
GROUP BY n.poplatok
```
* Vypíšte pacientov u interného v mesiaci, kedy má narodeniny
```SQL
SELECT DISTINCT idP, MONTH(n.den), MONTH(l.datNar)
FROM Navstevy AS n
JOIN Lekari AS l ON (l.idL = n.idL)
WHERE l.idL = n.idL
AND l.spec='Ocny'
AND MONTH(n.den) = MONTH(l.datNar)
```
