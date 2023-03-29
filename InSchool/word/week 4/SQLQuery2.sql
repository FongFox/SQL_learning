--DROP DATABASE Library;	
CREATE DATABASE Library ON PRIMARY
(
	NAME = 'Library',
	FILENAME = 'D:\Desktop\WorkSpace\SQL Data Base\InSchool\CanNotBackUp\libary\Library.mdf',
	SIZE = 3072KB,
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 1024KB 
)
LOG ON
(
	NAME = 'Library_log',
	FILENAME = 'D:\Desktop\WorkSpace\SQL Data Base\InSchool\CanNotBackUp\libary\Library_log.ldf',
	SIZE = 1024KB,
	MAXSIZE = 2048KB,
	FILEGROWTH = 10%
);
--GO
GO
--=================================
USE Library;
GO
--=================================
--create table data
--Publisher data
CREATE TABLE Publisher (
	Name	VARCHAR(20) NOT NULL,
	Address	VARCHAR(30) NULL,
	Phone	VARCHAR(10) NULL
);
GO
--Book data
CREATE TABLE Book (
	Book_ID			SMALLINT NOT NULL,
	Title			VARCHAR(30) NOT NULL,
	Publisher_Name	VARCHAR(20) NULL
);
GO
--Library Branch data
CREATE TABLE Library_Branch (
	Branch_ID   	SMALLINT	NOT NULL,
	Branch_Name		VARCHAR(20)	NOT NULL,
	Address			VARCHAR(30)	NOT NULL
);
GO
--Book Authors data
CREATE TABLE Book_Authors (
	Book_ID      SMALLINT	NOT NULL,
	Author_Name  VARCHAR(20)	NOT NULL
);
GO
--Borrower data
CREATE TABLE Borrower (
	Card_NO     SMALLINT	NOT NULL,
	Name		VARCHAR(20)	NULL,
	Address		VARCHAR(30)	NULL,
	Phone		VARCHAR(10)	NULL
);
GO
--Book Copies data
CREATE TABLE Book_Copies (
	Book_ID  		SMALLINT	NOT NULL,
	Branch_ID		SMALLINT	NOT NULL,
	No_Of_Copies	SMALLINT	NULL
);
GO
--Book Loans data
CREATE TABLE Book_Loans (
	Book_ID  	SMALLINT	NOT NULL,
	Branch_ID	SMALLINT	NOT NULL,
	Card_NO  	SMALLINT	NOT NULL,
	Date_Out	DATETIME	NULL,
	Due_Date	DATETIME	NULL
);
GO
--=================================
--Create primary key for table data
ALTER TABLE Publisher
ADD Constraint pk_publisher PRIMARY KEY (Name);
GO
ALTER TABLE Book
ADD Constraint pk_bk PRIMARY KEY (Book_ID);
GO
ALTER TABLE Library_Branch
ADD Constraint pk_lib_br PRIMARY KEY (Branch_ID);
GO
ALTER TABLE Book_Authors
ADD Constraint pk_bk_au PRIMARY KEY (Book_ID, Author_Name);
GO
ALTER TABLE Borrower
ADD Constraint pk_bor PRIMARY KEY (Card_NO);
GO
ALTER TABLE Book_Copies
ADD Constraint pk_bk_cop PRIMARY KEY (Book_ID, Branch_ID);
GO
ALTER TABLE Book_Loans
ADD Constraint pk_bk_loans PRIMARY KEY (Book_ID, Branch_ID, Card_NO);
GO
--=====================================
--Create foreign key for table data
ALTER TABLE Book
ADD CONSTRAINT fk_bk_publisher_name FOREIGN KEY (Publisher_Name) REFERENCES Publisher(Name);
GO
ALTER TABLE Book_Authors
ADD CONSTRAINT fk_bk_author_bk_id FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID);
GO
ALTER TABLE Book_Copies
ADD CONSTRAINT fk_bk_copies_bk_id FOREIGN KEY (Book_ID) REFERENCES BOOK(Book_ID);
GO
ALTER TABLE Book_Copies
ADD CONSTRAINT fk_bk_copies_branch_id FOREIGN KEY (Branch_ID) REFERENCES Library_Branch(Branch_ID);
GO
ALTER TABLE Book_Loans
ADD CONSTRAINT fk_bk_loans_bk_id FOREIGN KEY (Book_ID) REFERENCES BOOK(Book_ID);
GO
ALTER TABLE Book_Loans
ADD CONSTRAINT fk_bk_loans_branch_id FOREIGN KEY (Branch_ID) REFERENCES Library_Branch(Branch_ID);
GO
ALTER TABLE Book_Loans
ADD CONSTRAINT fk_bk_loans_card_no FOREIGN KEY (Card_NO) REFERENCES Borrower(Card_NO);
GO
--==============================================
--Insert table data
--Publisher 
INSERT INTO Publisher
VALUES ('Amazing Books', '9012 Great Rd', '333-3333');
GO
INSERT INTO Publisher
VALUES ('Plume', '1234 Cool Ave', '555-5555');
GO
INSERT INTO Publisher
VALUES ('Random House',	'5678 Neat St', '444-4444');
GO
--Book
INSERT INTO Book
VALUES (1, 'The Lost Tribe', 'Random House');
GO
INSERT INTO Book
VALUES (2, 'Farook', 'Random House');
GO
INSERT INTO Book
VALUES (3, 'Carrie', 'Plume');
GO
INSERT INTO Book
VALUES (4, 'The Dark Tower VII', 'Plume');
GO
INSERT INTO Book
VALUES (5, 'Red Dawn', 'Amazing Books');
GO
INSERT INTO Book
VALUES (6, 'Zepplin', 'Amazing Books');
GO
--Insert Library Branch
INSERT INTO Library_Branch
VALUES (1, 'Sharpstown', '4321 Wonder Road');
GO
INSERT INTO Library_Branch
VALUES (2, 'Central', '9876 Flower St');
GO
--Insert Book Authors
INSERT INTO Book_Authors
VALUES (1, 'Master Nook');
GO
INSERT INTO Book_Authors
VALUES (2, 'Jardumba Nartangula');
GO
INSERT INTO Book_Authors
VALUES (3, 'Stephen King');
GO
INSERT INTO Book_Authors
VALUES (4, 'Stephen King');
GO
INSERT INTO Book_Authors
VALUES (5, 'John Smith');
GO
INSERT INTO Book_Authors
VALUES (6, 'Yasunori Mitsugi');
GO
--Borrower
INSERT INTO Borrower
VALUES (1, 'John Doe', '1234 Plain St', '532-2432');
GO
INSERT INTO Borrower
VALUES (2, 'Jane Doe', '1234 Plain St',	'532-2432');
GO
INSERT INTO Borrower
VALUES (3, 'Mike Jackson', '1111 nowhere', '222-2222');
GO
--Book Copies
INSERT INTO Book_Copies
VALUES (1,	1,	10);
GO
INSERT INTO Book_Copies
VALUES (1,	2,	10);
GO
INSERT INTO Book_Copies
VALUES (2,	1,	10);
GO
INSERT INTO Book_Copies
VALUES (2,	2,	10);
GO
INSERT INTO Book_Copies
VALUES (3,	1,	10);
GO
INSERT INTO Book_Copies
VALUES (3,	2,	10);
GO
INSERT INTO Book_Copies
VALUES (4,	1,	10);
GO
INSERT INTO Book_Copies
VALUES (4,	2,	10);
GO
INSERT INTO Book_Copies
VALUES (5,	1,	10);
GO
INSERT INTO Book_Copies
VALUES (5,	2,	10);
GO
INSERT INTO Book_Copies
VALUES (6,	2,	10);
GO
--Book Loans
INSERT INTO Book_Loans
VALUES (1,	1,	1,	'12/15/2005', 	NULL);
GO
INSERT INTO Book_Loans
VALUES (1,	2,	1,	'11/24/2005', 	NULL);
GO
INSERT INTO Book_Loans
VALUES (2,	1,	2,	'12/15/2005', 	NULL);
GO
INSERT INTO Book_Loans
VALUES (2,	2,	2,	'11/24/2005 ', 	NULL);
GO
INSERT INTO Book_Loans
VALUES (3,	1,	3,	'12/15/2005 ', 	NULL);
GO
INSERT INTO Book_Loans
VALUES (3,	2,	3,	'11/24/2005  ', 	NULL);
GO
INSERT INTO Book_Loans
VALUES (4,	1,	1,	'12/15/2005   ', 	NULL);
GO
INSERT INTO Book_Loans
VALUES (4,	2,	1,	'11/24/2005  ', 	NULL);
GO
INSERT INTO Book_Loans
VALUES (5,	1,	2,	'12/15/2005 ', 	NULL);
GO
INSERT INTO Book_Loans
VALUES (5,	2,	2,	'11/24/2005 ', 	NULL);
GO
INSERT INTO Book_Loans
VALUES (6,	1,	3,	'12/15/2005 ', 	NULL);
GO
INSERT INTO Book_Loans
VALUES (6,	2,	3,	'11/19/2009 ', 	NULL);
GO
--============================================
--Test 
SELECT * FROM Book_Authors; 
GO
SELECT * FROM Book; 
GO
SELECT * FROM Library_Branch; 
GO
SELECT * FROM Book_Loans; 
GO
SELECT * FROM Borrower; 
GO
SELECT * FROM Book_Copies; 
GO
SELECT * FROM Publisher; 
GO
SELECT * FROM Borrower, Book_Loans; 
GO
--============================================
SELECT Bk.Book_ID, Bk.Title, Lib_Branch.Branch_ID, Lib_Branch.Branch_Name,Bk_Cp.No_Of_Copies 
	FROM Book_Copies AS Bk_Cp, Book AS Bk, Library_Branch AS Lib_Branch
	WHERE Bk.Title = 'The Lost Tribe' AND Lib_Branch.Branch_Name = 'Sharpstown' AND Bk_Cp.Book_ID = 1 AND Bk_Cp.Branch_ID = 1;
GO

SELECT Bk_Cp.Book_ID, Bk.Title, Lib_Br.Branch_ID, Lib_Br.Branch_Name, Bk_Cp.No_Of_Copies 
	FROM Book_Copies AS Bk_Cp, Book AS Bk, Library_Branch AS Lib_Br
	WHERE (Bk_Cp.Book_ID = 1 AND Bk_Cp.Book_ID = Bk.Book_ID) AND Bk_Cp.Branch_ID = Lib_Br.Branch_ID;
	--WHERE BK_Cp.Book_ID = 1 AND Bk.Book_ID = 1;
GO

SELECT Name
	FROM Borrower
	WHERE Card_NO NOT IN ( SELECT Card_NO from Book_Loans);
GO

SELECT Bk.Title, B.Name, B.Address
	FROM Library_Branch AS Lib_Br, Borrower AS B, Book_Loans AS Bk_L, Book AS Bk
	WHERE Lib_Br.Branch_Name = 'Sharpstown' AND Lib_Br.Branch_ID = Bk_L.Branch_ID 
			AND Bk_L.Due_Date = '10/5/2022' AND B.Card_NO = Bk_L.Card_NO AND Bk.Book_ID = Bk.Book_ID;
GO

SELECT * FROM Library_Branch; 
GO
SELECT * FROM Book_Loans; 
GO
SELECT Lib_Br.Branch_Name, COUNT(*) AS Count_Lib_Br
	FROM Library_Branch AS Lib_Br, Book_Loans AS Bk_L 
	WHERE Lib_Br.Branch_ID = Bk_L.Branch_ID
	GROUP BY Lib_Br.Branch_Name;
GO

SELECT * FROM Borrower; 
GO
SELECT * FROM Book_Loans; 
GO
SELECT B.Name, B.Address, COUNT(*) AS Number_Of_Book
	FROM Borrower AS B, Book_Loans AS Bk_L
	WHERE B.Card_NO = Bk_L.Card_NO 
	GROUP BY B.Name, B.Address
	HAVING COUNT(*) > 5;
GO

SELECT * FROM Book_Authors; 
GO
SELECT * FROM Library_Branch
GO
SELECT * FROM Book_Copies; 
GO
SELECT Book_Copies.Book_ID, Book_Authors.Author_Name, Library_Branch.Branch_Name, Book_Copies.No_Of_Copies
	FROM
		(Book_Copies INNER JOIN Book_Authors ON Book_Copies.Book_ID = Book_Authors.Book_ID)
		INNER JOIN Library_Branch ON Book_Copies.Branch_ID = Library_Branch.Branch_ID
	WHERE 
		(Book_Copies.Book_ID = Book_Authors.Book_ID AND Book_Copies.Branch_ID = Library_Branch.Branch_ID) 
		AND Library_Branch.Branch_Name = 'Central' AND (Book_Copies.Book_ID = 3 OR Book_Copies.Book_ID = 4);
GO