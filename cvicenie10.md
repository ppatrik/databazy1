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
CREATE DATABASE jozko;
```
* Vytvorenie tabuliek Miestnost, Oddelenie, Zamestnanci
```sql
CREATE TABLE Miestnost (
	id INT NOT NULL,
	kod VARCHAR(10) NOT NULL,
);
CREATE TABLE Oddelenie (
	id INT NOT NULL,
	nazov VARCHAR(10) NOT NULL,
);
CREATE TABLE Zamestnanci (
	id INT NOT NULL,
	oddelenie_id INT NOT NULL,
	miestnost_id INT NOT NULL,
	meno VARCHAR(10) NOT NULL,
);
```
* Pridanie väzieb medzi Oddelenim a Miestnostnou, respektíve medzi Oddelenim a Zamestnancami
```sql

```
* Napĺňanie tabuliek údajmi
```sql

```
* Pokus o vymazanie tabuliek - nedajú sa vymazať
```sql

```
* Pokus o vymazanie niektorých riadkov - nemal by dovoliť
```sql

```
