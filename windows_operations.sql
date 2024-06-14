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

select emp_no,department,salary,
avg(salary) over(partition by department order by salary) as rolling_department,
avg(salary) over(partition by department) as total_salary
from employees;

select emp_no,department,salary,min(salary) 
over(partition by department order by salary) as min_salary  from employees;

select department,salary,
	 rank() over(partition by department order by salary), 
	 rank() over(order by salary)
 from employees;
 
 select department,salary, 
 rank() over(partition by department order by salary) as dep_rank ,
 rank() over(order by salary desc) as over_all_rank 
 from employees;
 
select department,salary, 
	rank() over(partition by department order by salary desc ) as dep_rank,
	row_number() over(partition by department order by salary desc) as row_num ,
	 rank() over(order by salary desc) as over_all_rank,
	 dense_rank() over(order by salary desc) as over_all_rank_dense_rank  
	 from employees order by over_all_rank;
     
select department,
	salary, 
	rank() over(partition by department order by salary desc ) as dep_rank,
	row_number() over(partition by department order by salary desc) as row_num , 
	rank() over(order by salary desc) as over_all_rank,
	dense_rank() over(order by salary desc) as over_all_rank_dense_rank,
	row_number() over(order by salary desc) as overall_row_num
from employees order by over_all_rank;
 
 #quartile operations
 select emp_no, 
 department, 
 salary,
 ntile(4) over(partition by department order by salary desc) as dep_court,
 ntile(4) over(order by salary desc ) as order_sal  from employees order by department;
 
 #selecting the higest value from the rows
 select department, 
 emp_no, salary, 
 first_value(emp_no) over(order by salary desc) as fs_value from employees;
 
 #just another exmaple;
 select department,
 first_value(emp_no) over (partition by department) as high_part_id from employees;
 
 #higest paid person in a department using windows
 select emp_no,department,first_value(emp_no) over (partition by department order by salary desc) as high_part_id from employees;
 
 #highest paid in id terms again in comparision with the overall and department
 select emp_no,
 department,
 first_value(emp_no) over (partition by department order by salary desc) as highest_paid_depart,
 first_value(emp_no) over(order by salary desc) as highes_paid_overall  from employees;
 
 #for determining the nth value
 select emp_no,
 department,
 nth_value(emp_no,2) over (partition by department order by salary desc) as highest_paid_depart,
 nth_value(emp_no,2) over(order by salary desc) as highes_paid_overall  from employees;
 
 #more opertions we can do
 select emp_no, 
 department,
 salary ,
 lag(salary) over(order by salary desc) from employees;
 
 select emp_no,
 department,
 salary,
 salary-lag(salary) over(order by salary desc) as diff_salary
 from employees; 
 
 #the leading salary
  select emp_no, 
  department,
  salary ,
  lead(salary) over(order by salary desc) as leadn from employees;
  
  #lets use it in windows opertaion
   select emp_no,
   department,
   salary,
   lag(salary) over(partition by department order by salary desc) as lag_part  from employees;
   
   #more ops on window opa,leads and lags
   select emp_no,
   department,
   salary,
   salary-lag(salary) over(partition by department order by salary desc) as dep_salary_diff  from employees;