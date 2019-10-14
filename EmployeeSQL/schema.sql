-- Dan Dragone - Aug'19 - Feb'20 Data Viz class

-- Drop Tables if Existing
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- Create tables to import CSV files
CREATE TABLE departments (
  dept_no VARCHAR(10) UNIQUE NOT NULL,
  dept_name VARCHAR(50) NOT NULL,
  CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no")
  );

CREATE TABLE "dept_emp" (
    "emp_no" INT NOT NULL,
    "dept_no" VARCHAR (10) NOT NULL,
    "from_date" DATE NOT NULL,
    "to_date" DATE NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR (10) NOT NULL,
    "emp_no" INT NOT NULL,
    "from_date" DATE NOT NULL,
    "to_date" DATE NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" INT UNIQUE NOT NULL,
    "birth_date" DATE NOT NULL,
    "first_name" VARCHAR (20) NOT NULL,
    "last_name" VARCHAR (50) NOT NULL,
    "gender" VARCHAR (10) NOT NULL,
    "hire_date" DATE NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT NOT NULL,
    "salary" INT NOT NULL,
    "from_date" DATE NOT NULL,
    "to_date" DATE NOT NULL
);

CREATE TABLE "titles" (
    "emp_no" INT NOT NULL,
    "title" VARCHAR (50) NOT NULL,
    "from_date" DATE NOT NULL,
    "to_date" DATE NOT NULL
);

-- alter tables to add restrictions/constraints for the creation of Foreign Keys based on the Primary Keys
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

-- Query Each Table to confirm the Data
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;