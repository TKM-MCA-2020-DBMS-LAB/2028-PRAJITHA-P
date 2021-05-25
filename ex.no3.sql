--Consider the database for an organisation. Write the queries for the following

mysql> CREATE DATABASE ORGANISATION;
Query OK, 1 row affected (0.16 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| organisation       |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
mysql> USE ORGANISATION;
Database changed

mysql> CREATE TABLE department(dept_no VARCHAR(20) PRIMARY KEY,dept_name VARCHAR(50),location VARCHAR(20));
Query OK, 0 rows affected (1.78 sec)

mysql> CREATE TABLE employee(emp_no INT  PRIMARY KEY,emp_name VARCHAR(20) NOT NULL,DOB date NOT NULL,address varchar(50) NOT NULL,doj date NOT NULL,mobile_no numeric,dept_no varchar(20),salary DECIMAL(10,2) NOT NULL,FOREIGN KEY (dept_no) REFERENCES department(dept_no));
Query OK, 0 rows affected (2.02 sec)

--(i)	Add 5 rows in the employee and dept tables

--department

mysql> INSERT INTO department VALUES("S123","A");
Query OK, 1 row affected (0.19 sec)

mysql> INSERT INTO department VALUES("S145","B");
Query OK, 1 row affected (0.16 sec)

mysql> INSERT INTO department VALUES("M456","C");
Query OK, 1 row affected (0.22 sec)

mysql> INSERT INTO department VALUES("H456","D");
Query OK, 1 row affected (0.13 sec)

mysql> INSERT INTO department VALUES("2","E");
Query OK, 1 row affected (0.08 sec)

--employee

mysql> INSERT INTO employee VALUES(101,"Shyam","1998/11/26","Shyam Nivas",9874563214,"2",25000,"Typist");
Query OK, 1 row affected (0.49 sec)

mysql> INSERT INTO employee VALUES(102,"Asha","1998/1/6","Asha Nivas",8874563214,"H456",18000,"Accounts");
Query OK, 1 row affected (0.16 sec)

mysql> INSERT INTO employee VALUES(103,"Arun","1998/1/25","Arun Villa",8977563214,"M456",45000,"Manager");
Query OK, 1 row affected (0.42 sec)

mysql> INSERT INTO employee VALUES (104,"Syam","1996/2/26","Syam Bhavan",9874883214,"S123",35000,"Assistant");
Query OK, 1 row affected (0.12 sec)

mysql> INSERT INTO employee VALUES (105,"Amaya","1997/5/15","S Nivas",7894563214,"S145",15000,"Typist");
Query OK, 1 row affected (0.20 sec)




--(ii)	Display all the records from the above tables

mysql> SELECT * FROM department;
+---------+-----------+
| dept_no | dept_name |
+---------+-----------+
| 2       | E         |
| H456    | D         |
| M456    | C         |
| S123    | A         |
| S145    | B         |
+---------+-----------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM employee;
+--------+----------+------------+-------------+------------+---------+----------+-------------+
| emp_no | emp_name | DOB        | address     | mobile_no  | dept_no | salary   | designation |
+--------+----------+------------+-------------+------------+---------+----------+-------------+
|    101 | Shyam    | 1998-11-26 | Shyam Nivas | 9874563214 | 2       | 25000.00 | Typist      |
|    102 | Asha     | 1998-01-06 | Asha Nivas  | 8874563214 | H456    | 18000.00 | Accounts    |
|    103 | Arun     | 1998-01-25 | Arun Villa  | 8977563214 | M456    | 45000.00 | Manager     |
|    104 | Syam     | 1996-02-26 | Syam Bhavan | 9874883214 | S123    | 35000.00 | Assistant   |
|    105 | Amaya    | 1997-05-15 | S Nivas     | 7894563214 | S145    | 15000.00 | Typist      |
+--------+----------+------------+-------------+------------+---------+----------+-------------+
5 rows in set (0.06 sec)


--(iii)	Display the empno and name of all the employees from department no2

mysql> SELECT emp_no,emp_name FROM employee WHERE dept_no="2";
+--------+----------+
| emp_no | emp_name |
+--------+----------+
|    101 | Shyam    |
+--------+----------+
1 row in set (0.12 sec)

--(iv)	Display empno,name,designation,dept no and salary in the descending order of salary

mysql> SELECT emp_no,emp_name,designation,dept_no,salary FROM employee ORDER By salary DESC;
+--------+----------+-------------+---------+----------+
| emp_no | emp_name | designation | dept_no | salary   |
+--------+----------+-------------+---------+----------+
|    103 | Arun     | Manager     | M456    | 45000.00 |
|    104 | Syam     | Assistant   | S123    | 35000.00 |
|    101 | Shyam    | Typist      | 2       | 25000.00 |
|    102 | Asha     | Accounts    | H456    | 18000.00 |
|    105 | Amaya    | Typist      | S145    | 15000.00 |
+--------+----------+-------------+---------+----------+
5 rows in set (0.00 sec)

--(v)	Display the empno and name of all employees whose salary is between 2000 and 5000n

mysql> SELECT emp_no,emp_name FROM employee WHERE salary BETWEEN 20000 AND 50000;
+--------+----------+
| emp_no | emp_name |
+--------+----------+
|    101 | Shyam    |
|    103 | Arun     |
|    104 | Syam     |
+--------+----------+
3 rows in set (0.02 sec)

--(vi)	Display all designations without duplicate values.

mysql>  SELECT DISTINCT designation FROM employee;
+-------------+
| designation |
+-------------+
| Typist      |
| Accounts    |
| Manager     |
| Assistant   |
+-------------+
4 rows in set (0.06 sec)


--(vii)	Display the dept name and total salary of employees of each department

mysql> SELECT dept_no,SUM(salary) FROM employee GROUP BY dept_no;
+---------+-------------+
| dept_no | SUM(salary) |
+---------+-------------+
| 2       |    25000.00 |
| H456    |    18000.00 |
| M456    |    45000.00 |
| S123    |    35000.00 |
| S145    |    15000.00 |
+---------+-------------+
5 rows in set (0.00 sec)

--(viii)	Change the salary of employees to 25000 whose designation is ‘Typist’

mysql> UPDATE employee SET salary=25000 WHERE designation="Typist";
Query OK, 1 row affected (0.16 sec)
Rows matched: 2  Changed: 1  Warnings: 0

mysql> SELECT * FROM employee;
+--------+----------+------------+-------------+------------+---------+----------+-------------+
| emp_no | emp_name | DOB        | address     | mobile_no  | dept_no | salary   | designation |
+--------+----------+------------+-------------+------------+---------+----------+-------------+
|    101 | Shyam    | 1998-11-26 | Shyam Nivas | 9874563214 | 2       | 25000.00 | Typist      |
|    102 | Asha     | 1998-01-06 | Asha Nivas  | 8874563214 | H456    | 18000.00 | Accounts    |
|    103 | Arun     | 1998-01-25 | Arun Villa  | 8977563214 | M456    | 45000.00 | Manager     |
|    104 | Syam     | 1996-02-26 | Syam Bhavan | 9874883214 | S123    | 35000.00 | Assistant   |
|    105 | Amaya    | 1997-05-15 | S Nivas     | 7894563214 | S145    | 25000.00 | Typist      |
+--------+----------+------------+-------------+------------+---------+----------+-------------+
5 rows in set (0.05 sec)


--(ix)	Change the mobile no of employee named ‘john’(Shyam)

mysql>  UPDATE employee SET mobile_no=8975563214 WHERE emp_name="Shyam";
Query OK, 1 row affected (0.09 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM employee;
+--------+----------+------------+-------------+------------+---------+----------+-------------+
| emp_no | emp_name | DOB        | address     | mobile_no  | dept_no | salary   | designation |
+--------+----------+------------+-------------+------------+---------+----------+-------------+
|    101 | Shyam    | 1998-11-26 | Shyam Nivas | 8975563214 | 2       | 25000.00 | Typist      |
|    102 | Asha     | 1998-01-06 | Asha Nivas  | 8874563214 | H456    | 18000.00 | Accounts    |
|    103 | Arun     | 1998-01-25 | Arun Villa  | 8977563214 | M456    | 45000.00 | Manager     |
|    104 | Syam     | 1996-02-26 | Syam Bhavan | 9874883214 | S123    | 35000.00 | Assistant   |
|    105 | Amaya    | 1997-05-15 | S Nivas     | 7894563214 | S145    | 25000.00 | Typist      |
+--------+----------+------------+-------------+------------+---------+----------+-------------+
5 rows in set (0.04 sec)

--(x)	Delete all employees whose salaries are equal to Rs.7000(18000)

mysql> DELETE FROM employee WHERE salary=18000;
Query OK, 1 row affected (0.24 sec)

mysql> SELECT * FROM employee;
+--------+----------+------------+-------------+------------+---------+----------+-------------+
| emp_no | emp_name | DOB        | address     | mobile_no  | dept_no | salary   | designation |
+--------+----------+------------+-------------+------------+---------+----------+-------------+
|    101 | Shyam    | 1998-11-26 | Shyam Nivas | 8975563214 | 2       | 25000.00 | Typist      |
|    103 | Arun     | 1998-01-25 | Arun Villa  | 8977563214 | M456    | 45000.00 | Manager     |
|    104 | Syam     | 1996-02-26 | Syam Bhavan | 9874883214 | S123    | 35000.00 | Assistant   |
|    105 | Amaya    | 1997-05-15 | S Nivas     | 7894563214 | S145    | 25000.00 | Typist      |
+--------+----------+------------+-------------+------------+---------+----------+-------------+
4 rows in set (0.05 sec)

--(xi)	Select the department that has total salary paid for its employees more than 25000

mysql> SELECT dept_no,SUM(salary) FROM employee GROUP BY dept_no HAVING SUM(salary)>25000;
+---------+-------------+
| dept_no | SUM(salary) |
+---------+-------------+
| M456    |    45000.00 |
| S123    |    35000.00 |
+---------+-------------+
2 rows in set (0.06 sec)







