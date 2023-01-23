-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema endlang_usa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema endlang_usa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `endlang_usa` DEFAULT CHARACTER SET utf8 ;
USE `endlang_usa` ;

-- -----------------------------------------------------
-- Table `endlang_usa`.`languages_usa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `endlang_usa`.`languages_usa` (
  `id_lang_usa` INT NOT NULL,
  `language_name` VARCHAR(200) NOT NULL,
  `endangerment` VARCHAR(200) NOT NULL,
  `speakers` INT NOT NULL,
  `latitude` FLOAT NOT NULL,
  `longitude` FLOAT NOT NULL,
  `state` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id_lang_usa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `endlang_usa`.`states_population`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `endlang_usa`.`states_population` (
  `state_name` VARCHAR(200) NOT NULL,
  `1970` INT NOT NULL,
  `1980` INT NOT NULL,
  `1990` INT NOT NULL,
  `2000` INT NOT NULL,
  `2010` INT NOT NULL,
  `2020` INT NOT NULL,
  PRIMARY KEY (`state_name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `endlang_usa`.`states_population_has_languages_usa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `endlang_usa`.`states_population_has_languages_usa` (
  `states_population_state_name` VARCHAR(200) NOT NULL,
  `languages_usa_id_lang_usa` INT NOT NULL,
  PRIMARY KEY (`states_population_state_name`, `languages_usa_id_lang_usa`),
  INDEX `fk_states_population_has_languages_usa_languages_usa1_idx` (`languages_usa_id_lang_usa` ASC) VISIBLE,
  INDEX `fk_states_population_has_languages_usa_states_population_idx` (`states_population_state_name` ASC) VISIBLE,
  CONSTRAINT `fk_states_population_has_languages_usa_states_population`
    FOREIGN KEY (`states_population_state_name`)
    REFERENCES `endlang_usa`.`states_population` (`state_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_states_population_has_languages_usa_languages_usa1`
    FOREIGN KEY (`languages_usa_id_lang_usa`)
    REFERENCES `endlang_usa`.`languages_usa` (`id_lang_usa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



