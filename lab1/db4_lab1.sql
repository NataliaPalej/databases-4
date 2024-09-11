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