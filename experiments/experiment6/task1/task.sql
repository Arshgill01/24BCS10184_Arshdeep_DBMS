CREATE TABLE employee (
   employee_id INT,
   first_name VARCHAR(50),
   last_name VARCHAR(50),
   department VARCHAR(50),
   salary INT
);
INSERT INTO employee VALUES
(1, 'John', 'Smith', 'Sales', 50000),
(2, 'Alice', 'Johnson', 'Marketing', 55000);

CREATE VIEW employee_view AS
SELECT employee_id, first_name, last_name, department
FROM employee;

select * from employee_view;

delete from employee_view
where employee_id = 1;

select * from employee_view;