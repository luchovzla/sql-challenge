-- Titles table

CREATE TABLE titles (
	title_id VARCHAR(255) NOT NULL PRIMARY KEY,
	title VARCHAR(255) NOT NULL
);

-- Employee information table

CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title VARCHAR(255) NOT NULL,
	birth_date VARCHAR(255) NOT NULL,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	sex VARCHAR(255) NOT NULL,
	hire_date VARCHAR(255) NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);

-- Salary table

CREATE TABLE salary (
	emp_no INT,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Departments table

CREATE TABLE department (
	dept_no VARCHAR(255) NOT NULL,
	dept_name VARCHAR(255) NOT NULL,
	PRIMARY KEY (dept_no)
);

-- Create junction table for employee departments

CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR(255),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

SELECT * FROM dept_emp;

-- Create junction table for employee managers 

CREATE TABLE dept_manager (
	dept_no VARCHAR(255),
	emp_no INT,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

SELECT * FROM dept_manager;