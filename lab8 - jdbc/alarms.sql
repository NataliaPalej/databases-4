DROP DATABASE IF EXISTS Alarms;
CREATE DATABASE IF NOT EXISTS Alarms;
USE Alarms;

DROP TABLE IF EXISTS Alarms;


CREATE TABLE Alarms (
	RBS_ID DECIMAL(2) NOT NULL,
	Alarm_ID DECIMAL(2) NOT NULL,
	Alarm_Description VARCHAR(20),
	Date  DATETIME NOT NULL,
	Priority DECIMAL(2)	

	);

SELECT 'INSERTING DATA INTO DATABASE' as 'INFO';

INSERT INTO Alarms VALUES ('2', '12','Overheated Unit', '2024-01-01 12:40:00', '2');
INSERT INTO Alarms VALUES ('3', '10','Overloaded Unit', '2024-01-01 15:31:12', '1');
INSERT INTO Alarms VALUES ('1', '12','Electrical Interrupt','2024-01-01 15:40:00', '3');
INSERT INTO Alarms VALUES ('2', '12','Overheated Unit', '2024-01-01 16:10:00', '2');
INSERT INTO Alarms VALUES ('3', '12','Overloaded Unit', '2024-01-01 16:31:12', '1');
INSERT INTO Alarms VALUES ('3', '12','Overloaded Unit','2024-01-01 17:31:12', '1');

select * from Alarms;


SELECT * from Alarms;