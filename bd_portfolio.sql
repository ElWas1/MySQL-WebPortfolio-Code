-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bd_portfolio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd_portfolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_portfolio` DEFAULT CHARACTER SET utf8 ;
USE `bd_portfolio` ;

-- -----------------------------------------------------
-- Table `bd_portfolio`.`datospersonales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_portfolio`.`datospersonales` (
  `id` INT ZEROFILL NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `mail` VARCHAR(200) NULL,
  `celular` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_portfolio`.`estudios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_portfolio`.`estudios` (
  `id` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(200) NULL,
  `añodeegreso` INT NULL,
  `titulo` VARCHAR(45) NULL,
  `Datos p_id` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`id`, `Datos p_id`),
  INDEX `fk_Estudios_Datos p_idx` (`Datos p_id` ASC) VISIBLE,
  CONSTRAINT `fk_Estudios_Datos p`
    FOREIGN KEY (`Datos p_id`)
    REFERENCES `bd_portfolio`.`datospersonales` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_portfolio`.`habilidadesblandas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_portfolio`.`habilidadesblandas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NULL,
  `porcentaje` VARCHAR(45) NULL,
  `datospersonales_id` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`id`, `datospersonales_id`),
  INDEX `fk_habilidadesblandas_datospersonales1_idx` (`datospersonales_id` ASC) VISIBLE,
  CONSTRAINT `fk_habilidadesblandas_datospersonales1`
    FOREIGN KEY (`datospersonales_id`)
    REFERENCES `bd_portfolio`.`datospersonales` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_portfolio`.`habilidadesduras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_portfolio`.`habilidadesduras` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descripion` VARCHAR(45) NULL,
  `porcentaje` VARCHAR(45) NULL,
  `datospersonales_id` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`id`, `datospersonales_id`),
  INDEX `fk_habilidadesduras_datospersonales1_idx` (`datospersonales_id` ASC) VISIBLE,
  CONSTRAINT `fk_habilidadesduras_datospersonales1`
    FOREIGN KEY (`datospersonales_id`)
    REFERENCES `bd_portfolio`.`datospersonales` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
