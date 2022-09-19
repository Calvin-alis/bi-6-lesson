/*
	Lesson 5: 19.09 - Create table
*/
DROP TABLE IF EXISTS t1;  
DROP TABLE IF EXISTS t2;

CREATE TABLE t1 
(id INT);

CREATE TABLE t2 
(id INT);

INSERT INTO t1 VALUES (1),(2),(3);  
INSERT INTO t2 VALUES (2),(3),(4);

SELECT id  
FROM t1  
UNION  ALL 
SELECT id  
FROM t2;


SELECT id , current_date()
FROM t1
UNION
SELECT id, 'Some text'
FROM t2
UNION 
SELECT id, NULL
FROM t1;

