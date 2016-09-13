/*
3.1
*/
SELECT Student_id
        FROM Exam
        WHERE Exam_Grade < 10

/*
3.2
*/
SELECT Teacher_id, Course_id
    FROM Course
    WHERE Teacher_id = Teacher_id;

/*
3.3
*/
SELECT Student_id, AVG(Exam_Grade)
    FROM Exam
    GROUP BY Student_id

/*
3.4
*/


SELECT COUNT(DISTINCT (Average)) AS NumOfAvgGrades
    FROM (SELECT Student.Student_id, AVG(Exam_Grade) as Average
	      FROM Student, Exam)
