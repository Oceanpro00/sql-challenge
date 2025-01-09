# SQL Challenge: Employee Database Analysis

## Overview
This repository contains the solution for the Module 9 SQL Challenge as part of my data analytics bootcamp. The challenge involves data modeling, data engineering, and data analysis for Pewlett Hackard's (a fictional company) employee database from the 1980s and 1990s.

The goal of this project is to design tables to store CSV data, import data into a SQL database, and perform various analyses to answer specific business questions.

---

## Files in Repository

### 1. **Entity Relationship Diagram (ERD)**
- File: `ERD.png`
- Description: Visual representation of the database schema, showing the relationships between tables.

### 2. **Table Schemata**
- File: `table_schemata.sql`
- Description: SQL script to create the required database tables with proper data types, constraints, and relationships.

### 3. **SQL Queries**
- File: `queries.sql`
- Description: SQL queries to perform data analysis and answer specific questions based on the imported employee data.

### 4. **Data Files**
- Folder: `data/`
  - `employees.csv`: Employee details.
  - `salaries.csv`: Salary information for employees.
  - `titles.csv`: Job titles for employees.
  - `departments.csv`: Department details.
  - `dept_emp.csv`: Employee-to-department relationships.
  - `dept_manager.csv`: Department manager details.
- Description: Raw CSV files containing employee data for the analysis.

---

## Challenge Breakdown

### 1. **Data Modeling**
- Sketched the database schema using an ERD to define relationships between tables.
- Tables in the schema:
  - `employees`
  - `titles`
  - `salaries`
  - `departments`
  - `dept_emp`
  - `dept_manager`

### 2. **Data Engineering**
- Created a table schema for each of the six CSV files using `table_schemata.sql`.
- Key highlights:
  - Primary keys, foreign keys, and NOT NULL constraints are appropriately set.
  - Tables are created in the correct order to account for foreign key dependencies.
  - Correct data types and value lengths are defined for each column.

### 3. **Data Analysis**
- Imported CSV data into the SQL database.
- Used `queries.sql` to perform the following analyses:
  - Employee details: employee number, name, sex, and salary.
  - Employees hired in 1986.
  - Department managers and their details.
  - Employees in specific departments (Sales, Development).
  - Employees with specific name criteria.
  - Frequency of last names in the database.

---

## Setup and Execution

### 1. **Prerequisites**
Ensure you have the following tools installed:
- PostgreSQL or MySQL
- SQL client (e.g., pgAdmin, MySQL Workbench, or command-line interface)

### 2. **Steps to Reproduce**

#### a. Clone the Repository
```bash
$ git clone https://github.com/yourusername/sql-challenge.git
$ cd sql-challenge
```

#### b. Create the Database and Tables
1. Open your SQL client and connect to your database server.
2. Create a new database (e.g., `pewlett_hackard`):
   ```sql
   CREATE DATABASE pewlett_hackard;
   ```
3. Run the `table_schemata.sql` script to create the tables:
   ```bash
   psql -d pewlett_hackard -f table_schemata.sql
   ```

#### c. Import CSV Data
Use your SQL client or command-line tool to import data into each table. For example:
```sql
COPY employees FROM '/path/to/employees.csv' DELIMITER ',' CSV HEADER;
COPY salaries FROM '/path/to/salaries.csv' DELIMITER ',' CSV HEADER;
-- Repeat for other tables
```

#### d. Run Analysis Queries
1. Execute the queries in `queries.sql` to retrieve analysis results.
2. Example:
   ```sql
   SELECT emp_no, last_name, first_name, sex, salary FROM employees;
   ```

---

## Results
The analyses reveal key insights about the company's employees, such as:
- Employee demographics and salaries.
- Hiring trends in 1986.
- Department structures and manager details.
- Popular last names and employee distributions across departments.

---

## Key Learnings
- Database design using ERD.
- SQL scripting for table creation and data constraints.
- Complex query writing for data analysis.