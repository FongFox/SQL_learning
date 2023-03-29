USE Company;
GO
--============================================
SELECT * FROM Employee;
GO
--SELECT * FROM Project;
GO
SELECT * FROM Dependent;
GO
--SELECT * FROM Works_On;
--GO
SELECT * FROM Deparment;
GO
--============================================
SELECT DISTINCT E.LName
FROM Employee AS E, Dependent AS Dp, Deparment AS D
WHERE D.DNumber = E.DNo AND NOT E.SSN = Dp.ESSN;
GO
SELECT LName FROM Employee
WHERE NOT EXISTS (SELECT ESSN FROM Dependent WHERE ESSN = SSN) AND SSN IN (SELECT MgrSsn FROM Deparment);
GO
--============================================

