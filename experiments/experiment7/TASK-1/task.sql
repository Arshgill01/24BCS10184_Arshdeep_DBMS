CREATE TABLE employee (
    emp_id NUMBER PRIMARY KEY,
    salary NUMBER
);

INSERT INTO employee VALUES (1, 5000);
INSERT INTO employee VALUES (2, 0);
INSERT INTO employee VALUES (3, 7000);


DECLARE
    CURSOR emp_cursor IS 
        SELECT emp_id, salary FROM employee;

    v_emp_id   employee.emp_id%TYPE;
    v_salary   employee.salary%TYPE;

    salary_zero EXCEPTION;
BEGIN
    OPEN emp_cursor;
    FETCH emp_cursor INTO v_emp_id, v_salary;

    WHILE emp_cursor%FOUND LOOP
        IF v_salary = 0 THEN
            RAISE salary_zero;
        END IF;

        UPDATE employee
        SET salary = v_salary * 1.10   
        WHERE emp_id = v_emp_id;

        FETCH emp_cursor INTO v_emp_id, v_salary;
    END LOOP;

    CLOSE emp_cursor;

EXCEPTION
    WHEN salary_zero THEN
        DBMS_OUTPUT.PUT_LINE('Salary is zero. Increment not possible.');
END;
/
