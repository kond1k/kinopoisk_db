-- Список фильмов определенного жанра (Horror)
SELECT * FROM film_genres fg
JOIN films f
ON fg.film_id = f.id
WHERE fg.genre_id = (SELECT id FROM genres WHERE name = 'Horror')

-- Список актеров, игравших в определенном фильме(7)
SELECT * FROM film_actors fa
JOIN actors a
ON fa.actor_id = a.id
WHERE fa.film_id = 7


-- Список актеров, игравших в определенном жанре (Horror)
SELECT a.firstname, a.lastname, (SELECT title FROM films WHERE id = fa.film_id) as film FROM film_actors fa
JOIN actors a
ON fa.actor_id = a.id
WHERE fa.film_id IN (SELECT film_id FROM film_genres WHERE genre_id = (SELECT id FROM genres WHERE name = 'Horror'))


-- Число фильмов каждого жанра
SELECT COUNT(*), (SELECT name FROM genres g WHERE g.id = fg.genre_id) as genre
FROM film_genres fg
JOIN films f 
ON fg.film_id = f.id
GROUP BY fg.genre_id

-- Число жанров у фильма 
SELECT COUNT(*), (SELECT title FROM films WHERE fg.film_id = id) 
FROM film_genres fg
JOIN films f 
ON fg.film_id = f.id
GROUP BY fg.film_id

-- Число комментарий от каждого пользователя
SELECT COUNT(*) as comments, u.nickname
FROM comments c
JOIN users u
ON u.id = c.from_user_id
GROUP BY u.nickname
ORDER BY comments DESC;

-- Фильм, который хотят посмотреть больше всего человек
SELECT COUNT(*) as total, f.title
FROM film_status fs
JOIN films f 
ON fs.target_film_id = f.id
WHERE fs.status = 'want watch'
GROUP BY f.title
ORDER BY total DESC
LIMIT 1;








