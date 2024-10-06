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
