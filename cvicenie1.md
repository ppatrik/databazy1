1. cvičenie 18.9.2014
==
Ciele cvičenia
--
  *  Vytvorenie tabuľky (CREATE TABLE)
  *  Odstránenie tabuľky (DROP TABLE)
  *  Vloženie záznamov do tabuľky (INSERT)
  *  Výpis záznamov (SELECT)
  *  Usporiadanie záznamov (ORDER BY, ASCending, DESCending)
  *  Alias (AS)
  *  Stĺpcové funkcie (konkatenácia, SUBSTRING, LEN)
  *  Podmienky (WHERE, AND, OR, NOT, BETWEEN, IN, LIKE)

Úlohy
--

_Odstráňte tabuľku osoby (ak existuje)_
  IF OBJECT_ID (N'dbo.Vztah') IS NOT NULL
  BEGIN
    DROP TABLE dbo.Vztah
  END
  GO
  
_Vytvorte tabuľku osoby_
    Vložte záznam do tabuľky
    Vypíšte meno, priezvisko a pohlavie
    Vypíšte meno a priezvisko do jedného stĺpca
    Zoraďte záznamy podľa priezviska
    Zoraďte záznamy podľa priezviska zostupne
    Zoraďte záznamy podľa priezviska vzostupne
    Zoraďte záznamy podľa priezviska vzostupne a podľa mena zostupne
    Vypíšte meno,priezvisko a pohlavie zoradené podľa priezviska a mena
    Zistite dĺžky mien
    Výpíšte prvý znak z mena, bodku a priezvisko
    Vypíšte meno a priezvisko do jedného stĺpca a zoradte záznamy
    Vypíšte meno a priezvisko (v jednom stĺpci) a pohlavie s názvom "sex", ktoré majú id menšie ako 4 a sú zoradené podľa prvého stĺpca
    Vypíšte mužov menších ako 180, ktorí sa narodili pred dátumom 13.1.1980
    Vypíšte osoby, ktoré nemajú meno Ján
    Vypíšte osoby, ktorých výška je 167, 169 a 182 centimetrov
    Vypíšte osoby, ktorých váha je medzi 50 a 80 kilogramami
    Vypíšte osoby, ktorých priezviská začínajú na slovo Novák
    Vypíšte osoby, ktorých priezviská obsahujú slová ová
    Vypíšte osoby, ktorých priezviská končia na slovo ová + ľubovoľný znak
    Vypíšte osoby, ktorých priezviská obsahujú znaky o a á
    Vypíšte osoby, ktorých priezviská obsahujú znak K bez ohľadu na veľké a malé písmená
    Vypíšte osoby, ktorých priezviská obsahujú práve 5 znakov
