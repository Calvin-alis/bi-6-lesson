# Practise 21.09 
/*
	Practise every day: 
    - https://leetcode.com
	- https://www.hackerrank.com
    - https://exercism.org/dashboard
    - https://www.w3schools.com/mysql/default.asp
    - https://www.codewars.com/dashboard
*/


/*	Де можемо використовувати sub
		SELECT - (1 - колонка или 1 -  значення)
		WHERE - (1 -  колона або  n -  значення)
		FROM/JOIN - (n - колонок, m - значеннь) + потрібно вказати Alias 
*/



/*
	1.  Вивести всіх співробітників в кого ЗП більше 99999
    
    2. Вивезти всіх співробітників в кого імя Parto
    
    3. Вивести всіх співпробітників, хто народився в періоді з
		01-01-1952 по 12-31-1955 і з 01-01-1960 по 12-31-1965
        
	4. Вивести всіх співробітників з сумарним заробітком починаючи з 1 млн
    
    5. Вивести загальну кількість чоловіків і жінок
    
    6. Вивезти роки прийняття на роботу, коли було прийнято меньше 10000
    
    7. Починаючи з 01-01-2000 показати середній заробіток кожного співробітника
    
    8. Відобразити статистуку по співробітникам, відности дати народження 
    з розбивкою по рокам і місяцям
    
    9. Вивести всіх співробітників, які мають максимальну ЗП
    більше 99999 і порядковий номер більше 123456
    
    10. Вивести всіх чоловіків, які народились в червні 1972
    
    11. Відобразити поточні посади для всіх співробітників в кого назва 
    посади містить другу букву е
    
	12. Відобразити в зворотньому порядку лише ті відділи, де на момент 10-01-1998 працювало меньше 500 працівників;
    
	13. Показати кількісну статистику працівників по відділам на сьогоднішню дату;
    
	14. Скільки жінок було прийнято в 1993 році, які народились після 02-01-1940;
    
	15. Показати всі пари однофамільців(імя + прізвище), 
		 в яких зустрічаються чоловік і жінка з одноковим іменем і прізвищем; 

	16. Показати, дату найму на роботу, яка зустрічається найчастіше;

	17. Вивести Імя і ЗП співробітників;
    
	18. Вивести Прізвище, посаду на поточний момент і назву відділу  співробітників  на поточний момент

	19. Вивести Імя і актуальну ЗП співробітників, для тих в кого відсутня, відобразити 0
	
    20. Вивести Імя і актуальну ЗП співробітників жіночої статі, для тих в кого відсутня, відобразити 0

	21. Вивести Імя, emp_no і максимальну ЗП співробітників жіночої статі, в кого сумарна ЗП більше 1млн;
	
    22. Вивести Прізвище і період з/до за який вони отримували таку ЗП всіх співробітників в кого ЗП більше ніж середня ЗП по компанії;

	23. Вивести Прізвище і мінімальну ЗП кожного співробітника і максимальну ЗП по компанії(реалізувати двома способами);

	24. Вивести Імя співробітників, дату народження і періоди(з і до) 
		для тих в кого ЗП дорівняє максимальній заробітній платі за самий перший звітний період(from_date)

	25. Вивести порядковий номер співробітників, період отримання ЗП(з і до), 
			хто працював на посаді, яка містить текст 'Engineer', 
			мав ЗП більше ніж середню серед співробітників, 
			які працювали на посаді, яка містить текст 'Staff';
            
	26. Вивести назви посад і відділів з дублікатами;
    
	27. Вивести, лише унікальні значення назви посад і відділів з характеристикою, з якої таблиці взята інформація;
    
	28. Вивести всіх чолоків, хто працює в відділі 'Finance' в поточний момент, колонку з текстом 'Men' і нище списком
всіх жінок, хто працював в відділі 'Production' на момент 1999-01-01 і колонку з текстом 'Women';
        
*/


/*

DBMS

 1 What is the Database Management System (DBMS)?
 2 Which of components are usually DBMS consists?
 3 What is the Database Access Language?
 4 What is the Query Processor?
 5 What are DBMS functions?
 6 What is the Relational Database Management System (RDBMS)?
 7 What is Structured Query Language (SQL)?
 8 What is NoSQL?
 9 What is In-Memory Database Management System (IMDBMS)?
 10 What is Columnar Database Management System (CDBMS)?
 11 What is Cloud (Based) Database Management Systemis (C(B)DBMS)?
 12 What is Redundant Array of Independent Disks (RAID)?
 13 How does a RDBMS work?
 14 What is Big O notation?
 15 How to sort?
 16 SMP vs MPP
 17 What is RAID?

BASIC SQL    

 1 What Can SQL Do?
 2 What is Data Manipulation Language?
 3 What are SQL Components?
 4 What is the Logical Operators Precedence?
 5 What are SQL Aliases?
 6 What are SQL Comments?
 7 What is AdventureWorks Sample Database?
 8 What are SQL JOINS?
 9 What are SET Operations?
 10 What are Aggregate Functions?
 11 What is GROUP BY Statement?
 12 What is CASE Statement?
 13 What types of Subqueries exist?
 14 What is CTE (Common Table Expression)?
 15 What are SQL Data Types?
 16 What types of relationships exist?
 17 What are SQL constraints?
 18 What are Window Functions?
 19 What are DATE and TIME FUNCTIONS?
 20 What are STRING FUNCTIONS?

ADVANCED SQL  

 1 What is SQL Views?
 2 What is SQL Triggers?
 3 What are SQL grouping functions and ranking functions?
 4 What are SQL XML data-types?
 5 What are SQL User-Defined Functions?
 6 What are SQL Transactions and Error Handling?
 7 What are SQL Dynamic Queries?
 8 What is SQL Filestream and Free-Text Search?
 9 What are SQL Stored Procedures?
 10 What are SQL Computed Columns?
 11 What are SQL Partitions?
 12 What are SQL Geography and Geometry types?

QUERYING DATA TRANSACT-SQL  

 1 What is SQL Alias Syntax?
 2 What are SQL Synonyms?
 3 What are JOINs and Advanced JOINs?
 4 What are SQL Sub Queries?
 5 What are SQL Table Expression?
 6 What are TOP and OFFSET-FETCH filters?
 7 What are Apply Statements?
 8 What are PIVOT and UNPIVOT Statements?
 9 What are CASE Statements?
 10 What are SQL Execution Plans types?
 11 What are Live Execution Statistics?
 12 What are Types of physical joins?
 13 What are NESTED LOOPS?
 14 What is HASH Match?
 15 What is B-tree index structure?
 16 What are Clustered Tables vs Heap Tables?
 17 What is Index Fragmentation?
 18 What is Rebuild vs. Reorganize Strategy?

BUSINESS INTELLIGENCE, DATA WAREHOUSE

 1 What is Business Intelligence?
 2 What are the functions of Data Engineer, Data Quality Engineer, Data Scientist, Data Analyst?
 3 What is Data Warehouse?
 4 What is Data Lake?
 5 What are Normalization / Denormalization / Normal Forms?
 6 What are Fact/Dimension tables?
 7 What is Bill Inmon`s Top-Down approach to build Data Warehouse?
 8 What is Ralph Kimball`s Bottom-Up approach to build Data Warehouse?
 9 What is Dan Linstedt`s Data Vault?
*/


