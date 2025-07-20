-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema vendra
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vendra
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vendra` DEFAULT CHARACTER SET utf8 ;
USE `vendra` ;

-- -----------------------------------------------------
-- Table `vendra`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendra`.`categories` (
  `id_categories` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL,
  PRIMARY KEY (`id_categories`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendra`.`suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendra`.`suppliers` (
  `id_suppliers` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(450) NULL,
  `contact_person` VARCHAR(450) NULL,
  `phone` VARCHAR(30) NULL,
  `email` VARCHAR(100) NULL,
  `address` TEXT NULL,
  `tax_id` VARCHAR(50) NULL,
  PRIMARY KEY (`id_suppliers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendra`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendra`.`products` (
  `id_products` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(450) NULL,
  `description` TEXT NULL,
  `id_categories` INT NOT NULL,
  `id_suppliers` INT NOT NULL,
  `purchase_price` DECIMAL(10,2) NULL,
  `sale_price` DECIMAL(10,2) NULL,
  `stock_quantity` INT NULL,
  `barcode` VARCHAR(50) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id_products`),
  INDEX `fk_products_categories_idx` (`id_categories` ASC) VISIBLE,
  INDEX `fk_products_suppliers1_idx` (`id_suppliers` ASC) VISIBLE,
  CONSTRAINT `fk_products_categories`
    FOREIGN KEY (`id_categories`)
    REFERENCES `vendra`.`categories` (`id_categories`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_suppliers1`
    FOREIGN KEY (`id_suppliers`)
    REFERENCES `vendra`.`suppliers` (`id_suppliers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendra`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendra`.`customers` (
  `id_customers` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `phone` VARCHAR(30) NULL,
  `email` VARCHAR(100) NULL,
  `address` TEXT NULL,
  `document_number` VARCHAR(50) NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id_customers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendra`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendra`.`users` (
  `id_users` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NULL,
  `password_hash` VARCHAR(255) NULL,
  `name` VARCHAR(100) NULL,
  `role` ENUM('admin', 'cashier', 'stock') NULL,
  `is_active` TINYINT NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id_users`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendra`.`payment_methods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendra`.`payment_methods` (
  `id_payment_methods` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL,
  PRIMARY KEY (`id_payment_methods`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendra`.`sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendra`.`sales` (
  `id_sales` INT NOT NULL AUTO_INCREMENT,
  `id_customers` INT NOT NULL,
  `id_users` INT NOT NULL,
  `total_amount` DECIMAL(10,2) NULL,
  `id_payment_methods` INT NOT NULL,
  `sale_date` DATETIME NULL,
  PRIMARY KEY (`id_sales`),
  INDEX `fk_sales_customers1_idx` (`id_customers` ASC) VISIBLE,
  INDEX `fk_sales_users1_idx` (`id_users` ASC) VISIBLE,
  INDEX `fk_sales_payment_methods1_idx` (`id_payment_methods` ASC) VISIBLE,
  CONSTRAINT `fk_sales_customers1`
    FOREIGN KEY (`id_customers`)
    REFERENCES `vendra`.`customers` (`id_customers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_users1`
    FOREIGN KEY (`id_users`)
    REFERENCES `vendra`.`users` (`id_users`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_payment_methods1`
    FOREIGN KEY (`id_payment_methods`)
    REFERENCES `vendra`.`payment_methods` (`id_payment_methods`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendra`.`sale_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendra`.`sale_items` (
  `id_sale_items` INT NOT NULL AUTO_INCREMENT,
  `id_sales` INT NOT NULL,
  `products_id_products` INT NOT NULL,
  `quantity` VARCHAR(45) NULL,
  `unit_price` VARCHAR(45) NULL,
  `subtotal` VARCHAR(45) NULL,
  PRIMARY KEY (`id_sale_items`),
  INDEX `fk_sale_items_sales1_idx` (`id_sales` ASC) VISIBLE,
  INDEX `fk_sale_items_products1_idx` (`products_id_products` ASC) VISIBLE,
  CONSTRAINT `fk_sale_items_sales1`
    FOREIGN KEY (`id_sales`)
    REFERENCES `vendra`.`sales` (`id_sales`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sale_items_products1`
    FOREIGN KEY (`products_id_products`)
    REFERENCES `vendra`.`products` (`id_products`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendra`.`purchases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendra`.`purchases` (
  `id_purchases` INT NOT NULL AUTO_INCREMENT,
  `id_suppliers` INT NOT NULL,
  `id_users` INT NOT NULL,
  `total_amount` DECIMAL(10,2) NULL,
  `purchase_date` DATETIME NULL,
  PRIMARY KEY (`id_purchases`),
  INDEX `fk_purchases_suppliers1_idx` (`id_suppliers` ASC) VISIBLE,
  INDEX `fk_purchases_users1_idx` (`id_users` ASC) VISIBLE,
  CONSTRAINT `fk_purchases_suppliers1`
    FOREIGN KEY (`id_suppliers`)
    REFERENCES `vendra`.`suppliers` (`id_suppliers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchases_users1`
    FOREIGN KEY (`id_users`)
    REFERENCES `vendra`.`users` (`id_users`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendra`.`purchase_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendra`.`purchase_items` (
  `id_purchase_items` INT NOT NULL AUTO_INCREMENT,
  `id_purchases` INT NOT NULL,
  `id_products` INT NOT NULL,
  `quantity` INT NULL,
  `unit_cost` DECIMAL(10,2) NULL,
  `subtotal` DECIMAL(10,2) NULL,
  PRIMARY KEY (`id_purchase_items`),
  INDEX `fk_purchase_items_purchases1_idx` (`id_purchases` ASC) VISIBLE,
  INDEX `fk_purchase_items_products1_idx` (`id_products` ASC) VISIBLE,
  CONSTRAINT `fk_purchase_items_purchases1`
    FOREIGN KEY (`id_purchases`)
    REFERENCES `vendra`.`purchases` (`id_purchases`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_items_products1`
    FOREIGN KEY (`id_products`)
    REFERENCES `vendra`.`products` (`id_products`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendra`.`audit_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendra`.`audit_log` (
  `id_audit_log` INT NOT NULL AUTO_INCREMENT,
  `id_users` INT NOT NULL,
  `table_name` VARCHAR(100) NULL,
  `timestamp` DATETIME NULL,
  PRIMARY KEY (`id_audit_log`),
  INDEX `fk_audit_log_users1_idx` (`id_users` ASC) VISIBLE,
  CONSTRAINT `fk_audit_log_users1`
    FOREIGN KEY (`id_users`)
    REFERENCES `vendra`.`users` (`id_users`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendra`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendra`.`invoices` (
  `id_invoices` INT NOT NULL AUTO_INCREMENT,
  `id_sales` INT NOT NULL,
  `invoice_number` VARCHAR(50) NULL,
  `issued_date` DATETIME NULL,
  `total` DECIMAL(10,2) NULL,
  `pdf_path` VARCHAR(255) NULL,
  PRIMARY KEY (`id_invoices`, `id_sales`),
  INDEX `fk_invoices_sales1_idx` (`id_sales` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_sales1`
    FOREIGN KEY (`id_sales`)
    REFERENCES `vendra`.`sales` (`id_sales`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendra`.`settings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendra`.`settings` (
  `id_settings` INT NOT NULL AUTO_INCREMENT,
  `setting_key` VARCHAR(100) NULL,
  `setting_value` TEXT NULL,
  PRIMARY KEY (`id_settings`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
