/*
Below this we implement our main and supporting entities
*/

    /* This is the standard recipe for table
    creation, we follow in the entirety of
    our DML.sql

    -   First we drop the table if it exists, this
        is done to root out any problems which might arise
        when the <source ./"PATH"> command is called in CLI*/

    DROP TABLE IF EXISTS Student;

    /* - We then create the table*/
        CREATE Table Student(

            /* - Declare the attributes*/
            Student_id  INT,
            Student_Name VARCHAR(30),

            /* - Set the Primary Key*/
            PRIMARY KEY(Student_id)
        );

        /*- And then we make a CREATE INDEX-statement
            to index the newly made table, these are
            called for better indexing in the tables
            we rely on the most*/
        CREATE INDEX StudentIndex ON Student(Student_id);

    DROP TABLE IF EXISTS Course;
        CREATE Table Course(
            Course_id INT,
            Course_Name VARCHAR(60),
            Teacher_id INT,

            PRIMARY KEY(Course_id),
    /*- The FOREIGN KEY- Constraint is called
    to make a reference to the attribute it
    represents in another table. This is the
    Key value inheritance we rely so heavily on! */
            FOREIGN KEY(Teacher_id) REFERENCES Teacher(Teacher_id)
        );
        CREATE INDEX CourseIndex ON Course(Course_id);

    DROP TABLE IF EXISTS Project;
        CREATE Table Project(
            Project_Name VARCHAR(30),
            Supervisor_id INT,

            PRIMARY KEY(Project_Name),
            FOREIGN KEY(Supervisor_id) REFERENCES Teacher(Teacher_id)
        );
        CREATE INDEX ProjectIndex ON Project(Project_Name);

    DROP TABLE IF EXISTS Exam;
        CREATE Table Exam(
            Exam_id INT,
            Student_id INT,
            Course_id INT,
            Attempts INT,
            Exam_Grade VARCHAR(10),

            PRIMARY KEY(Exam_id),
            KEY(Exam_Grade),

            FOREIGN KEY(Student_id) REFERENCES Student(Student_id),
            FOREIGN KEY(Course_id) REFERENCES Course(Course_id)
        );

    DROP TABLE IF EXISTS HandIn;
        CREATE Table HandIn(
            Student_id INT,
            Course_id INT,
            HandIn_Name VARCHAR(30) ,
            Approved VARCHAR(3),

            FOREIGN KEY(Student_id) REFERENCES Student(Student_id),
            FOREIGN KEY(Course_id) REFERENCES Course(Course_id)
        );

    DROP TABLE IF EXISTS Supervisor;
        CREATE Table Supervisor(
            Supervisor_id INT,

            PRIMARY KEY (Supervisor_id),
            FOREIGN KEY(Supervisor_id) REFERENCES Teacher(Teacher_id)
        );

    DROP TABLE IF EXISTS Teacher;
        CREATE Table Teacher(
            Teacher_id INT,
            Teacher_Name VARCHAR(30) UNIQUE,

            PRIMARY KEY(Teacher_id)
        );
        CREATE INDEX TeacherIndex ON Teacher(Teacher_id);

/*
Below this is the Relationships we have decided to implement
*/
    DROP TABLE IF EXISTS StudentDoesProject;
        CREATE Table StudentDoesProject(
            Student_id INT,
            Project_Name VARCHAR(60),
            Project_Grade INT,

            PRIMARY KEY(Project_Name),
            FOREIGN KEY(Student_id) REFERENCES Student(Student_id),
            FOREIGN KEY(Project_Name) REFERENCES Project(Project_Name)
        );

    DROP TABLE IF EXISTS StudentAttendsCourse;
        CREATE TABLE StudentAttendsCourse(
            Student_id INT,
            Course_id INT,

            FOREIGN KEY(Student_id) REFERENCES Student(Student_id),
            FOREIGN KEY(Course_id) REFERENCES Course(Course_id)
        );
