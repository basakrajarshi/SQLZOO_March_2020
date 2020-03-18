1. SELECT 
      matchid,
      player 
   FROM goal g
     WHERE teamid = 'GER'

2. SELECT id,stadium,team1,team2
     FROM game g
   WHERE id = 1012 
   
3. SELECT player, teamid, stadium, mdate
     FROM game 
     JOIN goal ON (id=matchid)
   WHERE teamid = 'GER'
 
4. SELECT team1, team2, player
     FROM game
     JOIN goal ON (id=matchid)
   WHERE player LIKE 'Mario%' 
   
5. SELECT player, teamid, coach, gtime
     FROM goal 
     JOIN eteam ON (teamid=id)
   WHERE gtime<=10
   
6. SELECT mdate, teamname
     FROM game
     JOIN eteam ON (team1 = eteam.id)
   WHERE coach = 'Fernando Santos'
   
7. SELECT player
     FROM goal
     JOIN game ON (matchid=id)
   WHERE stadium = 'National Stadium, Warsaw'
   
8. SELECT DISTINCT(player)
     FROM game 
     JOIN goal ON matchid = id 
    WHERE (teamid = team1 AND team2 = 'GER')
    OR (teamid = team2 AND team1 = 'GER')
    
9. SELECT teamname, COUNT(player)
     FROM eteam 
     JOIN goal ON id=teamid
   GROUP BY teamname
   
10. SELECT stadium, COUNT(gtime)
       FROM game
       JOIN goal ON (id=matchid)
    GROUP BY stadium
    
11. SELECT matchid, mdate, COUNT(gtime)
       FROM game 
       JOIN goal ON matchid = id 
    WHERE (team1 = 'POL' OR team2 = 'POL')
    GROUP BY matchid
    
12. SELECT matchid, mdate, COUNT(gtime)
      FROM game
      JOIN goal ON matchid=id
    WHERE teamid = 'GER'
    GROUP BY matchid
      
13. SELECT mdate,
           team1,
           SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
           team2,
           SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
      FROM game 
      LEFT OUTER JOIN goal ON matchid = id
    GROUP BY id
    ORDER BY mdate, matchid, team1, team2
