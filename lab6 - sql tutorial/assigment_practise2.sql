-- Practice Queries 2
DROP DATABASE IF EXISTS practive_test;
CREATE DATABASE IF NOT EXISTS practive_test;
USE practive_test;

-- Creating Department table
CREATE TABLE Department (
    Department_Id INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(50),
    Location VARCHAR(50)
);

-- Inserting random data into Department table
INSERT INTO Department (DepartmentName, Location) VALUES
('HR', 'Chicago'),
('Finance', 'Austin'),
('Engineering', 'San Francisco'),
('Marketing', 'New York'),
('Sales', 'Seattle'),
('IT', 'San Francisco'),
('Legal', 'Chicago'),
('R&D', 'Austin');

-- Creating Employee table
CREATE TABLE Employee (
    Employee_Id INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department_Id INT,
    HireDate DATE,
    Salary DECIMAL(10, 2),
    Email VARCHAR(100),
    Age INT,
    FOREIGN KEY (Department_Id) REFERENCES Department(Department_Id)
);

-- Inserting random data into Employee table
INSERT INTO Employee (FirstName, LastName, Department_Id, HireDate, Salary, Email, Age) VALUES
('Emily', 'Brown', 1, '2020-05-14', 60000.00, 'emily.brown@example.com', 28),
('David', 'Taylor', 2, '2017-11-20', 75000.00, 'david.taylor@example.com', 35),
('Jessica', 'Johnson', 3, '2015-03-01', 95000.00, 'jessica.johnson@example.com', 42),
('Michael', 'Jones', 4, '2021-09-15', 50000.00, 'michael.jones@example.com', 26),
('Karen', 'Smith', 5, '2019-08-19', 58000.00, 'karen.smith@example.com', 30),
('James', 'Miller', 6, '2016-12-05', 84000.00, 'james.miller@example.com', 40),
('Sarah', 'Wilson', 7, '2018-02-22', 67000.00, 'sarah.wilson@example.com', 32),
('John', 'Davis', 8, '2014-04-12', 99000.00, 'john.davis@example.com', 45),
('Robert', 'Moore', 1, '2013-06-18', 65000.00, 'robert.moore@example.com', 38),
('Jane', 'Williams', 2, '2020-10-30', 72000.00, 'jane.williams@example.com', 29),
('Emily', 'Taylor', 3, '2017-07-12', 82000.00, 'emily.taylor@example.com', 33),
('David', 'Smith', 4, '2022-03-24', 53000.00, 'david.smith@example.com', 27),
('Jessica', 'Brown', 5, '2019-01-15', 60000.00, 'jessica.brown@example.com', 31),
('Michael', 'Johnson', 6, '2015-09-06', 92000.00, 'michael.johnson@example.com', 39),
('Karen', 'Jones', 7, '2021-11-03', 48000.00, 'karen.jones@example.com', 25),
('James', 'Davis', 8, '2016-07-09', 78000.00, 'james.davis@example.com', 37),
('Sarah', 'Moore', 1, '2013-02-28', 62000.00, 'sarah.moore@example.com', 34),
('John', 'Miller', 2, '2018-12-10', 85000.00, 'john.miller@example.com', 41),
('Robert', 'Taylor', 3, '2021-05-25', 51000.00, 'robert.taylor@example.com', 28),
('Null', 'Worker', NULL, '2015-07-23', 0, 'null.worker@example.com', 30);

-- Creating Project table
CREATE TABLE Project (
    Project_Id INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(100),
    Department_Id INT,
    Budget DECIMAL(10, 2),
    FOREIGN KEY (Department_Id) REFERENCES Department(Department_Id)
);

-- Inserting random data into Project table
INSERT INTO Project (ProjectName, Department_Id, Budget) VALUES
('New App Development', 1, 150000.00),
('Website Overhaul', 2, 90000.00),
('Marketing Campaign', 3, 50000.00),
('Cloud Migration', 4, 120000.00),
('Data Analysis Tool', 5, 80000.00);


-- 1. Retrieve all employees who work in the 'HR' department.
select * from employee e join department d on e.Department_Id=d.Department_Id where d.DepartmentName like "HR";

-- 2. Fetch the total number of employees who joined before the year 2020.
select count(*) as "TotalJoinedBefore2020" from employee where year(HireDate) < 2020;

-- 3. List all employees whose salary is above 75,000.
select * from employee where Salary > 75000;

-- 4. Find the employees whose email contains the word 'example'.
select * from employee where Email like "%example%";

-- 5. List the employees hired in the last 5 years (from today’s date).
select * from employee where year(HireDate) >= year(now())-5; 

-- 6. Retrieve the departments with more than 3 employees.
select d.DepartmentName, count(e.Department_Id) as "totalEmployees" from employee e join department d on e.Department_Id=d.Department_Id group by d.DepartmentName having count(e.Department_Id) > 2;

-- 7. Fetch the average salary of employees grouped by department.
select round(avg(e.Salary), 2) as "AvgSalary", d.DepartmentName as "Department" from employee e join department d on e.Department_Id=d.Department_Id group by d.DepartmentName;

-- 8. Find the highest paid employee in the Engineering department.
select e.FirstName, e.LastName, e.Salary from employee e join department d on e.Department_Id=d.Department_Id where DepartmentName like "Engineering" having max(e.Salary);

-- 9. Retrieve the names of employees working in departments located in 'San Francisco'.
select e.FirstName, e.LastName from employee e join department d on e.Department_Id=d.Department_Id where d.Location like "San Francisco";

-- 10. Display the count of employees in each department, including departments with no employees.
select Department_Id, count(Employee_Id) as "TotalEmployee" from employee group by Department_Id;
# or I could enhance the output to see what department it is rather than just its ID
select d.DepartmentName, count(e.Employee_Id) as "TotalEmployee" from employee e left join department d on e.Department_Id=d.Department_Id group by d.DepartmentName;

-- 11. Fetch employees whose first or last name starts with 'J'.
select * from employee where FirstName like "J%" or LastName like "J%";

-- 12. Find the employees who have a NULL value for the Department_Id.
select * from employee where Department_Id is NULL;

-- 13. Retrieve the list of all projects and their associated department names.
select p.ProjectName, d.DepartmentName from project p left join department d on p.Department_Id=d.Department_Id;

-- 14. Update the salary of employees in the Sales department, increasing it by 5%.
drop procedure if exists sp_updateSalary;
delimiter //
create procedure sp_updateSalary(
departmentToUpdate int
)
begin
update employee set Salary=Salary*1.05 where Department_Id=departmentToUpdate;
end //
delimiter ;

select * from department;
select * from employee where Department_Id=5;

call sp_updateSalary(5);

-- 15. Delete the employee records where the hire date is before 2015.
delete from employee where year(HireDate) < 2015;
select * from employee where year(HireDate) < 2015;

-- 16. Retrieve the names of employees who have the same first name but work in different departments.
select FirstName from employee group by FirstName having count(distinct Department_Id) > 1;

-- 17. Fetch the total budget of all projects associated with the 'Finance' department.
select sum(p.Budget) as "TotalBudget", d.DepartmentName from project p join department d on p.Department_Id=d.Department_Id where d.DepartmentName like "Finance";

-- 18. List all departments that do not have any projects assigned to them.
select d.DepartmentName from department d left join project p on d.Department_Id=p.Department_Id where Project_Id is null; 

select * from department;
select * from project;

-- 19. Fetch the employee with the second-highest salary in the company.
select FirstName, LastName, Salary as "SecondHighestSalary" from employee where Salary < (select max(Salary) from employee) order by Salary desc limit 1;
select * from employee;

-- 20. Count how many employees have an email domain ending with 'example.com'.
select count(Employee_Id) as "totalCount" from employee where email like "%example.com";

-- 21. Retrieve the employees who are older than 40 and working in the IT department.
select e.FirstName, e.LastName, e.Age, d.DepartmentName from employee e join department d on e.Department_Id=d.Department_Id where e.Age >= 40 and d.DepartmentName like "IT";

-- 22. List the departments where employees' average salary is below 60,000.
select d.DepartmentName, round(avg(e.Salary), 2) as "avgSalaryBelow60k" from department d join employee e on e.Department_Id=d.Department_Id 
group by d.DepartmentName having avg(e.Salary) < 60000;

-- 23. Find all projects where the budget is greater than the average budget of all projects.
select d.DepartmentName, p.Budget from department d join project p on d.Department_Id=p.Department_Id where p.Budget > (select avg(Budget) from project);
select avg(Budget) from project;

-- 24. Insert a new employee with all fields filled, and assign them to the IT department.
insert into employee (FirstName, LastName, Department_Id, HireDate, Salary, Email, Age) values ("Lilly", "Piesek", 6, "2024-10-07", "125999.00", "LillyPiesek@gmail.com", 18);
select * from employee;

-- 25. Update the email of the employee 'John Miller' to 'jmiller@gmail.com'.
select * from employee where FirstName like "John";
update employee set email="jmiller@gmail.com" where FirstName like "John" and LastName like "Miller";

-- 26. Write a stored procedure to retrieve all employees by department name.
drop procedure if exists sp_departmentEmployees;
delimiter //
create procedure sp_departmentEmployees (
department VARCHAR(50)
)
begin
select * from employee e join department d on e.Department_Id=d.Department_Id where d.DepartmentName like department;
end //
delimiter ;

call sp_departmentEmployees("IT");

-- 27. Write a stored procedure to update the salary of an employee given their Employee_Id.
drop procedure if exists sp_updateSalary;
delimiter //
create procedure sp_updateSalary(
employeeId int,
newSalary decimal(9, 2)
)
begin
update employee set Salary=newSalary where Employee_Id=employeeId;
end //
delimiter ;
call sp_updateSalary(1, 9999);
select * from employee where employee_Id=1;

-- 28. Write a function to calculate the average age of employees in a given department.
drop function if exists fn_averageAge;
delimiter //
create function fn_averageAge(
departmentId int
)
returns int

begin
declare averageAge int;
select round(avg(Age)) into averageAge from employee where Department_Id=departmentId; 
return averageAge;
end //
delimiter ;

select fn_averageAge(1);
select avg(Age) as "avgAge" from employee where Department_Id=1; # checking if above correct

-- 29. Find employees who were hired between 2017 and 2021, inclusive.
select FirstName, LastName, HireDate from employee where year(HireDate) between 2017 and 2021 order by HireDate;

-- 30. List all employees who work in departments that start with the letter 'M'.
select * from employee e join department d on e.Department_Id=d.Department_Id where DepartmentName like "M%";

-- 31. Create a view that displays the first name, last name, and department name for employees hired after 2019.
create view v_employees_hired_after_2019 as select e.FirstName, e.LastName, d.DepartmentName from employee e join department d on e.Department_Id=d.Department_Id where year(e.HireDate) < 2019; 
select * from v_employees_hired_after_2019;

-- 32. Create a trigger that automatically updates the `LastUpdated` column in the employee table every time an employee's salary is updated.
alter table employee add column LastUpdated VARCHAR(50);
drop trigger if exists tr_LastUpdated;
select * from employee;
delimiter //
create trigger tr_LastUpdated before update on employee for each row 
begin
set NEW.LastUpdated=now();
end //
delimiter ;

update employee set Email="karensmith@gmail.com" where Employee_Id=5;

-- 33. Describe the structure of the `department` table.
describe department; 

-- 34. Create a view that shows the total salary for each department.
create view v_totalSalaryPerDepartment as select d.DepartmentName, sum(Salary) as "SalaryTotal" from employee e join department d on e.Department_Id=d.Department_Id group by d.DepartmentName;
select * from v_totalSalaryPerDepartment;

-- 35. Create a trigger that prevents an employee from being deleted if their salary is greater than 50,000.
drop trigger if exists tr_preventDelete;
delimiter //
create trigger tr_preventDelete 
before delete on employee 
for each row 
begin 
    if OLD.Salary > 50000 then
        signal sqlstate '45000' 
        set message_text = 'Cannot delete employee with salary greater than 50,000';
    end if;
end //
delimiter ;
delete from employee where FirstName like "Lilly";

-- 36. Create a view to show all employees who have not been assigned to any department yet.
create view v_noDepartment as select * from employee where Department_Id is null;
select * from v_noDepartment;

-- 37. Describe the structure of the `employee` table.
describe employee;

-- 38. Create a trigger that automatically inserts a log record into a `salary_changes` table every time an employee’s salary is increased.
create table salary_changes (
id int primary key AUTO_INCREMENT, 
employeeId int,
oldSalary decimal(10, 2),
newSalary decimal(10, 2),
changeDate timestamp);

describe salary_changes;

drop trigger if exists tr_salarychanges;
delimiter //
create trigger tr_salarychanges after update on employee for each row 
begin 
# check if salary increased 
if NEW.Salary > OLD.Salary then 
insert into salary_changes(employeeId, oldSalary, newSalary, changeDate) 
values (OLD.Employee_Id, OLD.Salary, NEW.Salary, now());
end if;
end //
delimiter ;

UPDATE employee SET Salary = 99990 WHERE FirstName like "John";
UPDATE employee SET Salary = 178520 WHERE Employee_Id = 12;
UPDATE employee SET Salary = 223500 WHERE Employee_Id = 14;
select * from employee;
select * from salary_changes;



