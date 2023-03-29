
--DROP DATABASE Company;	
CREATE DATABASE Company ON PRIMARY
(
	NAME = 'Company',
	FILENAME = 'D:\Desktop\WorkSpace\SQL\InSchool\Week 1\Company.mdf',
	SIZE = 3072KB,
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 1024KB 
)
LOG ON
(
	NAME = 'Company_log',
	FILENAME = 'D:\Desktop\WorkSpace\SQL\InSchool\Week 1\Company_log.ldf',
	SIZE = 1024KB,
	MAXSIZE = 2048KB,
	FILEGROWTH = 10%
);
--GO
GO
--============================================
USE Company
--============================================
--Create Table
--Create table Deparment 
CREATE TABLE Deparment
(
	DName varchar(15) NOT NULL,
	DNumber numeric(4,0) NOT NULL,
	MgrSsn char(9) NULL,
	MgrStartdate datetime NULL
);
GO
--create Employee table
CREATE TABLE Employee
(
	FName varchar(15) NOT NULL,
	Mlnit varchar(1) NULL,
	LName varchar(15) NOT NULL,
	SSN char(9) NOT NULL,
	BDate datetime NULL,
	Address varchar(30) NULL,
	Sex char(1) NULL,
	Salary numeric(10,2) NULL,
	SuperSSN char(9) NULL,
	DNo numeric(4,0) NULL
);
GO
--Create Deparment Location Table
CREATE TABLE Dept_Location
(
	DNumber numeric(4,0) NOT NULL,
	Dlocation varchar(15) NOT NULL
);
GO
--Create Project Table
CREATE TABLE Project 
(
	PName varchar(15) NOT NULL,
	PNumber numeric(4,0) NOT NULL,
	PLocation varchar(15) NULL,
	DNum numeric(4,0) NOT NULL
);
GO
--Create Works_On Table
CREATE TABLE Works_On
(
	ESSN char(9) NOT NULL, 
	PNo numeric(4,0) NOT NULL,
	Hours numeric(4,1) NULL
);
GO
--Create Dependent Table 
CREATE TABLE Dependent 
(
	ESSN char(9) NOT NULL,
	Dependent_Name varchar(15) NOT NULL,
	Sex char(1) NULL,
	BDate datetime NULL,
	Relationship varchar(8) NULL
);
GO
--============================================
--Primary key for Deparment table
ALTER TABLE Deparment 
ADD Constraint pk_Dept PRIMARY KEY(DNumber);
GO
--Primary key for Employee table
ALTER TABLE Employee 
ADD Constraint pk_Emp PRIMARY KEY(SSN);
GO
--Primary key for deparment location
ALTER TABLE Dept_Location 
ADD Constraint pk_Dept_Loca PRIMARY KEY(DNumber, DLocation);
GO
--primary key for Project
ALTER TABLE Project
ADD Constraint pk_Proj PRIMARY KEY(PNumber);
GO
--primary key for works on
ALTER TABLE Works_On
ADD Constraint pk_works_on PRIMARY KEY(ESSN, PNo);
GO
--primary key for Dependent
ALTER TABLE Dependent
ADD Constraint pk_Dependent PRIMARY KEY(ESSN, Dependent_Name);
GO
--============================================
--Foreign Key for Deparment
ALTER TABLE Deparment
ADD Constraint fk_Mgrssn FOREIGN KEY(Mgrssn) 
REFERENCES Employee(SSN);
GO
--Foreign Key for Employee
ALTER TABLE Employee
ADD Constraint fk_SuperSSN FOREIGN KEY(SuperSSN) 
REFERENCES Employee(SSN);
GO
ALTER TABLE Employee 
ADD Constraint fk_DNo Foreign key(DNo) 
REFERENCES Deparment(DNumber);
GO
--Foreign Key for Deparment Location 
ALTER TABLE Dept_Location
ADD Constraint fk_DNumber FOREIGN KEY(DNumber) 
REFERENCES Deparment(DNumber);
GO
--Forgein Key for project 
ALTER TABLE Project
ADD Constraint fk_DNum FOREIGN KEY (DNum) 
REFERENCES Deparment(DNumber);
GO
--Foreign Key for works on
ALTER TABLE Works_On
ADD Constraint fk_PNo FOREIGN KEY (PNo) 
REFERENCES Project(PNumber);
GO
ALTER TABLE Works_On
ADD Constraint fk_ESSN FOREIGN KEY (ESSN) 
REFERENCES Employee(SSN);
GO
--Foreign Key for Dependent
ALTER TABLE Dependent
ADD Constraint fk_depen_ESSN FOREIGN KEY (ESSN) 
REFERENCES Employee(SSN);
GO
--============================================
--Insert data
--Insert Employee table
Insert INTO Employee
VALUES	('John','B','Smith','123456789','01/09/1955','Houston,TX','M','30000',NULL,NULL);
GO
Insert INTO Employee
VALUES	('Franklin','T','Wong','333445555','12/08/1945','Houston, TX','M','40000',NULL, NULL);
GO
INSERT INTO Employee
VALUES ('Joyce','A','English','453453453','07/31/1962', 'Houston, TX','F','25000',NULL, NULL);
GO
INSERT INTO Employee
VALUES ('Ramesh','K','Narayan','666884444','09/15/1952','Humble, TX','M','38000',NULL, NULL);
GO
INSERT INTO Employee
VALUES ('James','E','Borg','888665555','11/10/1927','Houston, TX','M','55000',NULL, NULL);
GO
INSERT INTO Employee
VALUES ('Jennifer','S','Wallace','987654321','06/20/1931','Bellaire, TX','F','43000',NULL, NULL);
GO
INSERT INTO Employee
VALUES ('Ahmad','V','Jabbar','987987987','03/29/1959','Houston, TX','M','25000',NULL, NULL);
GO
INSERT INTO Employee
VALUES ('Alicia','J','Zelaya','999887777','07/19/1958','Spring, TX','F','25000',NULL, NULL);
GO
--Insert Deparment Table
INSERT INTO Deparment
VALUES ('Headquarters',1,'888665555','06/19/1971');
GO
INSERT INTO Deparment
VALUES ('Administration',4,'987654321','01/01/1985');
GO
INSERT INTO Deparment
VALUES ('Research',5,'333445555','05/22/1978');
GO
--Insert Dept_Location table
INSERT INTO Dept_Location
VALUES (1,'Houston');
GO
INSERT INTO Dept_Location
VALUES (4,'Stafford');
GO
INSERT INTO Dept_Location
VALUES (5,'Bellaire');
GO
INSERT INTO Dept_Location
VALUES (5,'Houston');
GO
INSERT INTO Dept_Location
VALUES (5,'Sugarland');
GO
--Insert Project table data
INSERT INTO Project
VALUES ('ProductX',1,'Bellaire',5);
GO
INSERT INTO Project
VALUES ('ProductY',2,'Sugarland',5);
GO
INSERT INTO Project
VALUES ('ProductZ',3,'Houston',5);
GO
INSERT INTO Project
VALUES ('Computerization',10,'Stafford',4);
GO
INSERT INTO Project
VALUES ('Reorganization',20,'Houston',1);
GO
INSERT INTO Project
VALUES ('Newbenefits',30,'Stafford',4);
GO
--Insert Works_On table data
INSERT INTO Works_On
VALUES ('123456789',1,32.5);
GO
INSERT INTO Works_On
VALUES ('123456789',2,7.5);
GO
INSERT INTO Works_On
VALUES ('333445555',2,10.0);
GO
INSERT INTO Works_On
VALUES ('333445555',3,10.0);
GO
INSERT INTO Works_On
VALUES ('333445555',10,10.0);
GO
INSERT INTO Works_On
VALUES ('333445555',20,10.0);
GO
INSERT INTO Works_On
VALUES ('453453453',1,20.0);
GO
INSERT INTO Works_On
VALUES ('453453453',2,20.0);
GO
INSERT INTO Works_On
VALUES ('666884444',3,40.0);
GO
INSERT INTO Works_On
VALUES ('888665555',20,NULL);
GO
INSERT INTO Works_On
VALUES ('987654321',20,15.0);
GO
INSERT INTO Works_On
VALUES ('987654321',30,20.0);
GO
INSERT INTO Works_On
VALUES ('987987987',10,35.0);
GO
INSERT INTO Works_On
VALUES ('987987987',30,5.0);
GO
INSERT INTO Works_On
VALUES ('999887777',10,10.0);
GO
INSERT INTO Works_On
VALUES ('999887777',30,30.0);
GO
--Insert Dependent table data
INSERT INTO Dependent
VALUES ('123456789','Alice','F','12/31/1978','Daughter');
GO
INSERT INTO Dependent
VALUES ('123456789','Elizabeth','F','05/05/1957','Spouse');
GO
INSERT INTO Dependent
VALUES ('123456789','Michael','M','01/01/1978','Son');
GO
INSERT INTO Dependent
VALUES ('333445555','Alice','F','04/05/1976','Daughter');
GO
INSERT INTO Dependent
VALUES ('333445555','Joy','F','05/03/1948','Spouse');
GO
INSERT INTO Dependent
VALUES ('333445555','Theodore','M','10/25/1973','Son');
GO
INSERT INTO Dependent
VALUES ('987654321','Abner','M','02/29/1932','Spouse');
GO
--============================================
--update data
--update employee table
UPDATE Employee
	set SuperSSN = '333445555', DNo = '5'
	WHERE SSN = '123456789';
GO
UPDATE Employee
	set SuperSSN = '888665555', DNo = '5'
	WHERE SSN = '333445555';
GO
UPDATE Employee
	set SuperSSN = '333445555', DNo = '5'
	WHERE SSN = '453453453';
GO
UPDATE Employee
	set SuperSSN = '333445555', DNo = '5'
	WHERE SSN = '666884444';
GO
UPDATE Employee
	set DNo = '1'
	WHERE SSN = '888665555';
GO
UPDATE Employee
	set SuperSSN = '888665555', DNo = '4'
	WHERE SSN = '987654321';
GO
UPDATE Employee
	set SuperSSN = '987654321', DNo = '4'
	WHERE SSN = '987987987';
GO
UPDATE Employee
	set SuperSSN = '987654321', DNo = '4'
	WHERE SSN = '999887777';
GO
--============================================
--test 
SELECT *  FROM Employee;
GO
SELECT *  FROM Deparment;
GO
SELECT * FROM Dept_Location;
GO
SELECT * FROM Project;
GO
SELECT * FROM Works_On;
GO
SELECT * FROM Dependent;
GO
--========================================
SELECT * FROM Employee
WHERE LName like 'N%';
GO
SELECT * FROM Employee
WHERE Sex = 'M' AND (Address = 'Spring, TX' OR Address = 'Humble, TX');
GO

SELECT * FROM Project
WHERE DNum = 5 AND PLocation = 'Houston';
GO

SELECT * FROM Dependent
WHERE Relationship = 'Son' AND BDate = '1988';
GO

SELECT * FROM Employee
WHERE BDate BETWEEN '1940' AND '1960' AND Sex = 'F' AND Salary BETWEEN 30000 AND 50000;
GO

