show databases;

use ig_clone;
show tables;
desc photos;

#ops we can do with the table
-- this is for extracting the older account user in our database
select username,created_at from users order by created_at limit 5;

SELECT 
    DAYNAME(created_at) AS name_day, COUNT(*) AS num_reg
FROM
    users
GROUP BY name_day;
-- ... same code but with more penash code
#more penash code
SELECT 
    DAYNAME(created_at) AS name_day, COUNT(*) AS num_reg
FROM
    users
GROUP BY name_day
order by num_reg desc limit 2;

#for extracting the users who are not active
SELECT 
    username
FROM
    users
        LEFT JOIN
    photos ON users.id = photos.user_id
WHERE
    image_url IS NULL;

-- same problem but with more structure code
SELECT 
    username
FROM
    photos
        right JOIN
    users ON users.id = photos.user_id
WHERE
    photos.image_url IS NULL;

#step for finding the number of step
SELECT 
    photos.id, image_url, COUNT(*) AS tot_like_got
FROM
    photos
        INNER JOIN
    likes ON likes.photo_id = photos.id
GROUP BY photos.id
ORDER BY tot_like_got DESC
LIMIT 1;

#now lets find out who it belongs to
SELECT 
    users.username,photos.id, image_url, COUNT(*) AS tot_like_got
FROM
    photos
        INNER JOIN
    likes ON likes.photo_id = photos.id
    INNER JOIN users on  photos.user_id=users.id
GROUP BY photos.id
ORDER BY tot_like_got DESC
;

#for getting the average posts 
SELECT 
    (SELECT 
            COUNT(*)
        FROM
            photos) / (SELECT 
            COUNT(*)
        FROM
            users) AS avg;

SELECT 
    tags.tag_name, COUNT(*) as total_used
FROM
    tags
        INNER JOIN
    photo_tags ON photo_tags.tag_id = tags.id
GROUP BY tags.id
ORDER BY total_used desc limit 5;

#lets check for the accounts...bascially accounts that liked every pictures posted
SELECT 
    username, COUNT(*) AS tot_liked
FROM
    users
        INNER JOIN
    likes ON likes.user_id = users.id
GROUP BY users.id
HAVING tot_liked = 257;

#make more daynamic
SELECT 
    username, COUNT(*) AS tot_liked
FROM
    users
        INNER JOIN
    likes ON likes.user_id = users.id
GROUP BY users.id
HAVING tot_liked = (select count(*) from photos);