DROP TABLE IF EXISTS Course, CoursesHasHandIns, HandIn, Project, Student, StudentDoesProject, SupervisorSupervisesProject, Teacher;

CREATE Table Student(
    Student_id INT,
    Student_Name VARCHAR(30),

    PRIMARY KEY(Student_id)
);
CREATE INDEX StudentIndex ON Student(Student_id);

CREATE Table Teacher(
    Teacher_id INT,
    Teacher_Name VARCHAR(30) UNIQUE,

    PRIMARY KEY(Teacher_id)
);
CREATE INDEX TeacherIndex ON Teacher(Teacher_id);

CREATE Table Course(
    Course_id INT,
    Course_Name VARCHAR(60),
    Teacher_id INT,

    PRIMARY KEY(Course_id),
    FOREIGN KEY(Teacher_id) REFERENCES Teacher(Teacher_id)
);
CREATE INDEX CourseIndex ON Course(Course_id);

CREATE Table Project(
    Project_Name VARCHAR(30),

    PRIMARY KEY(Project_Name)
);
CREATE INDEX ProjectIndex ON Project(Project_Name);

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

CREATE Table HandIn(
    Student_id INT,
    Course_id INT,
    HandIn_Name VARCHAR(30) ,
    Approved VARCHAR(3),

    FOREIGN KEY(Student_id) REFERENCES Student(Student_id),
    FOREIGN KEY(Course_id) REFERENCES Course(Course_id)
);

CREATE Table Supervisor(
    Supervisor_id INT,

    PRIMARY KEY (Supervisor_id),
    FOREIGN KEY(Supervisor_id) REFERENCES Teacher(Teacher_id)
);


/*
Herunder findes alle relationerne vi har defineret i vores model
*/
CREATE Table StudentDoesProject(
    Student_id INT,
    Project_Name VARCHAR(60),
    Project_Grade VARCHAR(10),

    FOREIGN KEY(Student_id) REFERENCES Student(Student_id),
    FOREIGN KEY(Project_Name) REFERENCES Project(Project_Name)
);


CREATE Table TeacherTeachesCourse(
    Teacher_id INT,
    Course_id INT,

    FOREIGN KEY(Teacher_id) REFERENCES Teacher(Teacher_id),
    FOREIGN KEY(Course_id) REFERENCES Course(Course_id)
);

CREATE Table SupervisorSupervisesProject(
    Supervisor_id INT,
    Project_Name VARCHAR(60),

    
    FOREIGN KEY(Supervisor_id) REFERENCES Teacher(Teacher_id),
    FOREIGN KEY(Project_Name) REFERENCES Project(Project_Name)
);

CREATE TABLE StudentAttendsCourse(
    Student_id INT,
    Course_id INT,

    FOREIGN KEY(Student_id) REFERENCES Student(Student_id),
    FOREIGN KEY(Course_id) REFERENCES Course(Course_id)
);
