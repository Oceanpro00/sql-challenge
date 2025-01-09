DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;


-- Table Schemata for Titles (1/6)

CREATE TABLE titles(
	title_id VARCHAR(5) PRIMARY KEY NOT NULL,
	title VARCHAR(20) NOT NULL
);


-- Table Schemata for Employees (2/6)

CREATE TABLE employees(
	emp_no INTEGER PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE, 	-- Some people may not want to answer/ null rows
	first_name VARCHAR(35) NOT NULL,
	last_name VARCHAR(35) NOT NULL,
	sex VARCHAR(5),		-- Some people may not want to answer
	hire_date DATE NOT NULL,
	FOREIGN KEY(emp_title_id) REFERENCES titles(title_id)
);


-- Table Schemata for Departments (3/6)

CREATE TABLE departments(
	dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(20) UNIQUE NOT NULL
);


-- Table Schemata for Salaries (4/6)

CREATE TABLE salaries(
	emp_no INTEGER PRIMARY KEY NOT NULL,
	salary INTEGER NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);


-- Table Schemata for Department Employees (5/6)

CREATE TABLE dept_emp(
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY(emp_no, dept_no)
);


-- Table Schemata for Department Managers (6/6)

CREATE TABLE dept_manager(
	dept_no VARCHAR(4) NOT NULL,
	emp_no INTEGER NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY(dept_no, emp_no)
);