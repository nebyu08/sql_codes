use window_ops;

CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);

INSERT INTO employees (department, salary) VALUES
('engineering', 80000),
('engineering', 69000),
('engineering', 70000),
('engineering', 103000),
('engineering', 67000),
('engineering', 89000),
('engineering', 91000),
('sales', 59000),
('sales', 70000),
('sales', 159000),
('sales', 72000),
('sales', 60000),
('sales', 61000),
('sales', 61000),
('customer service', 38000),
('customer service', 45000),
('customer service', 61000),
('customer service', 40000),
('customer service', 31000),
('customer service', 56000),
('customer service', 55000);

#the over operation

select 
	department,
    salary,
    min(salary) over(),
    max(salary) over()  from employees;
    
select department,
	   salary,
       avg(salary) over()
from employees;

#over and partition operation
select emp_no, 
	department, 
	salary,
	sum(salary) over() as total_payroll , 
	sum(salary) over(partition by department) as depart_payroll from employees;

select department,avg(salary) over(partition by department) from employees;

#lets sum over windows and order them
select emp_no,department,salary,
sum(salary) over(partition by department order by salary) as rolling_department,
sum(salary) over(partition by department) as total_dept_salary
from employees;