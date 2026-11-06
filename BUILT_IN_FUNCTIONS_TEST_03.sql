DROP DATABASE IF EXISTS training_functions;
CREATE DATABASE training_functions;
USE training_functions;

CREATE TABLE CourseEnrollments (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(40),
    LastName VARCHAR(40),
    CourseName VARCHAR(40),
    Fee DECIMAL(10,2),
    EnrollmentDate DATE,
    CompletionDate DATE
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


INSERT INTO CourseEnrollments
(StudentID, FirstName, LastName, CourseName, Fee, EnrollmentDate, CompletionDate)
VALUES
(101, 'aman', 'Sharma', 'Python', 12500.75, '2026-01-05', '2026-03-20'),
(102, 'priya', 'Verma', 'MySQL', 9800.40, '2026-01-12', '2026-02-28'),
(103, 'rahul', 'Singh', 'Python', 15750.90, '2026-02-01', '2026-04-15'),
(104, 'neha', 'Gupta', 'Power BI', 11200.25, '2026-02-10', '2026-05-05'),
(105, 'ishita', 'Kapoor', 'MySQL', 8900.60, '2026-03-03', '2026-04-22'),
(106, 'arjun', 'Mehta', 'Python', 13650.15, '2026-03-15', '2026-06-10'),
(107, 'simran', 'Joshi', 'Power BI', 10400.95, '2026-04-01', '2026-06-30'),
(108, 'vikas', 'Rao', 'MySQL', 7600.50, '2026-04-18', '2026-05-29'),
(109, 'kiran', 'Malik', 'Python', 14999.99, '2026-05-02', '2026-07-25'),
(110, 'rohan', 'Sethi', 'Power BI', 11950.35, '2026-05-20', '2026-08-14');


SELECT *
FROM CourseEnrollments;


SELECT
    UPPER(CONCAT(FirstName, ' ', LastName)) AS FullName
FROM CourseEnrollments;


SELECT
    CONCAT(
        UPPER(LEFT(FirstName, 1)),
        LOWER(SUBSTRING(FirstName, 2)),
        ' ',
        UPPER(LEFT(LastName, 1)),
        LOWER(SUBSTRING(LastName, 2))
    ) AS FullName
FROM CourseEnrollments;


SELECT
    StudentID,
    CourseName,
    CONCAT(UPPER(LEFT(CourseName, 3)), '-', StudentID) AS StudentCode
FROM CourseEnrollments;


SELECT
    FirstName,
    REVERSE(FirstName) AS ReversedName,
    CHAR_LENGTH(FirstName) AS CharacterCount
FROM CourseEnrollments;


SELECT
    FirstName,
    LOCATE('a', FirstName) AS LetterPosition
FROM CourseEnrollments;


SELECT
    FirstName,
    UPPER(REPLACE(FirstName, 'a', 'o')) AS ModifiedName
FROM CourseEnrollments;


SELECT
    FirstName,
    LPAD(FirstName, 12, '0') AS PaddedName
FROM CourseEnrollments;


SELECT
    FirstName,
    CourseName,
    CONCAT(RIGHT(CourseName, 2), '-', LEFT(FirstName, 2)) AS CourseLabel
FROM CourseEnrollments;


SELECT
    FirstName,
    LastName,
    CONCAT(
        UPPER(SUBSTRING(FirstName, 1, 3)),
        LOWER(RIGHT(LastName, 2))
    ) AS ModifiedName
FROM CourseEnrollments;


SELECT
    StudentID,
    Fee,
    ROUND(Fee, 1) AS RoundedFee_OneDecimal,
    ROUND(Fee, 0) AS RoundedFee_WholeNumber
FROM CourseEnrollments;


SELECT
    StudentID,
    Fee,
    CEIL(Fee) AS RoundedUp,
    FLOOR(Fee) AS RoundedDown
FROM CourseEnrollments;


SELECT
    StudentID,
    Fee,
    MOD(Fee, 500) AS Remainder
FROM CourseEnrollments;


SELECT
    StudentID,
    Fee,
    ABS(Fee - 10000) AS AbsoluteDifference
FROM CourseEnrollments;


SELECT
    StudentID,
    Fee,
    ROUND(Fee * 1.18, 2) AS FinalFee
FROM CourseEnrollments;


SELECT
    StudentID,
    Fee,
    FORMAT(Fee, 2) AS FormattedFee
FROM CourseEnrollments;


SELECT
    StudentID,
    EnrollmentDate,
    YEAR(EnrollmentDate) AS EnrollmentYear,
    MONTHNAME(EnrollmentDate) AS MonthName,
    DAYNAME(EnrollmentDate) AS DayName
FROM CourseEnrollments;


SELECT
    StudentID,
    DATE_FORMAT(EnrollmentDate, '%d/%m/%Y') AS EnrollmentDate,
    DATE_FORMAT(CompletionDate, '%M %d, %Y') AS CompletionDate
FROM CourseEnrollments;


SELECT
    StudentID,
    EnrollmentDate,
    CompletionDate,
    TIMESTAMPDIFF(DAY, EnrollmentDate, CompletionDate) AS TotalDays
FROM CourseEnrollments;


SELECT
    StudentID,
    EnrollmentDate,
    DATE_ADD(
        DATE_ADD(EnrollmentDate, INTERVAL 1 MONTH),
        INTERVAL 10 DAY
    ) AS NewDate
FROM CourseEnrollments;


SELECT
    StudentID,
    CompletionDate,
    DATE_ADD(CompletionDate, INTERVAL -7 DAY) AS PreviousDate
FROM CourseEnrollments;


SELECT
    StudentID,
    EnrollmentDate,
    CompletionDate,
    TIMESTAMPDIFF(MONTH, EnrollmentDate, CompletionDate) AS TotalMonths
FROM CourseEnrollments;


SELECT
    StudentID,
    EnrollmentDate,
    DATE_ADD(
        DATE_ADD(
            DATE_ADD(EnrollmentDate, INTERVAL 1 YEAR),
            INTERVAL 2 MONTH
        ),
        INTERVAL 5 DAY
    ) AS UpdatedDate
FROM CourseEnrollments;


SELECT
    StudentID,
    EnrollmentDate,
    DAYNAME(EnrollmentDate) AS EnrollmentDay,
    CompletionDate,
    DAYNAME(CompletionDate) AS CompletionDay
FROM CourseEnrollments;


SELECT
    StudentID,
    EnrollmentDate,
    CURDATE() AS CurrentDate,
    TIMESTAMPDIFF(DAY, EnrollmentDate, CURDATE()) AS DaysUntilToday
FROM CourseEnrollments;


SELECT
    StudentID,
    DATE_FORMAT(CompletionDate, '%d/%m/%Y') AS OriginalDate,
    DATE_FORMAT(
        DATE_ADD(CompletionDate, INTERVAL 15 DAY),
        '%d/%m/%Y'
    ) AS NewDate
FROM CourseEnrollments;