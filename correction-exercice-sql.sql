-- 1 - Écrivez une requête qui retourne toutes les informations des acteurs 
-- qui ont joué un rôle dans le film «Annie Hall».

SELECT 
    p.*
FROM
    movie_casting mc
        INNER JOIN
    movie m ON m.id = mc.movie_id
        INNER JOIN
    people p ON p.id = mc.people_id
WHERE
    m.title LIKE '%Annie Hall%';
 

-- 2 - Écrivez une requête qui retourne le nom et prénom du réalisateur 
-- qui a réalisé un film dont il a joué un rôle.

SELECT DISTINCT
    CONCAT(p.firstname, ' ', p.lastname) AS fullname
FROM
    movie_casting mc
        INNER JOIN
    people p ON p.id = mc.people_id
        INNER JOIN
    movie_direction md ON md.movie_id = mc.movie_id
WHERE
    mc.people_id IN (SELECT 
            people_id
        FROM
            movie_direction);
-- 3 - Écrivez une requête qui retourne tous les films qui ne sont pas américain.
SELECT 
    *
FROM
    movie
WHERE
    country NOT LIKE 'US';

-- 4 - Écrivez une requête qui retourne le titre, l'année, la date de sortie du film, 
-- le réalisateur et l'acteur des films dont le critique est inconnu.
SELECT 
    m.title,
    CONCAT(director.firstname,
            ' ',
            director.lastname) AS director,
    m.year,
    m.released_at,
    CONCAT(actor.firstname, ' ', actor.lastname) AS actor
FROM
    movie m
        INNER JOIN
    movie_casting mc ON mc.movie_id = m.id
        INNER JOIN
    movie_direction md ON md.movie_id = m.id
        INNER JOIN
    people actor ON actor.id = mc.people_id
        INNER JOIN
    people director ON director.id = md.people_id
WHERE
    m.id NOT IN (SELECT DISTINCT
            movie_id
        FROM
            movie_review);

-- 5 - Écrivez une requête qui retourne le titre, l'année, la date de sortie, 
-- le réalisateur et l'acteur des films dont le critique est connu.

SELECT 
    m.title,
    CONCAT(director.firstname,
            ' ',
            director.lastname) AS director,
    m.year,
    m.released_at,
    CONCAT(actor.firstname, ' ', actor.lastname) AS actor
FROM
    movie m
        INNER JOIN
    movie_casting mc ON mc.movie_id = m.id
        INNER JOIN
    movie_direction md ON md.movie_id = m.id
        INNER JOIN
    people actor ON actor.id = mc.people_id
        INNER JOIN
    people director ON director.id = md.people_id
WHERE
    m.id IN (SELECT 
            DISTINCT movie_id
        FROM
            movie_review);

-- 6 - Écrivez une requête qui retourne les titres des films réalisés 
-- par le réalisateur Woddy Allen.
SELECT 
    m.title
FROM
    movie_direction md
        INNER JOIN
    movie m ON m.id = md.movie_id
        INNER JOIN
    people p ON p.id = md.people_id
WHERE
    p.firstname LIKE '%Woody%'
        AND p.lastname LIKE '%Allen%';

-- 7 - Écrivez une requête qui retourne les années par ordre croissant 
-- ou au moins un film a été produit et qui ont reçu une note de plus de 3 étoiles.

SELECT 
    m.year, AVG(stars) AS average_film
FROM
    movie_review mr
        INNER JOIN
    movie m ON m.id = mr.movie_id
GROUP BY m.year
HAVING average_film >= 3;

-- 8 - Écrivez une requête qui retourne 
-- les titres des films qui n'ont pas de notes.

SELECT 
    m.title,
    CONCAT(director.firstname,
            ' ',
            director.lastname) AS director,
    m.year,
    m.released_at,
    CONCAT(actor.firstname, ' ', actor.lastname) AS actor
FROM
    movie m
        INNER JOIN
    movie_casting mc ON mc.movie_id = m.id
        INNER JOIN
    movie_direction md ON md.movie_id = m.id
        INNER JOIN
    people actor ON actor.id = mc.people_id
        INNER JOIN
    people director ON director.id = md.people_id
WHERE
    m.id NOT IN (SELECT DISTINCT
            movie_id
        FROM
            movie_review);
-- 9 - Écrivez une requête qui retourne 
-- les noms de tous les utlisateurs qui n'ont pas noté.

SELECT 
    *
FROM
    user
WHERE
    id NOT IN (SELECT 
            user_id
        FROM
            movie_review);

-- 10 - Écrivez une requête qui retourne les utilisateurs qui ont noté plus d'un film.
SELECT 
    CONCAT(u.firstname, ' ', u.lastname) AS fullname,
    COUNT(*) AS nb_user_note
FROM
    movie_review mr
        INNER JOIN
    user u ON u.id = mr.user_id
GROUP BY user_id
HAVING nb_user_note > 1;

-- 11 - Écrivez une requête qui retourne le titre du film 
-- qui a le plus grand nombre d'étoiles par genre 
-- et le titre du film apparaît par ordre alphabétique.
SELECT 
    g.type, m.title, MAX(mr.stars) as best_film
FROM
    movie_review mr
        INNER JOIN
    movie m ON m.id = mr.movie_id
        INNER JOIN
    movie_genre mg ON mg.movie_id = m.id
        INNER JOIN
    genre g ON g.id = mg.genre_id
GROUP BY mg.genre_id;


-- 12 - Écrivez une requête qui retourne les noms de tous les utilisateurs 
-- qui ont noté le film American Beauty.
SELECT 
    u.firstname, u.lastname
FROM
    movie_review mr
        INNER JOIN
    movie m ON m.id = mr.movie_id
        INNER JOIN
    user u ON u.id = mr.user_id
WHERE
    m.title LIKE '%American Beauty%';

-- 13 - Écrivez une requête qui retourne le prénom, nom et role joué de tous 
-- les acteurs qui ont joué dans le film «Annie Hall».
SELECT 
    p.firstname, p.lastname, mc.starred_as
FROM
    people p
        INNER JOIN
    movie_casting mc ON mc.people_id = p.id
        INNER JOIN
    movie m ON m.id = mc.movie_id
WHERE
    m.title LIKE '%Annie Hall%';


-- 14 - Écrivez une requête qui retourne le prénom et nom du réalisateur 
-- de "Eyes Wide Shut" ainsi que l'année de sortie du film du film
SELECT 
    CONCAT(p.firstname, ' ', p.lastname) AS director,
    m.title,
    m.year
FROM
    movie m
        INNER JOIN
    movie_direction md ON md.movie_id = m.id
        INNER JOIN
    people p ON p.id = md.people_id
WHERE
    title LIKE '%Eyes Wide Shut%'


-- 15 - Écrivez une requête qui retourne le nom du film et 
-- du réalisateur (prénom et nom) dont le rôle de Sean Maguire a été joué.
SELECT 
    m.title,
    CONCAT(director.firstname,
            ' ',
            director.lastname) AS director
FROM
    movie_direction md
        INNER JOIN
    movie m ON m.id = md.movie_id
        INNER JOIN
    people director ON director.id = md.people_id
WHERE
    md.movie_id = (SELECT 
            m.id
        FROM
            movie_casting mc
                INNER JOIN
            movie m ON m.id = mc.movie_id
        WHERE
            mc.starred_as LIKE '%Sean Maguire%')


-- 16 - Écrivez une requête qui retourne tous les acteurs qui n'ont joué 
-- dans aucun film entre 1990 et 2000.
SELECT 
    p.firstname, p.lastname
FROM
    people p
        INNER JOIN
    movie_casting mc ON mc.people_id = p.id
        INNER JOIN
    movie m ON m.id = mc.movie_id
WHERE
    m.year NOT BETWEEN 1990 AND 2000;
  

-- 17 - Écrivez une requête qui retourne le prénom et le nom des réalisateurs 
-- avec le nombre de genres de films dirigés 
-- et classer le résultat par ordre alphabétique avec le prénom et le nom du réalisateur.
SELECT 
    CONCAT(p.firstname, ' ', p.lastname) AS director,
    COUNT(*) nb_genre_directed
FROM
    movie_direction md
        INNER JOIN
    people p ON p.id = md.people_id
        INNER JOIN
    movie m ON m.id = md.movie_id
        INNER JOIN
    movie_genre mg ON mg.movie_id = m.id
GROUP BY mg.genre_id
ORDER BY director;

-- 18 - Écrivez une requête qui retourne tous les films avec l'année de sortie, 
-- l'année de production et le(s) genre(s).
SELECT 
    m.year, m.title, g.type
FROM
    movie m
        INNER JOIN
    movie_genre mg ON mg.movie_id = m.id
        INNER JOIN
    genre g ON g.id = mg.genre_id
ORDER BY year DESC;

-- 19 - Écrivez une requête qui retourne tous les films avec l'année de sortie, 
-- le(s) genre(s) et le nom du réalisateur.
SELECT 
    m.title,
    YEAR(m.released_at) AS released_year,
    CONCAT(p.firstname, ' ', p.lastname) AS direction
FROM
    movie m
        INNER JOIN
    movie_genre mg ON mg.movie_id = m.id
        INNER JOIN
    genre g ON g.id = mg.genre_id
        INNER JOIN
    movie_direction md ON md.movie_id = m.id
        INNER JOIN
    people p ON p.id = md.people_id
ORDER BY released_year DESC;

-- 20 - Écrivez une requête qui retourne tous les films avec le titre, l'année, 
-- la date de sortie, la durée du film et le prénom et le nom du réalisateur 
-- sortis avant le 1er janvier 1989, et triez l'ensemble des résultats 
-- en fonction de la date de sortie de la date la plus récente à la plus ancienne
SELECT 
    m.year,
    m.released_at,
    CONCAT(m.time, ' minutes'),
    m.title,
    g.type,
    p.firstname,
    p.lastname
FROM
    movie m
        INNER JOIN
    movie_genre mg ON mg.movie_id = m.id
        INNER JOIN
    genre g ON g.id = mg.genre_id
        INNER JOIN
    movie_direction md ON md.movie_id = m.id
        INNER JOIN
    people p ON p.id = md.people_id
WHERE
    m.released_at < '1989-01-01'
ORDER BY m.released_at DESC;

-- 21 - Écrivez une requête qui calcule la durée moyenne de chaque genre de film
SELECT 
    g.type, ROUND(AVG(m.time)) as time_film
FROM
    movie m
        INNER JOIN
    movie_genre mg ON mg.movie_id = m.id
        INNER JOIN
    genre g ON g.id = mg.genre_id
GROUP BY mg.genre_id
-- 22 - Écrivez une requête qui retourne le nombre de films et leur note moyenne par genre et 
-- dont la note est supérieur à 4.
SELECT 
    m.title,
    CONCAT(director.firstname,
            ' ',
            director.lastname) AS director
FROM
    movie_direction md
        INNER JOIN
    movie m ON m.id = md.movie_id
        INNER JOIN
    people director ON director.id = md.people_id
WHERE
    md.movie_id = (SELECT 
            m.id
        FROM
            movie_casting mc
                INNER JOIN
            movie m ON m.id = mc.movie_id
        WHERE
            mc.starred_as LIKE '%Sean Maguire%')
