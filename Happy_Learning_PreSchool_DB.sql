DROP DATABASE IF EXISTS HAPPY_LEARNING;
CREATE DATABASE HAPPY_LEARNING;
USE HAPPY_LEARNING;

CREATE TABLE TEACHER(
T_ID				INT			PRIMARY KEY,
T_FIRST_NAME		VARCHAR(22)	NOT NULL,
T_MIDDLE_NAME		VARCHAR(22),
T_LAST_NAME			VARCHAR(22)	NOT NULL,
T_HOME_PHONE		CHAR(14)	NOT NULL,
T_WORK_EMAIL		VARCHAR(30)	NOT NULL,
T_PERSONAL_EMAIL	VARCHAR(30)	NOT NULL,
T_COLLEGE			VARCHAR(50)	NOT NULL,
T_DEGREE			VARCHAR(5)	NOT NULL,
T_AREA_OF_DEGREE	VARCHAR(25)	NOT NULL
);

CREATE TABLE CLASS(
CL_CODE				CHAR(2)		PRIMARY KEY,
CL_AGE_LEVEL		VARCHAR(25)	NOT NULL,
CL_COLOR			VARCHAR(5)	NOT NULL,
CL_PHONE			CHAR(14)	NOT NULL UNIQUE,
CL_CAPACITY			INT			NOT NULL,
CL_LOCATION			VARCHAR(130),
CL_ROOM_NUMBER		INT 		NOT NULL UNIQUE,
T_ID				INT,
FOREIGN KEY (T_ID) REFERENCES TEACHER(T_ID)
);

CREATE TABLE STUDENT(
S_ID			INT			PRIMARY KEY,
S_FIRST_NAME	VARCHAR(22)	NOT NULL,
S_MIDDLE_NAME	VARCHAR(22),
S_LAST_NAME		VARCHAR(22) NOT NULL,
S_NICKNAME		VARCHAR(20),
S_DATE_OF_BIRTH	DATE		NOT NULL,
S_ADDRESS		VARCHAR(55)	NOT NULL,
CL_CODE			CHAR(2),
FOREIGN KEY (CL_CODE) REFERENCES CLASS(CL_CODE)
);

CREATE TABLE CARETAKER(
CT_ID			INT			PRIMARY KEY,
CT_FIRST_NAME	VARCHAR(22)	NOT NULL,
CT_MIDDLE_NAME	VARCHAR(22),
CT_LAST_NAME	VARCHAR(22)	NOT NULL,
CT_HOME_PHONE	CHAR(14),
CT_WORK_PHONE	CHAR(14),
CT_MOBILE_PHONE	CHAR(14) 	NOT NULL,
CT_RELATIONSHIP	VARCHAR(25) NOT NULL,
CT_EMAIL		VARCHAR(30)	NOT NULL
);

CREATE TABLE REGISTRATION(
S_ID		INT,
CT_ID		INT,
FOREIGN KEY (S_ID) REFERENCES STUDENT(S_ID),
FOREIGN KEY (CT_ID) REFERENCES CARETAKER(CT_ID)
);

INSERT INTO TEACHER VALUES
	(101, 'Max', null, 'Holloway', '(922) 923-1132', 'MaxW@gmail.com', 'MaxPersonal@gmail.com',  'George Mason University', 'BS', 'Education' ),
    (102, 'Leon', null, 'Edwards', '(922) 169-3536', 'LeonW@gmail.com', 'LeonPersonal@gmail.com',  'Harvard University', 'BS', 'Psychology' ),
    (103, 'Jon', 'Bones', 'Jones', '(922) 887-8674', 'JonW@gmail.com', 'JonPersonal@gmail.com', 'Virginia Commonwealth University', 'BS', 'Education'),
    (104, 'Daniel', null,'Cormier', '(922) 387-2223', 'DaniellW@gmail.com', 'DanielPersonal@gmail.com', 'University of California', 'MA', 'Chemistry'),
    (105, 'Colby', null,'Covington', '(267) 394-6675', 'ColbyW@gmail.com', 'ColbyPersonal@gmail.com', 'University of Vermont', 'MS', 'Education')
    ;
    
INSERT INTO CLASS VALUES
	('RT', 'Turtles', 'Red', '(145) 223-3223', 26, 'Next to the cafeteria on the right side', 340, '101' ),
    ('GT', 'Turtles', 'Green', '(145) 325-6753', 25, null, 341, '103' ),
    ('BT', 'Turtles', 'Blue', '(145) 555-2343', 25, null, 342, '101' ),
    ('RF', 'Foxes', 'Red', '(145) 346-1167', 29, 'Behind the fountain next to vending machine', 343, '101' ),
    ('GF', 'Foxes', 'Green', '(145) 236-5200', 25, 'Near the office down hallway next to gym', 344, '105' ),
    ('BF', 'Foxes', 'Blue', '(145) 868-0975', 27, null, 345, '104' ),
    ('RM', 'Monkeys', 'Red', '(145) 464-4502', 28, 'Down the path from the office with sign that says Red Monkeys', 346, '105' ),
    ('GM', 'Monkeys', 'Green', '(145) 999-4442', 26, null, 347, '102' ),
    ('BM', 'Monkeys', 'Blue', '(145) 987-1324', 29, 'Right behind the cafeteria', 348, '102' )   
    ;

INSERT INTO STUDENT VALUES
	(901, 'Jake', null, 'Rick',  'Christopher','2002-10-31','4938 Long Road', 'RT'),
    (902, 'Sam', 'Cierah','Parker', 'Sammy', '2002-09-23','393  Field Way', 'GT'),
    (903, 'Chris', null,'Rock', 'Craig','2002-10-0','2344 Ox Road', 'BT'),
    (904, 'John', null,'White', null, '2001-12-15','232 Skim Road', 'RF'),
    (905, 'Will', null,'Smith', 'Bill', '2001-01-12','329 Milky Way', 'GF'),
    (906, 'Kim', 'Erin','Can', null, '2001-04-29','85 Dud Street', 'BF'),
    (907, 'Luke', null,'Lucas', null,'2000-07-23','111 Square Circle', 'RM'),
    (908, 'Kevin', null,'James', null,'2000-05-31','989 Weird Blvd', 'GM'),
    (909, 'Sally', 'Soup','Richard', 'Sal','2000-11-05','888 Fever Street', 'BM'),
    (910, 'Jess', 'Misha','Maple', null,'2000-10-09','101 Watch Way', 'RM'),
    (911, 'Ronald', null,'King', 'Ron','2001-03-01','8642 Hippy Hwy', 'GF')
    ;
    
INSERT INTO CARETAKER VALUES
	(801, 'Peter', null,'Rick', null, null, '(900) 535-5555', 'Father', 'Peter@hotmail.com'),
    (802, 'Richard', null,'Parker', '(111) 333-2130', null, '(111) 333-2130', 'Father', 'RichardP@gmail.com'),
    (803, 'Jessie', null,'Rock',  null, '(231) 676-3346', '(123) 132-1111', 'Mother', 'JessieRock@outlook.com'),
    (804, 'Kevin', null, 'White', '(111) 374-3928', '(222) 101-1123', '(995) 112-5432', 'Grandfather', 'K@gmail.com'),
    (805, 'Holly', 'Young','Smith',  '(445) 934-3111', '(888) 654-4567', '(900) 505-3303', 'Aunt', 'HollyYoung@hotmail.com'),
    (806, 'Dean', null, 'Can',  '(122) 111-2346', '(777) 757-7787', '(122) 333-3210', 'Father', 'DeanYO@gmail.com'),
    (807, 'Philip', 'Phil','Lucas',  '(111) 444-2343', '(111) 234-7777', '(111) 868-9909', 'Godfather', 'PhillsTIRED@gmail.com'),
    (808, 'Josh', null,'James',  '(122) 321-3563', '(122) 111-4444', '(332) 123-1010', 'Godfather', 'JoshGODFATHER@gmail.com'),
    (809, 'Wendy', null,'Richard',  null, null, '(101) 999-0039', 'Mother', 'Wendy@yomail.com'),
    (810, 'Kurt', null,'Maple', null, null, '(910) 888-7777', 'Father', 'KurtAngle@Kurtmail.com'),
    (811, 'Bart', 'Burt','King',  '(111) 999-2342', null, '(868) 566-7785', 'Father', 'BarttheGUY@kingmail.com')
    ;
    
INSERT INTO REGISTRATION VALUES
	(901, 801),
    (902, 802),
    (903, 803),
    (904, 804),
    (905, 805),
    (906, 806),
    (907, 807),
    (908, 808),
    (909, 809),
    (910, 810),
    (911, 811)
    ;

/*Random queries for practice*/
	
    /*Prints every student name in alphabetical order, along with level (age level), class color, class phone number, and teacher name*/
    SELECT CONCAT(S_FIRST_NAME, ' ', S_LAST_NAME) AS 'Student',
    CL_AGE_LEVEL AS 'Level', 
    CL_COLOR AS 'Color', 
    CL_PHONE AS 'Class Phone',
    CONCAT(T_FIRST_NAME, ' ', T_LAST_NAME) AS 'Teacher'
    FROM STUDENT 
    LEFT JOIN CLASS ON STUDENT.CL_CODE=CLASS.CL_CODE 
    LEFT JOIN TEACHER ON CLASS.T_ID=TEACHER.T_ID 
    ORDER BY S_LAST_NAME;
    
    /*prints student names by level, then color in alphabetical order, along with student date of birth*/
    SELECT CL_COLOR AS 'Color',
    CL_AGE_LEVEL AS 'Level',
    CONCAT(S_FIRST_NAME, ' ', S_LAST_NAME) AS 'Student Name',
    S_DATE_OF_BIRTH AS 'DOB' 
    FROM CLASS
    INNER JOIN STUDENT ON CLASS.CL_CODE=STUDENT.CL_CODE 
    ORDER BY CL_AGE_LEVEL, CL_COLOR, S_LAST_NAME;
    
    
    /*for each parent in alphabetical order, lists each student parent has enrolled*/
    SELECT CONCAT(CT_FIRST_NAME, ' ', CT_LAST_NAME) AS 'Caretaker Name',
    CT_HOME_PHONE AS 'Caretaker Home Phone',
    CONCAT(S_FIRST_NAME, ' ', S_LAST_NAME)  AS 'Student Name',
    CL_AGE_LEVEL AS 'Level',
    CL_COLOR AS 'Color' FROM CARETAKER
    LEFT JOIN REGISTRATION ON CARETAKER.CT_ID=REGISTRATION.CT_ID 
    INNER JOIN STUDENT ON REGISTRATION.S_ID=STUDENT.S_ID
    INNER JOIN CLASS ON STUDENT.CL_CODE=CLASS.CL_CODE
    ORDER BY CT_LAST_NAME;
    
    /*lists all teachers in alphabetical order as well as each of their students alongside their respective parents*/
    SELECT CONCAT(T_FIRST_NAME, ' ', T_LAST_NAME) AS 'Teacher',
    CONCAT(CT_FIRST_NAME, ' ', CT_LAST_NAME) AS 'Parent',
    CONCAT(S_FIRST_NAME, ' ', S_LAST_NAME) AS 'Student'
    FROM TEACHER
    LEFT JOIN CLASS ON TEACHER.T_ID=CLASS.T_ID
    LEFT JOIN STUDENT ON CLASS.CL_CODE=STUDENT.CL_CODE 
    LEFT JOIN REGISTRATION ON STUDENT.S_ID=REGISTRATION.S_ID
    LEFT JOIN CARETAKER ON REGISTRATION.CT_ID=CARETAKER.CT_ID
    ORDER BY T_LAST_NAME, CT_LAST_NAME, S_LAST_NAME;
    