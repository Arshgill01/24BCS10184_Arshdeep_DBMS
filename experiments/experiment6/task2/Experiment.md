# Experiment 6 - Task 2

Name: ABHINEET

UID: 24BCS10039

## Aim

To create materialized views that store selected employee details based on the employee's city.

## Question

Create an `employees` table, insert employee records, and create two materialized views named `M1` and `M2` containing the employees who live in Delhi. Display the records from both views.

## SQL Queries Used

```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    emp_salary DECIMAL(10, 2) NOT NULL,
    emp_city VARCHAR(100) NOT NULL
);

INSERT INTO employees (emp_id, emp_name, emp_salary, emp_city) VALUES
(101, 'Amit Sharma', 85000.00, 'Mumbai'),
(102, 'Priya Patel', 95000.00, 'Mumbai'),
(103, 'Rahul Verma', 60000.00, 'Delhi'),
(104, 'Ananya Iyer', 110000.00, 'Bangalore'),
(105, 'Vikram Singh', 55000.00, 'Delhi'),
(106, 'Sneha Reddy', 105000.00, 'Bangalore'),
(107, 'Rohan Das', 72000.00, 'Kolkata');

CREATE MATERIALIZED VIEW M1 AS
SELECT emp_id, emp_name, emp_city FROM employees
WHERE emp_city = 'Delhi'
WITH DATA;

SELECT * FROM M1;

CREATE MATERIALIZED VIEW M2 AS
SELECT emp_id, emp_name, emp_city FROM employees
WHERE emp_city = 'Delhi'
WITH DATA;

SELECT * FROM M2;
```

## Output

```text
CREATE TABLE
INSERT 0 7
SELECT 2

 emp_id |  emp_name   | emp_city
--------+-------------+----------
    103 | Rahul Verma | Delhi
    105 | Vikram Singh| Delhi
(2 rows)

SELECT 2

 emp_id |  emp_name   | emp_city
--------+-------------+----------
    103 | Rahul Verma | Delhi
    105 | Vikram Singh| Delhi
(2 rows)
```

## Output Screenshot

![Experiment 6 Task 2 Output](image.png)

## Image Explanation

The screenshot shows the creation of the `employees` table and insertion of seven employee records. The materialized views `M1` and `M2` filter the records using `emp_city = 'Delhi'`. Both views display Rahul Verma and Vikram Singh, who are the two employees from Delhi.

## Result

The materialized views `M1` and `M2` were successfully created and displayed the two employees whose city is Delhi.
