use book_shop;
show tables;

select title from books where released_year<1980;

#select title from books where author_lname
select title,released_year from books where author_lname='lahiri' and released_year>2000;

select title,author_lname from books  where author_lname="eggers" or author_lname="chabon";

select title,pages from books where pages between 100 and 200;

select title,author_lname from books where author_lname like 'C%' or author_lname like 'S%';
#another way of doing this is
select title,author_lname from books
where substring(author_lname,1,1) in ('c','s');


select title,author_lname,case
when title like "%stories%" then "short stories"
when title="just kids" or title='A Heartbreaking Work of Staggering Genius' then "memoir"
else "novel"
end as "type"
from books; 

SELECT 
    author_fname,
    author_lname,
    CASE
        WHEN COUNT(*) = 1 THEN CONCAT(1, ' book')
        ELSE CONCAT(COUNT(*), ' books')
    END AS counting
FROM
    books
WHERE
    author_fname IS NOT NULL
GROUP BY author_fname , author_lname;