--(i)	create the database--

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
7 rows in set (0.06 sec)

--(ii)	select the current database--

mysql> USE ORGANISATION;
Database changed

--(iii)  Create the following tables.--
--a.	employee (emp_no,emp_name,DOB, address, doj, mobile_no, dept_no, salary).--
--b.	department (dept_no, dept_name, location).--

mysql> CREATE TABLE department(dept_no VARCHAR(20) PRIMARY KEY,dept_name VARCHAR(50),location VARCHAR(20));
Query OK, 0 rows affected (1.78 sec)

mysql> CREATE TABLE employee(emp_no INT  PRIMARY KEY,emp_name VARCHAR(20) NOT NULL,DOB date NOT NULL,address varchar(50) NOT NULL,doj date NOT NULL,mobile_no numeric,dept_no varchar(20),salary DECIMAL(10,2) NOT NULL,FOREIGN KEY (dept_no) REFERENCES department(dept_no));
Query OK, 0 rows affected (2.02 sec)


--(iv)  Include necessary constraints.--
--(v)	List all the tables in the current database --

mysql> SHOW TABLES;
+------------------------+
| Tables_in_organisation |
+------------------------+
| department             |
| employee               |
+------------------------+
2 rows in set (0.06 sec)

--(vi)  Display the structure of the employee table --

mysql> DESC employee;
+-----------+---------------+------+-----+---------+-------+
| Field     | Type          | Null | Key | Default | Extra |
+-----------+---------------+------+-----+---------+-------+
| emp_no    | int           | NO   | PRI | NULL    |       |
| emp_name  | varchar(20)   | NO   |     | NULL    |       |
| DOB       | date          | NO   |     | NULL    |       |
| address   | varchar(50)   | NO   |     | NULL    |       |
| doj       | date          | NO   |     | NULL    |       |
| mobile_no | decimal(10,0) | YES  |     | NULL    |       |
| dept_no   | varchar(20)   | YES  | MUL | NULL    |       |
| salary    | decimal(10,2) | NO   |     | NULL    |       |
+-----------+---------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

--(vii)  Add a new column Designation to the employee table --

mysql>  ALTER TABLE employee ADD designation VARCHAR(20) NOT NULL;
Query OK, 0 rows affected (1.24 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC employee;
+-------------+---------------+------+-----+---------+-------+
| Field       | Type          | Null | Key | Default | Extra |
+-------------+---------------+------+-----+---------+-------+
| emp_no      | int           | NO   | PRI | NULL    |       |
| emp_name    | varchar(20)   | NO   |     | NULL    |       |
| DOB         | date          | NO   |     | NULL    |       |
| address     | varchar(50)   | NO   |     | NULL    |       |
| doj         | date          | NO   |     | NULL    |       |
| mobile_no   | decimal(10,0) | YES  |     | NULL    |       |
| dept_no     | varchar(20)   | YES  | MUL | NULL    |       |
| salary      | decimal(10,2) | NO   |     | NULL    |       |
| designation | varchar(20)   | NO   |     | NULL    |       |
+-------------+---------------+------+-----+---------+-------+
9 rows in set (0.12 sec)

--(viii)  Drop the column location from Dept table --

mysql> ALTER TABLE department DROP location;
Query OK, 0 rows affected (1.78 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC department;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_no   | varchar(20) | NO   | PRI | NULL    |       |
| dept_name | varchar(50) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.09 sec)

--(ix)  Drop the tables --
mysql> DROP TABLE employee;
Query OK, 0 rows affected (0.16 sec)

mysql> DROP TABLE department;
Query OK, 0 rows affected (0.16 sec)

--(x)  Delete the database --

mysql> DROP DATABASE organisation;
Query OK, 0 rows affected (0.16 sec)








