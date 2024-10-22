USE alarms;

CREATE TABLE perf (
	Perf_Record DECIMAL(2) NOT NULL PRIMARY KEY,
	Cell_ID DECIMAL(4) NOT NULL,
	Record_Description VARCHAR(30),
	Date  DATETIME NOT NULL,
	Value  DECIMAL(4)	

	);

SELECT 'INSERTING DATA INTO DATABASE' as 'INFO';

INSERT INTO perf VALUES ('1', '102','Dropped Calls', '2013-01-01 12:40:00', '20');
INSERT INTO perf VALUES ('2', '100','Avg Handover Latency ms', '2013-01-01 15:31:12', '500');
INSERT INTO perf VALUES ('3', '100','Dropped Calls','2013-01-01 15:40:00', '3');
INSERT INTO perf VALUES ('4', '101','Num Mobile Nodes', '2013-01-01 16:10:00', '200');
INSERT INTO perf VALUES ('5', '102','Avg Handover Latency (ms)', '2013-01-01 16:31:12', '400');
INSERT INTO perf VALUES ('6', '102','Dropped Calls','2013-01-01 17:31:12', '5');

select * from perf;