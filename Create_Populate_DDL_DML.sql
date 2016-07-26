-- Jagannath Group Team2 DDL Script
-- Script to create tables and populate data


SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema UNIVERSITYDB
-- -----------------------------------------------------
-- This is the Schema for the ITCS 6160 University Project.
-- 


CREATE SCHEMA IF NOT EXISTS `UNIVERSITYDB` DEFAULT CHARACTER SET utf8 ;
USE `UNIVERSITYDB` ;

-- -----------------------------------------------------
-- Table `UNIVERSITYDB`.`AspiringStudent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNIVERSITYDB`.`AspiringStudent` (
  `email` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(30) NOT NULL,
  `FirstName` VARCHAR(30) NULL,
  `Password` VARCHAR(30) NOT NULL DEFAULT 'changeMe',
  `GPA` FLOAT(3,2) NULL,
  `TestScore` SMALLINT NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UNIVERSITYDB`.`Resources`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNIVERSITYDB`.`Resources` (
  `idResource` INT UNSIGNED NOT NULL,
  `StudentLifeDoc` VARCHAR(45) NULL DEFAULT 'noname.PDF',
  `StudentLifeDocContents` BLOB NULL,
  `FAFSA` VARCHAR(100) NULL,
  `TimesDownloaded` SMALLINT NULL,
  `Specialization` VARCHAR(45) NULL,
  `AcademicCalendar` VARCHAR(45) NULL,
  PRIMARY KEY (`idResource`),
  UNIQUE INDEX `idResource_UNIQUE` (`idResource` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UNIVERSITYDB`.`ClicksOn`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNIVERSITYDB`.`ClicksOn` (
  `idResource` INT UNSIGNED NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idResource`, `email`),
  INDEX `email_idx` (`email` ASC),
  CONSTRAINT `idResource`
    FOREIGN KEY (`idResource`)
    REFERENCES `UNIVERSITYDB`.`Resources` (`idResource`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `1email`
    FOREIGN KEY (`email`)
    REFERENCES `UNIVERSITYDB`.`AspiringStudent` (`email`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UNIVERSITYDB`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNIVERSITYDB`.`Staff` (
  `StaffID` INT NOT NULL,
  `StaffEmail` VARCHAR(45) NOT NULL,
  `StaffName` VARCHAR(45) NULL DEFAULT NULL,
  `StaffPassword` VARCHAR(16) NULL DEFAULT NULL,
  PRIMARY KEY (`StaffEmail`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UNIVERSITYDB`.`ExtraCurricularActivities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNIVERSITYDB`.`ExtraCurricularActivities` (
  `ExtraCurricularName` VARCHAR(45) NULL DEFAULT NULL,
  `ExtraCurricularID` INT NOT NULL,
  PRIMARY KEY (`ExtraCurricularID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UNIVERSITYDB`.`Enjoys`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNIVERSITYDB`.`Enjoys` (
  `AcademicLetter` TINYINT(1) NULL DEFAULT NULL,
  `YearExperience` TINYINT NULL DEFAULT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `ExtraCurricularID` INT NOT NULL,
  PRIMARY KEY (`Email`, `ExtraCurricularID`),
  INDEX `ExtraCurricularActivitiesId_idx` (`ExtraCurricularID` ASC),
  CONSTRAINT `email`
    FOREIGN KEY (`Email`)
    REFERENCES `UNIVERSITYDB`.`AspiringStudent` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ExtraCurricularId`
    FOREIGN KEY (`ExtraCurricularID`)
    REFERENCES `UNIVERSITYDB`.`ExtraCurricularActivities` (`ExtraCurricularID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UNIVERSITYDB`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNIVERSITYDB`.`Address` (
  `email` VARCHAR(45) NOT NULL,
  `streetName` VARCHAR(30) NULL DEFAULT NULL,
  `city` VARCHAR(15) NULL DEFAULT NULL,
  `state` VARCHAR(20) NULL DEFAULT NULL,
  `zipcode` VARCHAR(10) NULL DEFAULT NULL,
  `building` VARCHAR(20) NULL DEFAULT NULL,
  `apartment` VARCHAR(20) NULL DEFAULT NULL,
  `region` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `emailAddress`
    FOREIGN KEY (`email`)
    REFERENCES `UNIVERSITYDB`.`AspiringStudent` (`email`)
    ON DELETE CASCADE);


-- -----------------------------------------------------
-- Table `UNIVERSITYDB`.`Contacts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNIVERSITYDB`.`Contacts` (
  `email` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(12) NOT NULL,
  `preferredContact` BIT(1) NULL DEFAULT 0,
  PRIMARY KEY (`email`, `phone`),
  CONSTRAINT ``
    FOREIGN KEY (`email`)
    REFERENCES `UNIVERSITYDB`.`AspiringStudent` (`email`)
    ON DELETE CASCADE);


-- -----------------------------------------------------
-- Table `UNIVERSITYDB`.`Courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNIVERSITYDB`.`Courses` (
  `CourseID` VARCHAR(6) NOT NULL,
  `CourseName` VARCHAR(20) NULL,
  PRIMARY KEY (`CourseID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UNIVERSITYDB`.`FinancialAssistance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNIVERSITYDB`.`FinancialAssistance` (
  `Name` VARCHAR(30) NOT NULL,
  `Amount` FLOAT(7,2) NULL,
  `MinGPA` FLOAT(3,2) NULL,
  PRIMARY KEY (`Name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UNIVERSITYDB`.`SemestersOffered`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNIVERSITYDB`.`SemestersOffered` (
  `CourseID` VARCHAR(6) NOT NULL,
  `SemestersOffered` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`CourseID`, `SemestersOffered`),
  CONSTRAINT `CourseId`
    FOREIGN KEY (`CourseID`)
    REFERENCES `UNIVERSITYDB`.`Courses` (`CourseID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UNIVERSITYDB`.`Major`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNIVERSITYDB`.`Major` (
  `MajorID` VARCHAR(15) NOT NULL,
  `MajorName` VARCHAR(40) NOT NULL,
  `EducationalPrereq` VARCHAR(30) NULL,
  `MinGPA` FLOAT(3,2) NOT NULL,
  `InstateTuition` FLOAT(10,2) NOT NULL,
  `OutStateTuition` FLOAT(10,2) NOT NULL,
  `NumCourses` TINYINT UNSIGNED NULL,
  PRIMARY KEY (`MajorID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UNIVERSITYDB`.`Offers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNIVERSITYDB`.`Offers` (
  `CourseID` VARCHAR(6) NOT NULL,
  `MajorID` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`CourseID`, `MajorID`),
  INDEX `MajorId_idx` (`MajorID` ASC),
  CONSTRAINT `2CourseID`
    FOREIGN KEY (`CourseID`)
    REFERENCES `UNIVERSITYDB`.`Courses` (`CourseID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `2MajorId`
    FOREIGN KEY (`MajorID`)
    REFERENCES `UNIVERSITYDB`.`Major` (`MajorID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UNIVERSITYDB`.`Offered`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNIVERSITYDB`.`Offered` (
  `Name` VARCHAR(30) NOT NULL,
  `MajorID` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Name`, `MajorID`),
  INDEX `Name_idx` (`Name` ASC),
  INDEX `MajorID_idx` (`MajorID` ASC),
  CONSTRAINT `1Name`
    FOREIGN KEY (`Name`)
    REFERENCES `UNIVERSITYDB`.`FinancialAssistance` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `1MajorID`
    FOREIGN KEY (`MajorID`)
    REFERENCES `UNIVERSITYDB`.`Major` (`MajorID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UNIVERSITYDB`.`Seeking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNIVERSITYDB`.`Seeking` (
  `Degree` VARCHAR(25) NOT NULL,
  `StartDate` DATE NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `MajorID` CHAR(15) NOT NULL,
  PRIMARY KEY (`Email`, `MajorID`),
  INDEX `MajorId_idx` (`MajorID` ASC),
  CONSTRAINT `3MajorId`
    FOREIGN KEY (`MajorID`)
    REFERENCES `UNIVERSITYDB`.`Major` (`MajorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `3Email`
    FOREIGN KEY (`Email`)
    REFERENCES `UNIVERSITYDB`.`AspiringStudent` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UNIVERSITYDB`.`UndergraduateDegree`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNIVERSITYDB`.`UndergraduateDegree` (
  `MajorID` VARCHAR(15) NOT NULL,
  `USpecialization` VARCHAR(30) NOT NULL,
  `SATScore` TINYINT NOT NULL,
  PRIMARY KEY (`MajorID`),
  CONSTRAINT `MajorID`
    FOREIGN KEY (`MajorID`)
    REFERENCES `UNIVERSITYDB`.`Major` (`MajorID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UNIVERSITYDB`.`GraduateDegree`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNIVERSITYDB`.`GraduateDegree` (
  `MajorID` VARCHAR(15) NOT NULL,
  `GSpecialization` VARCHAR(30) NOT NULL,
  `GREScore` TINYINT NOT NULL,
  PRIMARY KEY (`MajorID`),
  CONSTRAINT `5MajorID`
    FOREIGN KEY (`MajorID`)
    REFERENCES `UNIVERSITYDB`.`Major` (`MajorID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;




--  -----------------
-- Delete command may create foreign key violation same as truncate


/* `courses` */

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

/*  semestersoffered */

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


/* major */

INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M1','B.S in Mathematics','High School',3,4000,7000,40);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M2','B.S in Physics  ','High School',3,4000,7000,40);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M3','B.S in Computer Science','High School',3,4000,7000,40);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M4','B.S in Mechanical Engineering','High School',3,3800,6800,40);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M5','B.S in Civil Engineering','High School',3,3800,6800,40);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M6','B.S in Computer Engineering','High School',3,5500,8500,40);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M7','B.S in Industrial Engineering','High School',3,5500,8500,40);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M8','B.S in Chemistry','High School',3,4400,7400,40);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M9','M.S in Mathematics','Bachelor',3,4400,7400,10);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M10','M.S in Physics  ','Bachelor',3.2,5000,8000,10);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M11','M.S in Computer Science','Bachelor',3.2,5000,8000,10);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M12','M.S in Mechanical Engineering','Bachelor',3.2,5000,8000,10);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M13','M.S in Civil Engineering','Bachelor',3.2,6000,9000,10);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M14','M.S in Computer Engineering','Bachelor',3.2,6000,9000,10);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M15','M.S in Industrial Engineering','Bachelor',3.2,6000,9000,10);
INSERT INTO `major`(`MajorID`, `MajorName`, `EducationalPrereq`, `MinGPA`, `InstateTuition`, `OutStateTuition`, `NumCourses`) VALUES ('M16','M.S in Chemistry','Bachelor',3.2,6000,9000,10);


/* undergraduatedegree */

INSERT INTO `undergraduatedegree`(`MajorID`, `USpecialization`, `SATScore`) VALUES ('M1','Mathematics',270);
INSERT INTO `undergraduatedegree`(`MajorID`, `USpecialization`, `SATScore`) VALUES ('M2','Physics ',270);
INSERT INTO `undergraduatedegree`(`MajorID`, `USpecialization`, `SATScore`) VALUES ('M3','Computer Science',270);
INSERT INTO `undergraduatedegree`(`MajorID`, `USpecialization`, `SATScore`) VALUES ('M4','Mechanical Engineering',270);
INSERT INTO `undergraduatedegree`(`MajorID`, `USpecialization`, `SATScore`) VALUES ('M5','Civil Engineering',270);
INSERT INTO `undergraduatedegree`(`MajorID`, `USpecialization`, `SATScore`) VALUES ('M6','Computer Engineering',270);
INSERT INTO `undergraduatedegree`(`MajorID`, `USpecialization`, `SATScore`) VALUES ('M7','Industrial Engineering',270);
INSERT INTO `undergraduatedegree`(`MajorID`, `USpecialization`, `SATScore`) VALUES ('M8','Chemistry',270);


/* financialassistance */

INSERT INTO `financialassistance`(`Name`, `Amount`, `MinGPA`) VALUES ('Belk Scholarships','2500','2.5');
INSERT INTO `financialassistance`(`Name`, `Amount`, `MinGPA`) VALUES ('Turing Scholarships',3500,2.9);
INSERT INTO `financialassistance`(`Name`, `Amount`, `MinGPA`) VALUES ('Federal Grants',4500,3);
INSERT INTO `financialassistance`(`Name`, `Amount`, `MinGPA`) VALUES ('Institutional Grants',1200,3);
INSERT INTO `financialassistance`(`Name`, `Amount`, `MinGPA`) VALUES ('Levine Scholars Program',9000,3.2);
INSERT INTO `financialassistance`(`Name`, `Amount`, `MinGPA`) VALUES ('Agency Start Scholarship',7000,3);
INSERT INTO `financialassistance`(`Name`, `Amount`, `MinGPA`) VALUES ('A.K. Sutton Scholarship',4000,3);
INSERT INTO `financialassistance`(`Name`, `Amount`, `MinGPA`) VALUES ('Bonnie Cone Scholarship',3800,3);
INSERT INTO `financialassistance`(`Name`, `Amount`, `MinGPA`) VALUES ('Alumni Scholarships for Merit',12000,3.3);
INSERT INTO `financialassistance`(`Name`, `Amount`, `MinGPA`) VALUES ('Grant Thornton Scholarship',1000,4);


/* extracurricularactivities */

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


/* aspiringstudent */

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


/* enjoys */

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






INSERT INTO `Staff` (`StaffID`,`StaffEmail`,`StaffName`,`StaffPassword`) VALUES (1,'SueRussell@uncc.edu', 'Sue Russell',424784);
INSERT INTO `Staff` (`StaffID`,`StaffEmail`,`StaffName`,`StaffPassword`) VALUES (2,'RobertUnderwood@uncc.edu', 'Robert Underwood',265993);
INSERT INTO `Staff` (`StaffID`,`StaffEmail`,`StaffName`,`StaffPassword`) VALUES (3,'UnmanyouJones@uncc.edu', 'Unmanyou Jones',897677);
INSERT INTO `Staff` (`StaffID`,`StaffEmail`,`StaffName`,`StaffPassword`) VALUES (4,'LaurenClarkson@uncc.edu', 'Lauren Clarkson',238310);
INSERT INTO `Staff` (`StaffID`,`StaffEmail`,`StaffName`,`StaffPassword`) VALUES (5,'GabrielleWhite@uncc.edu', 'Gabrielle White',626105);
INSERT INTO `Staff` (`StaffID`,`StaffEmail`,`StaffName`,`StaffPassword`) VALUES (6,'SmithFinely@uncc.edu', 'Smith Finely',118846);
INSERT INTO `Staff` (`StaffID`,`StaffEmail`,`StaffName`,`StaffPassword`) VALUES (7,'LivelyBlake@uncc.edu', 'Lively Blake',756272);
INSERT INTO `Staff` (`StaffID`,`StaffEmail`,`StaffName`,`StaffPassword`) VALUES (8,'AnneLee@uncc.edu', 'Anne Lee',941893);
INSERT INTO `Staff` (`StaffID`,`StaffEmail`,`StaffName`,`StaffPassword`) VALUES (9,'SeanMathis@uncc.edu', 'Sean Mathis',629994);
INSERT INTO `Staff` (`StaffID`,`StaffEmail`,`StaffName`,`StaffPassword`) VALUES (10,'StephenMorgan@uncc.edu', 'Stephen Morgan',873444);

INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`, `FAFSA`, `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('1', 'SportsUNCC.PDF', '', 'NULL', '0','Sports', 'Fall');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`, `FAFSA`, `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('2', 'CultureUNCC.PDF', '', 'NULL', '2','Culture', 'Spring');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`, `FAFSA`, `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('3', 'Housing.PDF', '', 'NULL', '1', 'Housing','Summer1');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`, `FAFSA`, `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('4', 'TravelUNCC.PDF', '', 'NULL', '4', 'Travel','Summer2');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`, `FAFSA`, `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('5', 'CampusLifeUNCC.PDF', '', 'NULL', '2', 'CampusLife','Summer1');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`, `FAFSA`, `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('6', 'LibraryUNCC.PDF', '', 'NULL', '3', 'Library', 'Spring');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`, `FAFSA`, `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('7', 'AcademicsUNCC.PDF', '', 'NULL', '1', 'Academics','Summer2');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`, `FAFSA`, `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('8', 'SecurityUNCC.PDF', '', 'NULL', '5', 'Security', 'Fall');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`, `FAFSA`, `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('9', 'AdmissionsUNCC.PDF', '', 'NULL', '2', 'Admissions', 'Spring');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`, `FAFSA`, `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('10', 'AboutUNCC.PDF', '', 'NULL', '7', 'AboutUNCC','Summer1');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`, `FAFSA`, `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('11', 'VisitCampusUNCC.PDF', '', 'NULL', '6', 'VisitCampus','Fall');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`, `FAFSA`, `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('12', 'Parents_Family.PDF', '', 'NULL', '2', 'Parents_Family','Spring');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`, `FAFSA`, `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('13', 'Alumni_FriendsUNCC.PDF', '', 'NULL', '6', 'Alumni_Friends','Summer2');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`, `FAFSA`, `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('14', 'Faculty_StaffUNCC.PDF', '', 'NULL', '1', 'Faculty_Staff','Summer1');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`, `FAFSA`, `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('15', 'Community_EngageUNCC.PDF', '', 'NULL', '2', 'Community_Engagaement','Fall');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`, `FAFSA`, `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('16', 'ResearchUNCC.PDF', '', 'NULL', '4', 'Research','Spring');


/* clickson */

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

/* offers */

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

/* offered */
DELETE FROM `offered`;
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Belk Scholarships','M1');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Turing Scholarships','M2');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Federal Grants','M3');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Institutional Grants','M4');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Levine Scholars Program','M5');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Agency Start Scholarship','M6');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('A.K. Sutton Scholarship','M7');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Bonnie Cone Scholarship','M8');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Alumni Scholarships for Merit','M9');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Grant Thornton Scholarship','M10');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Belk Scholarships','M11');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Turing Scholarships','M12');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Federal Grants','M13');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Institutional Grants','M14');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Levine Scholars Program','M15');
INSERT INTO `offered`(`Name`, `MajorID`) VALUES ('Agency Start Scholarship','M16');


/*  seeking */

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

/* graduatedegree */ 

INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M1','Computer Science',250);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M2','Mathematics',250);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M3','Physics',250);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M4','Chemistry',260);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M5','Mechanical Engineering',260);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M6','Civil Engineering',260);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M7','Electrical and Computer Engineering',270);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M8','Industrial Engineering',270);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M9','Computer Science',290);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M10','Mathematics',290);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M11','Physics',290);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M12','Chemistry',260);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M13','Mechanical Engineering',290);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M14','Civil Engineering',300);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M15','Electrical and Computer Engineering',300);
INSERT INTO `graduatedegree`(`MajorID`, `GSpecialization`, `GREScore`) VALUES ('M16','Industrial Engineering',300);


/* resources */ 



/* Address */ 

INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('AmirAzmoon@uncc.edu', '100 Church Street', 'Charlotte', 'NC', '28100', '100', '100', 'NorthWest');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('ChloeHunter@uncc.edu', '200 South Street', 'Montgomery', 'Alabama', '10200', '200', '200', 'South');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('DineashPanchananam@uncc.edu','300', 'Reading', 'SC', '30300', '300', '300', 'NorthWest');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('EbrahimMughal@uncc.edu', '400 North Street', 'Phoenix', 'Phoenix', '40400', '400', '400', 'NorthEast');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('GrayCarolyn@uncc.edu', '500','500Trade Street', '	Little Rock', '50500', '500', '500', 'South');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('JaiDave@uncc.edu', '600 Harris Blvd', 'Sacramento', 'California', '60600', '600', '600', 'North');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('JayShah@uncc.edu', '700 College Street', 'San Francisco', 'California', '70700', '700', '700', 'West');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('KatherineRees@uncc.edu', '800 University Area ', 'Denver', 'Colorado', '80800', '800', '800', 'East');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('KrantiChinnaokotla@uncc.edu', '900 Mills Blvd', 'Newyork', 'Newyork', '90900', '900', '900', 'North');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('LakshmiVenkataSowmyaAndal@uncc.edu', '1000 Spiritual Blvd', 'Boise', 'Idaho', '11000', '1000','1000', 'South');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('MackenzieLeonard@uncc.edu', '1100 North Cross Street', 'Wilmington', 'Delaware', '11100', '1100', '1100','North');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('PetersAbigail@uncc.edu', '1200 Center City ', 'Houston', 'Texas', '11200', '1200', '1200', 'North');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('RajahChacko@uncc.edu', '1300 Church Lane', 'Pittsburgh', 'PA', '11300', '1300', '1300', 'North');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('SujitNanda@uncc.edu', '1400 Rolling St', 'Raleigh', 'NC', '11400', '1400', '1400', 'North');
INSERT INTO `address` (`email`, `streetName`, `city`, `state`, `zipcode`,`building`, `apartment`, `region`) VALUES ('SukritiRoy@uncc.edu', '1500 Cherry Blossoms', 'Charlotte', 'NC', '11500', '1500', '1500', 'North');
