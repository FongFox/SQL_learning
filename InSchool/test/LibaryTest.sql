USE Library;
GO
--=================================
SELECT * FROM Book_Authors; 
GO
SELECT * FROM Book; 
GO
--SELECT * FROM Library_Branch; 
--GO
SELECT * FROM Book_Loans; 
GO
--SELECT * FROM Borrower; 
--GO
--SELECT * FROM Book_Copies; 
--GO
--SELECT * FROM Publisher; 
--GO
--SELECT * FROM Borrower, Book_Loans; 
--GO
--=================================
SELECT B.Title, COUNT(B.Book_ID) FROM Book AS B
WHERE 
	B.Book_ID in ()
;
GO

