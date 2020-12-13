CREATE TABLE `categorias` (
  `ctgcod` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ctgdsc` VARCHAR(70) NOT NULL,
  `ctgest` CHAR(3) NOT NULL DEFAULT 'ACT',
  PRIMARY KEY (`ctgcod`));


INSERT INTO `categorias` (`ctgcod`, `ctgdsc`, `ctgest`) VALUES (NULL, 'Antiácidos', 'ACT'), 
(NULL, 'Antialérgicos', 'ACT'), (NULL, 'Antidiarreicos', 'ACT'), (NULL, 'Antiinfecciosos', 'ACT'),
 (NULL, 'Antiinflamatorios', 'ACT'), (NULL, 'Antipiréticos', 'ACT'), (NULL, 'Antitusivos y mucolíticos', 'ACT'); 