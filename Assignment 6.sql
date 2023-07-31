/*
				Assignment 6
                  Worth 10%
                Total Assignment is out of 100 marks  
				
                Complete all of the questions in this SQL file and submit the file for grading
                
                Open this file in SQL Workbench to complete all of the statements
                
                Make sure you run the CreateDB Script to create the sample database again so you have the correct data 
				
                You will need it to create the queries based on these tables
                
                There is a .jpg file which shows the tables in the database

*/


/*
 Question 1 (10 marks)
 
 a) Create two tables with the same numbers of columns and datatypes (mininum 3 columns in each table) (3 marks)
 
 b) Populate those tables with data (3 marks)
 
 c) Create a SELECT statement for each table and UNION them together (4 marks)
 
*/
CREATE TABLE table1 (
    id INT,
    name VARCHAR(30),
    age INT
);

CREATE TABLE table2 (
    id INT,
    name VARCHAR(30),
    age INT
);

INSERT INTO table1 VALUES (1, 'Alice', 25), (2, 'Bob', 30), (3, 'Charlie', 35);
INSERT INTO table2 VALUES (4, 'David', 40), (5, 'Eve', 45), (6, 'Frank', 50);

SELECT * FROM table1
UNION
SELECT * FROM table2;




/*
 Question 2 (10 marks)
 
 Create a query that lists the department number, employee number, and salaries of all employees in department D11.  
 UNION the same information , but this time sum up all the salaries to create a one line summary entry for the D11 department (hint sum the salary).  Sort the list by Salary.
 
*/

SELECT department_no, employee_no, salary 
FROM your_table 
WHERE department_no = 'D11'
UNION ALL
SELECT department_no, NULL, SUM(salary) 
FROM your_table 
WHERE department_no = 'D11'
GROUP BY department_no
ORDER BY salary;


/*
 Question 3 (10 marks)
 
a )  Write a query that uses NATURAL JOIN TO connect the EMPLOYEE and EMPPROJACT table.   Include the Employee number , First and Last name, Salary, Salary increased by 3% and Project number      ( 3 marks )

b) Use INNER JOIN OR JOIN with the same query with USING statement   ( 3 marks )

 
c) Use INNER JOIN OR JOIN with the same query with joined columns (hint a = a )    ( 4 marks )
 

*/
SELECT e.emp_no, e.first_name, e.last_name, e.salary, e.salary*1.03 as increased_salary, epa.proj_no
FROM employee e
NATURAL JOIN empprojact epa;

SELECT e.emp_no, e.first_name, e.last_name, e.salary, e.salary*1.03 as increased_salary, epa.proj_no
FROM employee e
JOIN empprojact epa USING (emp_no);


/*
 Question 4 ( 25 marks )
 
  a) Create three tables.  Two of the tables will have PRIMARY KEYS (mininum 3 columns in each table) and the third table will have two columns that are the foreign keys to each of the PRIMARY KEYS (6 marks)
 
 b) Populate these table with data (5 marks)
 
 c) Create a SELECT statement using NATURAL JOINS to connect the three tables together (7 marks)
 
 d) Run the Reverse Engineer function in MySQL workbench on these tables and provide the .MWB file in your submission ( 7 marks )
 
*/
CREATE TABLE table3 (
    id INT PRIMARY KEY,
    name VARCHAR(30),
    age INT
);

CREATE TABLE table4 (
    id INT PRIMARY KEY,
    role VARCHAR(30),
    experience INT
);

CREATE TABLE table5 (
    id3 INT,
    id4 INT,
    FOREIGN KEY (id3) REFERENCES table3(id),
    FOREIGN KEY (id4) REFERENCES table4(id)
);

INSERT INTO table3 VALUES (1, 'Alice', 25), (2, 'Bob', 30), (3, 'Charlie', 35);
INSERT INTO table4 VALUES (4, 'Developer', 5), (5, 'Tester', 4), (6, 'Analyst', 6);
INSERT INTO table5 VALUES (1, 4), (2, 5), (3, 6);

SELECT *
FROM table3
NATURAL JOIN table5
NATURAL JOIN table4;


/*
 Question 5 (15 marks)
 
  Write a query that uses INNER JOIN TO connect the EMPLOYEE, EMPPROJACT, PROJACT and PROJECT tables.   Include the Project number , Department number, Project start and end date and AC STAFF  
WHERE They belong to department D11 , Salary is more than or equal to 65 percent of $15,000 AND Salary is less than or equal to 130 percent of $40,000 

   
*/

SELECT p.proj_no, e.dept_no, pa.start_date, pa.end_date, pa.ac_staff
FROM employee e
INNER JOIN empprojact epa ON e.emp_no = epa.emp_no
INNER JOIN projact pa ON epa.act_no = pa.act_no
INNER JOIN project p ON pa.proj_no = p.proj_no
WHERE e.dept_no = 'D11' AND e.salary >= 0.65 * 15000 AND e.salary <= 1.3 * 40000;


/*
 Question 6 (15 marks)
 
 Create a query that lists empno, projno, emptime, emendate.  Left join the project to the empprojact table using projno and left join the act table using actno and then right join employee table using empno. 
 Where projno is AD3113 and empno is 000270 and emptime is greater than 0.5
 
 
*/
SELECT e.emp_no, p.proj_no, epa.emptime, epa.emendate
FROM project p
LEFT JOIN empprojact epa ON p.proj_no = epa.proj_no
LEFT JOIN act a ON epa.act_no = a.act_no
RIGHT JOIN employee e ON epa.emp_no = e.emp_no
WHERE p.proj_no = 'AD3113' AND e.emp_no = '000270' AND epa.emptime > 0.5;

/*
 Question 7 (15 marks)
 
  Describe all of the relationships between the tables in the attached image file TableRelationships.jpg
  
  a) describe all the foreign key and primary keys by defining the CREATE table statements for all the tables (10 marks)
  b) describe the relationship between each table ( 1..1 (exactly one match)  1..n (one or more matches)) (5 marks)

 
  
 */

 
 

 
 
 