show databases;

drop table customers;
drop table orders;

use shop;

create table customers(
id int primary key auto_increment,
first_name varchar(50),
last_name varchar(50),
email varchar(50)
);

create table orders(
id int primary key auto_increment,
order_date date,
amount decimal(8,2),
customer_id int,
foreign key (customer_id) references customers(id) 
);

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);

show tables;

#inner joins
select first_name,last_name, order_date,amount,email from customers inner join orders on orders.customer_id=customers.id;

#left join
select first_name,last_name,order_date,amount,email from customers left join orders on orders.customer_id=customers.id;


#right join
select first_name,last_name,amount from customers right join orders on orders.customer_id=customers.id;

#cool things to do
select first_name,last_name,ifnull(sum(amount),0) as money_spent from customers left join orders on customers.id=orders.customer_id group by first_name,last_name;

#lets delete and make the tables again
drop table orders;
drop table customers;

create table customers(
id int primary key auto_increment,
first_name varchar(25) not null,
last_name varchar(25) not null,
email varchar(25) not null
);

create table orders(
id int primary key auto_increment,
order_date date,
amount decimal(8,2),
customer_id int,
foreign key (customer_id) references customers(id) on delete cascade
);

#lets insert values here
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);
       
SELECT 
    first_name,
    IFNULL(AVG(grade), 0) AS average,
    CASE  
        WHEN IFNULL(AVG(grade), 0) <= 75 THEN "FAILING" 
        ELSE "PASSING" 
    END AS passing_status 
FROM 
    customers 
LEFT JOIN 
    papers ON papers.student_id = customers.id 
GROUP BY 
    first_name 
ORDER BY 
    average DESC;

SELECT 
    first_name,
    IFNULL(AVG(grade), 0) AS average,
    CASE
        WHEN IFNULL(AVG(grade), 0) <= 75 THEN 'FAILING'
        ELSE 'PASSING'
    END AS passing_status
FROM
    customers
        LEFT JOIN
    papers ON papers.student_id = students.id
GROUP BY first_name
ORDER BY average DESC;