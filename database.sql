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
(null, 'skwogus98', 'test', '나재현');

INSERT INTO artistDB (id, name) VALUES
(null, 'daft punk'),
(null, '공중도둑'),
(null, '검정치마'),
(null, 'sweet trip'),
(null, 'justice'),
(null, 'rei harakami'),
(null, 'KASHIWA DAISUKE'),
(null, 'car seat headrest'),
(null, 'Fiona apple'),
(null, 'Madeon'),
(null, 'porter robinson'),
(null, "World's End Girlfriend"),
(null, 'fishmans'),
(null, 'MGMT');

INSERT INTO albumDB (id, title, artistDB_id) VALUES
(null, 'discovery', 1),
(null, '무너지기', 2),
(null, 'thirsty', 3),
(null, '공중도덕', 2),
(null, 'you will never know why', 4),
(null, 'cross', 5),
(null, '[lust]', 6),
(null, 'program music I', 7),
(null, 'twin fantasy', 8),
(null, 'fetch the bolt cutters', 9),
(null, 'adventure', 10),
(null, 'worlds', 11),
(null, 'hurtbreak wonderland', 12),
(null, 'long season', 13),
(null, 'oracular specular', 14),
(null, 'The Idler Wheel Is Wiser Than the Driver of the Screw and Whipping Cords Will Serve You More Than Ropes Will Ever Do', 9);

INSERT INTO songDB (id, title, trackNo, albumDB_id) VALUES
(null, 'one more time', 1, 1),
(null, 'aerodynamic', 2, 1),
(null, 'digital love', 3, 1),
(null, 'harder, better, faster, stronger', 4, 1),
(null, 'crescendolls', 5, 1),
(null, 'nightvision', 6, 1),
(null, 'superheroes', 7, 1),
(null, 'high life', 8, 1),
(null, 'something about us', 9, 1),
(null, 'voyager', 10, 1),
(null, 'veridis quo', 11, 1),
(null, 'short circuit', 12, 1),
(null, 'face to face', 13, 1),
(null, 'too long', 14, 1);


INSERT INTO rateListDB (id, rank, albumDB_id, userDB_id) VALUES
(null, 1, 1, 1),
(null, 2, 2, 1),
(null, 3, 3, 1),
(null, 4, 4, 1),
(null, 5, 5, 1),
(null, 6, 6, 1),
(null, 7, 7, 1),
(null, 8, 8, 1),
(null, 9, 9, 1),
(null, 10, 10, 1),
(null, 11, 11, 1),
(null, 12, 12, 1),
(null, 13, 13, 1),
(null, 14, 14, 1),
(null, 15, 15, 1),
(null, 16, 16, 1);