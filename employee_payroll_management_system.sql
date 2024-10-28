create database employee_payroll_management_system;
use employee_payroll_management_system;

CREATE TABLE Employee (
  Employee_Id INT UNSIGNED AUTO_INCREMENT,
  First_Name VARCHAR(25),
  Last_Name VARCHAR(25),
  Hire_Date DATE,
  City VARCHAR(25),
  State VARCHAR(25),
  PRIMARY KEY (Employee_Id)
);

CREATE TABLE Department (
  Department_Id INT UNSIGNED,
  Department_Name VARCHAR(30),
  PRIMARY KEY (Department_Id)
);

CREATE TABLE AccountDetails (
  Account_Id INT UNSIGNED,
  Bank_Name VARCHAR(50),
  Account_Number VARCHAR(50),
  Employee_Id INT UNSIGNED,
  PRIMARY KEY (Account_Id),
  FOREIGN KEY (Employee_Id) REFERENCES Employee(Employee_Id)
);
select * from AccountDetails;


CREATE TABLE Salary (
  Salary_Id INT UNSIGNED,
  Gross_Salary DECIMAL(10, 2),
  Hourly_Pay DECIMAL(8, 2),
  State_Tax DECIMAL(8, 2),
  Federal_Tax DECIMAL(8, 2),
  Account_Id INT UNSIGNED,
  PRIMARY KEY (Salary_Id),
  FOREIGN KEY (Account_Id) REFERENCES AccountDetails(Account_Id)
);
select * from salary;


CREATE TABLE Project (
  Project_Id INT UNSIGNED,
  Project_Name VARCHAR(50),
  Project_Description VARCHAR(50),
  PRIMARY KEY (Project_Id)
);
select * from Project;

CREATE TABLE DepartmentProject (
  Department_Id INT UNSIGNED,
  Project_Id INT UNSIGNED,
  PRIMARY KEY (Department_Id, Project_Id),
  FOREIGN KEY (Department_Id) REFERENCES Department(Department_Id),
  FOREIGN KEY (Project_Id) REFERENCES Project(Project_Id)
);
select * from DepartmentProject;

CREATE TABLE Education (
  Education_Id INT UNSIGNED,
  Employee_Id INT UNSIGNED,
  Degree VARCHAR(30),
  Graduation_Year INT,
  PRIMARY KEY (Education_Id),
  FOREIGN KEY (Employee_Id) REFERENCES Employee(Employee_Id)
);
select * from Education;

CREATE TABLE Leaves (
  Leave_Id INT UNSIGNED,
  Employee_Id INT UNSIGNED,
  Leave_Date DATE,
  PRIMARY KEY (Leave_Id),
  FOREIGN KEY (Employee_Id) REFERENCES Employee(Employee_Id)
);
select * from Leaves;

CREATE TABLE Attendance (
  Attendance_Id INT UNSIGNED,
  Hours_Worked INT,
  PRIMARY KEY (Attendance_Id)
);
select * from Attendance;

CREATE TABLE Employee_Attendance (
  Employee_Id INT UNSIGNED,
  Attendance_Id INT UNSIGNED,
  PRIMARY KEY (Employee_Id, Attendance_Id),
  FOREIGN KEY (Employee_Id) REFERENCES Employee(Employee_Id),
  FOREIGN KEY (Attendance_Id) REFERENCES Attendance(Attendance_Id)
);
select * from Employee_Attendance;

CREATE TABLE Work_Location (
  Location_Id INT UNSIGNED,
  Location VARCHAR(25),
  Number_Of_Employees INT,
  City VARCHAR(25),
  State VARCHAR(25),
  PRIMARY KEY (Location_Id)
);
select * from Work_Location;

INSERT INTO Employee VALUES (101, 'Ojas', 'Phansekar', '2016-04-14', 'New York City', 'New York');
INSERT INTO Employee VALUES (102, 'Vrushali', 'Patil', '2018-06-21', 'Boston', 'Massachusetts');
INSERT INTO Employee VALUES (103, 'Pratik', 'Parija', '2019-09-13', 'Chicago', 'Illinois');
INSERT INTO Employee VALUES (104, 'Chetan', 'Mistry', '2011-04-12', 'Miami', 'Florida');
INSERT INTO Employee VALUES (105, 'Anugraha', 'Varkey', '2017-08-16', 'Atlanta', 'Georgia');
INSERT INTO Employee VALUES (106, 'Rasagnya', 'Reddy', '2018-07-25', 'San Mateo', 'California');
INSERT INTO Employee VALUES (107, 'Aishwarya', 'Boralkar', '2010-12-18', 'San Francisco', 'California');
INSERT INTO Employee VALUES (108, 'Shantanu', 'Savant', '2015-11-27', 'Seattle', 'Washington');
INSERT INTO Employee VALUES (109, 'Kalpita', 'Malvankar', '2016-04-24', 'Boston', 'Massachusetts');
INSERT INTO Employee VALUES (110, 'Saylee', 'Bhagat', '2014-05-21', 'San Francisco', 'California');

INSERT INTO Department VALUES (1,'Human Resources');
INSERT INTO Department VALUES (2,'Software Development');
INSERT INTO Department VALUES (3,'Data Analysis');
INSERT INTO Department VALUES (4,'Data Science');
INSERT INTO Department VALUES (5,'Business Intelligence');
INSERT INTO Department VALUES (6,'Data Engineering');
INSERT INTO Department VALUES (7,'Manufacturing');
INSERT INTO Department VALUES (8,'Quality Control');

INSERT INTO Project VALUES (21,'Dev','Whatever');
INSERT INTO Project VALUES (22,'Prod','do something');
INSERT INTO Project VALUES (23,'Test','focus');
INSERT INTO Project VALUES (24,'Nothing','do nothing');
INSERT INTO Project VALUES (25,'Research','focus on everything');
INSERT INTO Project VALUES (26,'Next Steps','find some way out');

INSERT INTO AccountDetails VALUES (40,'Santander','S12344',101);
INSERT INTO AccountDetails VALUES (41,'Santander','S12345',102);
INSERT INTO AccountDetails VALUES (42,'Santander','S12346',103);
INSERT INTO AccountDetails VALUES (43,'Santander','S12347',104);
INSERT INTO AccountDetails VALUES (44,'Chase','C12344',105);
INSERT INTO AccountDetails VALUES (45,'Chase','C12345',106);
INSERT INTO AccountDetails VALUES (46,'Chase','C12347',107);
INSERT INTO AccountDetails VALUES (47,'Chase','C12334',108);
INSERT INTO AccountDetails VALUES (48,'BOFA','C12378',109);
INSERT INTO AccountDetails VALUES (49,'BOFA','C12390',110);

INSERT INTO Education VALUES (10,101,'MS',2017);
INSERT INTO Education VALUES (11,102,'MS',2019);
INSERT INTO Education VALUES (12,104,'MS',2011);
INSERT INTO Education VALUES (13,108,'MS',2015);
INSERT INTO Education VALUES (14,109,'Bachelor',2013);
INSERT INTO Education VALUES (15,107,'Bachelor',2008);
INSERT INTO Education VALUES (16,106,'Bachelor',2007);

INSERT INTO Leaves VALUES (51, 104, '2019-12-01');
INSERT INTO Leaves VALUES (52, 108, '2019-12-02');
INSERT INTO Leaves VALUES (53, 109, '2019-12-03');
INSERT INTO Leaves VALUES (54, 107, '2019-12-04');
INSERT INTO Leaves VALUES (55, 106, '2019-12-05');
INSERT INTO Leaves VALUES (56, 104, '2019-12-06');
INSERT INTO Leaves VALUES (57, 108, '2019-12-07');
INSERT INTO Leaves VALUES (58, 109, '2019-12-07');
INSERT INTO Leaves VALUES (59, 107, '2019-12-08');
INSERT INTO Leaves VALUES (60, 106, '2019-12-09');

INSERT INTO Attendance VALUES (90,10);
INSERT INTO Attendance VALUES (91,20);
INSERT INTO Attendance VALUES (92,30);
INSERT INTO Attendance VALUES (93,40);
INSERT INTO Attendance VALUES (94,45);
INSERT INTO Attendance VALUES (95,56);
INSERT INTO Attendance VALUES (96,58);

INSERT INTO Work_Location VALUES (71,'North',4,'New York City','New York');
INSERT INTO Work_Location VALUES (72,'North',4,'Boston','Massachusetts');
INSERT INTO Work_Location VALUES (73,'North',4,'Chicago','Illinois');
INSERT INTO Work_Location VALUES (74,'North',89,'Miami','Florida');
INSERT INTO Work_Location VALUES (75,'South',90,'Atlanta','Georgia');
INSERT INTO Work_Location VALUES (76,'South',100,'San Mateo','California');
INSERT INTO Work_Location VALUES (77,'South',4,'San Francisco','California');
INSERT INTO Work_Location VALUES (78,'South',2,'Seattle','Washington');
INSERT INTO Work_Location VALUES (79,'South',25,'Alpharetta','Georgia');
INSERT INTO Work_Location VALUES (80,'South',20,'Keene','New Hampshire');
INSERT INTO Work_Location VALUES (81,'South',22,'Hampton','New Hampshire');

INSERT INTO Employee_Attendance VALUES (101,90);
INSERT INTO Employee_Attendance VALUES (102,91);
INSERT INTO Employee_Attendance VALUES (103,92);
INSERT INTO Employee_Attendance VALUES (104,93);
INSERT INTO Employee_Attendance VALUES (105,94);
INSERT INTO Employee_Attendance VALUES (106,95);
INSERT INTO Employee_Attendance VALUES (107,96);
INSERT INTO Employee_Attendance VALUES (108,91);
INSERT INTO Employee_Attendance VALUES (109,92);
INSERT INTO Employee_Attendance VALUES (110,93);

INSERT INTO DepartmentProject VALUES (1,21);
INSERT INTO DepartmentProject VALUES (2,22);
INSERT INTO DepartmentProject VALUES (3,23);
INSERT INTO DepartmentProject VALUES (4,24);
INSERT INTO DepartmentProject VALUES (5,25);
INSERT INTO DepartmentProject VALUES (6,26);
INSERT INTO DepartmentProject VALUES (7,21);
INSERT INTO DepartmentProject VALUES (8,24);

INSERT INTO Salary VALUES (1,57600,30,200,1000,40);
INSERT INTO Salary VALUES (2,76800,40,300,1300,41);
INSERT INTO Salary VALUES (3,96000,50,400,1500,42);
INSERT INTO Salary VALUES (4,115200,60,500,1700,43);
INSERT INTO Salary VALUES (5,57600,30,200,1000,44);
INSERT INTO Salary VALUES (6,76800,40,300,1300,45);
INSERT INTO Salary VALUES (7,96000,50,400,1500,46);
INSERT INTO Salary VALUES (8,115200,60,500,1700,47);
INSERT INTO Salary VALUES (9,57600,30,200,1000,48);
INSERT INTO Salary VALUES (10,76800,40,300,1300,49);

INSERT INTO Employee VALUES (111,'Priyanka','Jonas','2016-11-14','New York City','New York');

commit;

INSERT INTO Employee VALUES (112,'John','Vincent','2018-06-18','Boston','Massachusetts');

SAVEPOINT A1;

INSERT INTO Employee VALUES (113,'Pratik','Panhale','2019-09-13','Chicago','Illinois');

SAVEPOINT A2;

select * from employee;


