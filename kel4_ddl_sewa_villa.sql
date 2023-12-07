-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema kel4_sewa_villa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema kel4_sewa_villa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `kel4_sewa_villa` DEFAULT CHARACTER SET utf8 ;
USE `kel4_sewa_villa` ;

-- -----------------------------------------------------
-- Table `kel4_sewa_villa`.`Pemilik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kel4_sewa_villa`.`Pemilik` (
  `id_Pemilik` CHAR(5) NOT NULL,
  `Nama_Pemilik` VARCHAR(30) NULL,
  `Alamat` VARCHAR(50) NULL,
  `No_Hp` VARCHAR(15) NULL,
  PRIMARY KEY (`id_Pemilik`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kel4_sewa_villa`.`Villa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kel4_sewa_villa`.`Villa` (
  `Kode_Villa` CHAR(3) NOT NULL,
  `Nama_Villa` VARCHAR(20) NULL,
  `Alamat` VARCHAR(50) NULL,
  `Luas_Villa` INT NULL,
  `Harga_Weekdays` INT NULL,
  `Harga_Weekend` INT NULL,
  `Keterangan` VARCHAR(100) NULL,
  `Pemilik_id_Pemilik` CHAR(5) NOT NULL,
  PRIMARY KEY (`Kode_Villa`),
  INDEX `fk_Villa_Pemilik1_idx` (`Pemilik_id_Pemilik` ASC),
  CONSTRAINT `fk_Villa_Pemilik1`
    FOREIGN KEY (`Pemilik_id_Pemilik`)
    REFERENCES `kel4_sewa_villa`.`Pemilik` (`id_Pemilik`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kel4_sewa_villa`.`Penyewa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kel4_sewa_villa`.`Penyewa` (
  `id_Penyewa` CHAR(5) NOT NULL,
  `Nama_Penyewa` VARCHAR(30) NULL,
  `Alamat` VARCHAR(50) NULL,
  `No_Hp` VARCHAR(15) NULL,
  PRIMARY KEY (`id_Penyewa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kel4_sewa_villa`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kel4_sewa_villa`.`Admin` (
  `id_Admin` CHAR(5) NOT NULL,
  `Nama_Admin` VARCHAR(30) NULL,
  `Alamat` VARCHAR(50) NULL,
  `No_Hp` VARCHAR(15) NULL,
  PRIMARY KEY (`id_Admin`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kel4_sewa_villa`.`Transaksi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kel4_sewa_villa`.`Transaksi` (
  `id_Transaksi` INT NOT NULL AUTO_INCREMENT,
  `Tgl_CheckIn` DATE NULL,
  `Tgl_CheckOut` DATE NULL,
  `Villa_Kode_Villa` CHAR(3) NOT NULL,
  `Penyewa_id_Penyewa` CHAR(5) NOT NULL,
  `Admin_id_Admin` CHAR(5) NOT NULL,
  PRIMARY KEY (`id_Transaksi`),
  INDEX `fk_Transaksi_Villa1_idx` (`Villa_Kode_Villa` ASC),
  INDEX `fk_Transaksi_Penyewa1_idx` (`Penyewa_id_Penyewa` ASC),
  INDEX `fk_Transaksi_Admin1_idx` (`Admin_id_Admin` ASC),
  CONSTRAINT `fk_Transaksi_Villa1`
    FOREIGN KEY (`Villa_Kode_Villa`)
    REFERENCES `kel4_sewa_villa`.`Villa` (`Kode_Villa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transaksi_Penyewa1`
    FOREIGN KEY (`Penyewa_id_Penyewa`)
    REFERENCES `kel4_sewa_villa`.`Penyewa` (`id_Penyewa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transaksi_Admin1`
    FOREIGN KEY (`Admin_id_Admin`)
    REFERENCES `kel4_sewa_villa`.`Admin` (`id_Admin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
