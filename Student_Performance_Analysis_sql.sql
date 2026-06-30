CREATE DATABASE student_analysis;
USE student_analysis;

CREATE TABLE students (
    Student_id                  INT,
    Gender                      VARCHAR(10),
    School_Type                 VARCHAR(10),
    Parental_Involvement        VARCHAR(10),
    Parental_Education_Level    VARCHAR(20),
    Motivation_Level            VARCHAR(10),
    Teacher_Quality             VARCHAR(10),
    Peer_Influence              VARCHAR(10),
    Distance_from_Home          VARCHAR(10),
    Internet_Access             VARCHAR(5),
    Access_to_Resources         VARCHAR(10),
    Extracurricular_Activities  VARCHAR(5),
    Learning_Disabilities       VARCHAR(5),
    Family_Income               VARCHAR(10),
    Hours_Studied               INT,
    Attendance                  INT,
    Sleep_Hours                 INT,
    Physical_Activity           INT,
    Previous_Scores             INT,
    Tutoring_Sessions           INT,
    Exam_Score                  INT,
    Performance_Level           VARCHAR(30),
    Score_per_Hour              FLOAT
);

-- verify import and view data
SELECT COUNT(*) FROM students;       
SELECT * FROM students LIMIT 5;


-- 1. Total student count
SELECT COUNT(*) FROM students;

-- 2. Preview data
SELECT * FROM students LIMIT 10;

-- 3. Students per performance level
SELECT Performance_Level, COUNT(*) AS student_count
FROM students
GROUP BY Performance_Level;

-- 4. Average exam score
SELECT AVG(Exam_Score) AS Avg_Exam_Score
FROM students;

-- 5. Average attendance by performance level
SELECT Performance_Level,
       AVG(Attendance) AS Avg_Attendance
FROM students
GROUP BY Performance_Level;

-- 6. Average study hours by performance level
SELECT Performance_Level,
       AVG(Hours_Studied) AS Avg_Study_Hours
FROM students
GROUP BY Performance_Level;

-- 7. Top vs Weak performers - study hours
SELECT Performance_Level,
       AVG(Hours_Studied) AS Avg_Study_Hours
FROM students
WHERE Performance_Level IN ('Top Performer', 'Weak Performer')
GROUP BY Performance_Level;

-- 8. Tutoring sessions vs exam score
SELECT Tutoring_Sessions,
       AVG(Exam_Score) AS Avg_Score
FROM students
GROUP BY Tutoring_Sessions
ORDER BY Tutoring_Sessions;

-- 9. Motivation level vs exam score
SELECT Motivation_Level,
       AVG(Exam_Score) AS Avg_Score
FROM students
GROUP BY Motivation_Level
ORDER BY Avg_Score DESC;
