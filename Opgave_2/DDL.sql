CREATE TABLE IF NOT EXISTS Student(
    Student_id INT NOT NULL,
    Student_Name VARCHAR(30) UNIQUE

);

CREATE TABLE IF NOT EXISTS Course(
    Course_id INT NOT NULL,
    Course_Name VARCHAR(50)

);

CREATE TABLE IF NOT EXISTS Project(
    Project_Name VARCHAR(30)

);

CREATE TABLE IF NOT EXISTS Exam(
    Exam_id INT NOT NULL

);

CREATE TABLE IF NOT EXISTS HandIn(
    HandIn_Name VARCHAR(30) NOT NULL,
    APPROVED VARCHAR(3)

);

CREATE TABLE IF NOT EXISTS Teacher(
    Teacher_id INT NOT NULL,
    Teacher_Name VARCHAR(30) UNIQUE,
    PRIMARY KEY (Teacher_id)
);

CREATE TABLE IF NOT EXISTS Supervisor(
    Teacher_id INT NOT NULL REFERENCES Teacher(Teacher_id)

);
