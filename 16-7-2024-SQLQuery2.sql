CREATE DATABASE SchooleSystem
GO

USE SchooleSystem
GO

CREATE TABLE Students
(
StudentID INT PRIMARY KEY,
FullName varchar(50),

)
CREATE TABLE Teachers
(
TeacherID int primary key,
FullName varchar(50)
)
CREATE TABLE Courses
(
CourseID int primary key,
CourseName varchar(50),
TeacherID INT FOREIGN KEY REFERENCES Teachers(TeacherID)
)
CREATE TABLE TeacherDetails
(
teacherDetailsID int primary key ,
TeacherID INT FOREIGN KEY REFERENCES Teachers(TeacherID),
StudentID INT FOREIGN KEY REFERENCES Students(StudentID)

)

INSERT INTO Teachers VALUES
(1,'Kamal'),
(2,'MOHAMMAD'),
(3,'KHALED'),
(4,'ALI');

INSERT INTO Students VALUES
(1,'ahmad'),
(2,'yazan'),
(3,'malik'),
(4,'zaid'),
(5,'rashed'),
(6,'hussam');

INSERT INTO Courses VALUES
(1,'Biology',4),
(2,'Chemistry',2),
(3,'Physics',1),
(4,'Mathematics',3);

INSERT INTO TeacherDetails VALUES
(1,2,1),
(2,3,2),
(3,4,3),
(4,1,4),
(5,2,5),
(6,4,6);


SELECT * FROM Teachers

SELECT * FROM Students

SELECT * FROM TeacherDetails