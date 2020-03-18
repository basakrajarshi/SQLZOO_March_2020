1. SELECT id, 
          title
   FROM movie
   WHERE yr=1962
   
2. SELECT yr
   FROM movie
   WHERE title = 'Citizen Kane'
   
3. SELECT id, title, yr
   FROM movie
   WHERE title LIKE 'Star Trek%'
   ORDER BY yr
   
4. SELECT id 
   FROM actor
   WHERE name = 'Glenn Close'
   
5. SELECT id 
   FROM movie
   WHERE title = 'Casablanca'
   
6. SELECT name
   FROM actor
   JOIN casting ON actorid = id
   WHERE movieid = 11768
   
7. SELECT name
   FROM actor
   JOIN casting ON casting.actorid = actor.id
   JOIN movie ON casting.movieid = movie.id
   WHERE title = 'Alien'
   
8. SELECT title
   FROM movie
   JOIN casting ON movie.id = casting.movieid
   JOIN actor ON actor.id = casting.actorid
   WHERE name = 'Harrison Ford'
   
9. SELECT title
   FROM movie
   JOIN casting ON movie.id = casting.movieid
   JOIN actor ON actor.id = casting.actorid
   WHERE name = 'Harrison Ford'
   AND ord <> 1
   
10. SELECT title, name
    FROM movie
    JOIN casting ON movie.id = casting.movieid
    JOIN actor ON actor.id = casting.actorid
    WHERE yr = 1962
    AND ord = 1
    
11. SELECT yr,COUNT(title) 
    FROM movie 
    JOIN casting ON movie.id=movieid
    JOIN actor   ON actorid=actor.id
    WHERE name='Rock Hudson'
    GROUP BY yr
    HAVING COUNT(title) > 2
    
12. SELECT title, name 
    FROM casting
    JOIN movie ON movie.id = casting.movieid
    JOIN actor ON actor.id = casting.actorid
    WHERE ord = 1
    AND movieid IN (
      SELECT movieid 
      FROM casting
      JOIN actor ON actor.id = casting.actorid
      JOIN movie ON movie.id = casting.movieid
      WHERE name='Julie Andrews')
      
13. SELECT name
    FROM actor
    JOIN casting ON actor.id = casting.actorid
    WHERE ord = 1
    GROUP BY name
    HAVING COUNT(name) >= 15
    ORDER BY name
    
14. SELECT title, COUNT(actorid)
    FROM movie
    JOIN casting ON movie.id = casting.movieid
    WHERE yr = 1978
    GROUP BY title
    ORDER BY COUNT(actorid) DESC, title
    
15. SELECT name
    FROM actor 
    JOIN casting ON actor.id = casting.actorid
    WHERE movieid IN (SELECT movieid
                      FROM casting
                      JOIN actor ON actor.id = casting.actorid
                      WHERE name = 'Art Garfunkel')
    AND name <> 'Art Garfunkel'
    
    
