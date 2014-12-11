# 1.

## a)
```sql
ALTER TABLE Postava ALTER COLUMN id INT NOT NULL;
ALTER TABLE Postava ADD CONSTRAINT CON_1A CHECK (
	meno IS NOT NULL 
		AND meno != ''
	AND priezvisko IS NOT NULL 
		AND priezvisko != ''
	AND dat_nar IS NOT NULL
		AND dat_nar != 0
	AND pohlavie IS NOT NULL
		AND pohlavie != ''
);
```

## b)
```sql
ALTER TABLE Postava ADD PRIMARY KEY (id);
```

## c)
```sql
ALTER TABLE Postava ADD CONSTRAINT checkmz CHECK (pohlavie IN ('m', 'z'));
```

## d)
```sql
ALTER TABLE Postava ADD CONSTRAINT checkvyska CHECK (vyska BETWEEN 30 AND 250);
```

## e)
```sql
ALTER TABLE Postava ADD CONSTRAINT checkvaha CHECK (vaha >= 0);
```

## f)
```sql
ALTER TABLE Postava ADD UNIQUE (meno, priezvisko);
```

# 2
```sql
-- matka
ALTER TABLE Postava
   ADD CONSTRAINT FK_POSTAVA_REFERENCE_MATKA FOREIGN KEY (matka)
      REFERENCES Postava (id);
-- otec
ALTER TABLE Postava
   ADD CONSTRAINT FK_POSTAVA_REFERENCE_OTEC FOREIGN KEY (otec)
      REFERENCES Postava (id);
```

# 3
```sql
SELECT 
	pohlavie,
	COUNT(*) AS 'počet postáv', 
	AVG(vyska) AS 'priemerná výška',
	(SELECT TOP 1 meno FROM Postava AS p2 WHERE p2.pohlavie = p1.pohlavie ORDER BY meno) AS 'prvé meno v abecede',
	MAX(vaha) AS 'maximálna váha'
FROM Postava AS p1
GROUP BY pohlavie;
```

# 4
```sql
SELECT 
	d.meno + ' ' + d.priezvisko AS 'postava',
	CASE
		WHEN DATEDIFF(YY, d.dat_nar, GETDATE()) < 18 THEN 'dieťa'
		ELSE 'dospelý'
	END AS 'vek kategória',
	m.meno + ' ' + m.priezvisko AS 'matka',
	o.meno + ' ' + o.priezvisko AS 'otec'
FROM Postava AS d
LEFT JOIN Postava AS m ON (m.id = d.matka)
LEFT JOIN Postava AS o ON (o.id = d.otec)
ORDER BY d.dat_nar ASC
```

# 5
```sql
(
	SELECT 0 'vrstva', 'rodicia' 'typ', id 'potomok', otec 'muz', matka 'zena'
	FROM Postava
	WHERE otec IS NOT NULL
	OR matka IS NOT NULL
) UNION (
	SELECT 1 'vrstva', 'staryrodicia' 'typ', p1.id 'potomok', p2.otec 'muz', p2.matka 'zena'
	FROM Postava AS p1
	JOIN Postava AS p2 ON (p1.matka = p2.id OR p1.otec = p2.id)
	WHERE p2.otec IS NOT NULL
	OR p2.matka IS NOT NULL
) UNION (
	SELECT 2 'vrstva', 'prastaryrodicia' 'typ', p1.id 'potomok', p3.otec 'muz', p3.matka 'zena'
	FROM Postava AS p1
	JOIN Postava AS p2 ON (p1.matka = p2.id OR p1.otec = p2.id)
	JOIN Postava AS p3 ON (p2.matka = p3.id OR p2.otec = p3.id)
	WHERE p3.otec IS NOT NULL
	OR p3.matka IS NOT NULL
) UNION (
	SELECT 3 'vrstva', 'praprastaryrodicia' 'typ', p1.id 'potomok', p4.otec 'muz', p4.matka 'zena'
	FROM Postava AS p1
	JOIN Postava AS p2 ON (p1.matka = p2.id OR p1.otec = p2.id)
	JOIN Postava AS p3 ON (p2.matka = p3.id OR p2.otec = p3.id)
	JOIN Postava AS p4 ON (p3.matka = p4.id OR p3.otec = p4.id)
	WHERE p4.otec IS NOT NULL
	OR p4.matka IS NOT NULL
)
ORDER BY potomok
```

# 6

## a)
```sql
ALTER TABLE Postava ADD vseved CHAR(1) DEFAULT 'N' NOT NULL;
```

## b)
```sql
UPDATE Postava SET vseved = 'A' WHERE DATEDIFF(YY, dat_nar, GETDATE()) > 60
```

## c)
```sql
EXEC sys.sp_rename 
    @objname = N'dbo.Postava.vseved', 
    @newname = 'vsevediaci', 
    @objtype = 'COLUMN';
```

## d)
```sql
-- table
USE Rozpravka;
EXEC sp_rename 'Postava', 'Bytost';
-- database
ALTER DATABASE Rozpravka MODIFY Name = Fantasy;
```