CREATE DATABASE Library
GO 

USE Library
GO

CREATE TABLE Authors(
AuthorID int primary key,
FirstName varchar(20),
LastName varchar(20),
BirthYear INT
);
GO
CREATE TABLE Books(
BookID INT PRIMARY KEY,
Title varchar(20),
AuthorID int foreign key references Authors(AuthorID) ,
PublishedYear INT,
CopiesAvailable INT, 
BookCategory varchar(50)
);
GO
INSERT INTO Authors (AuthorID, FirstName, LastName, BirthYear) VALUES 
(1,'JOUN','HO',1695),
(2,'MARK','GIK',1980),
(3,'KALI','MON',1890),
(4,'ELON','MUSK',1950),
(5,'KANA','LAI',1890);
GO
INSERT INTO Books VALUES
	(1,'AR',1,1998,100,'DRAMA'),
	(2,'DD',2,1955,50,'ACTION'),
	(3,'LL',2,1980,60,'SI'),
	(4,'II',3,1962,40,'LH'),
	(5,'JGB',4,1970,80,'HORROR');
GO


--1
SELECT * FROM Books;
GO
SELECT * FROM Authors;
GO


--2
SELECT * FROM Books
WHERE CopiesAvailable = (SELECT  MAX(CopiesAvailable) FROM Books)

SELECT * FROM Books
WHERE CopiesAvailable = (SELECT  MIN(CopiesAvailable) FROM Books)


--3
SELECT AVG(PublishedYear) AS AVGPublishedYear
FROM Books


--4
SELECT SUM(CopiesAvailable) AS BookCount
FROM Books

SELECT COUNT(CopiesAvailable) AS BookCount
FROM Books


--5
DELETE Books

--6
TRUNCATE TABLE Authors;
--delete by muose 