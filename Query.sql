drop table CartItem
drop table Cart

use master
go
drop database UNIFY
use master
go
create database UNIFY
go
use UNIFY
go


create table [User](
	id int identity,
	email varchar(50),
	username varchar(50) unique not null,
	[password] varchar(36) not null,
	avatar varchar(50),
	role_id int,
	primary key(id)
)
create table Category(
	cate_id int identity primary key,
	cate_name nvarchar(255) not null,
)

create table Product(
	id int identity primary key,
	[name] nvarchar(255) not null,
	price float ,
	des varchar(2000),
	image varchar(50),
)


create table Cart(
	id varchar(50) primary key,	
	buyDate date
)
create table CartItem(
	id varchar(50) primary key,
	quantity int,
	unitPrice float,
	cat_id varchar(50) references Cart(id) not null
)

