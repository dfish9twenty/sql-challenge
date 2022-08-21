--List the employee number, last name, first name, sex, and salary of each employee
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
FROM employees, salaries
WHERE employees.emp_no = salaries.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT * FROM employees
WHERE hire_date BETWEEN'1986-01-01' AND '1986-12-31'

--List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT dept.dept_no, dept.dept_name, d.emp_no, e.last_name, e.first_name
FROM dept_manager As d
JOIN employees As e ON d.emp_no = e.emp_no
JOIN departments As dept ON dept.dept_no = d.dept_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT d.emp_no, e.last_name, e.first_name, dept.dept_name 
FROM employees As e
LEFT JOIN dept_manager As d ON d.emp_no = e.emp_no
RIGHT JOIN departments As dept ON dept.dept_no = d.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'; 

--List each employee in the Sales department, including their employee number, last name, and first name
SELECT d.emp_no, e.last_name, e.first_name, dept.dept_name 
FROM employees As e
LEFT JOIN dept_manager As d ON d.emp_no = e.emp_no
RIGHT JOIN departments As dept ON dept.dept_no = d.dept_no
WHERE dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT d.emp_no, e.last_name, e.first_name, dept.dept_name 
FROM employees As e
LEFT JOIN dept_manager As d ON d.emp_no = e.emp_no
RIGHT JOIN departments As dept ON dept.dept_no = d.dept_no
WHERE dept.dept_name = 'Sales' OR dept.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, COUNT(last_name) As "lastname_count"
FROM employees
GROUP BY last_name
ORDER BY "lastname_count" DESC;