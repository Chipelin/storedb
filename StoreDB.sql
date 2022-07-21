CREATE SCHEMA IF NOT EXISTS `Storedb` ;
USE `Storedb` ;


CREATE TABLE IF NOT EXISTS `Storedb`.`Category` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));




CREATE TABLE IF NOT EXISTS `Storedb`.`Images` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `path` VARCHAR(45) NULL,
  `alt` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));




CREATE TABLE IF NOT EXISTS `Storedb`.`Brand` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));



CREATE TABLE IF NOT EXISTS `Storedb`.`Product` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `category_id` INT NULL,
  `brand_id` INT NULL,
  `count` INT NULL,
  `baseprice` INT NULL,
  `discountprice` INT NULL,
  `currentprice` VARCHAR(45) NULL,
  `image_id` INT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `category_id_idx` (`category_id` ASC),
  INDEX `brand_id_idx` (`brand_id` ASC),
  INDEX `image_id_idx` (`image_id` ASC),
  CONSTRAINT `category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `Storedb`.`Category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `image_id`
    FOREIGN KEY (`image_id`)
    REFERENCES `Storedb`.`Images` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `brand_id`
    FOREIGN KEY (`brand_id`)
    REFERENCES `Storedb`.`Brand` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


INSERT INTO `Storedb`.`Brand` (`id`, `name`, `country`, `description`) VALUES (1, 'brand1', 'somecountry', 'brand 1 description');
INSERT INTO `Storedb`.`Brand` (`id`, `name`, `country`, `description`) VALUES (2, 'brand2', 'counry2', 'brand 2 desc');
INSERT INTO `Storedb`.`Category` (`id`, `name`, `description`) VALUES (1, 'cat1', 'cat1 description');
INSERT INTO `Storedb`.`Category` (`id`, `name`, `description`) VALUES (2, 'cat2', 'cat2 description');
INSERT INTO `Storedb`.`Category` (`id`, `name`, `description`) VALUES (3, 'cat3', 'cat3 description');
INSERT INTO `Storedb`.`Images` (`id`, `name`, `path`, `alt`) VALUES (1, 'img1', 'path\\to\\img', 'alt1');
INSERT INTO `Storedb`.`Images` (`id`, `name`, `path`, `alt`) VALUES (2, 'img2', 'path\\to\\img2', 'alt2');
INSERT INTO `Storedb`.`Images` (`id`, `name`, `path`, `alt`) VALUES (3, 'img3', 'path\\to\\img3', 'alt3');
INSERT INTO `Storedb`.`Product` (`id`, `name`, `category_id`, `brand_id`, `count`, `baseprice`, `discountprice`, `currentprice`, `image_id`, `description`) VALUES (1, 'product1', 1, 1, 56, 56, 50, '50', 1, 'desc');



