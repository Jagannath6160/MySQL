-- Jagannath Group Team2 SQL Script
/*  Script to create tables, populate tables with data and also contains queries for business functions */


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
  `idClicksOn` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `idResource` INT UNSIGNED NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idClicksOn`),
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
  `state` VARCHAR(2) NULL DEFAULT NULL,
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
  `MajorName` VARCHAR(50) NOT NULL,
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
  `USpecialization` VARCHAR(50) NOT NULL,
  `SATScore` SMALLINT NOT NULL,
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
  `GSpecialization` VARCHAR(50) NOT NULL,
  `GREScore` SMALLINT NOT NULL,
  PRIMARY KEY (`MajorID`),
  CONSTRAINT `5MajorID`
    FOREIGN KEY (`MajorID`)
    REFERENCES `UNIVERSITYDB`.`Major` (`MajorID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- Create a static reference table containing two-letter state abbreviation (PK), state, and census region. 
-- -----------------------------------------------------
-- Table `UNIVERSITYDB`.`StateRegion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNIVERSITYDB`.`StateRegion` ( 
`StateAbbr` CHAR(2) NOT NULL , 
`State` VARCHAR(15) NOT NULL , 
`Region` VARCHAR(20) NOT NULL , 
PRIMARY KEY (`StateAbbr`(2))) 
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

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
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`,  `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('4', 'LibraryUNCC.PDF', '', '3', 'Library', 'Spring');
INSERT INTO `resources` (`idResource`, `StudentLifeDoc`,`StudentLifeDocContents`,  `TimesDownloaded`, `Specialization`,`AcademicCalendar`) VALUES ('5', 'AdmissionsUNCC.PDF', '', '2', 'Admissions', 'Spring');



/*I Insertion into clickson */

INSERT INTO `clickson`(`idResource`, `email`) VALUES (1,'AmirAzmoon@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (2,'JayShah@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (3,'EbrahimMughal@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (4,'KrantiChinnaokotla@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (5,'LakshmiVenkataSowmyaAndal@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (1,'KatherineRees@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (2,'ChloeHunter@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (3,'GrayCarolyn@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (4,'PetersAbigail@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (5,'MackenzieLeonard@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (1,'JayShah@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (2,'EbrahimMughal@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (3,'KrantiChinnaokotla@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (4,'LakshmiVenkataSowmyaAndal@uncc.edu');
INSERT INTO `clickson`(`idResource`, `email`) VALUES (5,'JaiDave@uncc.edu');

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


SELECT A.email, A.FirstName, A.LastName, MajorName
FROM
	AspiringStudent A, Major M, Seeking S
WHERE
    M.MajorName='Computer Engineering' AND
    S.MajorID=M.MajorID AND
    A.email=S.email
    Order By A.FirstName;

 /* Allow staff to search based on  Degree seeking */


SELECT  A.email, A.FirstName, A.LastName, MajorName
FROM
	AspiringStudent A, Major M, Seeking S
WHERE
    S.Degree='BS' AND
    S.email=A.email
    GROUP BY A.email;



/* 4. Allow staff to search based on  favorite extracurricular activities.  */


/* -- Allow staff to search based on  favorite extracurricular activities. */


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


SELECT a.email, a.testscore, a.GPA FROM aspiringstudent a WHERE a.email="rvanga@gmail.com";


/*  Allow staff to view all the student’s G.P.A and S.A.T Score in decreasing order of test score.  */


SELECT a.email, a.testscore, a.GPA FROM aspiringstudent a ORDER BY a.testscore DESC;


/* 6. Allow a student to locate the Resources and access any of the resource. */


/* Allow the student to locate all the resources available to him.  */


Select StudentLifeDoc From Resources;


/* Allow the student to view resources based on specialization */


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


SELECT  A.email, A.FirstName, A.LastName, MajorName, City
FROM
	AspiringStudent A, Address D, Major M, Seeking S
WHERE
    A.email=D.email AND
    A.email=S.email AND
    S.MajorID = M.MajorID AND
    D.city = 'Charlotte';


/* Allow staff to search by Geography or Region */


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


SELECT e.email,a.firstname,a.lastname, ec.ExtraCurricularName from enjoys e, aspiringstudent a, extracurricularactivities ec where e.email = a.email and e.ExtraCurricularID =ec.ExtraCurricularID and ec.ExtraCurricularName = 'Swimming';


/* Allow staff to View reports to recruit and reach out to students based on their Academics. */


SELECT  email,LastName,FirstName
from      aspiringstudent
           where   GPA > '3.50'
and        TestScore > 300;


/* -- 10. Allow staff to view reports based on resources accessed by the students. */


/* Allow staff to view the resources accessed by a student */


SELECT r.StudentLifeDoc, r.specialization, r.TimesDownloaded, r.AcademicCalendar 
from clickson c ,resources r 
where c.idresource = r.idresource 
and email = 'LakshmiVenkataSowmyaAndal@uncc.edu';

/*Allow staff to view the most accessed resource. */


SELECT idresource,Specialization,TimesDownloaded
from    resources
where   TimesDownloaded = (select Max(TimesDownloaded)  from   resources);
