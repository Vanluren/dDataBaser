DROP TABLE IF EXISTS Student, Course, Project, Exam, Teacher, Supervisor, HandIn, CoursesHasHandIns, SupervisorSupervisesProject, StudentDoesProject, TeacherTeachesCourse;

CREATE Table Student(
    id INT ,
    Student_Name VARCHAR(30) UNIQUE,

    PRIMARY KEY(id)
);

CREATE Table Course(
    id INT ,
    Course_Name VARCHAR(60),

    PRIMARY KEY(id)
);

CREATE Table Project(
    Name VARCHAR(30),

    PRIMARY KEY(Name)
);

CREATE Table Exam(
    id INT ,
    Student_id INT,
    Attempts INT,
    Grade VARCHAR(3),

    PRIMARY KEY(id, Grade),
    FOREIGN KEY(Student_id) REFERENCES Student(id)
);

CREATE Table HandIn(
    Student_id INT,
    HandIn_Name VARCHAR(30) ,
    Approved VARCHAR(3),

    PRIMARY KEY(Approved),
    PRIMARY KEY(HandIn_Name),
    FOREIGN KEY(Student_id) REFERENCES Student(id)
);

CREATE Table Teacher(
    id INT,
    Teacher_Name VARCHAR(30) UNIQUE,

    PRIMARY KEY (id)
);

CREATE Table Supervisor(
    Teacher_id INT,

    FOREIGN KEY (Teacher_id) REFERENCES Teacher(id)
);


/*
Herunder findes alle relationerne vi har defineret i vores model
*/
CREATE Table StudentDoesProject(
    Student_id INT,
    Project_Name VARCHAR(60),
    Project_Grade INT,

    FOREIGN KEY(Student_id) REFERENCES Student(id),
    FOREIGN KEY Project_Name REFERENCES Project(Name)
);


CREATE Table TeacherTeachesCourse(
    Teacher_id INT,
    Course_id INT,

    FOREIGN KEY(Teacher_id) REFERENCES Teacher(id),
    FOREIGN KEY (Course_id) REFERENCES Course(id)
);

CREATE Table SupervisorSupervisesProject(
    Teacher_id INT,
    Project_Name VARCHAR(60),

    FOREIGN KEY(Teacher_id) REFERENCES Teacher(id),
    FOREIGN KEY (Project_Name) REFERENCES Project(Name)
);

CREATE Table CoursesHasHandIns(
    Course_id INT,
    HandIn_Name VARCHAR(30),

    FOREIGN KEY (Course_id) REFERENCES Course(id),
    FOREIGN KEY (HandIn_Name) REFERENCES HandIn(Name)
);
