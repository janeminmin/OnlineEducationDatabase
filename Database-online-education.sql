---------Online education platform Database-------


If exists (select name from sysdatabases 
           where name='GROUP9_ONLINEEDUCATION')
   Drop database GROUP9_ONLINEEDUCATION;
Else 
   Create database GROUP9_ONLINEEDUCATION;
GO

Use GROUP9_ONLINEEDUCATION;

If OBJECT_ID ('GROUP9_ONLINEEDUCATION.dbo.ADMINISTRATOR') is not null
   Drop table dbo.ADMINISTRATOR;

Create table dbo.ADMINISTRATOR
(AdminID int primary key not null,
 AFirstName varchar(20),
 ALastName varchar(20));

Insert dbo.ADMINISTRATOR
Values (10001, 'Ken', 'Sánchez'),
       (10002, 'Roberto','Tamburello'),
	   (10003, 'Terri', 'Duffy'),
       (10004, 'Rob','Walters'),
	   (10005, 'Gail', 'Erickson'),
       (10006, 'Jossef','Goldberg'),
	   (10007, 'Dylan', 'Miller'),
       (10008, 'Gigi','Matthew'),
	   (10009, 'Michael', 'Raheem'),
       (10010, 'Ovidiu','Cracium');


If OBJECT_ID ('GROUP9_ONLINEEDUCATION.dbo.INSTRUCTOR') is not null
   Drop table dbo.INSTRUCTOR;

Create table dbo.INSTRUCTOR
(InstructorID int primary key not null,
 IFirstName varchar(20),
 ILastName varchar(20),
 Orgnization varchar(50)) ;

Insert dbo.INSTRUCTOR
Values  (30001, 'Ovidiu', 'Cracium','Princeton University'),
        (30002, 'Thierry','Hers','University of Chicago'),
		(30003, 'Janice', 'Galvin','Cornell University'),
        (30004, 'Michael','Sullivan','Georgetown University'),
		(30005, 'Sharon', 'Salavaria','Genentech'),
        (30006, 'David','Bradley','Wake Forest University'),
		(30007, 'Kevin', 'Brown','University of Virginia'),
        (30008, 'John','Wood','New York University'),
		(30009, 'Mary', 'Dempsey','SalesForce'),
        (30010, 'Wanida','Benshoof','Edward Jones');

------------------------------------------------------
-----Start-----Feature 1----------------------------------
----------Computed Columns based on a function--------
------------------------------------------------------
If OBJECT_ID ('GROUP9_ONLINEEDUCATION.dbo.LEARNER') is not null
   Drop table dbo.LEARNER;

Create table dbo.LEARNER
(StudentID int primary key not null,
 SFirstName varchar(20),
 SLastName varchar(20),
 EmailAddress varchar(50),
 DateofBirth Date,
 Type varchar(20), 
 State varchar(5),
 Age AS DATEDIFF(hour,DateOfBirth,GETDATE())/8766) ;

Insert dbo.LEARNER
Values  (50001, 'Hailey', 'Simmons','hailey35@online.com','1991-03-05','professional','CA'),
        (50002, 'Kurt','Raje','Kurt14@online.com','1991-06-14','student','NJ'),
		(50003, 'Kenneth', 'Goel','kenneth16@online.com','1984-07-16','professional','OH'),
        (50004, 'Stephanie','Gonzales','stephanie44@online.com','1978-04-04','professional','IL'),
		(50005, 'Sydney', 'Simmons','syndney37@online.com','1991-03-07','student','WY'),
        (50006, 'Stanley','Fernandez','stanley17@online.com','1981-09-17','professional','LA'),
		(50007, 'Sydney', 'Murphy','sydney8@online.com','1983-12-08','professional','IN'),
        (50008, 'Karla','Chavez','karla16@online.com','1987-10-16','professional','LA'),
		(50009, 'Fernando', 'Campbell','fernando40@online.com','1989-04-10','student','NY'),
        (50010, 'Alexandra','Diaz','alexandra43@online.com','1985-04-03','professional','MA'),
		(50011, 'Blake', 'Adams','blake33@online.com','1977-03-03','professional','MD'),
        (50012, 'Lucas','Mitchell','lucas3@online.com','1979-07-27','professional','NJ'),
		(50013, 'Erica', 'Cai','erica20@online.com','1997-03-12','student','IN'),
        (50014, 'Amanda','Stewart','amanda03@online.com','1978-01-03','professional','CA'),
		(50015, 'Shannon', 'Zeng','shannon21@online.com','1993-04-21','student','CA'),
        (50016, 'Gabrielle','Foster','gabrielle38@online.com','1984-03-08','professional','AZ'),
		(50017, 'Amanda', 'Gonzales','amanda38@online.com','1993-08-03','student','NJ'),
        (50018, 'Wyatt','Johnson','wyatt1@online.com','1982-09-21','professional','NJ'),
		(50019, 'Ruth', 'Perez','ruth25@online.com','1978-05-25','professional','MA'),
        (50020, 'Katherine','Sanders','katherine24@online.com','1981-04-24','professional','TX'),
		(50021, 'Summer', 'Kapoor','summer1@online.com','1990-01-28','professional','CT'),
        (50022, 'Gabrielle','Perry','gabrielle30@online.com','1982-06-30','professional','CA'),
		(50023, 'Abigail', 'Bell','abigail9@online.com','1989-03-19','professional','MA'),
        (50024, 'Jeff','Smith','jeff4@online.com','1993-04-19','professional','WA'),
		(50025, 'Hailey', 'Cook','hailey4@online.com','1992-07-04','student','WA'),
        (50026, 'Alma','Son','alma1@online.com','1989-01-30','professional','CA'),
		(50027, 'Cedric', 'Beck','cedric38@online.com','1993-08-03','professional','IN'),
        (50028, 'Lauren','Gray','lauren16@online.com','1987-12-16','professional','MA'),
		(50029, 'Jeremy', 'Carter','jeremy13@online.com','1990-01-13','student','NY'),
        (50030, 'Alexandra','Watson','alexandra20@online.com','1993-10-20','professional','TX');

---------------------------------------------------------------------------------------------------
-----End----Feature 1-------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------

If OBJECT_ID ('GROUP9_ONLINEEDUCATION.dbo.COURSE') is not null
   Drop table dbo.COURSE;

Create table dbo.COURSE
(CourseID int primary key not null,
 CourseName varchar(100),
 InstructorID int foreign key REFERENCES INSTRUCTOR (InstructorID),
 Categrory varchar(50),
 StartTime Date) ;

Insert dbo.COURSE
Values (101, 'Data Mining', 30010 , 'Computer Science','2013-07-09'),
       (102, 'Cloud Computing', 30002 , 'Computer Science','2013-09-27'),
	   (103, 'Algorithms', 30010 , 'Computer Science','2014-06-20'),
       (104, 'Site Reliablility Engineering', 30003 , 'Computer Science','2014-01-04'),
	   (105, 'Java Programming', 30002 , 'Computer Science','2014-02-01'),
       (106, 'Web Design for Everybody',30003 , 'Computer Science','2014-12-21'),
	   (107, 'Successful Negotiation', 30009, 'Business','2015-01-14'),
	   (108, 'Marketing in a Digital World', 30005 , 'Business','2015-10-12'),
       (109, 'Fashion as Design', 30007, 'Art','2012-06-12'),
	   (110, 'Seeing Through Photographs', 30006, 'Art','2016-09-23'),
	   (111, 'Child Nutrition and Cooking', 30008 , 'Health','2015-07-17'),
       (112, 'Introductory Human Physiology', 30009 , 'Health','2016-02-12'),
	   (113, 'Supply Chain Engineering', 30010 , 'Engineering','2016-10-07'),
	   (114, 'Manufacturing Methods and Processes', 30001 , 'Engineering','2017-11-25'),
       (115, 'Construction Engineering', 30004, 'Engineering','2018-03-12');

------------------------------------------------------------
----Start------Feature 2------Place 1-----------------------
----------Table-level CHECK Constraints based on a function
------------------------------------------------------------
If OBJECT_ID ('GROUP9_ONLINEEDUCATION.dbo.ENROLLMENT') is not null
   Drop table dbo.ENROLLMENT;

Create table dbo.ENROLLMENT
(EnrollmentID int primary key,
 CourseID int foreign key REFERENCES COURSE(CourseID),
 StudentID int foreign key REFERENCES LEARNER(StudentID),
 EnrollmentDate Date) ;

IF OBJECT_ID ('GROUP9_ONLINEEDUCATION.dbo.CheckDateEnroll', 'FN') IS NOT NULL  
    DROP FUNCTION CheckDateEnroll;  
GO

CREATE FUNCTION dbo.CheckDateEnroll()
RETURNS int
AS BEGIN RETURN (
    Select Count(*)
	From ENROLLMENT en, COURSE cou
	Where en.CourseID=cou.CourseID and en.EnrollmentDate < cou.StartTime)
	End
Go
  
ALTER TABLE ENROLLMENT ADD CONSTRAINT chkdate1 CHECK (dbo.CheckDateEnroll() = 0);
Go
---------------------------------------------------------------------------------------
CREATE FUNCTION dbo.CheckEnrollment()
RETURNS int
AS
BEGIN
    declare @nub int;
	declare @result int;
	select @nub=Count(en.EnrollmentID) 
	From ENROLLMENT en, COURSE co, PAYENROLL pa
	where en.EnrollmentID=pa.EnrollmentID and en.CourseID=co.CourseID and DATEDIFF(day,pa.LastPayDate,getdate())<=30;
	If @nub > 50 
	set @result= 1;
	Else
	set @result= 0;
	return @result;
End
Go
ALTER TABLE ENROLLMENT ADD CONSTRAINT chkenroll CHECK (dbo.CheckEnrollment() = 0); 
Go


Insert dbo.ENROLLMENT
Values( 2 , 101 , 50001 ,'2014-05-23'),
( 5 , 103 , 50002 ,'2015-03-23'),
( 8 , 105 , 50003 ,'2014-03-23'),
( 10 , 106 , 50004 ,'2015-03-10'),
( 30 , 115 , 50005 ,'2018-07-19'),
( 12 , 107 , 50006 ,'2015-11-23'),
( 22 , 110 , 50007 ,'2017-06-13'),
( 29 , 114 , 50008 ,'2018-07-04'),
( 21 , 110 , 50009 ,'2017-06-08'),
( 11 , 106 , 50010 ,'2015-09-12'),
( 16 , 108 , 50011 ,'2016-07-17'),
( 19 , 109 , 50012 ,'2012-06-30'),
( 4 , 102 , 50013 ,'2014-03-08'),
( 15 , 108 , 50014 ,'2016-05-03'),
( 17 , 108 , 50015 ,'2016-01-30'),
( 23 , 110 , 50016 ,'2016-11-08'),
( 13 , 107 , 50017 ,'2016-08-29'),
( 28 , 113 , 50018 ,'2017-01-28'),
( 24 , 110 , 50019 ,'2017-01-13'),
( 25 , 111 , 50020 ,'2016-03-24'),
( 27 , 113 , 50021 ,'2016-12-02'),
( 6 , 104 , 50022 ,'2014-03-29'),
( 14 , 108 , 50023 ,'2016-08-17'),
( 3 , 102 , 50024 ,'2014-02-25'),
( 7 , 104 , 50025 ,'2014-11-18'),
( 26 , 112 , 50026 ,'2017-01-27'),
( 18 , 109 , 50027 ,'2013-07-27'),
( 9 , 105 , 50028 ,'2015-01-13'),
( 1 , 101 , 50029 ,'2015-05-25'),
( 20 , 109 , 50030 ,'2013-01-24');
------------------------------------------------------------
----End------Feature 2------Place 1 ------------------------
------------------------------------------------------------

------------------------------------------------------------
----Start------Feature 2------Place 2-----------------------
----------Table-level CHECK Constraints based on a function
------------------------------------------------------------
If OBJECT_ID ('GROUP9_ONLINEEDUCATION.dbo.PAYENROLL') is not null
   Drop table dbo.PAYENROLL;

Create table dbo.PAYENROLL
(EnrollmentID int primary key,
 CardNumber Varchar(40),
 LastPayDate Date,
 InstructorID int foreign key REFERENCES INSTRUCTOR(InstructorID)) ;

IF OBJECT_ID ('GROUP9_ONLINEEDUCATION.dbo.CheckDatePay', 'FN') IS NOT NULL  
    DROP FUNCTION CheckDatePay;  
GO
CREATE FUNCTION dbo.CheckDatePay()
RETURNS int
AS BEGIN RETURN (
    Select Count(*)
	From ENROLLMENT en, PAYENROLL pay
	Where en.EnrollmentID=pay.EnrollmentID and en.EnrollmentDate > pay.LastPayDate)
	End
Go
  
ALTER TABLE PAYENROLL ADD CONSTRAINT chkdate2 CHECK (dbo.CheckDatePay() = 0);
Go

Insert dbo.PAYENROLL
Values( 2 ,'AW00000001','2014-05-23', 30010 ),
( 1 ,'AW00000029','2015-05-25', 30010 ),
( 4 ,'AW00000013','2014-04-07', 30002 ),
( 3 ,'AW00000024','2014-03-27', 30002 ),
( 5 ,'AW00000002','2015-04-22', 30010 ),
( 6 ,'AW00000022','2014-04-29', 30003 ),
( 7 ,'AW00000025','2015-01-17', 30003 ),
( 8 ,'AW00000003','2014-03-23', 30002 ),
( 9 ,'AW00000028','2015-01-13', 30002 ),
( 10 ,'AW00000004','2015-03-10', 30003 ),
( 11 ,'AW00000010','2015-10-12', 30003 ),
( 12 ,'AW00000006','2015-12-23', 30009 ),
( 13 ,'AW00000017','2016-08-29', 30009 ),
( 16 ,'AW00000011','2016-09-16', 30005 ),
( 15 ,'AW00000014','2016-06-03', 30005 ),
( 17 ,'AW00000015','2016-01-30', 30005 ),
( 14 ,'AW00000023','2017-05-18', 30005 ),
( 19 ,'AW00000012','2012-07-30', 30007 ),
( 18 ,'AW00000027','2013-10-26', 30007 ),
( 20 ,'AW00000030','2013-02-24', 30007 ),
( 22 ,'AW00000007','2017-06-13', 30006 ),
( 21 ,'AW00000009','2017-06-08', 30006 ),
( 23 ,'AW00000016','2016-12-08', 30006 ),
( 24 ,'AW00000019','2017-04-14', 30006 ),
( 25 ,'AW00000020','2016-05-24', 30008 ),
( 26 ,'AW00000026','2017-05-29', 30009 ),
( 28 ,'AW00000018','2017-01-28', 30010 ),
( 27 ,'AW00000021','2017-03-03', 30010 ),
( 29 ,'AW00000008','2018-08-04', 30001 ),
( 30 ,'AW00000005','2018-11-18', 30004 );
-------------------------------------------------------------------
----End------Feature 2------Place 2--------------------------------
-------------------------------------------------------------------

If OBJECT_ID ('GROUP9_ONLINEEDUCATION.dbo.CONTENT') is not null
   Drop table dbo.CONTENT;

Create table dbo.CONTENT
(Content# int primary key,
 ContentType Varchar(20),
 CourseID int foreign key REFERENCES COURSE(CourseID) ) ;

Insert dbo.CONTENT
Values (1, 'reading', 101),
(2, 'video', 101),
(3, 'lab', 101),
(4, 'assignment', 101),
(5, 'reading', 101),
(6, 'video', 101),
(7, 'lab', 101),
(8, 'assignment', 101),
(9, 'reading', 102),
(10, 'video', 102),
(11, 'lab', 102),
(12, 'assignment', 102),
(13, 'reading', 102),
(14, 'video', 102),
(15, 'lab', 102),
(16, 'assignment', 102),
(17, 'reading', 103),
(18, 'video', 103),
(19, 'assignment', 103),
(20, 'reading', 104),
(21, 'video', 104),
(22, 'assignment', 104),
(23, 'reading', 104),
(24, 'video', 104),
(25, 'assignment', 104),
(26, 'reading', 105),
(27, 'video', 105),
(28, 'lab', 105),
(29, 'assignment', 105),
(30, 'reading', 105),
(31, 'video', 105),
(32, 'lab', 105),
(33, 'assignment', 105),
(34, 'reading', 106),
(35, 'video', 106),
(36, 'lab', 106),
(37, 'assignment', 106),
(38, 'reading', 106),
(39, 'video', 106),
(40, 'lab', 106),
(41, 'assignment', 106),
(42, 'reading', 107),
(43, 'video', 107),
(44, 'assignment', 107),
(45, 'reading', 107),
(46, 'video', 107),
(47, 'assignment', 107),
(48, 'reading', 108),
(49, 'video', 108),
(50, 'assignment', 108),
(51, 'reading', 108),
(52, 'video', 108),
(53, 'assignment', 108),
(54, 'reading', 108),
(55, 'video', 108),
(56, 'assignment', 108),
(57, 'reading', 108),
(58, 'video', 108),
(59, 'assignment', 108),
(60, 'reading', 109),
(61, 'video', 109),
(62, 'assignment', 109),
(63, 'reading', 109),
(64, 'video', 109),
(65, 'assignment', 109),
(66, 'reading', 109),
(67, 'video', 109),
(68, 'assignment', 109),
(69, 'reading', 110),
(70, 'video', 110),
(71, 'assignment', 110),
(72, 'reading', 110),
(73, 'video', 110),
(74, 'assignment', 110),
(75, 'reading', 110),
(76, 'video', 110),
(77, 'assignment', 110),
(78, 'reading', 110),
(79, 'video', 110),
(80, 'assignment', 110),
(81, 'reading', 111),
(82, 'video', 111),
(83, 'assignment', 111),
(84, 'reading', 112),
(85, 'video', 112),
(86, 'assignment', 112),
(87, 'reading', 113),
(88, 'video', 113),
(89, 'assignment', 113),
(90, 'reading', 113),
(91, 'video', 113),
(92, 'assignment', 113),
(93, 'reading', 114),
(94, 'video', 114),
(95, 'assignment', 114),
(96, 'reading', 115),
(97, 'video', 115),
(98, 'assignment', 115);

-----------------------------------------------------------------
----Start------Feature 2------Place 3----------------------------
----------Table-level CHECK Constraints based on a function------
-----------------------------------------------------------------
If OBJECT_ID ('GROUP9_ONLINEEDUCATION.dbo.QUIZ') is not null
   Drop table dbo.QUIZ;

Create table dbo.QUIZ
(QuizID int primary key,
 CourseID int foreign key REFERENCES COURSE(CourseID),
 PassDate Date,
 Grade int,
 StudentID int foreign key REFERENCES LEARNER(StudentID)) ;
 
IF OBJECT_ID ('GROUP9_ONLINEEDUCATION.dbo.CheckDateQuiz', 'FN') IS NOT NULL  
    DROP FUNCTION CheckDateQuiz;  
GO
CREATE FUNCTION dbo.CheckDateQuiz()
RETURNS int
AS BEGIN RETURN (
    Select Count(*)
	From QUIZ q1, COURSE c,QUIZ q2
	Where q2.CourseID=c.CourseID and c.CourseID=q1.CourseID 
	and q1.StudentID=q2.StudentID
	and q1.QuizID<q2.QuizID and q1.PassDate > q2.PassDate)
	End
Go
  
ALTER TABLE QUIZ ADD CONSTRAINT chkdate3 CHECK (dbo.CheckDateQuiz() = 0);
Go


Insert dbo.QUIZ
Values ( 1 , 101 ,'2015-06-03', 89 , 50029 ),
( 2 , 101 ,'2015-06-05', 96 , 50029 ),
( 3 , 101 ,'2014-05-29', 94 , 50001 ),
( 4 , 102 ,'2014-03-15', 87 , 50024 ),
( 5 , 102 ,'2014-03-31', 92 , 50024 ),
( 6 , 103 ,'2015-04-22', 80 , 50002 ),
( 7 , 104 ,'2014-04-06', 94 , 50022 ),
( 8 , 104 ,'2014-04-18', 91 , 50022 ),
( 9 , 104 ,'2014-05-23', 91 , 50022 ),
( 10 , 104 ,'2014-11-20', 99 , 50025 ),
( 11 , 104 ,'2015-02-09', 92 , 50025 ),
( 12 , 105 ,'2014-04-03', 96 , 50003 ),
( 13 , 106 ,'2015-03-12', 91 , 50004 ),
( 14 , 106 ,'2015-03-24', 88 , 50004 ),
( 15 , 107 ,'2015-12-18', 88 , 50006 ),
( 16 , 107 ,'2016-01-07', 94 , 50006 ),
( 17 , 107 ,'2016-09-13', 80 , 50017 ),
( 18 , 108 ,'2017-04-17', 94 , 50023 ),
( 19 , 108 ,'2017-06-06', 92 , 50023 ),
( 20 , 108 ,'2016-05-18', 89 , 50014 ),
( 21 , 108 ,'2016-06-03', 93 , 50014 ),
( 22 , 108 ,'2016-07-28', 89 , 50011 ),
( 23 , 108 ,'2016-02-13', 86 , 50015 ),
( 24 , 108 ,'2016-02-26', 94 , 50015 ),
( 25 , 109 ,'2013-08-18', 93 , 50027 ),
( 26 , 109 ,'2013-11-07', 100 , 50027 ),
( 27 , 109 ,'2012-07-16', 84 , 50012 ),
( 28 , 109 ,'2013-02-01', 89 , 50030 ),
( 29 , 110 ,'2017-06-22', 92 , 50009 ),
( 30 , 110 ,'2017-07-05', 81 , 50009 ),
( 31 , 110 ,'2017-06-25', 89 , 50007 ),
( 32 , 110 ,'2017-02-03', 88 , 50019 ),
( 33 , 111 ,'2016-04-10', 80 , 50020 ),
( 34 , 111 ,'2016-05-22', 94 , 50020 ),
( 35 , 112 ,'2017-03-11', 87 , 50026 ),
( 36 , 113 ,'2017-01-18', 97 , 50021 ),
( 37 , 113 ,'2017-02-12', 96 , 50021 ),
( 38 , 113 ,'2017-02-12', 96 , 50021 ),
( 39 , 113 ,'2017-03-18', 88 , 50021 ),
( 40 , 114 ,'2018-07-11', 99 , 50008 ),
( 41 , 115 ,'2018-07-29', 91 , 50005 ),
( 42 , 115 ,'2018-08-12', 80 , 50005 ),
( 43 , 115 ,'2018-09-27', 93 , 50005 ),
( 44 , 115 ,'2018-12-02', 90 , 50005 );
--------------------------------------------------------------------
-----End-----Feature 2------Place 3---------------------------------
---------------------------------------------------------------------


--------------------------------------------------------------------
----Start------Feature 2------Place 4-------------------------------
----------Table-level CHECK Constraints based on a function---------
--------------------------------------------------------------------
If OBJECT_ID ('GROUP9_ONLINEEDUCATION.dbo.CERTIFICATE') is not null
   Drop table dbo.CERTIFICATE;

Create table dbo.CERTIFICATE
(CertificateID int primary key,
 CertificateDate Date,
 QuizID int foreign key REFERENCES QUIZ(QuizID),
 QuizNumber int) ;

IF OBJECT_ID ('GROUP9_ONLINEEDUCATION.dbo.CheckDateCertif', 'FN') IS NOT NULL  
    DROP FUNCTION CheckDateCertif;  
GO
CREATE FUNCTION dbo.CheckDateCertif()
RETURNS int
AS BEGIN RETURN (
    Select Count(*)
	From QUIZ q, CERTIFICATE c
	Where c.QuizID=q.QuizID and c.CertificateDate <> q.PassDate)
	End
Go
  
ALTER TABLE CERTIFICATE ADD CONSTRAINT chkdate4 CHECK (dbo.CheckDateCertif() = 0);
Go

Insert dbo.CERTIFICATE
Values (1 ,'2015-06-05', 2 , 2),
(2 ,'2014-03-31', 5 , 2),
(3 ,'2014-05-23', 9 , 3),
(4 ,'2015-03-24', 14 , 2),
(5 ,'2016-01-07', 16 , 2),
(6 ,'2017-06-06', 19 , 2),
(7 ,'2016-06-03', 21 , 2),
(8 ,'2016-02-26', 24 , 2),
(9 ,'2013-11-07', 26 , 2),
(10 ,'2017-07-05', 30 , 2),
(11 ,'2017-03-18', 39 , 4),
(12 ,'2018-12-02', 44 , 4);
--------------------------------------------------------------------
----End------Feature 2------Place 5-------------------------------
---------------------------------------------------------------------

If OBJECT_ID ('GROUP9_ONLINEEDUCATION.dbo.ACCOUNT') is not null
   Drop table dbo.ACCOUNT;

Create table dbo.ACCOUNT
(ID int primary key not null,
 AccountType varchar(20)) ;

Insert dbo.ACCOUNT
Values (10001, 'administrator'),
       (10002, 'administrator'),
       (10003, 'administrator'),
       (10004, 'administrator'),
       (10005, 'administrator'),
	   (10006, 'administrator'),
       (10007, 'administrator'),
       (10008, 'administrator'),
       (10009, 'administrator'),
       (10010, 'administrator'),
	   (30001, 'instructor'),
       (30002, 'instructor'),
       (30003, 'instructor'),
       (30004, 'instructor'),
       (30005, 'instructor'),
	   (30006, 'instructor'),
       (30007, 'instructor'),
       (30008, 'instructor'),
       (30009, 'instructor'),
       (30010, 'instructor'),
	   (50001, 'learner'),
	   (50002, 'learner'),
	   (50003, 'learner'),
	   (50004, 'learner'),
	   (50005, 'learner'),
	   (50006, 'learner'),
	   (50007, 'learner'),
	   (50008, 'learner'),
	   (50009, 'learner'),
	   (50010, 'learner'),
	   (50011, 'learner'),
	   (50012, 'learner'),
	   (50013, 'learner'),
	   (50014, 'learner'),
	   (50015, 'learner'),
	   (50016, 'learner'),
	   (50017, 'learner'),
	   (50018, 'learner'),
	   (50019, 'learner'),
	   (50020, 'learner'),
	   (50021, 'learner'),
	   (50022, 'learner'),
	   (50023, 'learner'),
	   (50024, 'learner'),
	   (50025, 'learner'),
	   (50026, 'learner'),
	   (50027, 'learner'),
	   (50028, 'learner'),
	   (50029, 'learner'),
	   (50030, 'learner');


If OBJECT_ID ('GROUP9_ONLINEEDUCATION.dbo.FEEDBACK') is not null
   Drop table dbo.FEEDBACK;

Create table dbo.FEEDBACK
(Feedback# int Identity primary key,
 InstructorID int foreign key REFERENCES INSTRUCTOR (InstructorID),
 StudentID int foreign key REFERENCES LEARNER(StudentID)) ;

Insert dbo.FEEDBACK(InstructorID,StudentID)
Values (30002,50003),
       (30010,50021),
	   (30003,50022),
	   (30007,50027),
       (30003,50004),
	   (30010,50029),
       (30006,50009),
	   (30002,50024),
	   (30005,50023),
       (30005,50014); 


If OBJECT_ID ('GROUP9_ONLINEEDUCATION.dbo.SUPPORT') is not null
   Drop table dbo.SUPPORT;

Create table dbo.SUPPORT
(Content# int primary key,
 AdminID int foreign key REFERENCES ADMINISTRATOR (AdminID) ) ;

Insert dbo.SUPPORT (Content#,AdminID)
Values (1 , 10008),
(2 , 10007),
(3 , 10010),
(4 , 10004),
(5 , 10008),
(6 , 10006),
(7 , 10002),
(8 , 10010),
(9 , 10008),
(10 , 10002),
(11 , 10008),
(12 , 10009),
(13 , 10003),
(14 , 10002),
(15 , 10003),
(16 , 10001),
(17 , 10010),
(18 , 10006),
(19 , 10009),
(20 , 10007),
(21 , 10005),
(22 , 10009),
(23 , 10009),
(24 , 10006),
(25 , 10007),
(26 , 10010),
(27 , 10005),
(28 , 10001),
(29 , 10008),
(30 , 10005),
(31 , 10002),
(32 , 10009),
(33 , 10009),
(34 , 10002),
(35 , 10001),
(36 , 10009),
(37 , 10008),
(38 , 10004),
(39 , 10001),
(40 , 10006),
(41 , 10009),
(42 , 10001),
(43 , 10007),
(44 , 10001),
(45 , 10009),
(46 , 10004),
(47 , 10006),
(48 , 10006),
(49 , 10006),
(50 , 10003),
(51 , 10003),
(52 , 10002),
(53 , 10006),
(54 , 10002),
(55 , 10009),
(56 , 10001),
(57 , 10009),
(58 , 10008),
(59 , 10010),
(60 , 10007),
(61 , 10002),
(62 , 10001),
(63 , 10005),
(64 , 10001),
(65 , 10010),
(66 , 10004),
(67 , 10006),
(68 , 10004),
(69 , 10005),
(70 , 10004),
(71 , 10002),
(72 , 10002),
(73 , 10006),
(74 , 10007),
(75 , 10010),
(76 , 10004),
(77 , 10008),
(78 , 10001),
(79 , 10004),
(80 , 10006),
(81 , 10010),
(82 , 10010),
(83 , 10001),
(84 , 10009),
(85 , 10002),
(86 , 10005),
(87 , 10006),
(88 , 10009),
(89 , 10007),
(90 , 10010),
(91 , 10004),
(92 , 10008),
(93 , 10004),
(94 , 10001),
(95 , 10007),
(96 , 10010),
(97 , 10004),
(98 , 10007);


------------------------------------------------------
----Start------Feature 3-------------------------------
----------Column Data Encryption-----------------------

USE GROUP9_ONLINEEDUCATION;
GO

CREATE MASTER KEY ENCRYPTION BY 
PASSWORD = 'Group9INFO6210';
GO

CREATE CERTIFICATE CardNumber
   WITH SUBJECT = 'CardNumber',
   EXPIRY_DATE = '2022/02/02';
GO

CREATE SYMMETRIC KEY CardNumber_Key
    WITH ALGORITHM = AES_128
    ENCRYPTION BY CERTIFICATE CardNumber;
GO

-----Use Encryption on table PAYENROLL
--- Create a column in table PAYENROLL in which to store the encrypted data.
ALTER TABLE PAYENROLL 
    ADD Card_Encrypted varbinary(max); 
GO

OPEN SYMMETRIC KEY CardNumber_Key
   DECRYPTION BY CERTIFICATE CardNumber;

UPDATE PAYENROLL
SET Card_Encrypted = EncryptByKey(Key_GUID('CardNumber_Key'), CAST(CardNumber as Varchar));
GO

OPEN SYMMETRIC KEY CardNumber_Key
   DECRYPTION BY CERTIFICATE CardNumber;
GO

SELECT CardNumber, Card_Encrypted 
    AS 'Encrypted CardNumber', 
	CONVERT(varchar(max), DecryptByKey(Card_Encrypted))
    AS 'Decrypted Cardnumber' 
	FROM PAYENROLL;
GO

CLOSE SYMMETRIC KEY CardNumber_Key
Go
------House keeping
DROP SYMMETRIC KEY CardNumber_Key;
DROP CERTIFICATE CardNumber;
Drop MASTER KEY ;
------------------------------------------------------
----End------Feature 3-------------------------------
------------------------------------------------------



------------------------------------------------------
-----Start--------VIEW1------------------------------
--------------------------------------------------------

GO
IF OBJECT_ID('InstructorRevenue', 'V') IS NOT NULL
    DROP VIEW InstructorRevenue;
GO
/* report Instructors's all received payments and the corresponding details.*/
Create View [InstructorRevenue] as 
Select i.InstructorID,l.StudentID,l.SFirstName,l.SLastName,l.EmailAddress,l.Type,l.Age, e.EnrollmentDate, p.LastPayDate, 
       Round((Datediff(day, e.EnrollmentDate, p.LastPayDate)/30+1)*30, 0) As PaymentTotal
From PAYENROLL p, ENROLLMENT e, INSTRUCTOR i, LEARNER l
where i.InstructorID=p.InstructorID and e.EnrollmentID=p.EnrollmentID and e.StudentID=l.StudentID;
Go

Select * From InstructorRevenue;
---------------------------------------------------------------
-----End--------VIEW1----------------------------------------
--------------------------------------------------------------
				

------------------------------------------------------
-----Start--------VIEW2------------------------------
--------------------------------------------------------
GO
IF OBJECT_ID('CertificateTest', 'V') IS NOT NULL
    DROP VIEW CertificateTest;
GO

/* report all tests of Certificated granted and the corresponding details.*/

Create View [CertificateTest] as
With temp as
(Select c.CertificateID, c.QuizNumber, q1.CourseID, q1.StudentID, q2.QuizID
From CERTIFICATE c, QUIZ q1, QUIZ q2
Where c.QuizID=q1.QuizID and q1.CourseID=q2.CourseID and q1.StudentID=q2.StudentID)

Select Distinct t.CertificateID,t.QuizNumber, t.CourseID, t.StudentID,
Stuff((Select ', '+Rtrim(Cast(q.Grade as Char))
From QUIZ q
Where t.CourseID=q.CourseID and t.StudentID=q.StudentID
Group by q.QuizID, q.Grade
For xml path('')),1,2,'') as Grade,
Stuff((Select ', '+Rtrim(Cast(Datediff(day, e.EnrollmentDate, q.PassDate)as Char))
From QUIZ q, ENROLLMENT e
Where t.CourseID=q.CourseID and t.StudentID=q.StudentID and e.StudentID=q.StudentID and e.CourseID=q.CourseID
Group by e.EnrollmentDate, q.PassDate
For xml path('')),1,2,'') as Passdaysafterenroll
From temp t;
Go

Select * From CertificateTest;
---------------------------------------------------------------
-----End--------VIEW2----------------------------------------
---------------------------------------------------------------				


