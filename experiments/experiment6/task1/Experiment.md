# Experiment 6 - Task 1

Name: Arshdeep Singh

UID: 24BCS10184

## Aim

To create a view for selected employee details and delete a record through the view.

## Question

Create an `employee` table, insert employee records, create a view displaying employee details except salary, and delete the employee whose `employee_id` is 1 through the view.

## SQL Queries Used

```sql
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
```

## Output

```text
CREATE TABLE
INSERT 0 2
CREATE VIEW

 employee_id | first_name | last_name | department
-------------+------------+-----------+------------
			  1 | John       | Smith     | Sales
			  2 | Alice      | Johnson   | Marketing
(2 rows)

DELETE 1

 employee_id | first_name | last_name | department
-------------+------------+-----------+------------
			  2 | Alice      | Johnson   | Marketing
(1 row)
```

## Output Screenshot

Reference screenshot from [Abhineet's Experiment 6 Task 1](https://github.com/RICH-KEED/24BCS10039_ABHINEET_ADBMS/tree/9d579d352a3d9ae6eae24cc03ff01babf52893d0/EXPERIMENTS/EXPERIMENT-6/TASK-1), not a new local execution.

![Experiment 6 Task 1 Output](image.png)

## Image Explanation

The screenshot shows the creation of the `employee` table and `employee_view`. The first query displays both employees. The delete query removes the employee with `employee_id` 1, and the final query displays only Alice Johnson from the Marketing department.

## Result

The view was successfully created, and the employee record with `employee_id` 1 was successfully deleted through the view.
