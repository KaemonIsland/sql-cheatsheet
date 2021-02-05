-- 1. Finding the 5 oldest users

SELECT users, created_at FROM users ORDER BY created_at LIMIT 5;

-- 2. What day of the week do most users register on?

SELECT DAYNAME(created_at) AS day, COUNT(DAYNAME(created_at)) AS count FROM users GROUP BY day ORDER BY count DESC;

-- 3. Find the users who have never posted a photo

SELECT username FROM users LEFT JOIN photos ON users.id = photos.user_id WHERE ISNULL(image_url);