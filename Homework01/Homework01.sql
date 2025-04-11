CREATE DATABASE [SEDCACADEMYDB]
GO

USE [SEDCACADEMYDB];
GO


CREATE TABLE [Students](
	ID INT PRIMARY KEY,
	FirstName NVARCHAR(10) NOT NULL,
	LastName NVARCHAR(10) NOT NULL,
	DateOfBirth DATE NOT NULL,
	EnrolledDate DATE NOT NULL,
	Gender NCHAR(1) NOT NULL,
	NationalIDNumber NVARCHAR(20) NOT NULL,
	StudentCardNumber INT NOT NULL
)
GO

CREATE TABLE [Teachers] (
	ID INT PRIMARY KEY,
	FirstName NVARCHAR(10) NOT NULL,
	LastName NVARCHAR(10) NOT NULL,
	DateOfBirth DATE NOT NULL,
	AcademicRank NVARCHAR(20) NOT NULL,
	HireDate DATE NOT NULL
)
GO

CREATE TABLE [Grades] (
	ID INT PRIMARY KEY,
	StudentID NVARCHAR(20) NOT NULL,
	CourseID NVARCHAR(50) NOT NULL,
	TeacherID NVARCHAR(30) NOT NULL,
	Grade INT NOT NULL,
	Comment NVARCHAR(100) NULL,
	[Created Date] DATE NOT NULL, 
)
GO

CREATE TABLE [Courses] (
	ID INT PRIMARY KEY,
	[Name] NVARCHAR(10) NOT NULL,
	Credit INT NOT NULL,
	[Academic Year] INT NOT NULL,
	Semester INT NOT NULL
)
GO

CREATE TABLE [Achievement Types] (
    ID INT PRIMARY KEY,
	[Name] NVARCHAR(20) NOT NULL,
	[Description] NVARCHAR(50) NULL,
	[Participation Rate] NVARCHAR(100) NULL
)
GO

CREATE TABLE [Grade Details] (
    ID INT PRIMARY KEY,
	GradeID INT NOT NULL,
	[AchievementTypeID] NVARCHAR(30) NULL,
	[AchievementPoints] INT NULL,
	[AchievementMaxPoints] INT NULL,
	[AchievementDate] DATE NULL,
)
GO

SELECT * FROM dbo.[Students]

INSERT INTO dbo.[Students] (ID, FirstName, LastName, DateOfBirth, EnrolledDate, Gender, NationalIDNumber, StudentCardNumber)
VALUES (1, 'Trajko', 'Trajkovski', '1996-01-20', '2025-04-11', 'M', '123', 456);

SELECT * FROM dbo.[Teachers]

INSERT INTO Teachers (ID, FirstName, LastName, DateOfBirth, AcademicRank, HireDate)
VALUES (1, 'Mirche', 'Acev', '1999-09-19', 'Scholar', '2010-10-10');

SELECT * FROM dbo.[Grades]

INSERT INTO Grades (ID, StudentID, CourseID, TeacherID, Grade, Comment, [Created Date])
VALUES (1, 1, 1, 1, 90, 'Excellent work', '2023-12-15');

SELECT * FROM dbo.[Courses]

INSERT INTO Courses (ID, Name, Credit, [Academic Year], Semester)
VALUES (1, 'Java', 5, 2025, 1);

SELECT * FROM dbo.[Achievement Types]

INSERT INTO [Achievement Types] (ID, Name, Description, [Participation Rate])
VALUES (1, 'Homework Activity', 'Assignments Completition', 20.00);

SELECT * FROM dbo.[Grade Details]

INSERT INTO [Grade Details] (ID, GradeID, [AchievementTypeID], [AchievementPoints], [AchievementMaxPoints], [AchievementDate])
VALUES (1, 2, 3, 18, 25, '2025.04.11');