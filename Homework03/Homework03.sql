USE SEDC_ACADEMY_HOMEWORK
GO

-- Calculate the count of all grades per Teacher in the system

SELECT * FROM dbo.Grade
SELECT * FROM dbo.GradeDetails
SELECT * FROM dbo.Teacher
SELECT * FROM dbo.Student

SELECT g.TeacherID,
COUNT(g.ID) AS GradeCount
FROM dbo.Grade g
GROUP BY g.TeacherID

-- Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)

SELECT g.TeacherID,
COUNT(g.ID) AS GradeCount
FROM dbo.Grade g
WHERE StudentID < 100
GROUP BY g.TeacherID

-- Find the Maximal Grade, and the Average Grade per Student on all grades in the system

SELECT * FROM dbo.Grade
SELECT * FROM dbo.GradeDetails
SELECT * FROM dbo.Teacher
SELECT * FROM dbo.Student

SELECT g.StudentID,
MAX (g.Grade) AS MaximalGrade,
AVG (g.Grade) AS AvgGrade
FROM dbo.Grade g
GROUP BY g.StudentID

-- Calculate the count of all grades per Teacher in the system and filter only grade count greater than 200

SELECT g.TeacherID,
COUNT(g.ID) AS GradeCount
FROM dbo.Grade g
GROUP BY g.TeacherID
HAVING COUNT(g.ID) > 200


-- Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. 
-- Filter only records where Maximal Grade is equal to Average Grade

SELECT g.StudentID,
MAX (g.Grade) AS MaximalGrade,
AVG (g.Grade) AS AvgGrade
FROM dbo.Grade g
GROUP BY g.StudentID
HAVING MAX(g.Grade) = AVG(g.Grade)


-- List Student First Name and Last Name next to the other details from previous query

SELECT * FROM dbo.Grade
SELECT * FROM dbo.GradeDetails
SELECT * FROM dbo.Teacher
SELECT * FROM dbo.Student

SELECT g.StudentID, s.FirstName, s.LastName, 
MAX (g.Grade) AS MaximalGrade,
AVG (g.Grade) AS AvgGrade
FROM dbo.Grade g
JOIN dbo.[Student] s ON s.ID = g.StudentId
GROUP BY g.StudentID, s.FirstName, s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade)


-- Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student

CREATE VIEW vw_StudentGrades AS
SELECT g.StudentID
from dbo.Grade g

-- Change the view to show Student First and Last Names instead of StudentID

ALTER VIEW vw_StudentGrades AS
SELECT
	s.FirstName,
	s.LastName
FROM dbo.Student s

-- List all rows from view ordered by biggest Grade Count

ALTER VIEW vw_StudentGrades AS
SELECT
	s.FirstName,
	s.LastName,
	COUNT(g.Grade) AS GradeCount
FROM
	dbo.Grade g
JOIN
	dbo.Student s ON s.ID = g.StudentID
GROUP BY
	s.FirstName,
	s.LastName

SELECT * FROM vw_StudentGrades