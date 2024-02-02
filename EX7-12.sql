-- EX.7-9
DROP DATABASE IF EXISTS friends_of_people;
CREATE DATABASE friends_of_people;

DROP TABLE IF EXISTS animals;
CREATE TABLE animals (
	id serial PRIMARY KEY,
    group_id BIGINT UNSIGNED NOT NULL
);

INSERT INTO `animals`(group_id, id)
SELECT `id` as group_id, `animal_id` as id FROM `pets`;
INSERT INTO `animals`(group_id, id)
SELECT `id` as group_id, `animal_id` as id FROM `packAnimals`;

DROP TABLE IF EXISTS pets;
CREATE TABLE pets (
	id serial PRIMARY KEY,
    category_id BIGINT UNSIGNED NOT null,
    animal_id BIGINT UNSIGNED NOT null,
    `type` ENUM('dog', 'cat', 'humster'),
    INDEX pets_category_id (category_id),
    FOREIGN KEY (animal_id) REFERENCES animals(id) ON UPDATE CASCADE ON DELETE restrict
);

INSERT INTO `pets`(category_id, animal_id, `type`) VALUES 
(1,19, 'dog'),(2,20, 'dog'),(3,21, 'dog'),
(4,22, 'dog'),(5,23, 'dog'),(6,24, 'dog'),
(1,25, 'cat'),(2,26, 'cat'),(3,27, 'cat'),
(4,28, 'cat'),(5,29, 'cat'),(6,30, 'cat'),
(1,31, 'humster'),(2,32, 'humster'),(3,33, 'humster'),
(4,34, 'humster'),(5,35, 'humster'),(6,36, 'humster');

DROP TABLE IF EXISTS packAnimals;
CREATE TABLE packAnimals (
	id serial PRIMARY KEY,
    category_id BIGINT UNSIGNED NOT null,
    animal_id BIGINT UNSIGNED NOT null,
    `type` ENUM('horse', 'camel', 'donkey'),
    INDEX packAnimal_category_id (category_id),
    FOREIGN KEY (animal_id) REFERENCES animals(id) ON UPDATE CASCADE ON DELETE restrict
);
INSERT INTO `packAnimals`(category_id, animal_id, `type`) VALUES 
(1,1, 'horse'),(2,2, 'horse'),(3,3, 'horse'),
(4,4, 'horse'),(5,5, 'horse'),(6,6, 'horse'),
(1,7, 'camel'),(2,8, 'camel'),(3,9, 'camel'),
(4,10, 'camel'),(5,11, 'camel'),(6,12, 'camel'),
(1,13, 'donkey'),(2,14, 'donkey'),(3,15, 'donkey'),
(4,16, 'donkey'),(5,17, 'donkey'),(6,18, 'donkey');

DROP TABLE IF EXISTS cat;
CREATE TABLE cat (
	id serial PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age DATE,
    `commands` ENUM('run', 'jump', 'sit', 'sleep'),
    INDEX cats_name (name),
	FOREIGN KEY (id) REFERENCES pets(category_id)
);

INSERT INTO `cat`(name, age,`commands`) VALUES 
('kira','2023-11-11', 'run'),('dory','2012-12-03', 'run'),('oin','2012-08-17', 'run'),
('mira','2022-11-21', 'jump'),('nory','2015-01-04', 'jump'),('gloin','2017-11-23', 'sleep');

DROP TABLE IF EXISTS dog;
CREATE TABLE dog (
	id serial PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age DATE,
    `commands` ENUM('run', 'jump', 'sit', 'sleep'),
    INDEX dogs_name (name),
    FOREIGN KEY (id) REFERENCES pets(category_id)
);

INSERT INTO `dog`(name, age,`commands`) VALUES 
('kira','2023-11-11', 'run'),('dory','2012-12-03', 'run'),('oin','2012-08-17', 'run'),
('mira','2022-11-21', 'jump'),('nory','2015-01-04', 'jump'),('gloin','2017-11-23', 'sleep');

DROP TABLE IF EXISTS humster;
CREATE TABLE humster (
	id serial PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age DATE,
    `commands` ENUM('run', 'jump', 'sleep', 'die'),
    INDEX humsters_name (name),
    FOREIGN KEY (id) REFERENCES pets(category_id)
);

INSERT INTO `humster`(name, age,`commands`) VALUES 
('kira','2023-11-11', 'run'),('dory','2012-12-03', 'run'),('oin','2012-08-17', 'run'),
('mira','2022-11-21', 'jump'),('nory','2015-01-04', 'jump'),('gloin','2017-11-23', 'sleep');

DROP TABLE IF EXISTS horse;
CREATE TABLE horse (
	id serial PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age DATE,
    `commands` ENUM('run', 'jump', 'sleep', 'eat'),
    INDEX horses_name (name),
    FOREIGN KEY (id) REFERENCES packAnimals(category_id)
);

INSERT INTO `horse`(name, age,`commands`) VALUES 
('kira','2023-11-11', 'run'),('dory','2012-12-03', 'run'),('oin','2012-08-17', 'run'),
('mira','2022-11-21', 'jump'),('nory','2015-01-04', 'jump'),('gloin','2017-11-23', 'sleep');

DROP TABLE IF EXISTS donkey;
CREATE TABLE donkey (
	id serial PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age DATE,
    `commands` ENUM('run', 'jump', 'sleep', 'eat'),
    INDEX donkeys_name (name),
    FOREIGN KEY (id) REFERENCES packAnimals(category_id)
);

INSERT INTO `donkey`(name, age,`commands`) VALUES 
('kira','2023-11-11', 'run'),('dory','2012-12-03', 'run'),('oin','2012-08-17', 'run'),
('mira','2022-11-21', 'jump'),('nory','2015-01-04', 'jump'),('gloin','2017-11-23', 'sleep');

DROP TABLE IF EXISTS camel;
CREATE TABLE camel (
	id serial PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age DATE,
    `commands` ENUM('run', 'jump', 'sleep', 'eat'),
    INDEX camles_name (name),
    FOREIGN KEY (id) REFERENCES packAnimals(category_id)
);

INSERT INTO `camel`(name, age,`commands`) VALUES 
('kira','2023-11-11', 'run'),('dory','2012-12-03', 'run'),('oin','2012-08-17', 'run'),
('mira','2022-11-21', 'jump'),('nory','2015-01-04', 'jump'),('gloin','2017-11-23', 'sleep');

-- EX.10
DELETE FROM `packAnimals`
   WHERE type='camel';
--  union
select * from horse
union
select * from donkey;
-- MERGE
MERGE friends_of_people.horse AS Target
USING friends_of_people.donkey AS Source
    ON (Target.id = Source.id)
WHEN NOT MATCHED BY SOURCE
    THEN 
        DELETE
OUTPUT deleted.*, $action, inserted.*;

DROP TABLE IF EXISTS horse_donkey;
CREATE TABLE horse_donkey (
	id serial PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age DATE,
    `commands` ENUM('run', 'jump', 'sleep', 'eat')
);
INSERT INTO `horse_donkey`(name, age, `commands`)
SELECT name, age, `commands` FROM `horse`;
INSERT INTO `horse_donkey`(name, age, `commands`)
SELECT name, age, `commands` FROM `donkey`;

-- EX.11
DROP TABLE IF EXISTS youngAnimals;
create table youngAnimals (
id serial PRIMARY key,
name VARCHAR(50),
birthday DATE
);
INSERT INTO `youngAnimals`(name, birthday)
SELECT name, age as birthday FROM `cat`
where timestampdiff(YEAR, age, now()) between 1 and 3;

INSERT INTO `youngAnimals`(name, birthday)
SELECT name, age as birthday FROM `dog`
where timestampdiff(YEAR, age, now()) between 1 and 3;

INSERT INTO `youngAnimals`(name, birthday)
SELECT name, age as birthday FROM `humster`
where timestampdiff(YEAR, age, now()) between 1 and 3;

INSERT INTO `youngAnimals`(name, birthday)
SELECT name, age as birthday FROM `horse`
where timestampdiff(YEAR, age, now()) between 1 and 3;

INSERT INTO `youngAnimals`(name, birthday)
SELECT name, age as birthday FROM `camel`
where timestampdiff(YEAR, age, now()) between 1 and 3;

INSERT INTO `youngAnimals`(name, birthday)
SELECT name, age as birthday FROM donkey 
where timestampdiff(YEAR, age, now()) between 1 and 3;

DROP TABLE IF EXISTS accuracy_birthday;
create table accuracy_birthday(
id serial PRIMARY key,
name VARCHAR(50),
month_age int
);

INSERT INTO `accuracy_birthday`(name, month_age)
SELECT name,ROUND(TIMESTAMPDIFF(DAY, age, now())*12/365.24) as month_age FROM `cat`;

INSERT INTO `accuracy_birthday`(name, month_age)
SELECT name, ROUND(TIMESTAMPDIFF(DAY, age, now())*12/365.24) as month_age FROM `dog`;

INSERT INTO `accuracy_birthday`(name, month_age)
SELECT name,  ROUND(TIMESTAMPDIFF(DAY, age, now())*12/365.24) as month_age FROM `humster`;

INSERT INTO `accuracy_birthday`(name, month_age)
SELECT name, ROUND(TIMESTAMPDIFF(DAY, age, now())*12/365.24) as month_age FROM `horse`;

INSERT INTO `accuracy_birthday`(name, month_age)
SELECT name, ROUND(TIMESTAMPDIFF(DAY, age, now())*12/365.24) as month_age FROM `camel`;

INSERT INTO `accuracy_birthday`(name, month_age)
SELECT name, ROUND(TIMESTAMPDIFF(DAY, age, now())*12/365.24) as month_age FROM donkey;
-- EX.12
DROP TABLE IF EXISTS all_animals;
create table all_animals(
	id serial PRIMARY KEY,
    category_id BIGINT UNSIGNED NOT null,
    animal_id BIGINT UNSIGNED NOT null,
    `type` ENUM('horse', 'camel', 'donkey', 'dog', 'cat', 'humster')
);

INSERT INTO `all_animals`(category_id, animal_id, `type`)
SELECT category_id, animal_id, `type` as month_age FROM pets;
INSERT INTO `all_animals`(category_id, animal_id, `type`)
SELECT category_id, animal_id, `type` as month_age FROM packAnimals;