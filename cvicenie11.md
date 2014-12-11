# 11. cvičenie 27.11.2014
## Ciele cvičenia
* Integritné obmedzenia
* Kaskádovitosť
* Premenovanie databáz, tabuliek, záznamov
* Tranzitívny uzáver

## Úlohy
* V tempbd vytvorte tabuľku osoba so stĺpcami id (ako primary key), meno, priezvisko, dátum, pohlavie, výška, váha
```sql
CREATE TABLE osoba (
  id INT NOT NULL,
  meno VARCHAR(20) NOT NULL,
  priezvisko VARCHAR(20) NOT NULL,
  datum DATETIME,
  pohlavie CHAR(1),
  vyska INT,
  vaha INT,
  PRIMARY KEY (id)
);
```
* Upravte tabuľku tak, aby do stĺpca pohlavie bolo možné vkladať iba hodnoty 'm' alebo 'z'
```sql
ALTER TABLE osoba ADD CONSTRAINT checkmz CHECK (pohlavie IN ('m', 'z'));
```
* Vymažte integritné obmedzenie
```sql
ALTER TABLE osoba DROP CONSTRAINT checkmz;
```
* Vložte do tabuľky jeden platný riadok
```sql
insert into osoba values (1, 'f', 'g', null, 'z',null,null);
```
* Skúste vložiť do tabuľky riadok, kde bude pohlavie='d'
```sql
insert into osoba values (2, 'f', 'g', null, 'd',null,null);
```
* Bude fungovať, ak na chvíľu vypneme a potom znovu zapneme kontrolu
```sql
ALTER TABLE osoba NOCHECK CONSTRAINT checkmz;
-- vlozit do databazy zle data
ALTER TABLE osoba CHECK CONSTRAINT checkmz;
```
* Ošetrite tabuľku tak, aby nebolo možné vkladať null hodnoty do stĺpcov meno a priezvisko pomocou alter table
```sql
ALTER TABLE osoba ALTER COLUMN meno VARCHAR(20) NOT NULL;
ALTER TABLE osoba ALTER COLUMN priezvisko VARCHAR(20) NOT NULL;
```
* V ďalšom už nekontrolujte existujúce riadky
```sql
```
* Vložiť riadok
```sql
insert into osoba values (3, 'f', 'g', null, 'd',null,null);
```
* Zabezpečte, aby trojica pohlavie, výška, váha bola jedinečná (jednoznačná)
```sql
ALTER TABLE osoba ADD abcobmedzenie UNIQUE (pohlavie, vyska, vaha);
ALTER TABLE osoba DROP CONSTRAINT abcobmedzenie;
```
* Vložte riadok, ktorý dodržiava a nedodržiava toto obmedzenie
```sql
insert into osoba values (4, 'f', 'g', null, 'z', 10, 10);
insert into osoba values (5, 'f', 'g', null, 'z', 10, 10); -- nepojde
insert into osoba values (6, 'f', 'g', null, 'z', 10, 11);
```
* Zmažte stĺpec výška
```sql
ALTER TABLE osoba DROP COLUMN vyska;
```
* Upravte stĺpec pohlavie s default hodnotou 'm' s povolenými hodnotami 'm' a 'z'
```sql
ALTER TABLE osoba ALTER COLUMN pohlavie CHAR(1) NOT NULL;
ALTER TABLE osoba ADD DEFAULT( 'm' ) FOR pohlavie;
```
* Vložte dva platné riadky do tabuľky
```sql
-- same as above
```
* Vytvorte tabuľku osoba tak ako predtým, ale s inými obmedzeniami ( meno a priezvisko nie sú null, pohlavie musí byť 'm' alebo 'z', stĺpce výška, váha, pohlavie sú jedinečné, výška a váha sú kladné, tabuľka nemá iné telefónne číslo ako +421xxxxxxxxx )
```sql
create table osoba (
   meno                 text                 not null,
   priezvisko           time                 not null,
   pohlavie             char(10)             null
      constraint CKC_POHLAVIE_OSOBA check (pohlavie is null or (pohlavie in ('m','z'))),
   vyska                char(10)             null
      constraint CKC_VYSKA_OSOBA check (vyska is null or (vyska >= '0')),
   vaha                 char(10)             null
      constraint CKC_VAHA_OSOBA check (vaha is null or (vaha >= '0')),
   telefon              char(10)             null
      constraint CKC_TELEFON_OSOBA check (telefon LIKE '+421_________')
)
```
* Vypnúť constraint
```sql
ALTER TABLE osoba NOCHECK CONSTRAINT ALL;
```
* Zapnúť všetky constraint
```sql
ALTER TABLE osoba CHECK CONSTRAINT ALL;
```
* Vytvorte databázu gammaVydavatel a v nej tabuľku kniha obsahujúcu id a názov
```sql
CREATE DATABASE gammaVydavatel;
USE gammaVydavatel;
CREATE TABLE kniha (
  id INT NOT NULL,
  nazov VARCHAR(20),
  PRIMARY KEY(id)
);
```
* Rozšírime databázu tak, aby bolo možné zadať aj krajinu
```sql
ALTER TABLE kniha ADD krajina VARCHAR(20);
```
