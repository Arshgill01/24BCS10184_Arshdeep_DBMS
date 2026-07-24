# Experiment 3 — Aggregate Functions and `CASE`

## 3.1 — Counting with CASE

### Objective
To use a `CASE` expression inside `COUNT` to count students who scored more than 80 marks in each department.

### Concept
`CASE` evaluates the condition for each row in the `student` table:

- If `Marks > 80`, the expression returns `1`.
- Otherwise, it returns `NULL`.
- `COUNT` counts the `1` values and ignores `NULL` values.

### Task
Write a query to count the number of students in each department who scored more than 80 marks. Alias the count column as `Dept_HighScore_Count`.

### Input
The `student` table uses the following columns:

| Column | Description |
| --- | --- |
| `St_id` | Student identifier |
| `St_name` | Student name |
| `Marks` | Student's marks |
| `Department` | Student's department |

### SQL Query
```sql
/* Write a query to count the number of students across departments who has scored more than 80 marks.*/
SELECT department, 
COUNT(CASE WHEN Marks > 80 THEN 1 ELSE NULL END) AS Dept_HighScore_Count
FROM student
GROUP BY department;
```

### Output

| department | Dept_HighScore_Count |
| --- | ---: |
| Biology | 0 |
| English | 0 |
| History | 3 |
| Math | 4 |
| Physics | 4 |

### Result
The query correctly counts only students with `Marks` greater than 80 within each `department` group.

### Screenshot
![Count using CASE task and output](3.1.png)

## 3.2 — Employee Aggregate Functions

### Objective
Use `COUNT`, `SUM`, and `AVG` aggregate functions with `GROUP BY`, `ORDER BY`, `HAVING`, and `DISTINCT` on employee data.

### Questions Covered
The following are multiple related SQL questions:

1. Count employees in each city.
2. Sort the city-wise employee counts in ascending and descending order; when counts are equal, sort city names alphabetically.
3. Count employees in each city whose salary is at least `90000`.
4. Find cities with exactly one employee whose salary is at least `90000`.
5. Find the average employee salary for each city.
6. List the distinct cities and count them.

### SQL Setup and Queries
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

-- 1. Count employees in each city.
SELECT emp_city, COUNT(*) AS employee_count
FROM employees
GROUP BY emp_city;

-- 2(a). Sort city-wise employee counts in ascending order.
SELECT emp_city, COUNT(*) AS employee_count
FROM employees
GROUP BY emp_city
ORDER BY employee_count ASC, emp_city ASC;

-- 2(b). Sort city-wise employee counts in descending order.
SELECT emp_city, COUNT(*) AS employee_count
FROM employees
GROUP BY emp_city
ORDER BY employee_count DESC, emp_city ASC;

-- 3. Count employees earning at least 90000 in each city.
SELECT emp_city,
       SUM(CASE WHEN emp_salary >= 90000 THEN 1 ELSE 0 END) AS high_salary_employee_count
FROM employees
GROUP BY emp_city;

-- 4. Find cities with exactly one employee earning at least 90000.
SELECT emp_city
FROM employees
GROUP BY emp_city
HAVING SUM(CASE WHEN emp_salary >= 90000 THEN 1 ELSE 0 END) = 1;

-- 5. Find the average employee salary for each city.
SELECT emp_city, CAST(AVG(emp_salary) AS DECIMAL(20, 2)) AS average_salary
FROM employees
GROUP BY emp_city;

-- 6(a). List distinct employee cities.
SELECT DISTINCT emp_city
FROM employees;

-- 6(b). Count distinct employee cities.
SELECT COUNT(DISTINCT emp_city) AS city_count
FROM employees;
```

### Result
The queries group employee records by city, apply aggregate calculations, filter aggregate results with `HAVING`, and return distinct city values. No screenshot is included for §3.2.