-- 1. Finding the 5 oldest users

SELECT 
  users, 
  created_at 
FROM users 
ORDER BY created_at 
LIMIT 5;

-- 2. What day of the week do most users register on?

SELECT 
  DAYNAME(created_at) AS day, 
  COUNT(DAYNAME(created_at)) AS count 
FROM users 
GROUP BY day 
ORDER BY count DESC;

-- 3. Find the users who have never posted a photo

SELECT username 
FROM users 
LEFT JOIN photos ON users.id = photos.user_id 
WHERE ISNULL(image_url);

-- 4. We're runnin g anew contest to see who can get the most likes on a single photo.

SELECT 
  username, 
  image_url, 
  COUNT(*) AS likes 
FROM photos 
JOIN users 
  ON users.id = photos.user_id 
JOIN likes 
  ON photos.id = likes.photo_id 
GROUP BY image_url, username 
ORDER BY likes DESC 
LIMIT 1;

-- 5. How many times does the average user post?

SELECT (
  SELECT Count(*) 
  FROM photos
) / (
  SELECT Count(*) 
  FROM users
) AS avg;

-- 6. What are the top 5 most commonly used hashtags?

SELECT 
  name, 
  COUNT(name) AS used 
FROM tags 
JOIN photo_tags 
  ON tags.id = photo_tags.tag_id 
GROUP BY name 
ORDER BY used DESC 
LIMIT 5;

-- 7. Find users who have liked every single photo on the site.

SELECT 
  username, 
  COUNT(username) as user_likes 
FROM users 
JOIN likes 
  ON users.id = likes.user_id 
GROUP BY username 
HAVING user_likes = (
  SELECT COUNT(*) FROM photos
);