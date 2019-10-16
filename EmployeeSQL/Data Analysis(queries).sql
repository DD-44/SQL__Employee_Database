-- Dan Dragone - Aug'19 - Feb'20 Data Viz class

--1. List the following details of each employee: 
--  employee number, last name, first name, gender, and salary.
Select 
	employees.emp_no as "Employee Number",
	employees.last_name as "Last Name",
	employees.first_name as "First Name",
	employees.gender as "Gender",
	salaries.salary as "Salary"
From employees
Inner join salaries
ON employees.emp_no=salaries.emp_no
Order by employees.emp_no;

-- 2. List employees who were hired in 1986
Select emp_no, first_name, last_name, hire_date
From employees 
Where hire_date between '1986-01-01' and '1986-12-31';

-- 3. List the manager of each department with the following information: 
--     department number, department name, the manager's employee number, 
--     last name, first name, and start and end employment dates.
Select 
	dm.dept_no, 
	d.dept_name, 
	dm.emp_no,
	e.last_name,
	e.first_name,
	dm.from_date,
	dm.to_date
From dept_manager as dm
Inner Join departments as d
On dm.dept_no = d.dept_no
Inner Join employees as e
On dm.emp_no=e.emp_no
Order by dept_no;

-- 4. List the department of each employee with the following information: 
--            employee number, last name, first name, and department name.
Select
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
From employees as e
Inner Join dept_emp as de
On de.emp_no=e.emp_no
Inner Join departments as d
On d.dept_no=de.dept_no
Order by e.emp_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
Select first_name, last_name
From Employees
Where first_name='Hercules' 
And last_name Like 'B%'
Order by last_name;

--6. List all employees in the Sales department, including their 
--    employee number, last name, first name, and department name.
Select 
	e.emp_no,
	e.last_name,
	e.first_name,
	dpt.dept_name
From employees as e
Inner Join dept_emp as demp
On e.emp_no=demp.emp_no
Inner Join departments as dpt
On dpt.dept_no=demp.dept_no
Where dpt.dept_name='Sales'
Order by e.emp_no;

--7. List all employees in the Sales and Development departments, including their 
--    employee number, last name, first name, and department name.
Select 
	e.emp_no,
	e.last_name,
	e.first_name,
	dpt.dept_name
From employees as e
Inner Join dept_emp as demp
On e.emp_no=demp.emp_no
Inner Join departments as dpt
On dpt.dept_no=demp.dept_no
Where dpt.dept_name in ('Sales','Development')
Order by e.emp_no;

--8. In descending order, list the frequency count of 
--  employee last names, i.e., how many employees share each last name.
Select last_name, Count(last_name) as "Last Name Count"
From employees
Group by last_name
Order by "Last Name Count" DESC;