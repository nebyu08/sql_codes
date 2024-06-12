use book_shop;

create table palindrom(
	name varchar(25) not null check(name=reverse(name)),
    age int not null
    );
    
insert into palindrom(name,age) 
values('sos',12);

select * from palindrom;

#delete from palindrom where age=12;

create table parties3(
	name varchar(25) not null,
    age int not null,
    constraint not_over_18 check(age>18)
    );
    
insert into parties3(name,age)
values("drake",65);

select * from parties3;

CREATE TABLE houses2 (
    purchase INT NOT NULL,
    sales INT NOT NULL,
    CONSTRAINT pur_sale2 CHECK (sales >= purchase)
);

show tables;
desc sign;
#lets rename some table and the turn it back
alter table somthing rename to anon;

alter table anon rename to somthing;

#rename column from table
alter table companies 
rename column name to company_name;

desc companies;

#create table and add constrain into it
create table hh_price(
house_purchase int not null,
house_sale int not null
);

alter table hh_price 
add constraint hs_hp_mo check(house_sale>=house_purchase);

insert into hh_price(house_purchase,house_sale) values(901,900);

select * from hh_price;
