# 9. cvičenie 13.11.2014

## Ciele cvičenia
Množinové operácie (UNION, UNION ALL, INTERSECT, EXCEPT)

## Úlohy

* Doplňte nasledujúci dopyt tak, aby vrátil aj NULL hodnoty: SELECT mesPrijem FROM Pacienti WHERE mesPrijem <> 8500
```sql
(
	SELECT mesPrijem FROM Pacienti WHERE mesPrijem <> 8500
) UNION ALL (
	SELECT mesPrijem FROM Pacienti WHERE mesPrijem IS NULL
)
```
* Modifikujte nasledújuci dopyt tak, aby vrátil aj NULL hodnoty - 10 riadkov (JOIN má byť): SELECT p1.mesPrijem FROM Pacienti p1 JOIN Pacienti p2 ON p2.mesPrijem = p1.mesPrijem
```sql
(
	SELECT p1.mesPrijem 
	FROM Pacienti p1 
	JOIN Pacienti p2 ON p2.mesPrijem = p1.mesPrijem
) UNION ALL (
	SELECT p1.mesPrijem 
	FROM Pacienti p1 
	JOIN Pacienti p2 ON (
	    p2.mesPrijem IS NULL 
	    AND p1.mesPrijem IS NULL 
	    AND p1.idP != p2.idP
	)
)
```
* Doplňte nasledujúci dopyt tak, aby vrátil aj NULL hodnoty - 10 riadkov: SELECT p1.mesPrijem FROM Pacienti p1 JOIN Pacienti p2 ON p2.mesPrijem = p1.mesPrijem
```sql
(
	SELECT p1.mesPrijem 
	FROM Pacienti p1 
	JOIN Pacienti p2 ON p2.mesPrijem = p1.mesPrijem
) UNION ALL (
	SELECT p1.mesPrijem 
	FROM Pacienti p1 
	WHERE p1.mesPrijem IS NULL
)
```
* Akých pacientov (idP) mal lekár s id 3 (?)
```sql
SELECT idP FROM Navstevy AS n WHERE idL = 3
```
* Akých pacientov (idP) NEmal lekár s id 3 (?)
```sql
(SELECT idP FROM Pacienti)
EXCEPT
(SELECT idP FROM Navstevy AS n WHERE idL = 3)
```
