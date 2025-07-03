CREATE TABLE co_requisites ( 
    course_code          VARCHAR(8),
    alternate_course     VARCHAR(8)
);

CREATE INDEX CO_REQ_CO_REQ_COURSE_CODE ON co_requisites (course_code);

CREATE TABLE course_convenor ( 
    convenor_number      VARCHAR(10)  NOT NULL,
    convenor_name        VARCHAR(50),
    convenor_surname     VARCHAR(50),
    CONSTRAINT SYS_PK_10450 PRIMARY KEY (convenor_number)
);

CREATE TABLE course_list ( 
    approval             boolean  DEFAULT false,
    course_list_id       VARCHAR(10)  NOT NULL,
    credit               DOUBLE  DEFAULT 0,
    course_code          VARCHAR(8),
    num_of_course        SMALLINT  DEFAULT 0
);

CREATE INDEX COURSE_LIST_COURSE_CODE ON course_list (course_code);
CREATE INDEX COURSE_LIST_COURSE_LISTCOURSE_LIST_ID ON course_list (course_list_id);
CREATE INDEX COURSE_LIST_NUM_OF_COURSE ON course_list (num_of_course);

CREATE TABLE highschool_results ( 
    subject              VARCHAR(50),
    marks                DOUBLE  DEFAULT 0,
    fps                  DOUBLE  DEFAULT 0,
    exam_number          VARCHAR(13)  NOT NULL
);

CREATE INDEX HIGHSCHOOL_RESULTS_HIGHSCHOOL_RESULTSEXAM_NUMBER ON highschool_results (exam_number);

CREATE TABLE major ( 
    major_code           VARCHAR(3)  NOT NULL,
    major_name           VARCHAR(50),
    description          VARCHAR(150),
    CONSTRAINT SYS_PK_10456 PRIMARY KEY (major_code)
);

CREATE TABLE pre_requisites ( 
    pre_requisites_id    INT AUTO_INCREMENT PRIMARY KEY,
    course_code          VARCHAR(8)
);

CREATE INDEX PRE_REQ_COURSE_CODE ON pre_requisites (course_code);

CREATE TABLE students ( 
    student_number       VARCHAR(9)  NOT NULL,
    student_name         VARCHAR(50),
    student_surname      VARCHAR(50),
    course_list_id       VARCHAR(10),
    year_started         TIMESTAMP,
    year_ended           TIMESTAMP,
    status               VARCHAR(30),
    credits              SMALLINT  DEFAULT 0,
    exam_number          VARCHAR(13),
    major_code           VARCHAR(3),
    degree_code          VARCHAR(5),
    CONSTRAINT SYS_PK_10462 PRIMARY KEY (student_number),
    CONSTRAINT STUDENTS_STUDENTSEXAM_NUMBER UNIQUE (exam_number),
    CONSTRAINT STUDENTS_MAJORSTUDENTS FOREIGN KEY (major_code) REFERENCES major (major_code)
);

CREATE INDEX STUDENTS_COURSE_CODE ON students (course_list_id);
CREATE INDEX STUDENTS_DEGREE_CODE ON students (degree_code);

CREATE TABLE course ( 
    course_code          VARCHAR(8)  NOT NULL,
    course_name          VARCHAR(50),
    start_date           TIMESTAMP,
    end_date             TIMESTAMP,
    convenor_number      VARCHAR(10),
    lecture_venues       VARCHAR(50),
    num_students         SMALLINT  DEFAULT 0,
    num_tutors           SMALLINT  DEFAULT 0,
    num_tutorials        SMALLINT  DEFAULT 0,
    num_practical        SMALLINT  DEFAULT 0,
    num_periods          SMALLINT  DEFAULT 0,
    prerequisties_id     SMALLINT  DEFAULT 0,
    total_capacity       SMALLINT  DEFAULT 0,
    CONSTRAINT SYS_PK_10444 PRIMARY KEY (course_code),
    CONSTRAINT COURSE_COURSE_CONVERNORCOURSE FOREIGN KEY (convenor_number) REFERENCES course_convenor (convenor_number)
);

CREATE INDEX COURSE_NUM_PERIODS ON course (num_periods);
CREATE INDEX COURSE_NUM_PRACTICAL ON course (num_practical);
CREATE INDEX COURSE_NUM_STUDENTS ON course (num_students);
CREATE INDEX COURSE_NUM_TUTORIALS ON course (num_tutorials);
CREATE INDEX COURSE_NUM_TUTORS ON course (num_tutors);
CREATE INDEX COURSE_PREREQUISTIES_ID ON course (prerequisties_id);

CREATE TABLE major_courses ( 
    major_code           VARCHAR(3)  NOT NULL,
    course_code          VARCHAR(8),
    CONSTRAINT MAJOR_COURSES_COURSE_CODE FOREIGN KEY (course_code) REFERENCES course (course_code)
);

CREATE INDEX MAJOR_COURSES_COURSE_CODE ON major_courses (course_code);
