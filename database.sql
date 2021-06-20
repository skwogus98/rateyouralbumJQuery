grant all privileges on  *.* to 'root'@'%' identified by 'mysql1234';
delete from mysql.user where host="localhost" and user="root";
flush privileges;
select host,user,plugin,authentication_string from mysql.user;

DROP DATABASE IF EXISTS `musicDB` ;

CREATE DATABASE IF NOT EXISTS `musicDB` 
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;

USE `musicDB` 

-- -----------------------------------------------------
-- Table `mydb`.`artistDB`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `artistDB` (
  `id` INT NOT NULL auto_increment,
  `name` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;

-- -----------------------------------------------------
-- Table `mydb`.`albumDB`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `albumDB` (
  `id` INT NOT NULL auto_increment,
  `title` VARCHAR(255) NULL,
  `artistDB_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`artistDB_id`) REFERENCES `artistDB` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE
	)
ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;


-- -----------------------------------------------------
-- Table `mydb`.`userDB`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `userDB` (
  `id` INT NOT NULL auto_increment,
  `userID` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `nickname` VARCHAR(255),
  PRIMARY KEY (`id`))
ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;
  
 
-- -----------------------------------------------------
-- Table `mydb`.`list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rateListDB` (
  `id` INT NOT NULL auto_increment,
  `rank` INT NULL,
  `albumDB_id` INT NOT NULL,
  `userDB_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`albumDB_id`) REFERENCES `albumDB` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`userDB_id`) REFERENCES `userDB` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE)
ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;


-- -----------------------------------------------------
-- Table `mydb`.`songDB`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `songDB` (
  `id` INT NOT NULL auto_increment,
  `title` VARCHAR(255),
  `trackNo` INT,
  `albumDB_id` INT,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`albumDB_id`) REFERENCES `albumDB` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE)
ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;
  
 
INSERT INTO userDB (id, userID, password, nickname) VALUES
(null, 'test1', 'test1', 'test1');

INSERT INTO artistDB (id, name) VALUES
(null, 'daft punk');

INSERT INTO albumDB (id, title, artistDB_id) VALUES
(null, 'discovery', 1);

INSERT INTO songDB (id, title, trackNo, albumDB_id) VALUES
(null, 'one more time', 1, 1);