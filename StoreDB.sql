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



CREATE TABLE IF NOT EXISTS `Storedb`.`Product` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `main_category` INT NULL,
  `main_image` INT NULL,
  `count` INT NULL DEFAULT NULL,
  `price` FLOAT NULL DEFAULT NULL,
  `discountprice` FLOAT NULL DEFAULT NULL,
  `promoprice` FLOAT NULL DEFAULT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `is_active` TINYINT NOT NULL COMMENT '\n',
  PRIMARY KEY (`id`),
  INDEX `main_category_idx` (`main_category` ASC),
  INDEX `main_image_idx` (`main_image` ASC),
  CONSTRAINT `main_category`
    FOREIGN KEY (`main_category`)
    REFERENCES `Storedb`.`Category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `main_image`
    FOREIGN KEY (`main_image`)
    REFERENCES `Storedb`.`Images` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `Storedb`.`Product_Image` (
  `image_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`image_id`, `product_id`),
  INDEX `product_id_idx` (`product_id` ASC),
  CONSTRAINT `image_id`
    FOREIGN KEY (`image_id`)
    REFERENCES `Storedb`.`Images` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `Storedb`.`Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `Storedb`.`Product_Category` (
  `product_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`product_id`, `category_id`),
  INDEX `category_id_idx` (`category_id` ASC),
  CONSTRAINT `category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `Storedb`.`Category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


INSERT INTO `Storedb`.`Category` (`id`, `name`, `description`) VALUES (1, 'cat1', 'cat1 description');
INSERT INTO `Storedb`.`Category` (`id`, `name`, `description`) VALUES (2, 'cat2', 'cat2 description');
INSERT INTO `Storedb`.`Category` (`id`, `name`, `description`) VALUES (3, 'cat3', 'cat3 description');
INSERT INTO `Storedb`.`Images` (`id`, `name`, `path`, `alt`) VALUES (1, 'img1', 'path-to-img', 'alt1');
INSERT INTO `Storedb`.`Images` (`id`, `name`, `path`, `alt`) VALUES (2, 'img2', 'path-to-img2', 'alt2');
INSERT INTO `Storedb`.`Images` (`id`, `name`, `path`, `alt`) VALUES (3, 'img3', 'path-to-img3', 'alt3');
INSERT INTO `Storedb`.`Product` (`id`, `name`, 'main_category', 'main_image', `count`, `price`, `discountprice`, `promoprice`, `description`, 'is_active') VALUES (1, 'product1', 1, 1 10, 1, 56, 56, 'desc', 1);











