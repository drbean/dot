ALTER ROLE "SYSTEM" WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION;
CREATE ROLE drbean;
ALTER ROLE drbean WITH SUPERUSER INHERIT NOCREATEROLE CREATEDB LOGIN NOREPLICATION;
CREATE DATABASE moodlecloud;
-- CREATE TABLE mdl_course ( id INT, name VARCHAR(255 ) ) ;
-- INSERT INTO  mdl_course ( id, name ) VALUES ( 1, 'toeic' ) ;
