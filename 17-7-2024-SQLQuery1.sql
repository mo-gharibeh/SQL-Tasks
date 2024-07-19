CREATE DATABASE Jaradat
GO

USE Jaradat
GO

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthYear INT
);

 CREATE TABLE Sections (
    SecID INT PRIMARY KEY IDENTITY(1,1),
    SecName VARCHAR(30) NOT NULL
);

 CREATE TABLE Categories (
    CatID INT PRIMARY KEY IDENTITY(1,1),
    CatName VARCHAR(100)
);

 CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(100),
    AuthorID INT,
    PublishedYear INT,
    CopiesAvailable INT,
    CatID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (CatID) REFERENCES Categories(CatID)
);

 CREATE TABLE Book_Sec (
    BookID INT,
    SecID INT,
    PRIMARY KEY (BookID, SecID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (SecID) REFERENCES Sections(SecID)
);

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
	SecID int ,
	foreign key (SecID) references sections(SecID)
);

 
 CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(50),
    Name VARCHAR(50),
    BirthDate DATE,
    Email VARCHAR(100)
);

INSERT INTO Authors 
VALUES
('John', 'Doe', 1975),
('Jane', 'Smith', 1980),
('Emily', 'Johnson', 1990),
('Michael', 'Brown', 1985),
('Sarah', 'Davis', 1995),
('David', 'Wilson', 1965),
('Laura', 'Taylor', 1970);
GO
SELECT * FROM Authors

INSERT INTO Sections 
VALUES
('A'),
('B'),
('C'),
('D'),
('E'),
('F'),
('G');
GO
SELECT * FROM Sections

INSERT INTO Categories 
VALUES
('Novel'),
('Textbook'),
('Research'),
('Documentary'),
('Memoir'),
('Picture Book'),
('Epic');
GO

SELECT * FROM Categories


INSERT INTO Books 
VALUES
('Book A', 1, 2000, 5,  1),
('Book B', 2, 2005, 2,  2),
('Book C', 3, 2010, 3,  3),
('Book D', 4, 2015, 4,  4),
('Book E', 5, 2020, 1,  5),
('Book F', 6, 1995, 7,  6),
('Book G', 7, 1980, 6,  7);
GO

SELECT * FROM Books

INSERT INTO Book_Sec
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 3),
(5, 5),
(5, 6),
(7, 7);
GO
DELETE Book_Sec

INSERT INTO Employees
VALUES
('Alice',' Johnson', 1),
('Bob ','Smith', 2),
('Charlie ','Brown', 3),
('Diana',' Prince', 4),
('Edward',' King', 5),
('Fiona',' White', 6),
('George ','Black', 7);
GO

 INSERT INTO Users 
VALUES
 ('user1', 'Alice Johnson', '1990-05-15', 'alice@example.com'),
    ( 'user2', 'Bob Smith', '1988-09-20', 'bob@example.com'),
    ( 'user3', 'Emma Davis', '1995-03-10', 'emma@example.com'),
    ( 'user4', 'James Wilson', '1985-11-25', 'james@example.com'),
    ( 'user5', 'Sophia Brown', '1992-07-03', 'sophia@example.com'),
    ( 'user6', 'phia rown', '1992-07-03', 'sophia@example.com'),
    ('user4', 'Soph rown', '1992-07-03', 'sophia@example.com');

	GO


--One-To-Many
SELECT b.Title, a.FirstName, a.LastName
FROM Books b
INNER JOIN Authors a ON b.AuthorID = a.AuthorID;

SELECT b.Title, a.FirstName, a.LastName
FROM Books b
LEFT JOIN Authors a ON b.AuthorID = a.AuthorID;

SELECT b.Title, a.FirstName, a.LastName
FROM Books b
RIGHT JOIN Authors a ON b.AuthorID = a.AuthorID;

 SELECT b.Title, a.FirstName, a.LastName
FROM Books b
FULL OUTER JOIN Authors a ON b.AuthorID = a.AuthorID;


--Many-To-Many
--INNER JOIN
SELECT b.Title, s.SecName
FROM Books b
INNER JOIN Book_Sec ON B.BookID = Book_Sec.BookID
INNER JOIN Sections s ON S.SecID = Book_Sec.SecID


--LEFT JOIN
SELECT b.Title, s.SecName
FROM Books b
LEFT JOIN Book_Sec ON B.BookID = Book_Sec.BookID
LEFT JOIN Sections s ON S.SecID = Book_Sec.SecID


--RIGHT JOIN
SELECT b.Title, s.SecName
FROM Books b
RIGHT JOIN Book_Sec ON B.BookID = Book_Sec.BookID
RIGHT JOIN Sections s ON S.SecID = Book_Sec.SecID


--FULL JOIN
SELECT b.Title, s.SecName
FROM Books b
FULL OUTER JOIN Book_Sec ON B.BookID = Book_Sec.BookID
FULL OUTER JOIN Sections s ON S.SecID = Book_Sec.SecID
