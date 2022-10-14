# Homework 3 
/* exercise 1
		For the current maximum annual wage in the company SHOW the full name of an employee, department, current position, 
        for how long the current position is held, and total years of service in the company.
		USE common table expression this time 
*/

WITH emp_tab AS (SELECT ee.emp_no, concat(ee.first_name,' ',ee.last_name) as 'Full Name', es.salary as salary, dd.dept_name, et.title, 
timestampdiff(year,et.from_date,curdate()) as 'Time on position' , timestampdiff(year,ee.hire_date,curdate()) as 'Time in company' 
FROM employees as ee 
INNER JOIN salaries as es on (ee.emp_no=es.emp_no)INNER JOIN titles as et on (ee.emp_no=et.emp_no)
INNER JOIN dept_emp as ed on (ee.emp_no=ed.emp_no)INNER JOIN departments as dd on (ed.dept_no=dd.dept_no)WHERE curdate() 
BETWEEN es.from_date AND es.to_date AND curdate() BETWEEN et.from_date AND et.to_date),max_salary as 
(SELECT max(salary) as maximum_salary FROM salaries WHERE curdate() BETWEEN from_date AND to_date)SELECT *FROM emp_tab as t1 
INNER JOIN max_salary as t2 ON t1.salary=t2.maximum_salary;


-- Exercise 2 From MySQL documentation check how ABS() function works.
 -- https://dev.mysql.com/doc/refman/8.0/en/mathematical-functions.html  #function_abs
 
 
 /*
		Exercise 3
		Show all information about the employee, salary year, and the difference between salary and average salary in the company overall.
		For the employee, whose salary was assigned latest from salaries that are closest to mean salary overall (doesn’t matter higher or lower). 
		Here you need to find the average salary overall and then find the smallest difference of someone’s salary with an average salary
 */
 SELECT joined_tab.emp_no, joined_tab.first_name, joined_tab.last_name, YEAR(joined_tab.from_date) AS salary_year, joined_tab.salary, 
				(SELECT round(AVG(salary),0) FROM salaries) average_salary, salary - (SELECT round(avg(salary),0) FROM salaries) AS difference 
 FROM 
	(	SELECT ee.*, es.salary, es.from_date FROM employees as ee 
		INNER JOIN salaries AS es ON (ee.emp_no=es.emp_no)) AS joined_tab 
 WHERE 
		abs(salary -
        (SELECT round(avg(salary),0) from salaries)) = 
        (SELECT min(abs(salary - (
													SELECT round(AVG(salary),0) FROM salaries))) FROM salaries);
 
 
-- Exercise 4
-- Select the details, title, and salary of the employee with the highest salary who is not employed in the company anymore.
SELECT ede.emp_no, ede.dept_no, ede.from_date,ede.to_date, es.salary, es.from_date,es.to_date, et.title,et.from_date, et.to_date
FROM employees.dept_emp AS ede
INNER JOIN employees.salaries AS es ON (ede.emp_no=es.emp_no)
INNER JOIN employees.titles AS et ON (es.emp_no =et.emp_no)
LEFT  JOIN employees.salaries AS es1 ON (es.emp_no = es1.emp_no AND NOW() BETWEEN es1.from_date AND es1.to_date)
WHERE es1.emp_no IS NULl AND es.salary = (SELECT MAX(es.salary) FROM employees.salaries AS es
LEFT  JOIN employees.dept_emp AS edm ON (es.emp_no = edm.emp_no AND NOW() BETWEEN edm.from_date AND edm.to_date)
WHERE edm.emp_no IS NULL);


/*	Exercise 5
	Show Full Name, salary, and year of the salary for top 5 employees that have the highest one-time raise in salary (in absolute numbers). 
	Also, attach the top 5 employees that have the highest one-time raise in salary (in percent).  
	One-time rise here means the biggest difference between the two consecutiveyears
*/
SELECT ee.emp_no, first_name, last_name, ee.from_date, ee.to_date, ee.salary, es.salary AS nextsal, abs(es.salary - ee.salary) AS diffsal
FROM employees.salaries AS ee
JOIN employees.salaries AS es ON (es.emp_no=ee.emp_no and ee.to_date=es.from_date) 
LEFT JOIN employees.employees AS eee ON (eee.emp_no=ee.emp_no)
ORDER BY diffsal desc
LIMIT 5;

SELECT ee.emp_no, first_name, last_name, ee.from_date, ee.to_date, ee.salary, es.salary AS nextsal, ABS( es.salary/ ee.salary) AS diffpersal
FROM employees.salaries AS ee
JOIN employees.salaries AS es ON (es.emp_no=ee.emp_no and ee.to_date=es.from_date) 
LEFT JOIN employees.employees AS eee ON (eee.emp_no=ee.emp_no)
ORDER BY diffpersal desc
LIMIT 5;


 
 -- Exercise 6
 -- Generate a sequence of square numbers till 9 (1^2, 2^2... 9^2)
WITH RECURSIVE recCTE
AS (
SELECT 1 AS x, 1 AS 'rezult' 
UNION
SELECT   x+1 , POW(x+1,2) FROM recCTE
WHERE x < 9)


 SELECT * FROM recCTE;







