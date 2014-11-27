#12. cvičenie 4.12.2014
## Úlohy
* Vytvorte databázu OsoProVyd
* Vytvorte tabuľku Osoby so stĺpcami id osoby, priezvisko, krstné meno
* Vytvorte tabuľku Projekty so stĺpcami id projektu, názov a id osoby
* Vytvorte tabuľku Výdaje so stĺpcami id výdaje, id projektu, položka a cena
* Naplnte tabuľky
* Pridajte cudzie kľúče
* Pokúste sa zmazať záznam z projektu. Upravte cudzí kľúč tak, aby mazal kaskádovito
* Vymažte ceny nad 1000 z tabuľky výdaje

# Úlohy
* Premenujte databázu OsobaVztah na OsobaVztah2 a potom ju premenujte na OsobaVztah
```sql
ALTER DATABASE OsobaVztah MODIFY NAME = OsobaVztah2;
```
* Pridajte sĺpec do tabuľky a vložte nový záznam do tabuľky
* Upravte záznam v tabuľke
* Premenujte tabuľku, premenujte sĺpec v tabuľke
* Vymažte záznam z tabuľky
