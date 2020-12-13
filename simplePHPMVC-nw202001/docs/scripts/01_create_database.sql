CREATE SCHEMA `dynapolls` ;
-- Mysql < 8
 CREATE USER 'dynauser'@'%' IDENTIFIED BY 'fr4nc1scanus';
-- Mysql >= 8
-- CREATE USER 'Administrador'@'%' IDENTIFIED WITH mysql_native_password BY 'Unicah-2020';
GRANT ALL ON gemfarma.* TO 'Administrador'@'%';
