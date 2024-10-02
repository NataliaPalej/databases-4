drop database if exists db4_tutorial;
create database if not exists db4_tutorial;

use db4_tutorial;

CREATE TABLE person
(
P_id	INT,
firstName	VARCHAR(20),
lastName	VARCHAR(20),
Address	VARCHAR(20),
City	VARCHAR(20)
);
    
INSERT INTO person VALUES(1, 'Des', 'Dolan', 'Garrycastle', 'Athlone');
INSERT INTO person VALUES(2, 'John', 'Keane', 'Main St', 'Rosemount');
INSERT INTO person VALUES(3, 'Tomas', 'Mount', 'Robinstown', 'Mullingar');
    
SELECT * from person;
    
CREATE TABLE orders(
O_id	INT,
OrderNo	VARCHAR(20),
P_id	INT
);
    
INSERT INTO orders VALUES(1,'77895',3);
INSERT INTO orders VALUES(2,'44678',3);
INSERT INTO orders VALUES(3,'22456',1);
INSERT INTO orders VALUES(4,'24562',1);
INSERT INTO orders VALUES(5,'34764',15);
    
SELECT * FROM orders;
    
# inner join
SELECT Person.P_Id, Person.firstName, Person.lastName, Orders.OrderNo FROM Person JOIN Orders ON Person.P_Id = Orders.P_Id;
SELECT p.P_Id, p.firstName, p.lastName, o.OrderNo FROM Person p JOIN Orders o ON p.P_Id = o.P_Id;

# right outer join
SELECT p.P_Id, p.firstName, p.lastName, O.OrderNo FROM Person p RIGHT JOIN Orders o ON p.P_Id = O.P_Id;

# left outer join
SELECT p.P_Id, p.firstName, p.lastName, O.OrderNo FROM Person p LEFT JOIN Orders o ON p.P_Id = O.P_Id;

SELECT * from Person;

drop PROCEDURE IF EXISTS spUpdateAddress;

DELIMITER //
CREATE PROCEDURE spUpdateAddress ( 
    PersonID INT,
    newCity VARCHAR (20),
    newAddress VARCHAR (20)
) 

BEGIN
DECLARE sql_error TINYINT DEFAULT FALSE;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
SET sql_error = TRUE;

START TRANSACTION;

    UPDATE table_name SET address=newAddress, city=newCity WHERE P_id = PersonID;
    IF sql_error=FALSE THEN 
      COMMIT;
     ELSE
      ROLLBACK;
     END IF;

SELECT * FROM Person;

END //

# How to call the Stored Procedure 
CALL spUpdateAddress(3, "Main Street", "Oslo");
SELECT * from Person;

