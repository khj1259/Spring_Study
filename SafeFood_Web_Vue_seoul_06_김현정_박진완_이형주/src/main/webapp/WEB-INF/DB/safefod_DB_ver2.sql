-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema safefood
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema safefood
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `safefood` DEFAULT CHARACTER SET utf8 ;
USE `safefood` ;

-- -----------------------------------------------------
-- Table `safefood`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `safefood`.`user` (
  `id` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `allergy` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `safefood`.`board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `safefood`.`board` (
  `bnum` INT(11) NOT NULL AUTO_INCREMENT,
  `bdate` DATETIME NOT NULL,
  `id` VARCHAR(50) NOT NULL,
  `title` VARCHAR(1000) NOT NULL,
  `content` VARCHAR(1000) NULL DEFAULT NULL,
  `cnt` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`bnum`),
  INDEX `board_fk_id` (`id` ASC) VISIBLE,
  CONSTRAINT `board_fk_id`
    FOREIGN KEY (`id`)
    REFERENCES `safefood`.`user` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `safefood`.`food`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `safefood`.`food` (
  `code` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `supportpereat` DOUBLE NOT NULL,
  `calory` DOUBLE NOT NULL,
  `carbo` DOUBLE NULL DEFAULT NULL,
  `protein` DOUBLE NULL DEFAULT NULL,
  `fat` DOUBLE NULL DEFAULT NULL,
  `sugar` DOUBLE NULL DEFAULT NULL,
  `natrium` DOUBLE NULL DEFAULT NULL,
  `chole` DOUBLE NULL DEFAULT NULL,
  `fattyacid` DOUBLE NULL DEFAULT NULL,
  `transfat` DOUBLE NULL DEFAULT NULL,
  `maker` VARCHAR(45) NOT NULL,
  `material` VARCHAR(1000) NOT NULL,
  `img` VARCHAR(100) NOT NULL,
  `allergy` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `safefood`.`eatfood`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `safefood`.`eatfood` (
  `eatfoodcode` INT(11) NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(45) NOT NULL,
  `code` INT(11) NOT NULL,
  `cnt` INT(11) NOT NULL,
  PRIMARY KEY (`eatfoodcode`),
  INDEX `fk_eatfood_food_idx` (`code` ASC) VISIBLE,
  INDEX `fk_eatfood` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_eatfood`
    FOREIGN KEY (`id`)
    REFERENCES `safefood`.`user` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_eatfood_food`
    FOREIGN KEY (`code`)
    REFERENCES `safefood`.`food` (`code`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `safefood`.`userprivateinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `safefood`.`userprivateinfo` (
  `id` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NULL DEFAULT NULL,
  `height` VARCHAR(45) NULL DEFAULT NULL,
  `weight` VARCHAR(45) NULL DEFAULT NULL,
  `age` VARCHAR(45) NULL DEFAULT NULL,
  `checkActivity` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `userprivateinfo_fk_id`
    FOREIGN KEY (`id`)
    REFERENCES `safefood`.`user` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `safefood`.`wishlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `safefood`.`wishlist` (
  `wishcode` INT(11) NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(45) NOT NULL,
  `code` INT(11) NOT NULL,
  `cnt` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`wishcode`),
  INDEX `fk_wishlist_user_idx` (`id` ASC) VISIBLE,
  INDEX `fk_wishlist_food1_idx` (`code` ASC) VISIBLE,
  CONSTRAINT `fk_wishlist_food1`
    FOREIGN KEY (`code`)
    REFERENCES `safefood`.`food` (`code`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_wishlist_user`
    FOREIGN KEY (`id`)
    REFERENCES `safefood`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
