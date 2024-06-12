use book_shop;

#using the not operator
select title,author_lname from books where author_lname!='gaiman';

#using the like
select title from books where title like '% %';

#the not like operations
select title from books where title not like '% %';

select title,author_fname from books where title not like '%e%';

#greater than operations
select title from books where pages>300;

select title from books where released_year<2000;

select title from books where released_year>=2000;

select title from books where
	author_fname='Dave' and released_year>2010;

select title from books where
char_length(title) >30;

select title from books where
 char_length(title)>30 or pages>200;
 
 select title,author_fname,pages from books
 where pages<200 or title like '%stories%';
 
 #between ...
 select author_fname,author_lname,title,released_year from books
 where released_year between 2004 and 2005;
 
 #not between 
 select author_fname,title,released_year from books
 where released_year not between 2004 and 2005; 	
 
 #date comparision
 use funimation;
 show tables;
 select birthdate<'2005-05-10' from people;
 select cast('2005-05-10' as time);
 
 #lets use cast more
 select * from people where birthtime between cast('12:00:00' as time) and cast('16:00:00' as time);
 
 #the "in" operator
 use book_shop;
 select database();
 select title,author_lname from books where author_lname in ('carver','lahiri','smith');
 
 #check for yea that is not even
 select title,released_year from books where
 released_year not in (2000,2002,2004,2006,2008,2010,2012,2016);
 
 #now lets make it scalable
 select title,released_year from books where released_year%2 !=0;