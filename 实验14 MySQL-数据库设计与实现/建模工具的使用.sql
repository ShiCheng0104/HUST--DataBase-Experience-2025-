 # 请将利用MySQL Workbench软件的Modeling工具，经forward engineering 导出的创建schema的SQL语句完整粘到此处：
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema rbac
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema rbac
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rbac` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `rbac` ;

-- -----------------------------------------------------
-- Table `rbac`.`aprole`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rbac`.`aprole` (
  `RoleNo` INT NOT NULL COMMENT '角色编号',
  `RoleName` CHAR(20) NOT NULL COMMENT '角色名',
  `Comment` VARCHAR(50) NULL DEFAULT NULL COMMENT '角色描述',
  `Status` SMALLINT NULL DEFAULT NULL COMMENT '角色状态',
  PRIMARY KEY (`RoleNo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '角色表';


-- -----------------------------------------------------
-- Table `rbac`.`apuser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rbac`.`apuser` (
  `UserID` CHAR(8) NOT NULL COMMENT '用户工号',
  `UserName` CHAR(8) NULL DEFAULT NULL COMMENT '用户姓名',
  `Comment` VARCHAR(50) NULL DEFAULT NULL COMMENT '用户描述',
  `PassWord` CHAR(32) NULL DEFAULT NULL COMMENT '口令',
  `Status` SMALLINT NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`UserID`),
  UNIQUE INDEX `ind_username` (`UserName` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '用户表';


-- -----------------------------------------------------
-- Table `rbac`.`apgroup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rbac`.`apgroup` (
  `UserID` CHAR(8) NOT NULL COMMENT '用户编号',
  `RoleNo` INT NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`UserID`, `RoleNo`),
  INDEX `FK_apGroup_apRole` (`RoleNo` ASC) VISIBLE,
  CONSTRAINT `FK_apGroup_apRole`
    FOREIGN KEY (`RoleNo`)
    REFERENCES `rbac`.`aprole` (`RoleNo`),
  CONSTRAINT `FK_apGroup_apUser`
    FOREIGN KEY (`UserID`)
    REFERENCES `rbac`.`apuser` (`UserID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '角色分配表';


-- -----------------------------------------------------
-- Table `rbac`.`apmodule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rbac`.`apmodule` (
  `ModNo` BIGINT NOT NULL COMMENT '模块编号',
  `ModID` CHAR(10) NULL DEFAULT NULL COMMENT '系统或模块的代码',
  `ModName` CHAR(20) NULL DEFAULT NULL COMMENT '系统或模块的名称',
  PRIMARY KEY (`ModNo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '功能模块登记表';


-- -----------------------------------------------------
-- Table `rbac`.`apright`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rbac`.`apright` (
  `RoleNo` INT NOT NULL COMMENT '角色编号',
  `ModNo` BIGINT NOT NULL COMMENT '模块编号',
  PRIMARY KEY (`RoleNo`, `ModNo`),
  INDEX `FK_apRight_apModule` (`ModNo` ASC) VISIBLE,
  CONSTRAINT `FK_apRight_apModule`
    FOREIGN KEY (`ModNo`)
    REFERENCES `rbac`.`apmodule` (`ModNo`),
  CONSTRAINT `FK_apRight_apRole`
    FOREIGN KEY (`RoleNo`)
    REFERENCES `rbac`.`aprole` (`RoleNo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '角色权限表';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
···



 
 