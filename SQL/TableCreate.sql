
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
