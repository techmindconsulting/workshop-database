-- 1 - Écrivez une requête qui retourne le nom et l'année des films
SELECT 
    title, year
FROM
    movie;

-- 2 - Écrivez une requête qui retourne l'année de sortie du film American Beauty
SELECT 
    title, YEAR(released_at) AS year
FROM
    movie
WHERE
    title LIKE '%American Beauty%';

-- 3 - Écrivez une requête qui retourne le(s) film(s) sorti en 1999.
SELECT 
    *
FROM
    movie
WHERE
    YEAR(released_at) = 1999;

-- 4 - Écrivez une requête qui retourne le(s) film(s) sortis avant 1998.
SELECT 
    *
FROM
    movie
WHERE
    YEAR(released_at) < 1998;

-- 5 - Écrivez une requête qui retourne le nom de tous les utilisateurs qui ont commenté des films
SELECT DISTINCT
    firstname, lastname
FROM
    movie_review mc
        INNER JOIN
    user u ON u.id = mc.user_id;

-- 6 - Écrivez une requête qui retourne le nom de tous les utilisateurs qui ont attribué 6 étoiles ou plus à un film
SELECT DISTINCT
    firstname, lastname
FROM
    movie_review mc
        INNER JOIN
    user u ON u.id = mc.user_id
WHERE
    stars >= 6;
 
-- 7 - Écrivez une requête qui retourne les titres de tous les films qui n'ont pas de notes
SELECT 
    title
FROM
    movie
WHERE
    id NOT IN (SELECT 
            movie_id
        FROM
            movie_review
        WHERE
            stars IS NOT NULL);

-- 8 - Ecrivez une requête qui retourne les titres des films avec les ID 5, 6, 8
SELECT 
    title
FROM
    movie
WHERE
    id IN (5 , 6, 8);

-- 9 - Écrivez une requête qui retourne une liste de film avec l'année dont le titre des films contient les mots "Boogie" ou "Nights".
SELECT 
    title, year
FROM
    movie
WHERE
    title LIKE '%Boogie%' OR '%Nights%';

-- 10 - Écrivez une requête qui retourne l'ID d'un acteur ou membre de la direction dont le prénom est 'Woody' et le nom de famille est 'Allen'
SELECT 
    id, firstname, lastname
FROM
    people
WHERE
    firstname LIKE '%Woody%'
        AND lastname LIKE '%Allen%';  
