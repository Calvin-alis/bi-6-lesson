/*
	Lesson 1 - BI6 - 07.09.22
	Start with Sql. Basic - Sql
	1. Типи комментарів
	2. Ключево слово Use, SELECT
	3. Оператор *, та вибір колон з таблиці
	4. Where - блок, AND/OR  
	5. In/Not In - оператори
	6. LIKE/BETWEEN - оператори LIKE(statement _ or %)
	7. Is null/is not null
*/


SELECT "SLOVO";

# Текст 
-- Текст 

/*
	 Текст 
     текст 
     текст 
*/


SELECT 4 * 2;

USE employees;


SHOW TABLES;

SELECT * FROM employees;

SELECT first_name, last_name 
FROM employees;


SELECT *
FROM salaries;


SELECT 
    *
FROM
    employees.employees;


SELECT 
    *
FROM
    employees.employees
WHERE emp_no = 10001
 OR emp_no = 10002
 OR emp_no = 10003;
 



/*
	Slide 7
    Task 1: Retrieve a list with all female employees whose first name is Kellie.
	Task 2: Select a list of male employees
    whose first name is ‘Mark’ and all employees whose last name is ‘Luit’
*/
SELECT * FROM 
employees;

SELECT first_name 
FROM employees;

SELECT * FROM 
employees
WHERE gender = 'F';


SELECT 
*
FROM employees
WHERE gender = 'F' AND first_name = 'Kellie';

# Task 1(Var1)
SELECT 
*
FROM 
employees.employees 
WHERE first_name = 'Kellie' AND gender = 'F';


# Task 2
SELECT
*
FROM 
employees.employees 
WHERE (first_name = 'Mark' OR last_name = 'Luit') AND gender = 'M' ;


SELECT
*
FROM 
employees.employees 
WHERE first_name = 'Mark' AND gender = 'M'  OR last_name = 'Luit';

/*
	Slide 9
    Retrieve a list with all employees whose first name is either Kellie or Aruna
*/
SELECT *
FROM employees 
WHERE first_name = 'Kelie' OR first_name = 'Aruna';



/*
	Slide 11
    Retrieve a list with all female employees whose first name is
	either Kellie or Aruna.
*/
SELECT 
*
FROM 
employees 
WHERE (first_name = 'Kellie' OR first_name = 'Aruna') AND gender = 'F';



SELECT 
*
FROM 
employees 
WHERE first_name NOT  IN ('Kellie' ,'Aruna') AND gender = 'F';




/*
	Slide 13
	Task 1: Use the IN operator to select all individuals from the “employees” table, whose first name is either “Denis”, or “Elvis”.
	Task 2: Extract all records from the ‘employees’ table, aside from 
    those with employees named John, Mark, or Jacob.
*/
# Task 1
SELECT
*
FROM 
employees
WHERE first_name IN ('Denis', 'Elvis');

SELECT
*
FROM 
employees
WHERE first_name =  'Denis' OR first_name =  'Elvis';


# Task 2
SELECT *
FROM employees.employees
WHERE first_name NOT IN ('John', 'Marc', 'Jacob');



SELECT *
FROM employees.employees
WHERE first_name LIKE 'Mar_%' ;


SELECT *
FROM employees.employees
WHERE first_name LIKE '%ar%' ;


SELECT *
FROM employees.employees
WHERE first_name NOT LIKE '%a' ;


/*
	Slide 15
	Task 1: Working with the “employees” table, use the LIKE operator to select the data
	about all individuals, whose first name starts with “Mark”; specify that the name can be succeeded by any sequence of characters.

	Task 2: Retrieve a list with all employees who have been hired in the year 2000.

	Task 3: Retrieve a list with all employees whose employee number is written with 5
	characters, and starts with “1000”.
*/
# Task 1
SELECT * FROM employees 
WHERE first_name LIKE 'Mark%';

# Task 2
SELECT  * FROM employees
WHERE hire_date LIKE '2_00%';

# Task 3
SELECT * FROM employees
WHERE emp_no LIKE '1000_';


/*
	Slide 17
	Task 1: Extract all individuals from the ‘employees’ table whose first name contains “Jack”.
	Task 2: Once you have done that, extract another list containing the names of employees that do not contain “Jack”.
*/
# Task 1
SELECT 
*
FROM employees
WHERE first_name LIKE '%Jack%';

# Task 2
SELECT 
*
FROM employees
WHERE first_name NOT LIKE '%Jack%';



SELECT 
* 
FROM employees
WHERE emp_no  BETWEEN 10001 AND 10050;


SELECT 
* 
FROM employees
WHERE emp_no NOT BETWEEN 10001 AND 10050;


/*
	Slide 19
    Task 1: Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.
	Task 2: Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.
	Task 3: Select the names of all departments with numbers between ‘d003’ and ‘d006’.
*/
SHOW TABLES;

SELECT 
* 
FROM salaries;

# Task 1
SELECT 
* 
FROM salaries
WHERE salary BETWEEN 66000 AND 70000;

# Task 2
SELECT 
* 
FROM employees
WHERE emp_no NOT BETWEEN 10004 AND 10012;

# Task 3
SELECT
* 
FROM departments
WHERE dept_no BETWEEN 'd003' AND 'd006';


SELECT * 
FROM employees
WHERE emp_no IS NULL;


SELECT * 
FROM employees
WHERE emp_no IS NOT NULL;



/*
	Slide 21
    Task 1: Select the names of all departments whose department number value is not null and 
    names have ‘a’ character on any position or ‘e’ on the second place.
*/
SELECT
* 
FROM 
departments
WHERE 
dept_name LIKE '%a%' 
OR  
dept_name LIKE '_e%'
AND dept_no IS NOT NULL
ORDER BY dept_no DESC;




SELECT * 
FROM employees
WHERE hire_date >= '1986-01-01';


SELECT * 
FROM employees
WHERE hire_date < '1986-01-01';

SELECT * 
FROM salaries
WHERE emp_no = 10001;


/*
	Slide 23
    Task 1: Retrieve a list with data about all female employees who were hired in the year 2000 or after.
	Task 2: Extract a list with all employees’ salaries higher than $150,000 per annum.
*/
# Task 1
SELECT 
* 
FROM 
employees
WHERE gender = 'F' and hire_date LIKE '2%';

# Task 2
SELECT 
*
FROM 
salaries
WHERE salary > 150000;








