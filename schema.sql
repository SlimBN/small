create table if not exists users (
  id integer primary key auto_increment,
  username varchar(255) unique not null,
  password varchar(255) not null,
  name varchar(255),
  email varchar(255) not null,
  biography text
);

create table if not exists posts (
  id integer primary key auto_increment,
  title varchar(255) not null,
  published boolean not null,
  pub_date datetime not null,
  contents varchar(255) not null, 
  author_id integer not null,
  foreign key(author_id) references users(id)
);

create table if not exists tags (
  id integer primary key auto_increment,
  name varchar(255) not null
);

create table pages (
  id integer primary key auto_increment,
  title varchar(255) not null,
  published boolean not null,
  contents varchar(255) not null
);

create table attachments (
  id integer primary key auto_increment,
  name varchar(255) unique not null,
  file varchar(255) unique not null
);

create table postHasTag (
  id integer primary key auto_increment,
  post_id integer not null,
  tag_id integer not null,
  foreign key(post_id) references posts(id),
  foreign key(tag_id) references tags(id)
);
