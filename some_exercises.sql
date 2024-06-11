use book_shop;

select count(distinct title) from books;


select concat(author_lname,author_fname) as full_name,avg(released_year) from books
group by full_name;

select count(title) as counts,released_year from books group by released_year;

select sum(stock_quantity) from books;

select count(distinct title) from books;

select concat(author_lname," ",author_fname) as full_name,title,pages from books
where pages=(select max(pages) from books);

select released_year as year,count(*) as books,avg(pages) as "avg pages"  from books
group by released_year order by released_year;