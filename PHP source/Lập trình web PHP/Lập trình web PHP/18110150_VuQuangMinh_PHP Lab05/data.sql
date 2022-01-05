-- Create database vqm_fb_mini and all its tables

create database if not exists vqm_fb_mini;
use vqm_fb_mini;

create table if not exists users (
    user_id int auto_increment primary key,
    user_first_name nvarchar(30) default null,
    user_last_name nvarchar(30) default null,
    user_email varchar(30) default null,
    user_birthday date default null,
    user_password varchar(30) default null,
    user_gender int default null,
    user_avatar_link varchar(100) default null,
    user_bg_link varchar(100) default "img/user_bg.jpg",
    user_theme varchar(30) default "primary",
    user_otp varchar(10) default null
);

create table if not exists relationships (
    rlt_id int auto_increment primary key,
    rlt_user1_id int default null,
    rlt_user2_id int default null,
    rlt_status int default null
);

alter table relationships
add constraint FK_users_rlt1
foreign key (rlt_user1_id) references users(user_id);

alter table relationships
add constraint FK_users_rlt2
foreign key (rlt_user2_id) references users(user_id);

create table if not exists posts (
    post_id int auto_increment primary key,
    post_user_id int default null,
    post_content text default null,
    post_img varchar(100) default null,
    post_time datetime default CURRENT_TIMESTAMP()
);

alter table posts
add constraint FK_users_posts
foreign key (post_user_id) references users(user_id);

create table if not exists chats (
    chat_id int auto_increment primary key,
    chat_user1_id int default null,
    chat_user2_id int default null,
    chat_content_id int default null
);

alter table chats
add constraint FK_users_chat1
foreign key (chat_user1_id) references users(user_id);

alter table chats
add constraint FK_users_chat2
foreign key (chat_user2_id) references users(user_id);

-- chat_individual_contents = cic
create table if not exists chat_individual_contents (
    cic_id int auto_increment primary key,
    cic_user_id int default null,
    cic_content text default null,
    cic_img_link varchar(100) default null,
    cic_time datetime default CURRENT_TIMESTAMP()
);

alter table chats
add constraint FK_chats_cic
foreign key (chat_content_id) references chat_individual_contents(cic_id);

alter table chat_individual_contents
add constraint FK_users_cic
foreign key (cic_user_id) references users(user_id);

-- insert samples
insert into users(user_first_name, user_last_name, 
user_email, user_password,
user_gender, 
user_avatar_link, user_bg_link)

values ('Minh', 'Vũ Quang', 'vuquangminh872000@gmail.com', 'Tf6geYkD', 1, 'img/usr1_avatar.jpeg', 'img/usr1_bg.jpeg'),
('Albert', 'Einstein', 'minhvu872000@gmail.com', 'znZhJRi3', 1, 'img/usr2_avatar.jpeg', 'img/usr2_bg.jpeg')