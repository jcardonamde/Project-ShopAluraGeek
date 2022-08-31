-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema esquema_tienda_geek
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema esquema_tienda_geek
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `esquema_tienda_geek` DEFAULT CHARACTER SET utf8 ;
USE `esquema_tienda_geek` ;

-- -----------------------------------------------------
-- Table `esquema_tienda_geek`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esquema_tienda_geek`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NULL,
  `last_name` VARCHAR(150) NULL,
  `email` VARCHAR(150) NULL,
  `password` VARCHAR(255) NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esquema_tienda_geek`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esquema_tienda_geek`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name_prod` VARCHAR(255) NULL,
  `description` TEXT NULL,
  `price_prod` FLOAT NULL,
  `category` VARCHAR(150) NULL,
  `favorite` TINYINT NULL,
  `url_img` VARCHAR(255) NULL,
  `publication_expiration` DATETIME NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_products_users_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `esquema_tienda_geek`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
