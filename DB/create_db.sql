-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema endangerment_languages
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema endangerment_languages
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `endangerment_languages` DEFAULT CHARACTER SET utf8 ;
USE `endangerment_languages` ;

-- -----------------------------------------------------
-- Table `endangerment_languages`.`languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `endangerment_languages`.`languages` (
  `name_language` VARCHAR(45) NOT NULL,
  `cuntries` VARCHAR(45) NOT NULL,
  `endangerment` VARCHAR(45) NOT NULL,
  `speakers` INT NOT NULL,
  `latitude` FLOAT NOT NULL,
  `longitude` FLOAT NOT NULL,
  PRIMARY KEY (`name_language`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `endangerment_languages`.`languages_usa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `endangerment_languages`.`languages_usa` (
  `language_name` VARCHAR(45) NOT NULL,
  `endangerment` VARCHAR(45) NOT NULL,
  `speakers` INT NOT NULL,
  `state_name` VARCHAR(45) NOT NULL,
  `languages_name_language` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`language_name`),
  INDEX `fk_languages_usa_languages_idx` (`languages_name_language` ASC) VISIBLE,
  CONSTRAINT `fk_languages_usa_languages`
    FOREIGN KEY (`languages_name_language`)
    REFERENCES `endangerment_languages`.`languages` (`name_language`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `endangerment_languages`.`population_usa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `endangerment_languages`.`population_usa` (
  `state_name` VARCHAR(45) NOT NULL,
  `1970` INT NOT NULL,
  `1980` INT NOT NULL,
  `1990` INT NOT NULL,
  `2000` INT NOT NULL,
  `2010` INT NOT NULL,
  `2020` INT NOT NULL,
  `languages_usa_language_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`state_name`),
  INDEX `fk_population_usa_languages_usa1_idx` (`languages_usa_language_name` ASC) VISIBLE,
  CONSTRAINT `fk_population_usa_languages_usa1`
    FOREIGN KEY (`languages_usa_language_name`)
    REFERENCES `endangerment_languages`.`languages_usa` (`language_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `endangerment_languages`.`ethnic_population`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `endangerment_languages`.`ethnic_population` (
  `state_name` VARCHAR(45) NOT NULL,
  `1970` INT NOT NULL,
  `1980` INT NOT NULL,
  `1990` INT NOT NULL,
  `2000` INT NOT NULL,
  `2010` INT NOT NULL,
  `2020` INT NOT NULL,
  `population_usa_state_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`state_name`),
  INDEX `fk_ethnic_population_population_usa1_idx` (`population_usa_state_name` ASC) VISIBLE,
  CONSTRAINT `fk_ethnic_population_population_usa1`
    FOREIGN KEY (`population_usa_state_name`)
    REFERENCES `endangerment_languages`.`population_usa` (`state_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

