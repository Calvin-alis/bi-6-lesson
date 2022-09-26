/*
	Lesson 26.09.22:  DDL
     DDL(Data Definition Language) - Create, Alter, Drop, Rename 
    1. Create DB/ SHOW/ Exists
    2.  Types of engines
    3. Rename/Transfer
    4. Constraints
    5. Alter table
    6. Modify/Change
*/


# CREATE DATABASE  test_create_db;

CREATE DATABASE IF NOT EXISTS test_create_db; # Щоб не було помилок

SHOW DATABASES; # Список БД


 #DROP DATABASE test_create_db;
 
 # DROP DATABASE IF  EXISTS test_create_db;
/*
START TRANSACTION;

DROP DATABASE IF  EXISTS	test_create_db;

DROP DATABASE test_create_db;

SHOW DATABASES;

ROLLBACK;
*/


SHOW DATABASES;

USE test_create_db;

SHOW ENGINES;

/*
		MyISAM - 
        ISAM (англ. Indexed Sequential Access Method — индексно-последовательный метод доступа) — способ хранения данных для быстрого доступа к ним. 
        Способ был разработан компанией IBM для мейнфреймов в 1963 году, в настоящее время это основной способ представления данных почти во всех базах данных.
		В ISAM отдельно хранятся записи с данными и индексы (служебные данные), служащие для быстрого доступа к записям. 
        Данные хранятся последовательно (изначально ISAM использовался для хранения данных на ленточных накопителях, обеспечивающих только последовательные чтение/запись). 
		Второй набор данных — хеш-таблица — индексы, содержащие указатели, которые позволят извлечь определенные записи без поиска по всей базе данных. 
        Это несколько отличается от индексов в современных поисковых базах данных, так как в них индексы хранятся прямо в записях.
        Ключевая особенность ISAM — индексы малы и поиск по ним быстр. 
		Изменение в записях не требует изменять все записи, требуется только перестроить индекс.
*/
/*
		MEMORY
        MEMORY механизм хранения (прежде известный как HEAP) составляет таблицы специального назначения с содержанием, которое сохранено в памяти. 
        Поскольку данные уязвимы для катастрофических отказов, аппаратные проблемы, или отключения электричества питания, 
        только используют эти таблицы в качестве временных рабочих областей или кэшей только для чтения для данных, которые вытягивают от других таблиц.
*/
/*
		CSV
        Work with csv files
*/
/*
		Add requests:
        More about engine - https://habr.com/ru/post/64851/
        ACID - https://habr.com/ru/post/555920/
        Псевдокод - https://techrocks.ru/2020/03/27/how-to-write-pseudocode/
*/
/*
		InnoDB - ACID model
*/

# DROP TABLE IF  EXISTS tasks;

# camelStyle
# python_style
CREATE TABLE IF NOT EXISTS tasks (
	task_id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
	start_date DATE,
	due_date DATE,
	status TINYINT NOT NULL,
	priority  TINYINT  UNSIGNED NOT NULL,
	description TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE = INNODB;

DESCRIBE tasks;

DESC tasks;

SELECT * FROM tasks;


# SHOW FULL PROCESSLIST; 

CREATE TABLE 
IF NOT EXISTS emplo_test LIKE employees.employees;

DESCRIBE tasks;

DESCRIBE emplo_test;

SELECT * FROM emplo_test;


DROP TABLE IF EXISTS checklists;


CREATE TABLE IF NOT EXISTS checklists (
					todo_id 		  INT 							 AUTO_INCREMENT,
					task_id 		  INT ,
					todo 			  VARCHAR(255) 			NOT NULL,
					is_completed BOOLEAN 					NOT NULL 					DEFAULT FALSE,
                    #,FOREIGN KEY (task_id) REFERENCES tasks (task_id) ON UPDATE RESTRICT ON DELETE CASCADE )
					PRIMARY KEY (todo_id , task_id)
                    );
                    

DESCRIBE checklists;

DROP TABLE IF EXISTS checklists;

# Slide 7
CREATE TABLE IF NOT EXISTS checklists (
					todo_id 			INT 			AUTO_INCREMENT,
					task_id 			INT,
					todo			 VARCHAR(255)			 NOT NULL,
					is_completed BOOLEAN NOT NULL DEFAULT FALSE,
					PRIMARY KEY (todo_id , task_id), 
                    FOREIGN KEY (task_id) REFERENCES tasks (task_id)
					ON UPDATE RESTRICT ON DELETE CASCADE 
                    );
                    
DESC checklists;

CREATE TABLE IF NOT EXISTS checklists2 (
    todo_id INT AUTO_INCREMENT,
    task_id INT,
    todo VARCHAR(255) NOT NULL,
    is_completed BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (todo_id , task_id)
    
    ,CONSTRAINT constr_task FOREIGN KEY (task_id)
        REFERENCES tasks (task_id)
        ON UPDATE RESTRICT ON DELETE CASCADE );
        
ALTER TABLE checklists2 
DROP FOREIGN KEY constr_task;

DESC checklists2;

SELECT *
FROM information_schema.INNODB_FOREIGN_COLS;

/*
INSERT INTO checklists(task_id, todo)
VALUES(109, 'task 1');

INSERT INTO checklists(task_id, todo)
VALUES(109, 'task 1');

select * from checklists;

INSERT INTO checklists(task_id, todo, is_completed)
VALUES(987, 'wsx', -127); 
*/
 
SELECT * 
FROM checklists;

DROP TABLE IF EXISTS checklists;

 
SHOW TABLES;

RENAME TABLE checklists TO checklists_old;

SHOW TABLES;

RENAME TABLE employees.departments_dup TO test_create_db.departments_dup; # Transfer in schemas

SHOW TABLES;


CREATE TABLE posts (
			id 				INT 										AUTO_INCREMENT 				PRIMARY KEY,
			title 				VARCHAR(255) 					NOT NULL,
			excerpt 		VARCHAR(400),
			content 		TEXT,
			created_at	DATETIME,
			updated_at 	DATETIME
);

SELECT * FROM posts;


ALTER TABLE posts
DROP COLUMN excerpt;

SELECT * FROM posts;

DESC posts;

SHOW TABLES;

SELECT * FROM tasks;


ALTER TABLE tasks
ADD COLUMN  hardware VARCHAR(255) AFTER status; 

select * from tasks;

ALTER TABLE tasks
ADD COLUMN  hardware_group INT NOT NULL; 

ALTER TABLE tasks
ADD COLUMN  id_last INT NOT NULL ; 


ALTER TABLE tasks
ADD COLUMN id INT NOT NULL FIRST;


SELECT * FROM tasks;

# TRUNCATE tasks;
TRUNCATE checklists2;


SELECT * FROM  tasks;

SELECT  COUNT(emp_no) FROM  employees.emplo_dup2;

/*
START TRANSACTION;
TRUNCATE TABLE emplo_dup2;

ROLLBACK;
*/
DESC tasks;

INSERT INTO tasks(id, status,  priority, title ,start_date, due_date, hardware_group)
VALUES  (1, 0, 0, 'Learn NOT NULL constraint', '2017-02-01','2017-02-02', 10),
				(2,  1, 1, 'Check and update NOT NULL constraint to your database', '2017-02-01',NULL, 11);

DESC tasks;

INSERT INTO tasks(id ,task_id, title, status, priority, hardware_group, id_last)
VALUES  (1, 0,  'Learn NOT NULL constraint', 1, 10, 5, 8),
				(2,  2,  'Check and update NOT NULL constraint to your database', 2, 11, 7,1);
                
SELECT * FROM tasks;

UPDATE tasks
SET
	due_date =  NOW()  + 7
WHERE
	due_date IS NULL;

INSERT INTO tasks(id ,task_id, title, status, priority, hardware_group, id_last, start_date)
VALUES  (4, 5,  'Learn NOT NULL constraint', 1, 10, 5, 8, '1998-05-05'),
				(3,  4,  'Check and update NOT NULL constraint to your database', 2, 11, 7,1, '2001-08-01');

SELECT * FROM  tasks;

UPDATE tasks
SET
	due_date =  start_date  + 7
WHERE
	due_date IS NULL;

SELECT * FROM  tasks;

ALTER TABLE tasks
CHANGE COLUMN
	due_date
	end_date DATE NOT NULL;

ALTER TABLE tasks
MODIFY COLUMN
	end_date 
    DATE  NOT NULL;
    
    
DESCRIBE tasks;


CREATE TABLE users (
	user_id 					INT 								AUTO_INCREMENT 							PRIMARY KEY,
	username 				VARCHAR(40),
	password 				VARCHAR(255),
	email 						VARCHAR(255) 
    );
    
    
CREATE TABLE roles(
	role_id INT AUTO_INCREMENT,
	role_name VARCHAR(50),
	PRIMARY KEY(role_id)
);

CREATE TABLE user_roles(
	user_id INT,
	role_id INT,
	PRIMARY KEY(user_id,role_id),
	FOREIGN KEY(user_id) REFERENCES users(user_id),
	FOREIGN KEY(role_id) REFERENCES roles(role_id)
);

CREATE TABLE pk_demos(
	id INT,
	title VARCHAR(255) NOT NULL
);

ALTER TABLE pk_demos
ADD PRIMARY KEY(id);


CREATE DATABASE fk_demo;
USE fk_demo;

# Restrict  
CREATE TABLE categories (
    categoryId INT AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(100) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE products (
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(100) NOT NULL,
    categoryId INT,
    CONSTRAINT fk_category FOREIGN KEY (categoryId) REFERENCES categories (categoryId) # RESRTICT
)  ENGINE=INNODB;

DESC categories;

DESC products;

INSERT INTO categories(categoryName)
VALUES('Smartphone'), ('Smartwatch');

SELECT * FROM categories;

INSERT INTO products(productName, categoryId) VALUES('iPhone',1);

SELECT * FROM products;

INSERT INTO products(productName, categoryId) VALUES('iPad',3);

# Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`fk_demo`.`products`, CONSTRAINT `fk_category` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`categoryId`))

INSERT INTO products(productName, categoryId) VALUES('iPad',2);

SELECT * FROM products;

UPDATE categories
SET categoryId = 100
WHERE categoryId = 1;


DROP TABLE products;

CREATE TABLE products (
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(100) NOT NULL,
    categoryId INT NOT NULL,
    CONSTRAINT fk_category FOREIGN KEY (categoryId)
        REFERENCES categories (categoryId)
        ON UPDATE CASCADE ON DELETE CASCADE
)  ENGINE=INNODB;

INSERT INTO products(productName, categoryId)
VALUES
	('iPhone', 1),
	('Galaxy Note',1),
	('Apple Watch',2),
	('Samsung Galaxy Watch',2);



UPDATE categories
SET categoryId = 100
WHERE categoryId = 1;

SELECT * FROM categories;
SELECT * FROM products;


DELETE FROM categories
WHERE categoryId = 2;

SELECT * FROM categories;

SELECT * FROM products;


# Slide 25
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS products;

CREATE TABLE categories (
    categoryId INT AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(100) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE products (
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(100) NOT NULL,
    categoryId INT,
    CONSTRAINT fk_category FOREIGN KEY (categoryId)
        REFERENCES categories (categoryId)
        ON UPDATE SET NULL ON DELETE SET NULL
)  ENGINE=INNODB;


# Slide 26
INSERT INTO categories(categoryName)
VALUES
('Smartphone'),
('Smartwatch');

INSERT INTO products(productName, categoryId)
VALUES
('iPhone', 1),
('Galaxy Note',1),
('Apple Watch',2),
('Samsung Galary Watch',2);

UPDATE categories 
SET 
    categoryId = 100
WHERE
    categoryId = 1;

SELECT * FROM products;
    
SELECT * FROM categories;

DELETE FROM categories
WHERE categoryId = 2;

SELECT * FROM products;

SET foreign_key_checks = 0;

SET foreign_key_checks = 1;



CREATE TABLE parts (
    part_no VARCHAR(18) PRIMARY KEY,
    description VARCHAR(40),
    cost DECIMAL(10 , 2 ) NOT NULL CHECK (cost >= 0),
    price DECIMAL(10 , 2 ) NOT NULL CHECK (price >= 0)
);


INSERT INTO parts(part_no, description,cost,price)
VALUES('A-001','Cooler',0, 100);

DROP TABLE parts;

CREATE TABLE parts (
    part_no VARCHAR(18) PRIMARY KEY,
    description VARCHAR(40),
    cost DECIMAL(10 , 2 ) NOT NULL CHECK (cost >= 0),
    price DECIMAL(10 , 2 ) NOT NULL CHECK (price >= 0),
    CONSTRAINT parts_chk_price_gt_cost CHECK (price >= cost)
);

INSERT INTO parts(part_no, description,cost,price)
VALUES('A-001','Cooler',200,100);


