-- Practice Queries 
DROP DATABASE IF EXISTS practive_test;
CREATE DATABASE IF NOT EXISTS practive_test;
USE practive_test;

-- Create the 'Person' table
CREATE TABLE Person (
    P_Id INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Address VARCHAR(100),
    Age INT
);

-- Insert data into the 'Person' table
INSERT INTO Person (P_Id, FirstName, LastName, Address, Age) VALUES
(1, 'John', 'Doe', '123 Elm St', 28),
(2, 'Jane', 'Smith', '456 Oak St', 34),
(3, 'Alice', 'Johnson', '789 Pine St', 22),
(4, 'Bob', 'Brown', '321 Maple St', 45),
(5, 'Charlie', 'Davis', '654 Cedar St', 29),
(6, 'David', 'Clark', '987 Birch St', 38),
(7, 'Emma', 'Taylor', '111 Willow St', 25),
(8, 'Grace', 'Moore', '222 Spruce St', 30),
(9, 'Henry', 'Lee', '333 Redwood St', 40),
(10, 'Ivy', 'Anderson', '444 Poplar St', 27);

INSERT INTO Person (P_Id, FirstName, LastName, Address, Age) VALUES
(11, 'Lilly', 'Lola', '7 Angel St', 18);

-- Create the 'Orders' table
CREATE TABLE Orders (
    O_Id INT PRIMARY KEY,
    OrderNo VARCHAR(50),
    P_Id INT,
    OrderDate DATE,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (P_Id) REFERENCES Person(P_Id)
);

-- Insert data into the 'Orders' table
INSERT INTO Orders (O_Id, OrderNo, P_Id, OrderDate, Amount) VALUES
(1, 'A123', 1, '2023-01-10', 250.50),
(2, 'A124', 2, '2023-02-14', 450.00),
(3, 'A125', 3, '2023-03-20', 199.99),
(4, 'A126', 1, '2023-04-01', 100.00),
(5, 'A127', 4, '2023-04-15', 320.75),
(6, 'A128', 5, '2023-05-05', 175.50),
(7, 'A129', 6, '2023-05-10', 89.99),
(8, 'A130', 7, '2023-06-21', 600.00),
(9, 'A131', 8, '2023-07-11', 150.25),
(10, 'A132', 9, '2023-08-01', 300.00);

INSERT INTO Orders (O_Id, OrderNo, P_Id, OrderDate, Amount) VALUES
(11, 'A133', 1, '2024-06-10', 120.50),
(12, 'A134', 2, '2024-08-14', 650.00);


-- Retrieve all the records from the Customers table.
select * from Person;

-- Retrieve all the records from the Orders table.
select * from orders;

-- Create a query that retrieves the unique first names from the Customers table.
select distinct FirstName as "Unique Names" from person;

-- Retrieve all customers whose age is above 30.
select FirstName, LastName, Age from person where age > 30;

-- Find all orders placed after March 1st, 2023.
select * from orders where OrderDate > "2023-03-01"; 

-- Retrieve the details of orders where the amount is more than $200.
select * from orders where Amount > 200;

-- Create a query that retrieves all customers who have placed an order.
select * from person p join orders o on p.P_Id=o.P_Id ;

-- Retrieve the total number of customers who are 25 years old or younger.
select count(*) as "Cust Above 25" from person where age <= 25;

-- Retrieve the names of customers who have placed orders in 2023.
select p.FirstName, p.LastName, o.OrderDate from person p left join orders o on p.P_Id=o.O_Id where OrderDate like "2023%";

-- Find the total number of orders in the "Shipped" status.
# add column "status" as it doesnt originally exist 
ALTER TABLE `practive_test`.`orders` 
ADD COLUMN `status` VARCHAR(45) NULL DEFAULT NULL AFTER `Amount`;
select * from orders;
# update orders to add Shipped in few positions
update orders set status="Shipped" where P_Id < 5;
# select total number of orders that were shipped 
select count(*) as "Shipped" from orders where status like "Shipped";

-- Retrieve the first name and email of all customers whose email domain is 'example.com'.
alter table orders add column `email` varchar(50) default null;
select * from orders;
update orders set email="someemail@example.com" where P_Id like 1;
update orders set email="myemail@example.com" where P_Id like 8;
select p.FirstName, o.email from person p left join orders o on p.P_Id=o.O_Id where email like "%example.com";

-- Find customers who have placed more than one order.
select p.FirstName, p.LastName, COUNT(o.OrderNo) as "TotalOrders" from person p join orders o on p.P_Id=o.P_Id group by p.P_Id HAVING COUNT(o.OrderNo) > 1;

-- Retrieve the details of customers whose last name starts with 'J'.
select * from person where LastName like "J%";

-- Retrieve the order information where the amount is between $100 and $300.
select * from orders where Amount between 100 and 300;

-- Find all orders that have been cancelled.
update orders set status="Cancelled" where OrderNo="A128";
update orders set status="Cancelled" where OrderNo="A132";
select * from orders;
select p.FirstName, p.LastName, o.status, o.OrderDate from person p left join orders o on p.P_Id=o.O_Id where o.status like "Cancelled"; 

-- Create a query that retrieves the names of customers who haven’t placed any orders.
INSERT INTO Person (P_Id, FirstName, LastName, Address, Age) VALUES
(12, 'Monica', 'Aspargus', '29 Main St', 19),
(13, 'Beatrice', 'Berry', 'Dalton St', 68),
(14, 'Sunflower', 'McCaren', 'Greemings House', 50);

INSERT INTO Person (P_Id, FirstName, LastName, Address, Age) VALUES
(15, 'Lilly', 'Kors', '88 Puck St', 61);

select p.FirstName, p.LastName, o.OrderNo from person p left join orders o on p.p_Id=o.p_Id where OrderNo is NULL;

-- Retrieve the customer details along with their orders, if any.
select * from person p join orders o on p.p_Id=o.p_Id where OrderNo is not null order by p.P_Id;
# retriving people who hasnt placed orders in comparison
select * from person p left join orders o on p.p_Id=o.p_Id where OrderNo is null;

-- Retrieve the total number of orders placed by each customer.
select p.FirstName, p.LastName, count(o.OrderNo) as "TotalOrders" from person p left join orders o on p.P_Id=o.P_Id group by p.P_Id;

-- Retrieve the average order amount from the Orders table.
select round(avg(Amount), 2) as "avgTotal" from orders;

-- Retrieve all customers who are not in the Orders table (i.e., customers who haven't placed an order).
select * from person p left join orders o on p.P_Id=o.P_Id where OrderNo is null;

-- Retrieve orders placed by customers whose first name is 'John'.
select * from orders o join person p on o.P_Id=p.P_Id where FirstName like "John";

-- Create a query that lists all customers who have 'gmail.com' in their email addresses.
update orders set email="basic@gmail.com" where P_Id=2;
select * from orders;
select * from orders where email like "%gmail.com";

-- Retrieve all orders along with customer names where the status is 'Delivered'.
update orders set status="Delivered" where P_Id=3 or P_Id=7 or P_Id=6;
select * from orders;
select o.OrderNo, o.OrderDate, o.Amount, o.status, o.email, p.FirstName, p.LastName from orders o left join person p on o.P_Id=p.P_Id where status like "Delivered";

-- Find customers who have placed orders worth more than $400 in total.
select p.FirstName, p.LastName, sum(o.Amount) as "TotalAmount" from person p join orders o on p.P_Id=o.P_Id group by p.P_Id having sum(o.Amount) > 400;

-- Retrieve the minimum and maximum order amounts from the Orders table.
INSERT INTO Orders (O_Id, OrderNo, P_Id, OrderDate, Amount) VALUES
(13, 'A458', 11, '2024-08-08', 29.99);
INSERT INTO Orders (O_Id, OrderNo, P_Id, OrderDate, Amount) VALUES
(14, 'A684', 12, '2024-05-09', 895.59);

(SELECT p.FirstName, p.LastName, o.Amount AS "MinAmount"
FROM orders o
JOIN person p ON o.P_Id = p.P_Id
WHERE o.Amount = (SELECT MIN(Amount) FROM orders))

UNION

(SELECT p.FirstName, p.LastName, o.Amount AS "MaxAmount"
FROM orders o
JOIN person p ON o.P_Id = p.P_Id
WHERE o.Amount = (SELECT MAX(Amount) FROM orders));

-- Retrieve all customers who have the number '2' in their age.
select * from person where Age like "%2%";

-- Find the number of orders placed in each month.
select month(OrderDate) as "Month", count(*) as "TotalOrders" from orders group by month(OrderDate);

-- Retrieve customers along with the total amount they have spent on orders.
select p.FirstName, p.LastName, sum(o.Amount) as "TotalSpent" from person p right join orders o on p.P_Id=o.P_Id group by p.P_Id order by sum(o.Amount); 

-- Retrieve orders placed by customers older than 35.
select * from orders o left join person p on o.P_Id=p.P_Id where p.Age > 35;
# returning only orders table info
SELECT * FROM orders WHERE P_Id IN (SELECT P_Id FROM person WHERE Age > 35);

-- Find the total number of unique customers who have placed an order.
select distinct count(p.FirstName) as "TotalUniqCustNames" from person p join orders o on p.P_Id=o.P_Id;

-- Stored Procedures
-- extra question 1: Create a stored procedure that retrieves all customer details whose age is above a certain value, where the value is passed as a parameter.
DELIMITER  // 
create procedure sp_RetrieveCustByAge(
in ageLimit INT
)

begin
select * from person where Age > ageLimit;
end //

DELIMITER ;

CALL sp_RetrieveCustByAge(50);

-- extra question 2: Create a stored procedure that inserts a new order into the Orders table with values for customer ID, order date, and order amount as parameters.
drop procedure if exists sp_insertNewOrder;

DELIMITER //
create procedure sp_insertNewOrder(
pID INT,
orderDate Date,
amount DECIMAL(10, 2)
)

begin
insert into orders (P_Id, OrderDate, Amount) values (pID, orderDate, amount); 
end //
DELIMITER ;

CALL sp_insertNewOrder(8, '2024-06-10', 971.35);
select * from orders where p_Id=8;

-- extra question 3: Create a stored procedure that updates the email of a customer based on their customer ID, where both email and customer ID are passed as parameters.
drop procedure if exists sp_updateEmail;
delimiter //
create procedure sp_updateEmail(
pID INT,
newEmail VARCHAR(50)
)
begin
update orders set email=newEmail where P_Id=pID;
end //
delimiter ;

call sp_updateEmail(8, "newemail@example.com");
select * from orders where p_Id=8;

-- Stored Functions
-- extra question 1: Create a stored function that calculates and returns the total amount of orders for a given customer, with the customer ID passed as a parameter.
drop function if exists fn_custTotalOrders;

delimiter //
create function fn_custTotalOrders (
custId INT
)
returns decimal(9, 2)

begin
declare totalAmount decimal(9,2);
select sum(Amount) into totalAmount from orders where P_Id=custId;
return totalAmount;
end //
delimiter ;

select fn_custTotalOrders(1);
# double checking if correct 
select p.P_Id, p.firstName, p.LastName, sum(o.Amount) as "totalAmount" from person p join orders o on p.P_Id=o.P_Id where p.p_Id=1;


-- extra question 2: Create a stored function that checks whether a customer’s age is greater than 30 and returns a boolean value.
drop function if exists fn_isCustOlderThan30;
delimiter //
create function fn_isCustOlderThan30(
custId INT
)
returns boolean

begin
declare isGreaterThan30 BOOLEAN DEFAULT FALSE;
select if(Age > 30, true, false) INTO isGreaterThan30 from person where P_Id=custID;
return isGreaterThan30;
end //
delimiter ;

select fn_isCustOlderThan30(14);
select * from person where p_Id=14;
select * from person where p_Id=1;

-- extra question 3: Create a stored function that returns the number of orders placed by a customer, 
-- where the customer ID is passed as a parameter.
drop function if exists fn_ordersPlacedByCust;
delimiter //
create function fn_ordersPlacedByCust(
custID int
)
returns int

begin
declare totalOrders int;
select count(OrderNo) into totalOrders from orders where P_Id=custId;
return totalOrders;
end//

delimiter ;

select fn_ordersPlacedByCust(1);
select * from orders where p_Id=1;

-- JOINs
-- extra question 1: Retrieve all customers along with their respective orders.
select p.FirstName, p.LastName, o.OrderDate, o.OrderNo, o.Amount, o.status from person p join orders o on p.P_Id=o.P_Id where OrderNo is not NULL order by o.OrderDate; 

-- extra question 2: Retrieve all customers who have placed an order, along with the order date and amount.
select p.FirstName, p.LastName, o.OrderDate, o.Amount from person p inner join orders o on p.P_Id=o.P_Id order by o.OrderDate;

-- extra question 3: Retrieve customers who have placed orders worth more than $500, along with their order details.
select * from person p join orders o on p.P_Id=o.P_Id where o.Amount > 500;  
