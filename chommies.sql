CREATE TABLE corequisites (
    course_code VARCHAR(8),
    alternate_course VARCHAR(8)
);

CREATE INDEX COREQUISITES_CO_REQUISITESCOURSE_CODE ON corequisites (course_code);

CREATE TABLE course_convenor (
    convenor_number VARCHAR(10) ,
    convenor_name VARCHAR(50),
    convenor_surname VARCHAR(50)
);

CREATE TABLE course_list (
    approval BOOLEAN DEFAULT false,
    course_list_id VARCHAR(10),
    credit DOUBLE DEFAULT 0,
    course_code VARCHAR(8),
    status VARCHAR(20)
);

CREATE INDEX COURSE_LIST_COURSE_CODE ON course_list (course_code);
CREATE INDEX COURSE_LIST_COURSE_LISTCOURSE_LIST_ID ON course_list (course_list_id);
CREATE INDEX COURSE_LIST_NUM_OF_COURSE ON course_list (status);

CREATE TABLE degree (
    requirements VARCHAR(100),
    degree_code VARCHAR(5),
    credits_needed SMALLINT DEFAULT 0,
    degree_name VARCHAR(50),
    major_code VARCHAR(5)
);

CREATE INDEX DEGREE_MAJOR_CODE ON degree (major_code);

CREATE TABLE highschool_results (
    subject VARCHAR(50),
    marks DOUBLE DEFAULT 0,
    fps DOUBLE DEFAULT 0,
    exam_number VARCHAR(13)
);

CREATE TABLE major (
    major_code VARCHAR(5) PRIMARY KEY,
    major_name VARCHAR(50),
    description VARCHAR(255)
);

CREATE TABLE major_courses (
    course_code VARCHAR(8),
    major_code VARCHAR(5),
    FOREIGN KEY (major_code) REFERENCES major(major_code)
);

CREATE TABLE prerequisites (
    prerequisites_id SMALLINT ,
    course_code VARCHAR(8)
);

CREATE TABLE students (
    student_number VARCHAR(9) PRIMARY KEY,
    student_name VARCHAR(50),
    student_surname VARCHAR(50),
    course_list_id VARCHAR(10),
    year_started TIMESTAMP,
    year_ended TIMESTAMP,
    status VARCHAR(30),
    credits SMALLINT DEFAULT 0,
    exam_number VARCHAR(13),
    degree_code VARCHAR(5),
    major_id_2 VARCHAR(5),
    major_id_1 VARCHAR(5),
    FOREIGN KEY (major_id_1) REFERENCES major(major_code)
);

CREATE INDEX STUDENTS_COURSE_CODE ON students (course_list_id);
CREATE INDEX STUDENTS_DEGREE_CODE ON students (degree_code);
CREATE INDEX STUDENTS_MAJOR_ID ON students (major_id_1);
CREATE INDEX STUDENTS_STUDENTSEXAM_NUMBER ON students (exam_number);

CREATE TABLE course (
    course_code VARCHAR(8) PRIMARY KEY,
    course_name VARCHAR(50),
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    convenor_number VARCHAR(10),
    lecture_venues VARCHAR(50),
    num_students SMALLINT DEFAULT 0,
    num_tutors SMALLINT DEFAULT 0,
    num_tutorials SMALLINT DEFAULT 0,
    num_practical SMALLINT DEFAULT 0,
    num_periods SMALLINT DEFAULT 0,
    prerequisties_id SMALLINT DEFAULT 0,
    total_capacity SMALLINT DEFAULT 0,
    credit VARCHAR(255),
    FOREIGN KEY (convenor_number) REFERENCES course_convenor(convenor_number)
);

CREATE INDEX COURSE_NUM_PERIODS ON course (num_periods);
CREATE INDEX COURSE_NUM_PRACTICAL ON course (num_practical);
CREATE INDEX COURSE_NUM_STUDENTS ON course (num_students);
CREATE INDEX COURSE_NUM_TUTORIALS ON course (num_tutorials);
CREATE INDEX COURSE_NUM_TUTORS ON course (num_tutors);
CREATE INDEX COURSE_PREREQUISTIES_ID ON course (prerequisties_id);


INSERT INTO corequisites( course_code, alternate_course ) VALUES ( 'CSC1015F', 'CSC1010H');
INSERT INTO corequisites( course_code, alternate_course ) VALUES ( 'CSC1015F', 'CSC1019H');
INSERT INTO corequisites( course_code, alternate_course ) VALUES ( 'CSC1015F', 'CSC1017H');
INSERT INTO corequisites( course_code, alternate_course ) VALUES ( 'INF1002F', 'CSC1015F');
INSERT INTO corequisites( course_code, alternate_course ) VALUES ( 'INF1003S', 'CSC1016S');
INSERT INTO corequisites( course_code, alternate_course ) VALUES ( 'MAM1004F', 'MAM1004S');
INSERT INTO corequisites( course_code, alternate_course ) VALUES ( 'CSC1016S', 'CSC1011S');
INSERT INTO corequisites( course_code, alternate_course ) VALUES ( 'STA1000S', 'STA1007S');
INSERT INTO corequisites( course_code, alternate_course ) VALUES ( 'STA1000F', 'STA1000S');
INSERT INTO corequisites( course_code, alternate_course ) VALUES ( 'STA1000S', 'STA1006S');
INSERT INTO corequisites( course_code, alternate_course ) VALUES ( 'BIO1000F', 'BIO1000H');
INSERT INTO corequisites( course_code, alternate_course ) VALUES ( 'PHY1031F', 'PHY1023H');
INSERT INTO corequisites( course_code, alternate_course ) VALUES ( 'MAM1004F', 'MAM1031F');
INSERT INTO corequisites( course_code, alternate_course ) VALUES ( 'MAM1004F', 'MAM1033F');
INSERT INTO corequisites( course_code, alternate_course ) VALUES ( 'MAM1004F', 'MAM1005H');
INSERT INTO course_convenor( convenor_number, convenor_name, convenor_surname ) VALUES ( '100', 'To be advised', 'To be advised');
INSERT INTO course_convenor( convenor_number, convenor_name, convenor_surname ) VALUES ( '101', 'Sonia', 'Berman');
INSERT INTO course_convenor( convenor_number, convenor_name, convenor_surname ) VALUES ( '102', 'Ayanda', 'Pekane');
INSERT INTO course_convenor( convenor_number, convenor_name, convenor_surname ) VALUES ( '103', 'Neil', 'Watson');
INSERT INTO course_convenor( convenor_number, convenor_name, convenor_surname ) VALUES ( '104', 'Adheesh', 'Burdree');
INSERT INTO course_convenor( convenor_number, convenor_name, convenor_surname ) VALUES ( '105', 'Aslam', 'Safla');
INSERT INTO course_convenor( convenor_number, convenor_name, convenor_surname ) VALUES ( '106', 'Spencer', 'Wheaton');
INSERT INTO course_convenor( convenor_number, convenor_name, convenor_surname ) VALUES ( '107', 'Harry', 'Weigert');
INSERT INTO course_convenor( convenor_number, convenor_name, convenor_surname ) VALUES ( '108', 'J M', 'Bishop');
INSERT INTO course_convenor( convenor_number, convenor_name, convenor_surname ) VALUES ( '109', 'M', 'Vaaltyn');
INSERT INTO course_convenor( convenor_number, convenor_name, convenor_surname ) VALUES ( '110', 'R', 'Altwegg');
INSERT INTO course_convenor( convenor_number, convenor_name, convenor_surname ) VALUES ( '111', 'S', 'Salau');
INSERT INTO course_convenor( convenor_number, convenor_name, convenor_surname ) VALUES ( '112', 'Greg S', 'Smith');
INSERT INTO course_convenor( convenor_number, convenor_name, convenor_surname ) VALUES ( '113', 'G', 'Stewart');
INSERT INTO course_convenor( convenor_number, convenor_name, convenor_surname ) VALUES ( '114', 'R', 'Maliwatu');
INSERT INTO course_convenor( convenor_number, convenor_name, convenor_surname ) VALUES ( '115', 'D', 'Snyman');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 0, '1', 0.0, 'CSC2002S', 'Ongoing');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '1', 0.0, 'CSC2001F', 'Ongoing');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '1', 18.0, 'BIO1000F', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '1', 18.0, 'BIO1004S', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '1', 36.0, 'CEM1000W', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '1', 18.0, 'MAM1004F', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '1', 18.0, 'CSC1015F', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '1', 18.0, 'CSC1016S', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 0, '5', 0.0, 'CSC2002S', 'Ongoing');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '5', 0.0, 'CSC2001F', 'Ongoing');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '5', 0.0, 'BIO1000F', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '5', 18.0, 'BIO1004S', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '5', 36.0, 'CEM1000W', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '5', 18.0, 'MAM1004F', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '5', 18.0, 'CSC1015F', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '5', 18.0, 'CSC1016S', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '2', 18.0, 'MAM1004F', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '2', 18.0, 'CSC1015F', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '2', 18.0, 'CSC1016S', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '2', 18.0, 'PHY1032S', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '2', 0.0, 'CSC2001F', 'Ongoing');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 0, '2', 0.0, 'CSC2002S', 'Ongoing');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '2', 18.0, 'BIO1000F', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '2', 18.0, 'STA1000F', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '1', 18.0, 'STA1000F', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '4', 18.0, 'MAM1004F', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '4', 18.0, 'CSC1015F', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '4', 18.0, 'CSC1016S', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '4', 18.0, 'PHY1031F', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '4', 18.0, 'PHY1032S', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '4', 0.0, 'CSC2001F', 'Ongoing');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 0, '4', 0.0, 'CSC2002S', 'Ongoing');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '4', 18.0, 'STA1000F', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '3', 18.0, 'STA1000F', 'Ongoing');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 0, '3', 18.0, 'FTX1005F', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '3', 18.0, 'MAM1004F', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '3', 18.0, 'CSC1015F', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '3', 18.0, 'CSC1016S', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 0, '3', 0.0, 'CSC2002S', 'Ongoing');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '3', 0.0, 'CSC2001F', 'Ongoing');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '3', 18.0, 'MAM1008S', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 0, '1', 0.0, 'MAM1008S', 'Ongoing');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '5', 0.0, 'STA1000F', 'Ongoing');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '5', 18.0, 'MAM1008S', 'Done');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 0, '5', 0.0, 'FTX1005S', 'Ongoing');
INSERT INTO course_list( approval, course_list_id, credit, course_code, status ) VALUES ( 1, '2', 18.0, 'PHY1031F', 'Done');
INSERT INTO degree( requirements, degree_code, credits_needed, degree_name, major_code ) VALUES ( 'None', 'SB001', 420, 'BSc in Archeology', 'AGE');
INSERT INTO degree( requirements, degree_code, credits_needed, degree_name, major_code ) VALUES ( 'None', 'SB001', 420, 'BSc in Astrophysics', 'AST');
INSERT INTO degree( requirements, degree_code, credits_needed, degree_name, major_code ) VALUES ( 'NSC Bio or Physics - 60%', 'SB001', 420, 'BSc in Biology', 'BIO');
INSERT INTO degree( requirements, degree_code, credits_needed, degree_name, major_code ) VALUES ( 'NSC Physical Science - 60% and Maths - 70%', 'SB001', 420, 'BSc in Chemistry', 'CEM');
INSERT INTO degree( requirements, degree_code, credits_needed, degree_name, major_code ) VALUES ( 'NSC Maths - 70%;', 'SB001', 420, 'BSc in Computer Science', 'CSC');
INSERT INTO degree( requirements, degree_code, credits_needed, degree_name, major_code ) VALUES ( 'NSC Geog - 50% or GEO1000F', 'SB001', 420, 'BSc in Environmental Science', 'EGS');
INSERT INTO degree( requirements, degree_code, credits_needed, degree_name, major_code ) VALUES ( 'NSC Geog - 50% or Physics or Life Science - 60%', 'SB001', 420, 'BSc in Geology', 'GEO');
INSERT INTO degree( requirements, degree_code, credits_needed, degree_name, major_code ) VALUES ( 'GEO1009F - 45%', 'SB001', 420, 'BSc in Geological Science', 'GEO');
INSERT INTO degree( requirements, degree_code, credits_needed, degree_name, major_code ) VALUES ( 'MAM1004F OR MAM1031F', 'SB001', 420, 'BSc in Applied Mathematics', 'MA1');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'English', 78.0, 78.0, '1737583729070');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Accounting', 84.0, 84.0, '1746283749005');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'English', 68.0, 68.0, '1746283749005');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Mathematics', 80.0, 80.0, '1746283749005');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Life Orientation', 60.0, 0.0, '1746283749005');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Physical Science', 75.0, 75.0, '1746283749005');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Afrikaans', 74.0, 74.0, '1746283749005');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Life Science', 72.0, 72.0, '1746283749005');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Mathematics', 76.0, 76.0, '1737583729070');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Afriaans', 70.0, 70.0, '1737583729070');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Life Science', 72.0, 72.0, '1737583729070');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Physical Science', 67.0, 67.0, '1737583729070');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Life Orientation', 80.0, 0.0, '1737583729070');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Information Technology', 82.0, 82.0, '1737583729070');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'English', 68.0, 68.0, '1756254878615');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Mathematics', 76.0, 76.0, '1756254878615');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Life Orientation', 77.0, 0.0, '1756254878615');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Information Technology', 70.0, 70.0, '1756254878615');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Afrikaans', 75.0, 75.0, '1756254878615');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Physical Science', 60.0, 60.0, '1756254878615');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Life Science', 75.0, 75.0, '1756254878615');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Information Technology', 81.0, 81.0, '1772388237823');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'English', 65.0, 65.0, '1772388237823');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Afrikaans', 72.0, 72.0, '1772388237823');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Mathematics', 81.0, 81.0, '1772388237823');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Life Orientation', 70.0, 0.0, '1772388237823');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Life Science', 78.0, 78.0, '1772388237823');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Physical Science', 70.0, 70.0, '1772388237823');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'English', 72.0, 72.0, '1785412348123');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Afrikaans', 65.0, 65.0, '1785412348123');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Life Orientation', 87.0, 0.0, '1785412348123');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Mathematics', 84.0, 84.0, '1785412348123');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Physical Science', 81.0, 81.0, '1785412348123');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Life Science', 78.0, 78.0, '1785412348123');
INSERT INTO highschool_results( subject, marks, fps, exam_number ) VALUES ( 'Information Technology', 83.0, 83.0, '1785412348123');
INSERT INTO major( major_code, major_name, description ) VALUES ( 'AGE', 'Archeology', null);
INSERT INTO major( major_code, major_name, description ) VALUES ( 'AST', 'Astrophysics', null);
INSERT INTO major( major_code, major_name, description ) VALUES ( 'BIO', 'Biology', null);
INSERT INTO major( major_code, major_name, description ) VALUES ( 'CEM', 'Chemistry', null);
INSERT INTO major( major_code, major_name, description ) VALUES ( 'CSC02', 'Business Computing', 'Studying business computing involves understanding how information technology (IT) can be applied to solve business problems, improve efficiency, and create value.');
INSERT INTO major( major_code, major_name, description ) VALUES ( 'CSC03', 'Computer Engineering', 'Studying computer engineering involves a blend of electrical engineering and computer science, focusing on the design, development, and integration of computer systems and related technologies.');
INSERT INTO major( major_code, major_name, description ) VALUES ( 'CSC05', 'Computer Science', 'Studying computer science involves diving into various aspects of computing, including theory, programming, and practical application.');
INSERT INTO major( major_code, major_name, description ) VALUES ( 'EGS', 'Environmental & Geographical Science', null);
INSERT INTO major( major_code, major_name, description ) VALUES ( 'GEO', 'Geology', null);
INSERT INTO major( major_code, major_name, description ) VALUES ( 'HUB', 'Human Anatomy & Physiology', null);
INSERT INTO major( major_code, major_name, description ) VALUES ( 'MA1', 'Applied Mathematics', null);
INSERT INTO major( major_code, major_name, description ) VALUES ( 'MAM', 'Mathematics', null);
INSERT INTO major( major_code, major_name, description ) VALUES ( 'MBO', 'Marine Biology', null);
INSERT INTO major( major_code, major_name, description ) VALUES ( 'MCB01', 'Biochemistry', 'Studying biochemistry involves the exploration of chemical processes within and related to living organisms, providing a fundamental understanding of life at a molecular level.');
INSERT INTO major( major_code, major_name, description ) VALUES ( 'MCG', 'Genetics', null);
INSERT INTO major( major_code, major_name, description ) VALUES ( 'MST', 'Mathemathical Statistics', null);
INSERT INTO major( major_code, major_name, description ) VALUES ( 'PHY', 'Physics', null);
INSERT INTO major( major_code, major_name, description ) VALUES ( 'QBO', 'Quantitative Biology', null);
INSERT INTO major( major_code, major_name, description ) VALUES ( 'SDS', 'Statistics & Data Science', null);
INSERT INTO major( major_code, major_name, description ) VALUES ( 'SEA', 'Ocean & Atmosphere Science', null);
INSERT INTO major( major_code, major_name, description ) VALUES ( 'STA01', 'Applied Staistics', 'Studying applied statistics involves the practical application of statistical methods and techniques to analyze data and make informed decisions across various fields.');
INSERT INTO major_courses( course_code, major_code ) VALUES ( 'PHY1032', 'CSC03');
INSERT INTO major_courses( course_code, major_code ) VALUES ( 'CSC1015F', 'CSC03');
INSERT INTO major_courses( course_code, major_code ) VALUES ( 'CSC1016F', 'CSC03');
INSERT INTO major_courses( course_code, major_code ) VALUES ( 'MAM1004F', 'STA01');
INSERT INTO major_courses( course_code, major_code ) VALUES ( 'MAM1008S', 'STA01');
INSERT INTO major_courses( course_code, major_code ) VALUES ( 'STA1000F', 'STA01');
INSERT INTO major_courses( course_code, major_code ) VALUES ( 'CSC1015F', 'CSC02');
INSERT INTO major_courses( course_code, major_code ) VALUES ( 'CSC1016S', 'CSC02');
INSERT INTO major_courses( course_code, major_code ) VALUES ( 'FTX1005S', 'CSC02');
INSERT INTO major_courses( course_code, major_code ) VALUES ( 'MAM1004F', 'CSC02');
INSERT INTO major_courses( course_code, major_code ) VALUES ( 'MAM1008S', 'CSC02');
INSERT INTO major_courses( course_code, major_code ) VALUES ( 'BIO1000F', 'MCB01');
INSERT INTO major_courses( course_code, major_code ) VALUES ( 'BIO1004S', 'MCB01');
INSERT INTO major_courses( course_code, major_code ) VALUES ( 'MAM1004F', 'MCB01');
INSERT INTO major_courses( course_code, major_code ) VALUES ( 'CEM1000W', 'MCB01');
INSERT INTO major_courses( course_code, major_code ) VALUES ( 'STA1000S', 'MCB01');
INSERT INTO major_courses( course_code, major_code ) VALUES ( 'CSC1015F', 'CSC05');
INSERT INTO major_courses( course_code, major_code ) VALUES ( 'CSC1016F', 'CSC05');
INSERT INTO major_courses( course_code, major_code ) VALUES ( 'MAM1004F', 'CSC05');
INSERT INTO major_courses( course_code, major_code ) VALUES ( 'MAM1008S', 'CSC05');
INSERT INTO major_courses( course_code, major_code ) VALUES ( 'CSC2001F', 'CSC05');
INSERT INTO major_courses( course_code, major_code ) VALUES ( 'CSC2002S', 'CSC05');
INSERT INTO major_courses( course_code, major_code ) VALUES ( 'INF2009F', 'CSC05');
INSERT INTO major_courses( course_code, major_code ) VALUES ( 'PHY1031', 'CSC03');
INSERT INTO prerequisites( prerequisites_id, course_code ) VALUES ( 1, 'CSC1015F');
INSERT INTO prerequisites( prerequisites_id, course_code ) VALUES ( 7, 'CSC1015F');
INSERT INTO prerequisites( prerequisites_id, course_code ) VALUES ( 9, 'PHY1032S');
INSERT INTO prerequisites( prerequisites_id, course_code ) VALUES ( 15, 'MAM1004F');
INSERT INTO prerequisites( prerequisites_id, course_code ) VALUES ( 16, 'MAM1031F');
INSERT INTO prerequisites( prerequisites_id, course_code ) VALUES ( 22, 'CSC1011F');
INSERT INTO prerequisites( prerequisites_id, course_code ) VALUES ( 24, 'INF1003F');
INSERT INTO prerequisites( prerequisites_id, course_code ) VALUES ( 1, 'CSC1016S');
INSERT INTO prerequisites( prerequisites_id, course_code ) VALUES ( 2, 'CSC2001F');
INSERT INTO prerequisites( prerequisites_id, course_code ) VALUES ( 4, 'INF1003S');
INSERT INTO prerequisites( prerequisites_id, course_code ) VALUES ( 5, 'MAM1004F');

INSERT INTO students( student_number, student_name, student_surname, course_list_id, year_started, year_ended, status, credits, exam_number, degree_code, major_id_2, major_id_1 ) VALUES ( 'BRNANE009', 'Aneesah', 'Barnes', '2', '2023-01-12', null, 'Undergrade', 420, '1746283749005', 'BSc', 'CSC02', 'CSC05');
INSERT INTO students( student_number, student_name, student_surname, course_list_id, year_started, year_ended, status, credits, exam_number, degree_code, major_id_2, major_id_1 ) VALUES ( 'HNTCAS004', 'Casey', 'Hunter', '3', '2023-01-12', null, 'Undergrade', 420, '1772388237823', 'BSc', 'CSC03', 'CSC05');
INSERT INTO students( student_number, student_name, student_surname, course_list_id, year_started, year_ended, status, credits, exam_number, degree_code, major_id_2, major_id_1 ) VALUES ( 'INDSHR002', 'Shriya', 'Inderpal', '1', '2023-01-12', null, 'Undergrade', 420, '1737583729070', 'BSc', 'CSC02', 'CSC05');
INSERT INTO students( student_number, student_name, student_surname, course_list_id, year_started, year_ended, status, credits, exam_number, degree_code, major_id_2, major_id_1 ) VALUES ( 'JWNARI001', 'Aria', 'Jeewon', '4', '2023-01-12', null, 'Undergrade', 420, '1756254878615', 'BSc', 'CSC03', 'CSC05');
INSERT INTO students( student_number, student_name, student_surname, course_list_id, year_started, year_ended, status, credits, exam_number, degree_code, major_id_2, major_id_1 ) VALUES ( 'SMSMOE006', 'Rashaad', 'Samsodien', '5', '2023-01-12', null, 'Undergrade', 360, '1785412348123', 'BSc', 'STA01', 'CSC05');

INSERT INTO course( course_code, course_name, start_date, end_date, convenor_number, lecture_venues, num_students, num_tutors, num_tutorials, num_practical, num_periods, prerequisties_id, total_capacity, credit ) VALUES ( 'BIO1000F', 'Cell Biology', '2024-02-12', '2024-05-15', '108', 'LS2A', 400, 20, 12, 12, 48, 13, 500, '18');
INSERT INTO course( course_code, course_name, start_date, end_date, convenor_number, lecture_venues, num_students, num_tutors, num_tutorials, num_practical, num_periods, prerequisties_id, total_capacity, credit ) VALUES ( 'BIO1000H', 'Cell Biology', '2024-02-12', '2024-10-31', '109', 'LS2A', 400, 20, 12, 12, 96, 14, 500, '18');
INSERT INTO course( course_code, course_name, start_date, end_date, convenor_number, lecture_venues, num_students, num_tutors, num_tutorials, num_practical, num_periods, prerequisties_id, total_capacity, credit ) VALUES ( 'CEM1000W', 'Chemistry 1000', '2024-02-12', '2024-10-31', '112', 'Pd Hahn 1', 500, 20, 12, 12, 96, 17, 600, '18');
INSERT INTO course( course_code, course_name, start_date, end_date, convenor_number, lecture_venues, num_students, num_tutors, num_tutorials, num_practical, num_periods, prerequisties_id, total_capacity, credit ) VALUES ( 'CSC1010H', 'Computer Science 1010', '2024-02-12', '2024-10-31', '113', 'CSC304', 850, 60, 0, 10, 96, 19, 900, '18');
INSERT INTO course( course_code, course_name, start_date, end_date, convenor_number, lecture_venues, num_students, num_tutors, num_tutorials, num_practical, num_periods, prerequisties_id, total_capacity, credit ) VALUES ( 'CSC1011H', 'Computer Science 1011', '2024-07-22', '2024-10-31', '113', 'CSC304', 850, 60, 0, 10, 96, 22, 900, '18');
INSERT INTO course( course_code, course_name, start_date, end_date, convenor_number, lecture_venues, num_students, num_tutors, num_tutorials, num_practical, num_periods, prerequisties_id, total_capacity, credit ) VALUES ( 'CSC1015F', 'Computer Sciecne 1015', '2024-02-12', '2024-05-15', '105', 'CSC304', 986, 70, 0, 10, 48, 6, 1100, '18');
INSERT INTO course( course_code, course_name, start_date, end_date, convenor_number, lecture_venues, num_students, num_tutors, num_tutorials, num_practical, num_periods, prerequisties_id, total_capacity, credit ) VALUES ( 'CSC1016S', 'Computer Science 1016', '2024-02-12', '2024-05-15', '105', 'LS2A', 700, 60, 0, 10, 40, 7, 900, '18');
INSERT INTO course( course_code, course_name, start_date, end_date, convenor_number, lecture_venues, num_students, num_tutors, num_tutorials, num_practical, num_periods, prerequisties_id, total_capacity, credit ) VALUES ( 'CSC1017H', 'Computer Science 1017', '2024-02-12', '2024-10-31', '100', 'CSC304', 800, 70, 0, 10, 96, 21, 900, '18');
INSERT INTO course( course_code, course_name, start_date, end_date, convenor_number, lecture_venues, num_students, num_tutors, num_tutorials, num_practical, num_periods, prerequisties_id, total_capacity, credit ) VALUES ( 'CSC1019H', 'Computer Science 1019', '2024-02-12', '2024-10-31', '100', 'CSC304', 800, 65, 0, 10, 96, 20, 900, '18');
INSERT INTO course( course_code, course_name, start_date, end_date, convenor_number, lecture_venues, num_students, num_tutors, num_tutorials, num_practical, num_periods, prerequisties_id, total_capacity, credit ) VALUES ( 'CSC2001F', 'Computer Science 2001', '2024-02-12', '2024-05-31', '101', 'NLT', 656, 30, 0, 5, 48, 1, 700, '24');
INSERT INTO course( course_code, course_name, start_date, end_date, convenor_number, lecture_venues, num_students, num_tutors, num_tutorials, num_practical, num_periods, prerequisties_id, total_capacity, credit ) VALUES ( 'CSC2002S', 'Computer Science 2002', '2024-07-22', '2024-10-31', '101', 'James3A', 500, 20, 0, 6, 48, 2, 700, '24');
INSERT INTO course( course_code, course_name, start_date, end_date, convenor_number, lecture_venues, num_students, num_tutors, num_tutorials, num_practical, num_periods, prerequisties_id, total_capacity, credit ) VALUES ( 'FTX1005F', 'Managerial Finance', '2024-07-22', '2024-04-12', '104', 'BT103', 300, 20, 12, 0, 48, 3, 500, '18');
INSERT INTO course( course_code, course_name, start_date, end_date, convenor_number, lecture_venues, num_students, num_tutors, num_tutorials, num_practical, num_periods, prerequisties_id, total_capacity, credit ) VALUES ( 'INF1002F', 'Foundation of Information Systems', '2024-02-12', '2024-05-15', '114', 'Alumni Lab 1', 550, 20, 12, 12, 36, 23, 600, '18');
INSERT INTO course( course_code, course_name, start_date, end_date, convenor_number, lecture_venues, num_students, num_tutors, num_tutorials, num_practical, num_periods, prerequisties_id, total_capacity, credit ) VALUES ( 'INF1003F', 'Commercial Programming', '2024-02-12', '2024-05-15', '115', 'Alumni Lab 1', 500, 20, 0, 12, 36, 24, 600, '18');
INSERT INTO course( course_code, course_name, start_date, end_date, convenor_number, lecture_venues, num_students, num_tutors, num_tutorials, num_practical, num_periods, prerequisties_id, total_capacity, credit ) VALUES ( 'INF2009F', 'Systems Analysis', '2024-02-12', '2024-05-31', '102', 'NLT', 450, 25, 7, 0, 36, 4, 600, '18');
INSERT INTO course( course_code, course_name, start_date, end_date, convenor_number, lecture_venues, num_students, num_tutors, num_tutorials, num_practical, num_periods, prerequisties_id, total_capacity, credit ) VALUES ( 'MAM1004F', 'Mathematics 1004', '2024-02-12', '2024-05-15', '100', 'James4A', 700, 25, 12, 0, 48, 10, 800, '18');
INSERT INTO course( course_code, course_name, start_date, end_date, convenor_number, lecture_venues, num_students, num_tutors, num_tutorials, num_practical, num_periods, prerequisties_id, total_capacity, credit ) VALUES ( 'MAM1005H', 'Mathematics 1', '2024-02-12', '2024-10-31', '100', 'NLT', 700, 25, 12, 0, 96, 18, 800, '18');
INSERT INTO course( course_code, course_name, start_date, end_date, convenor_number, lecture_venues, num_students, num_tutors, num_tutorials, num_practical, num_periods, prerequisties_id, total_capacity, credit ) VALUES ( 'MAM1031F', 'Mathematics 1031', '2024-02-12', '2024-05-15', '100', 'NLT', 756, 25, 12, 0, 48, 11, 800, '18');
INSERT INTO course( course_code, course_name, start_date, end_date, convenor_number, lecture_venues, num_students, num_tutors, num_tutorials, num_practical, num_periods, prerequisties_id, total_capacity, credit ) VALUES ( 'MAM1033F', 'Mathematics 1033', '2024-02-12', '2024-05-15', '100', 'NLT', 457, 25, 12, 0, 48, 12, 600, '18');
INSERT INTO course( course_code, course_name, start_date, end_date, convenor_number, lecture_venues, num_students, num_tutors, num_tutorials, num_practical, num_periods, prerequisties_id, total_capacity, credit ) VALUES ( 'PHY1031F', 'General Physics A', '2024-02-12', '2024-05-15', '106', 'James3A', 567, 20, 5, 5, 48, 8, 600, '18');
INSERT INTO course( course_code, course_name, start_date, end_date, convenor_number, lecture_venues, num_students, num_tutors, num_tutorials, num_practical, num_periods, prerequisties_id, total_capacity, credit ) VALUES ( 'PHY1032S', 'General Physics B', '2024-07-22', '2024-10-31', '107', 'James3A', 499, 20, 5, 5, 48, 9, 600, '18');
INSERT INTO course( course_code, course_name, start_date, end_date, convenor_number, lecture_venues, num_students, num_tutors, num_tutorials, num_practical, num_periods, prerequisties_id, total_capacity, credit ) VALUES ( 'STA1000F', 'Introductory to Statisticts', '2024-02-12', '2024-05-30', '103', 'Chris Hani 1', 300, 18, 12, 0, 12, 5, 400, '18');
INSERT INTO course( course_code, course_name, start_date, end_date, convenor_number, lecture_venues, num_students, num_tutors, num_tutorials, num_practical, num_periods, prerequisties_id, total_capacity, credit ) VALUES ( 'STA1006S', 'Mathematical Statistics 1', '2024-07-22', '2024-10-31', '111', 'John Day 1', 300, 18, 12, 0, 48, 16, 400, '18');
INSERT INTO course( course_code, course_name, start_date, end_date, convenor_number, lecture_venues, num_students, num_tutors, num_tutorials, num_practical, num_periods, prerequisties_id, total_capacity, credit ) VALUES ( 'STA1007S', 'Introductory Statistics for Scientists', '2024-07-22', '2024-10-31', '110', 'Chris Hani 1', 300, 18, 12, 0, 48, 15, 400, '18');