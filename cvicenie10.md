# 10. cvičenie 20.11.2014
## Ciele cvičenia
* Zmazanie a vytvorenie a používanie databázy ak existuje
* Zmazanie a vytvorenie tabuliek ak existujú
* Integritné obmedzenia (PRIMARY KEY, NOT NULL, UNIQUE, CHECK)
* Modifikácia štruktúry tabuľky (ALTER TABLE)
* Väzby medzi tabuľkami (REFERENCES, CONSTRAINT, FOREIGN KEY, ON DELETE/UPDATE CASCADE, ON DELETE SET NULL )
* Mazanie záznamov (DELETE), zmazanie tabuliek (DROP TABLE)

## Úlohy
* Vytvorenie databázy
```sql
if not exists(select 1 from sys.databases where name = 'jozko')
CREATE DATABASE jozko;
```
* Vytvorenie tabuliek Miestnost, Oddelenie, Zamestnanci
```sql
if not exists (select 1 from sysobjects where id = object_id('Miestnost') and type = 'U')
CREATE TABLE Miestnost (
   idM                  int                  not null,
   kod                  text                 null,
   constraint PK_MIESTNOST primary key (idM)
);
--
if not exists (select 1 from sysobjects where id = object_id('Oddelenie') and type = 'U')
CREATE TABLE Oddelenie (
   idO                  int                  not null,
   nazov                text                 null,
   constraint PK_ODDELENIE primary key (idO)
);
--
if not exists (select 1 from sysobjects where id = object_id('Zamestnanci') and type = 'U')
CREATE TABLE Zamestnanci (
   idZ                  int                  not null,
   idO                  int                  null,
   idM                  int                  null,
   krsne                text                 null,
   constraint PK_ZAMESTNANCI primary key (idZ)
);
```
* Pridanie väzieb medzi Oddelenim a Miestnostnou, respektíve medzi Oddelenim a Zamestnancami
```sql
if not exists (
	select 1 
	from sys.sysreferences r 
	join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
	where r.fkeyid = object_id('Zamestnanci') 
	and o.name = 'FK_ZAMESTNA_REFERENCE_MIESTNOS'
)
alter table Zamestnanci
   add constraint FK_ZAMESTNA_REFERENCE_MIESTNOS foreign key (idM)
      references Miestnost (idM)
--
if not exists (
	select 1 
	from sys.sysreferences r 
	join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
	where r.fkeyid = object_id('Oddelenie') 
	and o.name = 'FK_ZAMESTNA_REFERENCE_ODDELENI'
)
alter table Zamestnanci
   add constraint FK_ZAMESTNA_REFERENCE_ODDELENI foreign key (idO)
      references Oddelenie (idO)
```
* Napĺňanie tabuliek údajmi
```sql
INSERT INTO Oddelenie VALUES
(1, 'Oddelenie 1'),
(2, 'Oddelenie 2'),
(3, 'Oddelenie 3');
--
INSERT INTO Miestnost VALUES
(1, 'M 1'),
(2, 'M 2'),
(3, 'M 3');
--
INSERT INTO Zamestnanci VALUES
(1, 1, 3, 'Zam 1'),
(2, 2, 2, 'Zam 2'),
(3, 3, 1, 'Zam 3'),
(4, 3, 3, 'Zam 4'),
(5, 2, 2, 'Zam 5'),
(6, 3, 1, 'Zam 6');
```
* Pokus o vymazanie tabuliek - nedajú sa vymazať
```sql
-- nepojde
DROP TABLE Oddlenie
TRUNCATE Oddlenie
```
* Pokus o vymazanie niektorých riadkov - nemal by dovoliť
```sql
--pojde
INSERT INTO Miestnost VALUES(4, 'm4');
DELETE FROM Miestnost WHERE idM=4
-- nepojde
DELETE FROM Miestnost WHERE idM=2
```
