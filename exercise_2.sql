use funimation;
create table inventory(
item_name varchar(25),
item decimal(6,2),
quantity int
);

#printing the current date
select curdate();

#printing the current time
select curtime(); 

select day(curdate());

select dayofweek(curdate());

#print out the name of the day
select date_format(curdate(),'%a');

#printing date in the format M/D/Y

#select concat(month(curdate()),"/",day(curdate()),"/",year(curdate());
select date_format(curdate(),'%m/%d/%y');

#when we want to see the whole year
select date_format(curdate(),'%m/%d/%Y');

#select concat(date_format(curdate(),'%m','/',date_format(curdate(),'%d'),'/',date_format(curdate(),'%y')); 
#select date_format(curdate(),'%m');

#select dateformat(now(),'%y');

#lets print our date in more lanugage manner
select date_format(curdate(),'%M %D at %k:%i');

create table tweets_table(
	tweet varchar(150),
    user_name varchar(15),
    tweeted_time timestamp default current_timestamp
    );

show tables;

desc tweets_table;