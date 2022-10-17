/*
																		SQL Exercises 4
		1. Показать для каждого сотрудника его текущую зарплату и текущую зарплату текущего руководителя.
		2. Показать всех сотрудников, которые в настоящее время зарабатывают больше,чем их руководители.
        3. Из таблицы dept_managerпервым запросом выбрать данные по актуальным менеджерам департаментов и --сделать свой столбец “checks” со значением ‘actual’.
        Вторым запросом из этой же таблицы dept_manager выбрать НЕ актуальных--менеджеров департаментов и сделать свой столбец “checks” со значением ‘old’. 
        Объединить результат двух запросов через union.
		4. К результату всех строк таблицы departments, добавить еще две строки со--значениями “d010”, “d011” для dept_no и “Data Base”, “Help Desk” для dept_name.
        5. Найти emp_no актуального менеджера из департамента ‘d003’, далее через подзапрос из таблицы сотрудников вывести по нему информацию.
        6. Найти максимальную дату приема на работу, далее через подзапрос из таблицы--сотрудников вывести по этой дате информацию по сотрудникам.
*/
        
        
# 1. Показать для каждого сотрудника его текущую зарплату и текущую зарплату текущего руководителя.
SELECT ede.emp_no AS 'Employeer', sal1 AS 'Salary of employeer', sal2 AS 'Salary of manager' FROM employees.dept_emp AS ede
INNER JOIN  (SELECT es.salary as sal1, es.emp_no as numb1 FROM employees.salaries AS es WHERE CURDATE() BETWEEN es.from_date AND es.to_date ) as emp ON (numb1=ede.emp_no)
INNER JOIN (SELECT  es1.salary  as sal2, edm.dept_no as numb2 FROM employees.dept_manager AS edm
INNER JOIN employees.salaries AS es1 ON (edm.emp_no=es1.emp_no)
WHERE CURDATE() BETWEEN edm.from_date AND edm.to_date AND CURDATE() BETWEEN es1.from_date AND es1.to_date) as man ON (ede.dept_no=numb2)
WHERE CURDATE() BETWEEN ede.from_date AND ede.to_date;


# 2. Показать всех сотрудников, которые в настоящее время зарабатывают больше,чем их руководители.
SELECT ede.emp_no AS 'Employeer', salemp AS 'Salary of employeer', salman AS 'Salary of manager', (salemp-salman) AS dif 
FROM employees.dept_emp AS ede
INNER JOIN  (SELECT es.salary as salemp, es.emp_no as connect1 FROM employees.salaries AS es 
WHERE CURDATE() BETWEEN es.from_date AND es.to_date ) as emp ON (connect1=ede.emp_no)
INNER JOIN (SELECT  es1.salary  as salman, edm.dept_no as dept_number FROM employees.dept_manager AS edm
INNER JOIN employees.salaries AS es1 ON (edm.emp_no=es1.emp_no) WHERE CURDATE() BETWEEN edm.from_date AND edm.to_date AND CURDATE() BETWEEN es1.from_date AND es1.to_date) as man
ON (ede.dept_no=dept_number)WHERE CURDATE() BETWEEN ede.from_date AND ede.to_date AND salemp>salman;


# 3. Из таблицы dept_manager первым запросом выбрать данные по актуальным менеджерам департаментов и --сделать свой столбец “checks” со значением ‘actual’.  
#Вторым запросом из этой же таблицы dept_manager выбрать НЕ актуальных
SELECT *, 'actual' AS CHECKS FROM employees.dept_manager
WHERE CURDATE() BETWEEN from_date AND to_date 
UNION
SELECT edm.*, 'old' AS CHECKS FROM employees.dept_manager AS edm WHERE to_date<CURDATE();


# 4. К результату всех строк таблицы departments, добавить еще две строки со--значениями “d010”, “d011” для dept_no и “Data Base”, “Help Desk” для dept_name.
SELECT *FROM employees.departments
UNION
SELECT 'd010', 'Data Desk'
UNION
SELECT 'd011', 'Help Desk';


# 5. Найти emp_no актуального менеджера из департамента ‘d003’, далее черезподзапрос из таблицы сотрудников вывести по нему информацию.
SELECT *FROM employees.employees
WHERE emp_no= (SELECT emp_no FROM dept_manager WHERE dept_no='d003' AND CURDATE() BETWEEN from_date AND to_date);


# 6. Найти максимальную дату приема на работу, далее через подзапрос из таблицы--сотрудников вывести по этой дате информацию по сотрудникам.
SELECT *FROM employees.employees
WHERE hire_date = (SELECT MAX(hire_date) FROM employees.employees)
