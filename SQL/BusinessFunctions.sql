
/*--------------- BUSINESS FUNCTIONS---------------------*/




/* 1. Allow a Student to create a login and password */

/* The student would be able to create a new account. The user would be able to provide his information like email, FirstName, LastName ,password, his GPA and his Test Score. */

INSERT INTO `aspiringstudent` (`email`, `LastName`, `FirstName`, `Password`, `GPA`, `TestScore`) VALUES ('rvanga@gmail.com', 'Vang', 'Rajes', 'passwor', '3.5', '315');

INSERT INTO `aspiringstudent` (`email`, `LastName`, `FirstName`, `Password`, `GPA`, `TestScore`) VALUES  ('johndoe@gmail.com', 'Doe', 'John', 'password', '3.5','310');



/* 2. Allow the student to update and maintain his profile */

/* The student would be able to update his account details. He would be able to change his FirstName, LastName, password , his GPA and his Test Score. */

UPDATE `aspiringstudent` SET `LastName` = 'Vanga', `FirstName` = 'Rajesh', `Password` = 'password', `GPA` = '3.75', `TestScore` = '325' WHERE `aspiringstudent`.`email` = 'rvanga@gmail.com';


/* The student would be able to add his address. He would be able to provide his    information like street name, city, state, zipcode, building, apartment and region. */

INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`, `building`, `apartment`, `region`) VALUES ('rvanga@gmail.com', '9000 University Terrace Dr', 'Charlott', 'NA', '28262', '9000', 'A', 'East');


/* The student would be able to update his address. He would be able to provide his information like street name, city, state, zipcode, building, apartment and region. */

UPDATE `address` SET `streetName` = 'University Terrace Dr', `city` = 'Charlotte', `state` = 'NC', `building` = '9001', `apartment` = 'D', `region` = 'Mideast' WHERE `address`.`email` = 'rvanga@gmail.com';


/* The student would be able to add his contact number and select his preferred contact medium ( email or phone). */

INSERT INTO `contacts` (`email`, `phone`, `preferredContact`) VALUES ('rvanga@gmail.com', '123-456-0879', b'0');


/* The student would be able to update his contact number and change his preferred contact medium between email and phone. */

UPDATE `contacts` SET `phone` = '123-456-0870', `preferredContact` = b'1' WHERE `contacts`.`email` = 'rvanga@gmail.com' AND `contacts`.`phone` = '123-456-0879';


/* The Student would be able to add the Extracurricular Activities he enjoys. */

INSERT INTO `enjoys` (`AcademicLetter`, `YearExperience`, `Email`, `ExtraCurricularID`) VALUES ('2', '5', 'rvanga@gmail.com', '1');


/* The Student would be able to update the Extracurricular Activities he enjoys. */

UPDATE `enjoys` SET `AcademicLetter` = '3', `YearExperience` = '6' WHERE `enjoys`.`Email` = 'rvanga@gmail.com' AND `enjoys`.`ExtraCurricularID` = 1;


/* The Student would be able to add the Major he is seeking or interested in. */

INSERT INTO `seeking` (`Degree`, `StartDate`, `Email`, `MajorID`) VALUES ('MS', '2016-08-15', 'rvanga@gmail.com', 'M13');


/* The Student would be able to update the Major he is seeking or is interested in. */

UPDATE `seeking` SET `Degree` = 'phD', `MajorID` = 'M10' WHERE `seeking`.`Email` = 'rvanga@gmail.com' AND `seeking`.`MajorID` = 'M13';



/* 3. Allow staff to search based on Major and Degree seeked */


/* Allow staff to search based on Major */

CREATE VIEW `Search by MajorName` AS
SELECT A.email, A.FirstName, A.LastName, MajorName
FROM
	AspiringStudent A, Major M, Seeking S
WHERE
    M.MajorName='Computer Engineering' AND
    S.MajorID=M.MajorID AND
    A.email=S.email
    Order By A.FirstName;

 /* Allow staff to search based on  Degree seeking */

CREATE VIEW `Search by DEGREESEEKING1` AS
SELECT  A.email, A.FirstName, A.LastName, MajorName
FROM
	AspiringStudent A, Major M, Seeking S
WHERE
    S.Degree='BS' AND
    S.email=A.email
    GROUP BY A.email;



/* 4. Allow staff to search based on  favorite extracurricular activities.  */


/* -- Allow staff to search based on  favorite extracurricular activities. */

CREATE VIEW `Search Students by Extracurricular Activity name` AS
SELECT A.email, A.FirstName, A.LastName, E.AcademicLetter, E.YearExperience
FROM
    AspiringStudent A,  enjoys E, extracurricularactivities EC
WHERE
   EC.ExtraCurricularName='Swimming' AND
   E.ExtraCurricularID=EC.ExtraCurricularID AND
    A.email=E.Email
    Order By A.FirstName;


/* 5. Allow staff to view student(s) G.P.A and GRE/SAT score. */


/* Allow staff to view a student’s G.P.A and S.A.T Score  */

CREATE VIEW `View Student's GPA and test scores` AS
SELECT a.email, a.testscore, a.GPA FROM aspiringstudent a WHERE a.email="rvanga@gmail.com";


/*  Allow staff to view all the student’s G.P.A and S.A.T Score in decreasing order of test score.  */

CREATE VIEW `Display test scores in descending` AS
SELECT a.email, a.testscore, a.GPA FROM aspiringstudent a ORDER BY a.testscore DESC;


/* 6. Allow a student to locate the Resources and access any of the resource. */


/* Allow the student to locate all the resources available to him.  */

CREATE VIEW `Resources available to Student` AS
Select StudentLifeDoc From Resources;


/* Allow the student to view resources based on specialization */

CREATE VIEW `View Resources based on specialization` AS
Select StudentLifeDoc, StudentLifeDocContents
From Resources
where Specialization like 'sports';


/* 7. Allow staff to view reports based on specific criteria such as G.P.A and GRE/S.A.T score. */

/* Search based on G.P.A and SAT */

Select * from major m, UndergraduateDegree u where m.MajorID =u.MajorID and  m.MinGPA =3 and u.SATScore =270 ;


/* Search based on G.P.A and GRE */


Select * from major m, GraduateDegree g where g.MajorID =m.MajorID and m.MinGPA=3.00 and  g.GREScore=270;



/* -- 8. Allow staff to search based on  Geography and Location*/


/*  Allow staff to search by Location / City */

CREATE or REPLACE VIEW `Search by city1` AS
SELECT  A.email, A.FirstName, A.LastName, MajorName, City
FROM
	AspiringStudent A, Address D, Major M, Seeking S
WHERE
    A.email=D.email AND
    A.email=S.email AND
    S.MajorID = M.MajorID AND
    D.city = 'Charlotte';


/* Allow staff to search by Geography or Region */

CREATE or REPLACE VIEW `Search by Geography / Region` AS
SELECT  A.email, A.FirstName, A.LastName, MajorName, Region
FROM
	AspiringStudent A, Address D, Major M, Seeking S
WHERE
    A.email=D.email AND
    A.email=S.email AND
    S.MajorID = M.MajorID AND
    D.Region = 'South';



/* -- 9. Allow staff to View reports to recruit and reach out to students based on their extracurricular  activities and Academics */


/* Allow staff to View reports to recruit and reach out to students based on the extracurricular activity name */

CREATE or REPLACE VIEW `Search students by interest in ECA` AS
SELECT e.email,a.firstname,a.lastname, ec.ExtraCurricularName from enjoys e, aspiringstudent a, extracurricularactivities ec where e.email = a.email and e.ExtraCurricularID =ec.ExtraCurricularID and ec.ExtraCurricularName = 'Swimming';


/* Allow staff to View reports to recruit and reach out to students based on their Academics. */

CREATE or REPLACE VIEW `Search students by TestScore and GPA` AS
SELECT  email,LastName,FirstName
from      aspiringstudent
           where   GPA > '3.50'
and        TestScore > 300;


/* -- 10. Allow staff to view reports based on resources accessed by the students. */


/* Allow staff to view the resources accessed by a student */

CREATE or REPLACE VIEW `Search the resources accessed by a student` AS
SELECT r.StudentLifeDoc, r.specialization, r.TimesDownloaded, r.AcademicCalendar 
from clickson c ,resources r 
where c.idresource = r.idresource 
and email = 'LakshmiVenkataSowmyaAndal@uncc.edu';

/*Allow staff to view the most accessed resource. */

CREATE or REPLACE VIEW `Most accessed resource` AS
SELECT idresource,Specialization,TimesDownloaded
from    resources
where   TimesDownloaded = (select Max(TimesDownloaded)  from   resources);
