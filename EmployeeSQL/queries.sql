-- List the employee number, last name, first name, sex, and salary of each employee.

SELECT
	emp.emp_no as "Employee #",
	emp.last_name as "Last Name",
	emp.first_name as "First Name",
	emp.sex as "Sex",
	sal.salary as "Salary"
FROM employees as emp
INNER JOIN salaries as sal ON sal.emp_no = emp.emp_no;


-- List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT
	first_name as "First Name",
	last_name as "Last Name",
	hire_date as "Hire Date"
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;


-- List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT
	dep.dept_no as "Department #",
	dep.dept_name as "Department Name",
	emp.emp_no as "Employee #",
	emp.last_name as "Last Name",
	emp.first_name as "First Name"
FROM employees as emp
INNER JOIN dept_manager as dep_m ON emp.emp_no = dep_m.emp_no
INNER JOIN departments as dep ON dep_m.dept_no = dep.dept_no;


-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT
	emp.emp_no as "Employee #",
	emp.last_name as "Last Name",
	emp.first_name as "First Name",
	dep.dept_no as "Department #",
	dep.dept_name as "Department Name"
FROM employees as emp
INNER JOIN dept_emp as dep_e ON emp.emp_no = dep_e.emp_no
INNER JOIN departments as dep ON dep_e.dept_no = dep.dept_no;


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT
	first_name as "First Name",
	last_name as "Last Name",
	sex as "Sex"
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


-- List each employee in the Sales department, including their employee number, last name, and first name.

SELECT
	emp.emp_no as "Employee #",
	emp.last_name as "Last Name",
	emp.first_name as "First Name"
FROM employees as emp
INNER JOIN dept_emp as dep_e ON dep_e.emp_no = emp.emp_no
WHERE dep_e.dept_no = 'd007';	-- Refered to the Departments Table directly to find the dept_no for Sales 


-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT
	emp.emp_no as "Employee #",
	emp.last_name as "Last Name",
	emp.first_name as "First Name",
	dep.dept_name as "Department"
FROM employees as emp
INNER JOIN dept_emp as dep_e ON dep_e.emp_no = emp.emp_no
INNER JOIN departments as dep ON dep_e.dept_no = dep.dept_no
WHERE dep.dept_name = 'Sales'
OR dep.dept_name = 'Development';


-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT
    last_name as "Last Name",
    COUNT(last_name) as "Frequency Count"
FROM employees
GROUP BY last_name
ORDER BY "Frequency Count" DESC;