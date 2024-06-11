#show databases;

use funimation;

#show tables;

#desc states;

drop table states;

create table parents(offspring tinyint);

insert into parents values (2),(3),(1),(0),(5);

select * from parents;

create table nums(x float,y double);

insert into nums(x,y) values(12.90,909,912);
insert into nums(x,y) values(1.123,5.923);

select * from nums;

# lets go to date-time 

create table people(
	name varchar(25),
    birthdate date,
    birthtime time,
    birthdt datetime
);

desc people;

insert into people(name,birthdate,birthtime,birthdt) 
values('dread','1985-4-12','12:54:12','1985-4-12 12:54:12');

#delete from people where name='dread';

select * from people;

# i added more data using terminal here
select curtime();
select curdate();
select now();

#or we could just use this for date time
select current_timestamp();

insert into people(name,birthdate,birthtime,birthdt) 
values('shpinks',curdate(),curtime(),now());

select * from people;


#getting the differenc between our dates
select datediff(curdate(),birthdt) from people;

#subtracting and adding
select date_add(birthdate,interval 3 day) from people;

select date_sub(birthdate,interval 3 day) from people;

#desc people;

#finding out when people turn 18 like what year
select birthdate,date_add(birthdate,interval 18 year) as the_date from people;

#lets check out the data time manipulation going on
select timediff(curtime(),birthtime) from people;