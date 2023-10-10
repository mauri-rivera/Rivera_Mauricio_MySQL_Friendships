use friends;

SELECT * FROM users;
SELECT * FROM friendships;

SELECT us1.first_name AS first_name, us1.last_name AS last_name, us2.first_name AS friend_first_name, us2.last_name AS friend_last_name 
FROM friendships f 
JOIN users us1 ON f.user_id = us1.id
JOIN users us2 ON f.friend_id = us2.id;

/* Devuelva a todos los usuarios que son amigos de Kermit, asegúrese de que sus nombres se muestren en los resultados. */

SELECT * FROM users;
SELECT * FROM users WHERE users.first_name = 'Kermit';

SELECT us1.first_name AS first_name, us1.last_name AS last_name 
FROM friendships f 
JOIN users us1 ON f.user_id = us1.id
JOIN users us2 ON f.friend_id = us2.id
WHERE f.friend_id = 4;

/* Devuelve el recuento de todas las amistades. */

SELECT COUNT(*)
FROM friendships f 
JOIN users us1 ON f.user_id = us1.id
JOIN users us2 ON f.friend_id = us2.id;

/* Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark.*/

INSERT INTO users (first_name, last_name) VALUES ('Mauricio', 'Rivera'); 
SELECT * FROM users;

SELECT * FROM friendships;
INSERT INTO friendships (user_id, friend_id) VALUES (6, 2);
INSERT INTO friendships (user_id, friend_id) VALUES (6, 4);
INSERT INTO friendships (user_id, friend_id) VALUES (6, 5);

SELECT us1.first_name AS first_name, us1.last_name AS last_name, us2.first_name AS friend_first_name, us2.last_name AS friend_last_name 
FROM friendships f 
JOIN users us1 ON f.user_id = us1.id
JOIN users us2 ON f.friend_id = us2.id;

/* Devuelve a los amigos de Eli en orden alfabético. */

SELECT * FROM users;

SELECT us3.first_name AS first_name, us3.last_name AS last_name
FROM friendships f 
JOIN users us1 ON f.user_id = us1.id
JOIN users us2 ON f.friend_id = us2.id
JOIN users us3 ON us3.id = f.user_id OR us3.id = f.friend_id
WHERE f.user_id = 2 OR f.friend_id = 2
GROUP BY us3.id HAVING us3.first_name != 'Eli'
ORDER BY us3.first_name ASC; 

/* Eliminar a Marky Mark de los amigos de Eli. */

SELECT us3.first_name AS first_name, us3.last_name AS last_name
FROM friendships f 
JOIN users us1 ON f.user_id = us1.id
JOIN users us2 ON f.friend_id = us2.id
JOIN users us3 ON us3.id = f.user_id OR us3.id = f.friend_id
WHERE f.user_id = 2 OR f.friend_id = 2
GROUP BY us3.id HAVING us3.first_name != 'Eli' AND CONCAT(us3.first_name, " ", us3.last_name) != 'Marky Mark'
ORDER BY us3.first_name ASC; 

/*Devuelve todas las amistades, mostrando solo el nombre y apellido de ambos amigos*/

SELECT us1.first_name AS first_name, us1.last_name AS last_name, us2.first_name AS friend_first_name, us2.last_name AS friend_last_name 
FROM friendships f 
JOIN users us1 ON f.user_id = us1.id
JOIN users us2 ON f.friend_id = us2.id;