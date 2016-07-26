
/* Insertion into `stateregion` */

insert into STATEREGION (state, stateAbbr, region) values ('Alabama','AL','South');
insert into STATEREGION (state, stateAbbr, region) values ('Alaska','AK','West');
insert into STATEREGION (state, stateAbbr, region) values ('Arizona','AZ','West');
insert into STATEREGION (state, stateAbbr, region) values ('Arkansas','AR','South');
insert into STATEREGION (state, stateAbbr, region) values ('California','CA','West');
insert into STATEREGION (state, stateAbbr, region) values ('Colorado','CO','West');
insert into STATEREGION (state, stateAbbr, region) values ('Connecticut','CT','Northeast');
insert into STATEREGION (state, stateAbbr, region) values ('Delaware','DE','Northeast');
insert into STATEREGION (state, stateAbbr, region) values ('Florida','FL','South');
insert into STATEREGION (state, stateAbbr, region) values ('Georgia','GA','South');
insert into STATEREGION (state, stateAbbr, region) values ('Hawaii','HI','West');
insert into STATEREGION (state, stateAbbr, region) values ('Idaho','ID','West');
insert into STATEREGION (state, stateAbbr, region) values ('Illinois','IL','Midwest');
insert into STATEREGION (state, stateAbbr, region) values ('Indiana','IN','Midwest');
insert into STATEREGION (state, stateAbbr, region) values ('Iowa','IA','Midwest');
insert into STATEREGION (state, stateAbbr, region) values ('Kansas','KS','Midwest');
insert into STATEREGION (state, stateAbbr, region) values ('Kentucky','KY','South');
insert into STATEREGION (state, stateAbbr, region) values ('Louisiana','LA','South');
insert into STATEREGION (state, stateAbbr, region) values ('Maine','ME','Northeast');
insert into STATEREGION (state, stateAbbr, region) values ('Maryland','MD','South');
insert into STATEREGION (state, stateAbbr, region) values ('Massachusetts','MA','Northeast');
insert into STATEREGION (state, stateAbbr, region) values ('Michigan','MI','Midwest');
insert into STATEREGION (state, stateAbbr, region) values ('Minnesota','MN','Midwest');
insert into STATEREGION (state, stateAbbr, region) values ('Mississippi','MS','South');
insert into STATEREGION (state, stateAbbr, region) values ('Missouri','MO','Midwest');
insert into STATEREGION (state, stateAbbr, region) values ('Montana','MT','West');
insert into STATEREGION (state, stateAbbr, region) values ('Nebraska','NE','Midwest');
insert into STATEREGION (state, stateAbbr, region) values ('Nevada','NV','West');
insert into STATEREGION (state, stateAbbr, region) values ('New Hampshire','NH','Northeast');
insert into STATEREGION (state, stateAbbr, region) values ('New Jersey','NJ','Northeast');
insert into STATEREGION (state, stateAbbr, region) values ('New Mexico','NM','West');
insert into STATEREGION (state, stateAbbr, region) values ('New York','NY','Northeast');
insert into STATEREGION (state, stateAbbr, region) values ('North Carolina','NC','South');
insert into STATEREGION (state, stateAbbr, region) values ('North Dakota','ND','Midwest');
insert into STATEREGION (state, stateAbbr, region) values ('Ohio','OH','Midwest');
insert into STATEREGION (state, stateAbbr, region) values ('Oklahoma','OK','South');
insert into STATEREGION (state, stateAbbr, region) values ('Oregon','OR','West');
insert into STATEREGION (state, stateAbbr, region) values ('Pennsylvania','PA','Northeast');
insert into STATEREGION (state, stateAbbr, region) values ('Rhode Island','RI','Northeast');
insert into STATEREGION (state, stateAbbr, region) values ('South Carolina','SC','South');
insert into STATEREGION (state, stateAbbr, region) values ('South Dakota','SD','Midwest');
insert into STATEREGION (state, stateAbbr, region) values ('Tennessee','TN','South');
insert into STATEREGION (state, stateAbbr, region) values ('Texas','TX','South');
insert into STATEREGION (state, stateAbbr, region) values ('Utah','UT','West');
insert into STATEREGION (state, stateAbbr, region) values ('Vermont','VT','Northeast');
insert into STATEREGION (state, stateAbbr, region) values ('Virginia','VA','South');
insert into STATEREGION (state, stateAbbr, region) values ('Washington','WA','West');
insert into STATEREGION (state, stateAbbr, region) values ('West Virginia','WV','South');
insert into STATEREGION (state, stateAbbr, region) values ('Wisconsin','WI','Midwest');
insert into STATEREGION (state, stateAbbr, region) values ('Wyoming','WY','West');
-- adding Washington, DC.
insert into STATEREGION (state, stateAbbr, region) values ('Washington DC','DC','South');
-- adding XX as International.
insert into STATEREGION (state, stateAbbr, region) values ('International','XX','International');

/* Insertion into `courses` */

INSERT INTO `courses`(`CourseID`, `CourseName`) VALUES ('1','Physics I');
INSERT INTO `courses`(`CourseID`, `CourseName`) VALUES ('2','Physics II');
INSERT INTO `courses`(`CourseID`, `CourseName`) VALUES ('3','Calculus I');
INSERT INTO `courses`(`CourseID`, `CourseName`) VALUES ('4','Calculus II');
INSERT INTO `courses`(`CourseID`, `CourseName`) VALUES ('5','Calculus III');
INSERT INTO `courses`(`CourseID`, `CourseName`) VALUES ('6','Introduction to C++');
INSERT INTO `courses`(`CourseID`, `CourseName`) VALUES ('7','Introduction to Java');
INSERT INTO `courses`(`CourseID`, `CourseName`) VALUES ('8','Algorithms Design');
INSERT INTO `courses`(`CourseID`, `CourseName`) VALUES ('9','Algorithms Design');
INSERT INTO `courses`(`CourseID`, `CourseName`) VALUES ('10','Database Systems');
INSERT INTO `courses`(`CourseID`, `CourseName`) VALUES ('11','Statics');
INSERT INTO `courses`(`CourseID`, `CourseName`) VALUES ('12','Thermodynamics I');
INSERT INTO `courses`(`CourseID`, `CourseName`) VALUES ('13','Thermodynamics II');
INSERT INTO `courses`(`CourseID`, `CourseName`) VALUES ('14','Control Systems I');
INSERT INTO `courses`(`CourseID`, `CourseName`) VALUES ('15','Linear Algebra');
INSERT INTO `courses`(`CourseID`, `CourseName`) VALUES ('16','Bridge Desgin');
INSERT INTO `courses`(`CourseID`, `CourseName`) VALUES ('17','Structural Steel I');
INSERT INTO `courses`(`CourseID`, `CourseName`) VALUES ('18','Structural Steel II');
INSERT INTO `courses`(`CourseID`, `CourseName`) VALUES ('19','Statics');
INSERT INTO `courses`(`CourseID`, `CourseName`) VALUES ('20','Capital Estimating');

/* Insertion into semestersoffered */

INSERT INTO `semestersoffered`(`CourseID`, `SemestersOffered`) VALUES ('1','Summer II');
INSERT INTO `semestersoffered`(`CourseID`, `SemestersOffered`) VALUES ('2','Summer I');
INSERT INTO `semestersoffered`(`CourseID`, `SemestersOffered`) VALUES ('3','Spring');
INSERT INTO `semestersoffered`(`CourseID`, `SemestersOffered`) VALUES ('4','Fall');
INSERT INTO `semestersoffered`(`CourseID`, `SemestersOffered`) VALUES ('5','Summer II');
INSERT INTO `semestersoffered`(`CourseID`, `SemestersOffered`) VALUES ('6','Summer I');
INSERT INTO `semestersoffered`(`CourseID`, `SemestersOffered`) VALUES ('7','Spring');
INSERT INTO `semestersoffered`(`CourseID`, `SemestersOffered`) VALUES ('8','Fall');
INSERT INTO `semestersoffered`(`CourseID`, `SemestersOffered`) VALUES ('9','Summer II');
INSERT INTO `semestersoffered`(`CourseID`, `SemestersOffered`) VALUES ('10','Summer I');
INSERT INTO `semestersoffered`(`CourseID`, `SemestersOffered`) VALUES ('11','Spring');
INSERT INTO `semestersoffered`(`CourseID`, `SemestersOffered`) VALUES ('12','Fall');
INSERT INTO `semestersoffered`(`CourseID`, `SemestersOffered`) VALUES ('13','Summer II');
INSERT INTO `semestersoffered`(`CourseID`, `SemestersOffered`) VALUES ('14','Summer I');
INSERT INTO `semestersoffered`(`CourseID`, `SemestersOffered`) VALUES ('15','Spring');
INSERT INTO `semestersoffered`(`CourseID`, `SemestersOffered`) VALUES ('16','Fall');
INSERT INTO `semestersoffered`(`CourseID`, `SemestersOffered`) VALUES ('17','Summer II');
INSERT INTO `semestersoffered`(`CourseID`, `SemestersOffered`) VALUES ('18','Summer');
INSERT INTO `semestersoffered`(`CourseID`, `SemestersOffered`) VALUES ('19','Spring');


/* Insertion into major */

INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M1','Mathematics','High School',3,4000,7000,40);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M2','Physics  ','High School',3,4000,7000,40);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M3','Computer Science','High School',3,4000,7000,40);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M4','Mechanical Engineering','High School',3,3800,6800,40);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M5','Civil Engineering','High School',3,3800,6800,40);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M6','Computer Engineering','High School',3,5500,8500,40);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M7','Industrial Engineering','High School',3,5500,8500,40);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M8','Chemistry','High School',3,4400,7400,40);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M9','Accounting','High School',3,4400,7400,10);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M10','Anthropology','High School',3.2,5000,8000,10);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M11','Criminal Justice','High School',3.2,5000,8000,10);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M12','Economics','High School',3.2,5000,8000,10);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M13','English','High School',3.2,6000,9000,10);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M14','History','High School',3.2,6000,9000,10);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M15','Meteorology','High School',3.2,6000,9000,10);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M16','Political Science','High School',3.2,6000,9000,10);


/* undergraduatedegree */

INSERT INTO `undergraduatedegree`(`MajorID`, `USpecialization`, `SATScore`) VALUES ('M1','Mathematics',270);
INSERT INTO `undergraduatedegree`(`MajorID`, `USpecialization`, `SATScore`) VALUES ('M2','Physics ',270);
INSERT INTO `undergraduatedegree`(`MajorID`, `USpecialization`, `SATScore`) VALUES ('M3','Computer Science',270);
INSERT INTO `undergraduatedegree`(`MajorID`, `USpecialization`, `SATScore`) VALUES ('M4','Mechanical Engineering',270);
INSERT INTO `undergraduatedegree`(`MajorID`, `USpecialization`, `SATScore`) VALUES ('M5','Civil Engineering',270);
INSERT INTO `undergraduatedegree`(`MajorID`, `USpecialization`, `SATScore`) VALUES ('M6','Computer Engineering',270);
INSERT INTO `undergraduatedegree`(`MajorID`, `USpecialization`, `SATScore`) VALUES ('M7','Industrial Engineering',270);
INSERT INTO `undergraduatedegree`(`MajorID`, `USpecialization`, `SATScore`) VALUES ('M9','Accounting',270);
INSERT INTO `undergraduatedegree`(`MajorID`, `USpecialization`, `SATScore`) VALUES ('M10','Anthropology',270);
INSERT INTO `undergraduatedegree`(`MajorID`, `USpecialization`, `SATScore`) VALUES ('M11','Criminal Justice',270);
INSERT INTO `undergraduatedegree`(`MajorID`, `USpecialization`, `SATScore`) VALUES ('M12','Economics',270);
INSERT INTO `undergraduatedegree`(`MajorID`, `USpecialization`, `SATScore`) VALUES ('M13','English',270);
INSERT INTO `undergraduatedegree`(`MajorID`, `USpecialization`, `SATScore`) VALUES ('M14','History',270);
INSERT INTO `undergraduatedegree`(`MajorID`, `USpecialization`, `SATScore`) VALUES ('M15','Meteorology',270);
INSERT INTO `undergraduatedegree`(`MajorID`, `USpecialization`, `SATScore`) VALUES ('M16','Political Science',270);


/* Insertion into  financialassistance */

INSERT INTO `financialassistance`(`Name`, `Amount`, `MinGPA`) VALUES ('Belk Scholarships','2500','2.5');
INSERT INTO `financialassistance`(`Name`, `Amount`, `MinGPA`) VALUES ('Turing Scholarships',3500,2.9);
INSERT INTO `financialassistance`(`Name`, `Amount`, `MinGPA`) VALUES ('Federal Grants',4500,3);
INSERT INTO `financialassistance`(`Name`, `Amount`, `MinGPA`) VALUES ('Institutional Grants',1200,3);
INSERT INTO `financialassistance`(`Name`, `Amount`, `MinGPA`) VALUES ('Levine Scholars Program',9000,3.2);
INSERT INTO `financialassistance`(`Name`, `Amount`, `MinGPA`) VALUES ('Agency Start Scholarship',7000,3);
INSERT INTO `financialassistance`(`Name`, `Amount`, `MinGPA`) VALUES ('A.K. Sutton Scholarship',4000,3);
INSERT INTO `financialassistance`(`Name`, `Amount`, `MinGPA`) VALUES ('Bonnie Cone Scholarship',3800,3);
INSERT INTO `financialassistance`(`Name`, `Amount`, `MinGPA`) VALUES ('Alumni Scholarships for Merit',12000,3.3);
INSERT INTO `financialassistance`(`Name`, `Amount`, `MinGPA`) VALUES ('Sports Quota',1000,4);
INSERT INTO `financialassistance`(`Name`, `Amount`, `MinGPA`) VALUES ('GA Scholar',1000,4);
INSERT INTO `financialassistance`(`Name`, `Amount`, `MinGPA`) VALUES ('TA Scholar',1000,4);
INSERT INTO `financialassistance`(`Name`, `Amount`, `MinGPA`) VALUES ('Jagannath Scholar',1000,4);
INSERT INTO `financialassistance`(`Name`, `Amount`, `MinGPA`) VALUES ('John Scholarship',1000,4);
INSERT INTO `financialassistance`(`Name`, `Amount`, `MinGPA`) VALUES ('Doe Thornton Scholarship',1000,4);


/* Insertion into  extracurricularactivities */

INSERT INTO `extracurricularactivities`(`ExtraCurricularName`, `ExtraCurricularID`) VALUES ('Soccer',1);
INSERT INTO `extracurricularactivities`(`ExtraCurricularName`, `ExtraCurricularID`) VALUES ('Basketball',2);
INSERT INTO `extracurricularactivities`(`ExtraCurricularName`, `ExtraCurricularID`) VALUES ('Baseball',3);
INSERT INTO `extracurricularactivities`(`ExtraCurricularName`, `ExtraCurricularID`) VALUES ('Racquetball  ',4);
INSERT INTO `extracurricularactivities`(`ExtraCurricularName`, `ExtraCurricularID`) VALUES ('Football',5);
INSERT INTO `extracurricularactivities`(`ExtraCurricularName`, `ExtraCurricularID`) VALUES ('Swimming',6);
INSERT INTO `extracurricularactivities`(`ExtraCurricularName`, `ExtraCurricularID`) VALUES ('Softball',7);
INSERT INTO `extracurricularactivities`(`ExtraCurricularName`, `ExtraCurricularID`) VALUES ('Chess Club',8);
INSERT INTO `extracurricularactivities`(`ExtraCurricularName`, `ExtraCurricularID`) VALUES ('Computer Science Club',9);
INSERT INTO `extracurricularactivities`(`ExtraCurricularName`, `ExtraCurricularID`) VALUES ('The Engineering Club',10);
INSERT INTO `extracurricularactivities`(`ExtraCurricularName`, `ExtraCurricularID`) VALUES ('Mathematics Club',11);
INSERT INTO `extracurricularactivities`(`ExtraCurricularName`, `ExtraCurricularID`) VALUES ('Chemistry Club',12);
INSERT INTO `extracurricularactivities`(`ExtraCurricularName`, `ExtraCurricularID`) VALUES ('Greek Life',13);
INSERT INTO `extracurricularactivities`(`ExtraCurricularName`, `ExtraCurricularID`) VALUES ('Physics Club',14);
INSERT INTO `extracurricularactivities`(`ExtraCurricularName`, `ExtraCurricularID`) VALUES ('Student Activities',15);


/* Insertion into  aspiringstudent */

INSERT INTO `aspiringstudent`( `email`, `LastName`, `FirstName`,  `Password`, `GPA`, `TestScore`) VALUES ('AmirAzmoon@uncc.edu','Azmoon', 'Amir', '761757', '3.4', '320');
INSERT INTO `aspiringstudent`( `email`, `LastName`, `FirstName`,  `Password`, `GPA`, `TestScore`) VALUES ('JayShah@uncc.edu','Shah', 'Jay', '751158', '3.5', '303' );
INSERT INTO `aspiringstudent`( `email`, `LastName`, `FirstName`,  `Password`, `GPA`, `TestScore`) VALUES ('EbrahimMughal@uncc.edu','Mughal', 'Ebrahim','136797','3.7', '305');
INSERT INTO `aspiringstudent`( `email`, `LastName`, `FirstName`,  `Password`, `GPA`, `TestScore`) VALUES ('KrantiChinnaokotla@uncc.edu','Chinnaokotla', 'Kranti','664015', '3.4', '310');
INSERT INTO `aspiringstudent`( `email`, `LastName`, `FirstName`,  `Password`, `GPA`, `TestScore`) VALUES ('LakshmiVenkataSowmyaAndal@uncc.edu','Sowmya Andal', 'Lakshmi Venkata','555566', '3.4', '315');
INSERT INTO `aspiringstudent`( `email`, `LastName`, `FirstName`,  `Password`, `GPA`, `TestScore`) VALUES ('JaiDave@uncc.edu','Dave', 'Jai', '204040', '3.4', '316');
INSERT INTO `aspiringstudent`( `email`, `LastName`, `FirstName`,  `Password`, `GPA`, `TestScore`) VALUES ('RajahChacko@uncc.edu','Chacko', 'Rajah', '46999', '3.7', '320');
INSERT INTO `aspiringstudent`( `email`, `LastName`, `FirstName`,  `Password`, `GPA`, `TestScore`) VALUES ('SukritiRoy@uncc.edu','Roy','Sukriti','247285', '3.9', '327');
INSERT INTO `aspiringstudent`( `email`, `LastName`, `FirstName`,  `Password`, `GPA`, `TestScore`) VALUES ('SujitNanda@uncc.edu','Nanda','Sujit','678136', '3.43', '320');
INSERT INTO `aspiringstudent`( `email`, `LastName`, `FirstName`,  `Password`, `GPA`, `TestScore`) VALUES ('DineashPanchananam@uncc.edu','Panchananam','Dineash','762810', '3.41', '313');
INSERT INTO `aspiringstudent`( `email`, `LastName`, `FirstName`,  `Password`, `GPA`, `TestScore`) VALUES ('KatherineRees@uncc.edu','Rees','Katherine','702632', '3.2', '316');
INSERT INTO `aspiringstudent`( `email`, `LastName`, `FirstName`,  `Password`, `GPA`, `TestScore`) VALUES ('ChloeHunter@uncc.edu','Hunter', 'Chloe','91433', '2.7', '300');
INSERT INTO `aspiringstudent`( `email`, `LastName`, `FirstName`,  `Password`, `GPA`, `TestScore`) VALUES ('GrayCarolyn@uncc.edu','Carolyn', 'Gray','280626', '3.75', '298');
INSERT INTO `aspiringstudent`( `email`, `LastName`, `FirstName`,  `Password`, `GPA`, `TestScore`) VALUES ('PetersAbigail@uncc.edu','Abigail', 'Peters','230625', '3.6', '300');
INSERT INTO `aspiringstudent`( `email`, `LastName`, `FirstName`,  `Password`, `GPA`, `TestScore`) VALUES ('MackenzieLeonard@uncc.edu','Leonard', 'Mackenzie','422458', '3.2', '301');


/* Insertion into  enjoys */

INSERT INTO `enjoys`(`AcademicLetter`, `YearExperience`, `Email`, `ExtraCurricularID`) VALUES (1,1,'AmirAzmoon@uncc.edu',1);
INSERT INTO `enjoys`(`AcademicLetter`, `YearExperience`, `Email`, `ExtraCurricularID`) VALUES (1,2,'JayShah@uncc.edu',2);
INSERT INTO `enjoys`(`AcademicLetter`, `YearExperience`, `Email`, `ExtraCurricularID`) VALUES (1,3,'EbrahimMughal@uncc.edu',3);
INSERT INTO `enjoys`(`AcademicLetter`, `YearExperience`, `Email`, `ExtraCurricularID`) VALUES (1,1,'KrantiChinnaokotla@uncc.edu',4);
INSERT INTO `enjoys`(`AcademicLetter`, `YearExperience`, `Email`, `ExtraCurricularID`) VALUES (1,2,'LakshmiVenkataSowmyaAndal@uncc.edu',5);
INSERT INTO `enjoys`(`AcademicLetter`, `YearExperience`, `Email`, `ExtraCurricularID`) VALUES (1,3,'JaiDave@uncc.edu',6);
INSERT INTO `enjoys`(`AcademicLetter`, `YearExperience`, `Email`, `ExtraCurricularID`) VALUES (2,4,'RajahChacko@uncc.edu',7);
INSERT INTO `enjoys`(`AcademicLetter`, `YearExperience`, `Email`, `ExtraCurricularID`) VALUES (2,1,'SukritiRoy@uncc.edu',8);
INSERT INTO `enjoys`(`AcademicLetter`, `YearExperience`, `Email`, `ExtraCurricularID`) VALUES (3,1,'SujitNanda@uncc.edu',9);
INSERT INTO `enjoys`(`AcademicLetter`, `YearExperience`, `Email`, `ExtraCurricularID`) VALUES (4,1,'DineashPanchananam@uncc.edu',10);
INSERT INTO `enjoys`(`AcademicLetter`, `YearExperience`, `Email`, `ExtraCurricularID`) VALUES (5,2,'KatherineRees@uncc.edu',11);
INSERT INTO `enjoys`(`AcademicLetter`, `YearExperience`, `Email`, `ExtraCurricularID`) VALUES (6,3,'ChloeHunter@uncc.edu',12);
INSERT INTO `enjoys`(`AcademicLetter`, `YearExperience`, `Email`, `ExtraCurricularID`) VALUES (3,4,'GrayCarolyn@uncc.edu',13);
INSERT INTO `enjoys`(`AcademicLetter`, `YearExperience`, `Email`, `ExtraCurricularID`) VALUES (1,1,'PetersAbigail@uncc.edu',14);
INSERT INTO `enjoys`(`AcademicLetter`, `YearExperience`, `Email`, `ExtraCurricularID`) VALUES (1,2,'MackenzieLeonard@uncc.edu',15);
INSERT INTO `enjoys`(`AcademicLetter`, `YearExperience`, `Email`, `ExtraCurricularID`) VALUES (1,3,'KatherineRees@uncc.edu',6);
INSERT INTO `enjoys`(`AcademicLetter`, `YearExperience`, `Email`, `ExtraCurricularID`) VALUES (1,1,'ChloeHunter@uncc.edu',7);
INSERT INTO `enjoys`(`AcademicLetter`, `YearExperience`, `Email`, `ExtraCurricularID`) VALUES (1,2,'GrayCarolyn@uncc.edu',8);
INSERT INTO `enjoys`(`AcademicLetter`, `YearExperience`, `Email`, `ExtraCurricularID`) VALUES (1,3,'PetersAbigail@uncc.edu',9);
INSERT INTO `enjoys`(`AcademicLetter`, `YearExperience`, `Email`, `ExtraCurricularID`) VALUES (1,4,'MackenzieLeonard@uncc.edu',10);

/* Insertion into  contacts */

INSERT INTO `Contacts` (`email`,`phone`,`preferredContact`) VALUES ('AmirAzmoon@uncc.edu','426-168-2339',1);
INSERT INTO `Contacts` (`email`,`phone`,`preferredContact`) VALUES ('JayShah@uncc.edu','519-558-9869',0);
INSERT INTO `Contacts` (`email`,`phone`,`preferredContact`) VALUES ('EbrahimMughal@uncc.edu','520-932-7244',1);
INSERT INTO `Contacts` (`email`,`phone`,`preferredContact`) VALUES ('KrantiChinnaokotla@uncc.edu','449-307-5930',1);
INSERT INTO `Contacts` (`email`,`phone`,`preferredContact`) VALUES ('LakshmiVenkataSowmyaAndal@uncc.edu','721-542-2665',0);
INSERT INTO `Contacts` (`email`,`phone`,`preferredContact`) VALUES ('JaiDave@uncc.edu','789-195-6905',1);
INSERT INTO `Contacts` (`email`,`phone`,`preferredContact`) VALUES ('RajahChacko@uncc.edu','465-614-4019',1);
INSERT INTO `Contacts` (`email`,`phone`,`preferredContact`) VALUES ('SukritiRoy@uncc.edu','674-852-3843',0);
INSERT INTO `Contacts` (`email`,`phone`,`preferredContact`) VALUES ('SujitNanda@uncc.edu','426-900-9815',0);
INSERT INTO `Contacts` (`email`,`phone`,`preferredContact`) VALUES ('DineashPanchananam@uncc.edu','232-287-4125',1);
INSERT INTO `Contacts` (`email`,`phone`,`preferredContact`) VALUES ('KatherineRees@uncc.edu','558-538-1635',1);
INSERT INTO `Contacts` (`email`,`phone`,`preferredContact`) VALUES ('ChloeHunter@uncc.edu','557-847-4680',0);
INSERT INTO `Contacts` (`email`,`phone`,`preferredContact`) VALUES ('GrayCarolyn@uncc.edu','342-662-8800',0);
INSERT INTO `Contacts` (`email`,`phone`,`preferredContact`) VALUES ('PetersAbigail@uncc.edu','949-153-6957',0);
INSERT INTO `Contacts` (`email`,`phone`,`preferredContact`) VALUES ('MackenzieLeonard@uncc.edu','233-724-9876',1);
INSERT INTO `Contacts` (`email`,`phone`,`preferredContact`) VALUES ('GrayCarolyn@uncc.edu','342-662-8850',0);
INSERT INTO `Contacts` (`email`,`phone`,`preferredContact`) VALUES ('PetersAbigail@uncc.edu','949-153-6987',0);
INSERT INTO `Contacts` (`email`,`phone`,`preferredContact`) VALUES ('MackenzieLeonard@uncc.edu','233-624-9876',1);


/* Insertion into  staff */

INSERT INTO `Staff` (`StaffID`,`StaffEmail`,`StaffName`,`StaffPassword`) VALUES (1,'SueRussell@uncc.edu', 'Sue Russell',424784);
INSERT INTO `Staff` (`StaffID`,`StaffEmail`,`StaffName`,`StaffPassword`) VALUES (2,'RobertUnderwood@uncc.edu', 'Robert Underwood',265993);
INSERT INTO `Staff` (`StaffID`,`StaffEmail`,`StaffName`,`StaffPassword`) VALUES (3,'UnmanyouJones@uncc.edu', 'Unmanyou Jones',897677);
INSERT INTO `Staff` (`StaffID`,`StaffEmail`,`StaffName`,`StaffPassword`) VALUES (4,'LaurenClarkson@uncc.edu', 'Lauren Clarkson',238310);
INSERT INTO `Staff` (`StaffID`,`StaffEmail`,`StaffName`,`StaffPassword`) VALUES (5,'GabrielleWhite@uncc.edu', 'Gabrielle White',626105);
INSERT INTO `Staff` (`StaffID`,`StaffEmail`,`StaffName`,`StaffPassword`) VALUES (6,'SmithFinely@uncc.edu', 'Smith Finely',118846);
INSERT INTO `Staff` (`StaffID`,`StaffEmail`,`StaffName`,`StaffPassword`) VALUES (7,'LivelyBlake@uncc.edu', 'Lively Blake',756272);
INSERT INTO `Staff` (`StaffID`,`StaffEmail`,`StaffName`,`StaffPassword`) VALUES (8,'AnneLee@uncc.edu', 'Anne Lee',941893);
INSERT INTO `Staff` (`StaffID`,`StaffEmail`,`StaffName`,`StaffPassword`) VALUES (9,'SeanMathis@uncc.edu', 'Sean Mathis',629994);
INSERT INTO `Staff` (`StaffID`,`StaffEmail`,`StaffName`,`StaffPassword`) VALUES (10,'uncs1@uncc.edu', 'John Doe',873444);
INSERT INTO `Staff` (`StaffID`,`StaffEmail`,`StaffName`,`StaffPassword`) VALUES (11,'uncs12@uncc.edu', 'Albert Einstein',873444);
INSERT INTO `Staff` (`StaffID`,`StaffEmail`,`StaffName`,`StaffPassword`) VALUES (12,'uncs13@uncc.edu', 'Sebastien Vettel',873444);
INSERT INTO `Staff` (`StaffID`,`StaffEmail`,`StaffName`,`StaffPassword`) VALUES (13,'uncs14@uncc.edu', 'Gary Cahill',873444);
INSERT INTO `Staff` (`StaffID`,`StaffEmail`,`StaffName`,`StaffPassword`) VALUES (14,'uncs15@uncc.edu', 'Eden Hazzard',873444);
INSERT INTO `Staff` (`StaffID`,`StaffEmail`,`StaffName`,`StaffPassword`) VALUES (15,'uncs16@uncc.edu', 'Clint Eastwood',873444);

/* Insertion into  resources */

INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`,  `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('1', 'SportsUNCC.PDF', '', '0','Sports', 'Fall');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`,  `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('2', 'CultureUNCC.PDF', '', '2','Culture', 'Spring');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`,  `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('3', 'Housing.PDF', '', '1', 'Housing','Summer1');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`,  `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('4', 'TravelUNCC.PDF', '', '4', 'Travel','Summer2');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`,  `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('5', 'CampusLifeUNCC.PDF', '', '2', 'CampusLife','Summer1');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`,  `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('6', 'LibraryUNCC.PDF', '', '3', 'Library', 'Spring');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`,  `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('7', 'AcademicsUNCC.PDF', '', '1', 'Academics','Summer2');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`,  `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('8', 'SecurityUNCC.PDF', '', '5', 'Security', 'Fall');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`,  `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('9', 'AdmissionsUNCC.PDF', '', '2', 'Admissions', 'Spring');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`,  `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('10', 'AboutUNCC.PDF', '', '7', 'AboutUNCC','Summer1');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`,  `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('11', 'VisitCampusUNCC.PDF', '', '6', 'VisitCampus','Fall');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`,  `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('12', 'Parents_Family.PDF', '', '2', 'Parents_Family','Spring');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`,  `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('13', 'Alumni_FriendsUNCC.PDF', '', '6', 'Alumni_Friends','Summer2');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`,  `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('14', 'Faculty_StaffUNCC.PDF', '', '1', 'Faculty_Staff','Summer1');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`,  `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('15', 'Community_EngageUNCC.PDF', '', '2', 'Community_Engagaement','Fall');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`,  `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('16', 'ResearchUNCC.PDF', '', '4', 'Research','Spring');


/*I Insertion into clickson */

INSERT INTO `clickson`(`idResource`, `email`) VALUES (1,'AmirAzmoon@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (2,'JayShah@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (3,'EbrahimMughal@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (4,'KrantiChinnaokotla@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (5,'LakshmiVenkataSowmyaAndal@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (6,'JaiDave@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (7,'RajahChacko@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (8,'SukritiRoy@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (9,'SujitNanda@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (10,'DineashPanchananam@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (1,'KatherineRees@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (2,'ChloeHunter@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (3,'GrayCarolyn@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (4,'PetersAbigail@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (5,'MackenzieLeonard@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (6,'KatherineRees@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (7,'ChloeHunter@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (8,'GrayCarolyn@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (9,'PetersAbigail@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (10,'MackenzieLeonard@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (1,'JayShah@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (2,'EbrahimMughal@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (3,'KrantiChinnaokotla@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (4,'LakshmiVenkataSowmyaAndal@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (5,'JaiDave@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (6,'RajahChacko@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (7,'SukritiRoy@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (8,'SujitNanda@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (9,'KatherineRees@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (10,'ChloeHunter@uncc.edu');

/* Insertion into offers */

INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('1','M1');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('2','M1');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('3','M1');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('4','M1');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('5','M1');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('6','M1');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('7','M1');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('8','M2');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('9','M2');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('10','M2');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('11','M2');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('12','M2');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('13','M2');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('14','M3');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('15','M3');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('16','M3');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('17','M3');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('18','M4');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('19','M4');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('20','M4');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('1','M4');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('2','M4');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('3','M4');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('4','M4');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('5','M5');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('6','M5');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('7','M5');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('8','M5');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('9','M5');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('10','M5');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('11','M6');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('12','M6');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('13','M6');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('14','M6');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('15','M6');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('16','M6');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('17','M6');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('18','M6');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('19','M6');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('20','M6');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('1','M7');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('2','M7');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('3','M7');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('4','M7');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('5','M7');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('6','M7');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('7','M7');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('8','M7');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('9','M7');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('10','M7');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('11','M7');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('12','M8');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('13','M8');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('14','M8');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('15','M8');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('16','M9');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('17','M9');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('18','M9');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('19','M9');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('20','M9');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('1','M9');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('2','M10');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('3','M10');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('4','M10');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('5','M10');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('6','M11');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('7','M11');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('8','M11');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('9','M11');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('10','M12');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('11','M12');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('12','M12');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('13','M12');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('14','M13');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('15','M13');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('16','M13');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('17','M14');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('18','M14');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('19','M15');
INSERT INTO `offers`(`CourseID`, `MajorID`) VALUES ('20','M16');

/* Insertion into offered */


INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Belk Scholarships','M1');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Turing Scholarships','M2');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Federal Grants','M3');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Institutional Grants','M4');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Levine Scholars Program','M5');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Agency Start Scholarship','M6');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('A.K. Sutton Scholarship','M7');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Bonnie Cone Scholarship','M8');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Alumni Scholarships for Merit','M9');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('John Scholarship','M10');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Belk Scholarships','M11');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Turing Scholarships','M12');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Federal Grants','M13');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Institutional Grants','M14');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Levine Scholars Program','M15');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Agency Start Scholarship','M16');


/* Insertion into seeking */

INSERT INTO `seeking`(`Degree`, `StartDate`, `Email`, `MajorID`) VALUES ('BS','2016-06-29','AmirAzmoon@uncc.edu','M1');
INSERT INTO `seeking`(`Degree`, `StartDate`, `Email`, `MajorID`) VALUES ('BS','2016-05-18','JayShah@uncc.edu','M2');
INSERT INTO `seeking`(`Degree`, `StartDate`, `Email`, `MajorID`) VALUES ('BS','2016-01-07','EbrahimMughal@uncc.edu','M3');
INSERT INTO `seeking`(`Degree`, `StartDate`, `Email`, `MajorID`) VALUES ('BS','2016-08-15','KrantiChinnaokotla@uncc.edu','M4');
INSERT INTO `seeking`(`Degree`, `StartDate`, `Email`, `MajorID`) VALUES ('BS','2015-06-29','LakshmiVenkataSowmyaAndal@uncc.edu','M5');
INSERT INTO `seeking`(`Degree`, `StartDate`, `Email`, `MajorID`) VALUES ('PhD','2015-05-18','JaiDave@uncc.edu','M6');
INSERT INTO `seeking`(`Degree`, `StartDate`, `Email`, `MajorID`) VALUES ('PhD','2015-01-07','RajahChacko@uncc.edu','M7');
INSERT INTO `seeking`(`Degree`, `StartDate`, `Email`, `MajorID`) VALUES ('PhD','2014-08-15','SukritiRoy@uncc.edu','M8');
INSERT INTO `seeking`(`Degree`, `StartDate`, `Email`, `MajorID`) VALUES ('PhD','2016-06-29','SujitNanda@uncc.edu','M9');
INSERT INTO `seeking`(`Degree`, `StartDate`, `Email`, `MajorID`) VALUES ('PhD','2016-05-18','DineashPanchananam@uncc.edu','M10');
INSERT INTO `seeking`(`Degree`, `StartDate`, `Email`, `MajorID`) VALUES ('PhD','2016-01-07','KatherineRees@uncc.edu','M11');
INSERT INTO `seeking`(`Degree`, `StartDate`, `Email`, `MajorID`) VALUES ('MS','2015-08-15','ChloeHunter@uncc.edu','M12');
INSERT INTO `seeking`(`Degree`, `StartDate`, `Email`, `MajorID`) VALUES ('MS','2015-06-29','GrayCarolyn@uncc.edu','M13');
INSERT INTO `seeking`(`Degree`, `StartDate`, `Email`, `MajorID`) VALUES ('MS','2015-05-18','PetersAbigail@uncc.edu','M14');
INSERT INTO `seeking`(`Degree`, `StartDate`, `Email`, `MajorID`) VALUES ('MS','2015-01-07','MackenzieLeonard@uncc.edu','M15');

/* Insertion into graduatedegree */ 

INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M1','Computer Science',250);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M2','Mathematics',250);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M3','Physics',250);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M4','Chemistry',260);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M5','Mechanical Engineering',260);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M6','Civil Engineering',260);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M7','Electrical and Computer Engineering',270);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M8','Industrial Engineering',270);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M9','Accounting',270);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M10','Anthropology',270);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M11','Criminal Justice',270);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M12','Economics',270);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M13','English',270);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M14','History',270);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M15','Meteorology',270);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M16','Political Science',270);


/* Insertion into Address */ 

INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('AmirAzmoon@uncc.edu', '100 Church Street', 'Charlotte', 'NC', '28100', '100', '100', 'mideast');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('ChloeHunter@uncc.edu', '200 South Street', 'Montgomery', 'AL', '10200', '200', '200', 'South');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('DineashPanchananam@uncc.edu','300', 'Reading', 'SC', '30300', '300', '300', 'Northwest');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('EbrahimMughal@uncc.edu', '400 North Street', 'Phoenix', 'TX', '40400', '400', '400', 'Southeast');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('GrayCarolyn@uncc.edu', '500 Trade Street', '	Little Rock', 'UT', '50500', '500', '500', 'South');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('JaiDave@uncc.edu', '600 Harris Blvd', 'Sacramento', 'CA', '60600', '600', '600', 'North');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('JayShah@uncc.edu', '700 College Street', 'San Francisco', 'CA', '70700', '700', '700', 'West');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('KatherineRees@uncc.edu', '800 University Area ', 'Denver', 'CO', '80800', '800', '800', 'East');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('KrantiChinnaokotla@uncc.edu', '900 Mills Blvd', 'Newyork', 'NY', '90900', '900', '900', 'North');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('LakshmiVenkataSowmyaAndal@uncc.edu', '1000 Spiritual Blvd', 'Boise', 'ID', '11000', '1000','1000', 'South');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('MackenzieLeonard@uncc.edu', '1100 North Cross Street', 'Wilmington', 'DE', '11100', '1100', '1100','Midwest');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('PetersAbigail@uncc.edu', '1200 Center City ', 'Houston', 'TX', '11200', '1200', '1200', 'North');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('RajahChacko@uncc.edu', '1300 Church Lane', 'Pittsburgh', 'PA', '11300', '1300', '1300', 'North');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('SujitNanda@uncc.edu', '1400 Rolling St', 'Raleigh', 'NC', '11400', '1400', '1400', 'North');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('SukritiRoy@uncc.edu', '1500 Cherry Blossoms', 'Charlotte', 'NC', '11500', '1500', '1500', 'Mideast');



