-- =====================================
-- Book Management Analysis Project
-- =====================================
-- Author: SUGANTHI K
-- Description: SQL project for fresher practice

-- 1. Create Database
create database book_manage_analyse;
use book_manage_analyse;

-- 2. Authors Table
create table authors (
    author_id int primary key,
    a_name varchar(30) not null,
    a_email_id varchar(60) not null,
    a_dob date,
    a_gender varchar(20),
    a_nationality varchar(40),
    a_official_website varchar(70),
    a_role varchar(30)
);

-- Insert data
insert into authors values
(1,'suga','assdsed@gmail.com','2001-03-04','female','Indian','https://abirami12.com','writer'),
(2,'selvi','feryyjuku@gmail.com','1992-03-04','female','American','https://kavikavi34.com','writer'),
(3,'nenjam','dsferfd@gmail.com','2000-03-04','male','American','https://arunakaran11.com','writer');
select*from authors;

-- 3. Show author name and book title, including authors without books.
select a.a_name, b.b_name
from authors a
left join books b on a.author_id = b.b_author_id;

--4.Publishers Table
create table publishers(
       publish_id int primary key,
       p_name varchar(20) not null,
       p_country varchar(20),
       p_city varchar(30),
       p_address varchar(50),
       p_website varchar(50),
       p_ph_no bigint
);
--Insert data
insert into publishers values(1,'kavin','usa','new york','1221 sori street','https://www.education.com',+1-2344562345),
insert into publishers values(2,'rajesh','India','mumbai','111 ravi apartment street','https://www.fearasd.com',+91-3549239341),
insert into publishers values(3,'jayam','India','Delhi','342 elankarai street','https://www.worldslove.com',+91-2765323893);
select*from publishers;

--5.Display books along with publisher country only for Indian publishers.
select distinct b_name,p_country
from books b 
inner join publishers p on p.publish_id=b.b_publish_id
where p_country='india'
and b_name is not null;

--6.Book Table
create table books(
        book_id int primary key identity(1001,1),
        b_name varchar(30),
        b_edition_name varchar(20),
        b_release_date date,
        b_book_price decimal(10,2),
        b_current_price decimal(10,2),
        b_award_name varchar(50),
        b_category varchar(50),
        b_country_publish varchar(30),
        b_author_id int foreign key references authors(author_id),
        b_publish_id int foreign key references publishers(publish_id)
);
--Insert data
insert into books values('database system concepts','4th edition','02-05-2005',2500.00,3000.00,
'best database book 2020','education','India',null,1),
insert into books values('13th page','2th edition','03-05-2002',500.00,400.00,
'best fear book','ghost','India',null,3),
insert into books values('Two Worlds apart','5th edition','06-07-2015',1200.00,2000.00,
'best pair 2016','love','korea',3,2);

select*from books

--7.Display book title,book edition name,author name,publisher name.
select b_name as book_title,b_edition_name,a_name as author_name
,p_name as publisher_name 
from books b
inner join authors a on b.b_author_id = a.author_id
inner join publishers p on b.b_publish_id=p.publish_id;

--8.Platforms Table
create table platforms(
       platform_id int,
       platform_name varchar(30),
       website varchar(50) not null),
       p_book_id int foreign key references books(book_id)
);
--Insert data
insert into platforms values(1,'amazon','https://www.amazon12.com',1002)
insert into platforms values(2,'pearson','https://www.pearson.com',1003)
insert into platforms values(3,'o\reilly','https://www.oreily33.com',1001)
select*from platforms

--9.Display authors, books, and platforms using only LEFT JOINs.
select b_name as book_title,a_name,platform_name 
from authors a  
left join books b on a.author_id = b.b_author_id
left join platforms pl on b.book_id=pl.p_book_id;

--10.Stores Table
create table stores(
      store_id int,
      name varchar(30),
      location varchar(30),
      ph_no bigint,
      s_book_id int foreign key references books(book_id)
);

--Insert data
insert into stores values(1,'bookshop','chennai,India',+91-37583776,1003),
insert into stores values(2,'nobel','kerala,India',+91-2435466,1002),
insert into stores values(3,'knowledge','mumbai,India',+91-5768789,1001);
select*from stores;

--11.Find total value of books per store.
select * from
(
select s.name as store_namae,sum(b.b_current_price) as total_price 
from books b 
inner join stores s
on b.book_id=s.s_book_id
group by s.name
) t;



