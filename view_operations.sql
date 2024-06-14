show databases;

use tv_db;

show tables;

desc reviewers;

desc reviews;

desc series;

#create virtual table
CREATE VIEW full_review AS
    SELECT 
        first_name, last_name, title, rating
    FROM
        reviews
            JOIN
        reviewers ON reviewers.id = reviews.reviewer_id
            JOIN
        series ON series.id = reviews.series_id;

select genre,avg(rating) from full_review group by genre;

desc series;

CREATE OR REPLACE VIEW ordered_series AS
    SELECT 
        title, released_year, genre
    FROM
        series
    ORDER BY released_year DESC;
    
    #another way or altering the view table is
    alter view  ordered_series as select title,released_year,genre as year from series;
    
    select * from ordered_series;
    
SELECT 
    title, AVG(rating), COUNT(rating) AS rate_count
FROM
    full_review
GROUP BY title
HAVING COUNT(rating) > 1;


#operations on grouping
SELECT 
    released_year, genre, AVG(rating), genre
FROM
    full_review
GROUP BY released_year , genre;

SELECT 
    released_year, genre, AVG(rating), genre
FROM
    full_review
GROUP BY released_year , genre WITH ROLLUP;

#set the selection into None
set session sql_mode="";
SELECT 
    title, rating
FROM
    series
        INNER JOIN
    reviews ON reviews.series_id = series.id
GROUP BY title;

#SETTING THE SESSION
set session sql_mode="ONLY_FULL_GROUP_BY";

#the session one
select @@session.sql_mode;

#the glocbal one
select @@global.sql_mode;