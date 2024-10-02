------------------------------------------------------------------------------------------------
# # # # LECTURE 1 # # # #
------------------------------------------------------------------------------------------------
show databases;

drop database if exists db4_lab1;
create database if not exists db4_lab1;

use db4_lab1;

create table branch (name varchar(10), city varchar(20), director varchar(20), assets integer);
create table food_table (food varchar(10), price decimal(5, 2), qty integer);

# view table variables 
desc branch;
desc food_table;

select * from branch;
select * from food_table;

# delete table
drop table branch;

# update table
alter table branch add column zip integer;
alter table branch drop column zip;

insert into branch values ("branch 1", "Athlone", "J.Bloggs", 70);
insert into branch values ("branch 2", "Ballinasloe", "Pat Mc", 500);
insert into branch values ("branch 3", "Dublin", "J. Public", 15);
insert into branch values ("branch 4", "Dublin", "SomeName", 45);
insert into branch values ("branch 5", "Mullingar", "SomeName2", 56);
insert into branch values ("branch 6", "Athlone", "SomeName3", 79);

insert into food_table values ();
insert into food_table values ();

# display table output using "like" to search for specific string in a column 
select * from branch where city like "%lon%";

select city from branch;
select distinct city from branch;

# order the output of the table 
select * from branch order by city;

# display total count of table column 
select count(assets) from branch;

# display unique outputs from table column
select distinct assets from branch;
# display sum and avg from the table column
select sum(assets) from branch;
select avg(assets) from branch;

# display table information by grouping the results from the table
select city, sum(assets) as total_assets from branch group by city;
select director, city, sum(assets) as total_assets from branch group by director, city;

# display table information with specific filter using "having" 
select director, city, sum(assets) as total_assets from branch group by director, city having sum(assets) > 50;

# display table information using rollup 
select director, city, sum(assets) as total_assets from branch group by director, city with rollup;

select * from branch;

------------------------------------------------------------------------------------------------
# # # # LECTURE 2 # # # #
------------------------------------------------------------------------------------------------
# insert values into a table, "assets" column will default to NULL
INSERT INTO branch (name, city, director) VALUES ("branch 10", "Dublin", "Joe Maxi");

# test for IS NULL output 
select name, city, director from branch where assets IS NULL;
select name, city, director from branch where assets IS NOT NULL;

select * from branch;

# Update 
UPDATE branch SET assets=600 WHERE name LIKE "branch 1";

# Delete
DELETE from branch WHERE city="Roscommon";

# Deletes Everything
DELETE from branch;

SELECT name, city, assets, NOW() as assets_date FROM branch;

# AND condition
SELECT * FROM branch WHERE city LIKE "Athlone" AND director LIKE "J.Bloggs";
# OR condition
SELECT * FROM branch WHERE city LIKE "Athlone" OR director LIKE "J.Public";

------------------------------------------------------------------------------------------------
# # # # # # SUB-QUERIES # # # # # #
------------------------------------------------------------------------------------------------
create table branch_list (name varchar(10));
insert into branch_list values ("Branch 1");
insert into branch_list values ("Branch 2");
insert into branch_list values ("Branch 3");

select * from branch_list;

# return columns from branch table where name matches branch_list table
select distinct name, city, director from branch where name in (select name from branch_list);


------------------------------------------------------------------------------------------------
# # # # # # JOINS # # # # # #
------------------------------------------------------------------------------------------------
create table Persons;
create table Persons (name varchar(10), city varchar(20), director varchar(20), assets integer);
create table Orders (name varchar(10), city varchar(20), director varchar(20), assets integer);

SELECT Persons.LastName, Persons.FirstName, Orders.OrderNo FROM Persons INNER JOIN Orders ON Persons.P_Id=Orders.P_Id ORDER BY Persons.LastName;
SELECT Persons.LastName, Persons.FirstName, Orders.OrderNo FROM Persons LEFT JOIN Orders ON Persons.P_Id=Orders.P_Id ORDER BY Persons.LastName;
SELECT Persons.LastName, Persons.FirstName, Orders.OrderNo FROM Persons RIGHT JOIN Orders ON Persons.P_Id=Orders.P_Id ORDER BY Persons.LastName;
SELECT Persons.LastName, Persons.FirstName, Orders.OrderNo FROM Persons FULL JOIN Orders ON Persons.P_Id=Orders.P_Id ORDER BY Persons.LastName;
