# the min max jounrey
use book_shop;
#show tables;

#desc books;

#the min
select min(released_year) from books;

#the max
select max(stock_quantity) from books;

select min(author_lname) as minimum ,max(author_lname) as maximum from books;

#lets try sub-query for the firs time
select title,pages from books where pages=(select max(pages) from books);

select title,released_year from books where released_year=(select min(released_year) from books);    

select min(released_year) from books;

select author_lname,count(*) from books group by author_lname,author_fname;

select concat(author_lname," ",author_fname) as full_n,count(*) from books group by full_n;

select count(book_id) from books;
select book_id from books;

#lets print out each authors earliest book
select author_lname,author_fname,min(released_year) from books
group by author_lname,author_fname;

#we can change it into latest release of the authors book
select author_lname,max(released_year) from books
group by author_lname,author_fname;

#choose the earliest and latest books
select author_fname,min(released_year),max(released_year),count(*) as number_books from books group by author_fname,author_lname;

# using SUM

#lets see how many each write has wrrite
select concat(author_lname,author_fname) as full_name,sum(pages) from books
group by full_name;

#using average
select avg(stock_quantity) from books;

## movre calculation in this field
select released_year,avg(stock_quantity) as average_sales,count(*) as number_of_books from books
group by released_year;