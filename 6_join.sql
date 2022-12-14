/* 1. show the matchid and player name for all goals scored by Germany. To
      identify German players, check for: teamid = 'GER' */
SELECT
  matchid,
  player
FROM goal
WHERE teamid LIKE 'ger';

-- 2. Show id, stadium, team1, team2 for just game 1012
SELECT
  id,
  stadium,
  team1,
  team2
FROM game
WHERE id = 1012;

/* 3.  Modify it to show the player, teamid, stadium and mdate for every German
       goal. */
SELECT
  goal.player,
  goal.teamid,
  game.stadium,
  game.mdate
FROM game
INNER JOIN goal
  ON goal.matchid = game.id
WHERE teamid LIKE 'ger';

/* 4. Show the team1, team2 and player for every goal scored by a player called
      Mario player LIKE 'Mario%' */
SELECT
  game.team1,
  game.team2,
  goal.player
FROM game
INNER JOIN goal
  ON goal.matchid = game.id
WHERE goal.player LIKE 'mario%';

/* 5. Show player, teamid, coach, gtime for all goals scored in the first 10
      minutes gtime<=10 */
SELECT
  goal.player,
  goal.teamid,
  eteam.coach,
  goal.gtime
FROM goal
INNER JOIN eteam
  ON goal.teamid = eteam.id
WHERE gtime <= 10;

/* 6. List the dates of the matches and the name of the team in which 'Fernando
      Santos' was the team1 coach. */
SELECT
  game.mdate,
  eteam.teamname
FROM game
INNER JOIN eteam
  ON game.team1 = eteam.id
WHERE eteam.coach LIKE 'fernando santos';

/* 7. List the player for every goal scored in a game where the stadium was
     'National Stadium, Warsaw' */
SELECT goal.player
FROM goal
INNER JOIN game
  ON goal.matchid = game.id
WHERE game.stadium LIKE 'national stadium, warsaw';

-- 8. Instead show the name of all players who scored a goal against Germany.
SELECT DISTINCT goal.player
FROM goal
INNER JOIN game
  ON goal.matchid = game.id
WHERE
  goal.teamid NOT LIKE 'ger'
  AND
    (game.team1 LIKE 'ger'
     OR game.team2 LIKE 'ger');

-- 9. Show teamname and the total number of goals scored.
SELECT
  eteam.teamname,
  COUNT(goal.player)
FROM eteam
INNER JOIN goal
  ON eteam.id = goal.teamid
GROUP BY eteam.teamname;

-- 10. Show the stadium and the number of goals scored in each stadium.
SELECT
  game.stadium,
  COUNT(goal.player)
FROM game
INNER JOIN goal
  ON game.id = goal.matchid
GROUP BY game.stadium;

/* 11. For every match involving 'POL', show the matchid, date and the number of
       goals scored. */
SELECT
  goal.matchid,
  game.mdate,
  COUNT(goal.gtime)
FROM goal
INNER JOIN game
  ON goal.matchid = game.id
WHERE
  game.team1 LIKE 'pol'
  OR game.team2 LIKE 'pol'
GROUP BY
  goal.matchid,
  game.mdate;

/* 12. For every match where 'GER' scored, show matchid, match date and the
       number of goals scored by 'GER' */
SELECT
  goal.matchid,
  game.mdate,
  COUNT(goal.player)
FROM goal
INNER JOIN game
  ON goal.matchid = game.id
WHERE goal.teamid LIKE 'ger'
GROUP BY
  goal.matchid,
  game.mdate;

/* 13. List every match with the goals scored by each team as shown (table is
       not included here in my code). This will use "CASE WHEN" which has not been
       explained in any previous exercises. */
SELECT
  game.mdate,
  game.team1,
  SUM(CASE WHEN goal.teamid = game.team1 THEN 1 ELSE 0 END) AS score1,
  game.team2,
  SUM(CASE WHEN goal.teamid = game.team2 THEN 1 ELSE 0 END) AS score2
FROM game
LEFT JOIN goal
  ON game.id = goal.matchid
GROUP BY
  game.mdate,
  goal.matchid,
  game.team1,
  game.team2;
