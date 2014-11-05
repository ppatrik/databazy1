-- Vyber zapasov
SELECT
  FORMAT(time, 'dd.MM.yyyy HH:mm')                                         AS 'Dátum',
  t_home.name                                                              AS 'Domáci',
  t_hosts.name                                                             AS 'Hostia',
  CAST(score_home AS VARCHAR(10)) + ':' + CAST(score_hosts AS VARCHAR(10)) AS 'Výsledok'
FROM battles
  LEFT JOIN teams t_home ON (team_home = t_home.id)
  LEFT JOIN teams t_hosts ON (team_hosts = t_hosts.id);

-- pocet dni od prveho zapasu
SELECT TOP 1 DATEDIFF(D, time, GETDATE())
FROM battles;

-- pocet dni od prveho zapasu
SELECT TOP 1 DATEDIFF(M, time, GETDATE())
FROM battles;

-- Staty zacinajuce na S a konciace na o
SELECT *
FROM teams
WHERE name LIKE 'S%o';

-- Staty zacinajuce na S a konciace na o zoradene zostupne
SELECT *
FROM teams
WHERE name LIKE 'S%o'
ORDER BY name DESC;

-- Pocet zapasov ktore vyhrali domaci
SELECT COUNT(*) AS 'Domaci vyhrali'
FROM battles
WHERE score_home > score_hosts;

-- Duel prveho zapasu
SELECT TOP 1
  FORMAT(time, 'dd.MM.yyyy HH:mm')                                         AS 'Dátum',
  t_home.name                                                              AS 'Domáci',
  t_hosts.name                                                             AS 'Hostia',
  CAST(score_home AS VARCHAR(10)) + ':' + CAST(score_hosts AS VARCHAR(10)) AS 'Výsledok'
FROM battles
  LEFT JOIN teams t_home ON (team_home = t_home.id)
  LEFT JOIN teams t_hosts ON (team_hosts = t_hosts.id)
ORDER BY time ASC;

-- Padlo najviac golov
SELECT TOP 1
  FORMAT(time, 'dd.MM.yyyy HH:mm')                                         AS 'Dátum',
  t_home.name                                                              AS 'Domáci',
  t_hosts.name                                                             AS 'Hostia',
  CAST(score_home AS VARCHAR(10)) + ':' + CAST(score_hosts AS VARCHAR(10)) AS 'Výsledok',
  score_hosts + score_home                                                 AS 'Golov'
FROM battles
  LEFT JOIN teams t_home ON (team_home = t_home.id)
  LEFT JOIN teams t_hosts ON (team_hosts = t_hosts.id)
ORDER BY 'Golov' DESC;

-- NAJTESNEJSI ROZDIEL
SELECT
  FORMAT(time, 'dd.MM.yyyy HH:mm')                                         AS 'Dátum',
  t_home.name                                                              AS 'Domáci',
  t_hosts.name                                                             AS 'Hostia',
  CAST(score_home AS VARCHAR(10)) + ':' + CAST(score_hosts AS VARCHAR(10)) AS 'Výsledok'
FROM battles
  LEFT JOIN teams t_home ON (team_home = t_home.id)
  LEFT JOIN teams t_hosts ON (team_hosts = t_hosts.id)
WHERE ABS(score_home - score_hosts) = (SELECT TOP 1 ABS(score_home - score_hosts) AS 'rozdiel'
                                       FROM battles
                                       ORDER BY 'rozdiel' ASC)

-- napisanie ze kto vyhral
SET LANGUAGE 'slovak';
SELECT
  FORMAT(time, 'dd.MM.yyyy HH:mm')                                         AS 'Dátum',
  DATENAME(DW, time)                                                       AS 'Deň',
  t_home.name                                                              AS 'Domáci',
  t_hosts.name                                                             AS 'Hostia',
  CAST(score_home AS VARCHAR(10)) + ':' + CAST(score_hosts AS VARCHAR(10)) AS 'Výsledok',
  CASE
  WHEN t_home.name = 'Slovensko' AND score_home < score_hosts THEN 'prehrali'
  WHEN t_home.name = 'Slovensko' AND score_home = score_hosts THEN 'remizovali'
  WHEN t_home.name = 'Slovensko' AND score_home > score_hosts THEN 'vyhrali'
  WHEN t_hosts.name = 'Slovensko' AND score_home < score_hosts THEN 'vyhrali'
  WHEN t_hosts.name = 'Slovensko' AND score_home = score_hosts THEN 'remizovali'
  WHEN t_hosts.name = 'Slovensko' AND score_home > score_hosts THEN 'prehrali'
  END                                                                      AS 'Konečný stav'
FROM battles
  LEFT JOIN teams t_home ON (team_home = t_home.id)
  LEFT JOIN teams t_hosts ON (team_hosts = t_hosts.id)
WHERE t_home.name = 'Slovensko' OR t_hosts.name = 'Slovensko'

-- Vysledkova tabulka
SELECT
  name                                                                                 AS 'Názov tímu',
  (SELECT COUNT(*)
   FROM battles
   WHERE team_home = teams.id OR team_hosts = teams.id)                                AS 'Počet zápasov',
  (SELECT COUNT(*)
   FROM battles
   WHERE (team_home = teams.id AND score_home > score_hosts) OR
         (team_hosts = teams.id AND score_hosts > battles.score_home))                 AS 'Počet výhier',
  (SELECT COUNT(*)
   FROM battles
   WHERE (team_home = teams.id OR team_hosts = teams.id) AND score_home = score_hosts) AS 'Počet remíz',
  (SELECT COUNT(*)
   FROM battles
   WHERE (team_home = teams.id AND score_home < score_hosts) OR
         (team_hosts = teams.id AND score_hosts < battles.score_home))                 AS 'Počet prehier',
  (SELECT SUM(score_home)
   FROM battles
   WHERE team_home = teams.id) + (SELECT SUM(score_hosts)
                                  FROM battles
                                  WHERE team_hosts = teams.id)                         AS 'Počet daných gólov',
  (SELECT SUM(score_hosts)
   FROM battles
   WHERE team_home = teams.id) + (SELECT SUM(score_home)
                                  FROM battles
                                  WHERE team_hosts = teams.id)                         AS 'Počet získaných gólov'
FROM teams