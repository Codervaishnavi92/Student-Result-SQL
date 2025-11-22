CREATE DATABASE StudentResultDB;

USE StudentResultDB;

CREATE TABLE Students (
    student_id INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(150),
	Semester INT CHECK (semester BETWEEN 1 AND 8));

	Select * from courses;

	CREATE TABLE Courses (
    course_id INT IDENTITY(100,1) PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits TINYINT NOT NULL
);


CREATE TABLE Results (
    result_id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    marks INT CHECK (marks BETWEEN 0 AND 100),
    grade VARCHAR(2),
    CONSTRAINT FK_Results_Student FOREIGN KEY (student_id) REFERENCES Students(student_id),
    CONSTRAINT FK_Results_Course FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
INSERT INTO Students (name, email, semester) VALUES
('Vaishnavi Yadav','vaishyv23@gmail.com',5),
('Urvshi Sharma','Urvashi@gmail.com',5),
('Rahul Rajput','rahul.v@gmail.com',6),
('Neha Singh','neha.singh@gmail.com',4),
('Aisha Sharma','Aisha@gmail.com',3),
('Gauri yadav','Manshi@gmail.com',7),
('Kaushki Sharma','kaush43@gmail.com',8),
('Ratan Sharma','shrma@gmail.com',6),
('Puja yadav','puja@gmail.com',4);

INSERT INTO Courses (course_name, credits) VALUES
('Database Systems',4),
('Operating Systems',3),
('Data Structures',4),
('Java programmin',4),
('Web Technology',4),
('DAA',4),
('Machine learning',4),
('Mathematics4',4),
('Constitution',4);


INSERT INTO Results (student_id, course_id, marks, grade) VALUES
(1, 100, 85, 'A'),
(1, 101, 78, 'B'),
(2, 100, 92, 'A'),
(3, 102, 66, 'C'),
(2, 103, 74, 'B'),
(4, 100, 88, 'A'),
(4, 101, 69, 'C'),
(5, 102, 95, 'A'),
(5, 103, 57, 'D');

SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Results;

SELECT s.student_id, s.name, s.email, s.semester,
       c.course_id, c.course_name, r.marks, r.grade
FROM Results r
JOIN Students s ON r.student_id = s.student_id
JOIN Courses c ON r.course_id = c.course_id
ORDER BY s.student_id;


SELECT s.student_id, s.name,
       AVG(CONVERT(DECIMAL(5,2), r.marks)) AS avg_marks
FROM Students s
JOIN Results r ON s.student_id = r.student_id
GROUP BY s.student_id, s.name
ORDER BY avg_marks DESC;

SELECT semester, COUNT(*) AS student_count
FROM Students
GROUP BY semester;

CREATE OR ALTER VIEW StudentFullReport AS
SELECT s.student_id, s.name, s.email, s.semester,
       c.course_id, c.course_name, r.marks, r.grade
FROM Results r
JOIN Students s ON r.student_id = s.student_id
JOIN Courses c ON r.course_id = c.course_id;

SELECT * FROM StudentFullReport;

CREATE OR ALTER PROCEDURE GetStudentReport
    @stu_id INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT *
    FROM StudentFullReport
    WHERE student_id = @stu_id;
END;
EXEC GetStudentReport @stu_id = 1;


