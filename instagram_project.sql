create database ig_clone;
use ig_clone;
#show tables;

create table users(
	id int primary key auto_increment,
    username varchar(255) not null unique ,
    created_data timestamp default now()
    );
    
create table photos(
	id int primary key auto_increment,
    image_url varchar(255) not null,
    user_id int not null,
    create_at timestamp default now(),
    foreign key (user_id) references users(id)
    );

create table comments(
    id int primary key auto_increment,
    comment_text varchar(500) not null,
    user_id int not null,
    photo_id int not null,
    created_at timestamp default now(), 
    foreign key (user_id) references users(id),
    foreign key(photo_id) references photos(id)
    );

create table likes(
    photo_id int not null,
    user_id int not null,
    created_at timestamp default now(),
    foreign key (photo_id) references photos(id),
    foreign key(user_id) references users(id),
    #this is the primary key constring its like only one combo of user and photos are allowed
	primary key(user_id,photo_id)  
);

CREATE TABLE follows (
    followe_id INT NOT NULL,
    follower_id INT NOT NULL,
    created_at timestamp default now(),
    FOREIGN KEY (followe_id)
        REFERENCES users (id),
    FOREIGN KEY (follower_id)
        REFERENCES users (id),
    PRIMARY KEY (follower_id , followe_id)
);

CREATE TABLE tags (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tag_name VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

create table photo_tags(photo_id int not null,
tag_id int not null,
foreign key (photo_id) references photos(id),
 foreign key (tag_id) references tags(id),
 primary key(photo_id,tag_id));
    
show tables;
    
    