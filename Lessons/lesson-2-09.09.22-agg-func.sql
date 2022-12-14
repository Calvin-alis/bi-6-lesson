/* 
	Lesson - 2 
	Topic: 
		1. Type of date
        2. Order by - Add info about type
        3. Aggregation func
        4. Group by 
        5. Having 
        6. Round, Ceil, Floor
*/

SELECT ROUND(5.1356, 1), CEIL(5.1356), FLOOR(5.9);

SELECT ROUND(3.14159, 2);

SELECT  CEIL(3.14159);

SELECT FLOOR(3.14159);




USE employees;	

SHOW TABLES;


SELECT * FROM salaries;

SHOW  COLUMNS  FROM  employees.employees; # показывает типы данных в таблице по колонкам


SELECT md5('');



/* Aggregation func

	max() - find max in column. Example: 		SELECT MAX(salary) FROM employees.salaries;
	min()  - find min in column. Example: 			SELECT MIN(salary) FROM employees.salaries;
    avg()  - find mean in column. Example:  		SELECT AVG(salary) FROM employees.salaries;
    count() - calculate all in column. Example: 	SELECT COUNT(*) FROM employees.salaries;
    sum() - calculate sum. Example: 				SELECT SUM(salary) FROM employees.salaries;
    
 */
SELECT MIN(salary)
 FROM employees.salaries;
 
 SELECT MAX(salary)
 FROM employees.salaries;
 
 SELECT SUM(salary) 
 FROM employees.salaries;
 
 SELECT AVG(salary) 
 FROM employees.salaries;
 
SELECT *
FROM 
employees
WHERE gender = 'M';
 
 SELECT COUNT(*) AS "☀️"
 FROM 
 employees
 WHERE gender = 'M';
 
 SELECT COUNT(*)
 FROM employees 
 WHERE gender = 'F';
 
 
 SELECT COUNT(*)
 FROM employees 
 WHERE gender = 'M';
 
 SELECT gender, COUNT(gender)
 FROM employees
 GROUP BY gender;
 
 SELECT 
 *
 FROM 
 salaries;
 
 
SELECT 
 emp_no, COUNT(salary), AVG(salary), MAX(salary)
 FROM 
 salaries
 WHERE emp_no 
 GROUP BY emp_no;
 
 SELECT 
 first_name, last_name
 FROM 
employees
GROUP BY first_name, last_name;
 
 SELECT 
 emp_no, AVG(salary)
 FROM 
 salaries
 WHERE emp_no BETWEEN 10001 AND 10010
 GROUP BY emp_no;
 
 SELECT * FROM employees;



SELECT AVG(salary), ROUND(AVG(salary),  1)
FROM salaries;

 # Відобразити Найменьше/Найбільше день на родження (серед M,F)
 SELECT MAX(birth_date), MIN(birth_date)
 FROM employees
 WHERE gender = 'F';
 

 SELECT MAX(birth_date), MIN(birth_date)
 FROM employees 
 WHERE gender = 'M';
 
 
 SELECT 
    gender, MIN(birth_date), MAX(birth_date)
FROM
    employees
GROUP BY gender;
 
SELECT  MIN(emp_no), MAX(emp_no)
FROM employees ;


 SELECT first_name, count(emp_no)
 FROM employees
 WHERE gender = 'M'
 GROUP BY first_name;
 
 
 SELECT * FROM employees;
 
 
SELECT first_name, last_name, COUNT(emp_no)
FROM employees
WHERE first_name = 'Georgi' AND last_name = 'Facello'
GROUP BY first_name, last_name;
 
 SELECT first_name, last_name
 FROM employees
 WHERE first_name = 'Georgi' AND last_name = 'Facello';
 
 
 SELECT first_name, last_name, COUNT(emp_no)
FROM employees
GROUP BY first_name, last_name
HAVING COUNT(emp_no) = 2;
 
 SELECT SUM(salary), COUNT(salary)
 FROM salaries;
 
 SELECT 4 / 2;
 
  SELECT SUM(salary) / COUNT(salary), AVG(salary)
 FROM salaries;
 
 # A - 15, B - 20, C - 30
 
 SELECT emp_no, SUM(salary), COUNT(salary)
 FROM salaries
 GROUP BY emp_no
 HAVING COUNT(salary) > 10;
 
/*
	Slide 8
	Task 1:Select all employees whose average salary is higher than $120,000 per  annum.
*/
SELECT * FROM salaries;

SELECT AVG(salary) FROM salaries;


SELECT 
emp_no, AVG(salary) AS sal
FROM 
salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER  BY sal ASC;


SELECT 
emp_no, AVG(salary) AS sal
FROM 
salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER  BY sal DESC;


/*
	Slide 11
    Task 1: Select the employee numbers of all individuals who have signed  more than 
    1 contract after the 1st of January 2000.
    Hint: To solve this exercise, use the “dept_emp” table
*/
SELECT * FROM dept_emp;


SELECT *
FROM
dept_emp
WHERE from_date LIKE '2__0%';


 
SELECT 
emp_no
FROM dept_emp
WHERE from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1;


# Use concat 
SELECT CONCAT(first_name, " " ,  last_name ) AS 'Full name'
FROM 
employees;

SELECT * FROM salaries ;

/*
	Slide 12
    Task 1: What is the total amount of money spent on salaries for all contracts 
    starting after the 1st of January 1997?
*/
SELECT * FROM salaries;

SELECT * FROM salaries
WHERE from_date > '1997-01-01';


SELECT SUM(salary)
FROM salaries
WHERE from_date > '1997-01-01';

/*
	Slide 13
    Task 1: Which is the lowest employee number in the database?
	Task 2: Which is the highest employee number in the database?
*/
SELECT MIN(emp_no) FROM employees;

SELECT MAX(emp_no) FROM employees;


SELECT MAX(emp_no)
FROM employees.employees AS ee;


SELECT MIN(emp_no)  min_value , MAX(emp_no) AS "☀️"
 FROM employees;
 

/*
	Slide 15
	Task 1: Show average annual salaries that are above 100k USD paid to  employees
    who started after the 1st of January 1997?
*/

SELECT * FROM salaries;

SELECT emp_no 
FROM salaries 
GROUP BY emp_no;

/*
'10066', '100512.8333'
'10068', '110374.2000'
'10136', '104907.3333'
'10151', '106037.2000'
'10173', '104170.3333'
'10232', '102270.8333'
*/
SELECT 
    emp_no, AVG(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01'
GROUP BY emp_no
HAVING AVG(salary) > 100000;



/*
	Slide 17
    Task 1: Round the average amount of money spent on salaries for
    all contracts  that started after the 1st of January 1997 to a precision of cents.
*/
SELECT 
emp_no, ROUND(AVG(salary), 2) AS 'Round'
FROM 
salaries
WHERE to_date > '1997-01-01'
GROUP BY emp_no;


/*
	Вивести всіх співробітників в кого рік народження між 1955 і 1970
    Наступний пункт sorted 
*/


/*
	Вивести всіх співробітників кто отримав зп в  2002
    Наступний пункт sorted 
*/