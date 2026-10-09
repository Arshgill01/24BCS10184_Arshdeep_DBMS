\set ON_ERROR_STOP on

BEGIN;
CREATE SCHEMA experiment8_validation;
SET LOCAL search_path TO experiment8_validation;

\ir task.sql

DO $$
DECLARE
    updated_salary NUMERIC;
    status VARCHAR;
    missing_employee_raised BOOLEAN := FALSE;
BEGIN
    IF (SELECT salary FROM employee WHERE emp_id = 101) IS DISTINCT FROM 55000.00 THEN
        RAISE EXCEPTION 'Sample call did not persist salary 55000.00';
    END IF;

    IF (SELECT salary FROM employee WHERE emp_id = 102) IS DISTINCT FROM 60000.00
       OR (SELECT salary FROM employee WHERE emp_id = 103) IS DISTINCT FROM 55000.00 THEN
        RAISE EXCEPTION 'Sample call changed another employee';
    END IF;

    updated_salary := 1250.50;
    CALL update_sal_proc1(101, updated_salary, status);
    IF updated_salary IS DISTINCT FROM 56250.50 OR status IS DISTINCT FROM 'SUCCESS'
       OR (SELECT salary FROM employee WHERE emp_id = 101) IS DISTINCT FROM updated_salary THEN
        RAISE EXCEPTION 'Repeated/decimal increment or returned parameters are incorrect';
    END IF;

    updated_salary := 0;
    CALL update_sal_proc1(102, updated_salary, status);
    IF updated_salary IS DISTINCT FROM 60000.00 OR status IS DISTINCT FROM 'SUCCESS'
       OR (SELECT salary FROM employee WHERE emp_id = 102) IS DISTINCT FROM 60000.00 THEN
        RAISE EXCEPTION 'Zero increment changed the employee salary or returned parameters';
    END IF;

    BEGIN
        updated_salary := 5000;
        CALL update_sal_proc1(999, updated_salary, status);
    EXCEPTION
        WHEN raise_exception THEN
            IF SQLERRM <> 'Employee Not Found' THEN
                RAISE;
            END IF;
            missing_employee_raised := TRUE;
    END;

    IF NOT missing_employee_raised THEN
        RAISE EXCEPTION 'Missing employee did not raise the expected exception';
    END IF;

    IF (SELECT COUNT(*) FROM employee) <> 3
       OR (SELECT salary FROM employee WHERE emp_id = 101) IS DISTINCT FROM 56250.50
       OR (SELECT salary FROM employee WHERE emp_id = 102) IS DISTINCT FROM 60000.00
       OR (SELECT salary FROM employee WHERE emp_id = 103) IS DISTINCT FROM 55000.00 THEN
        RAISE EXCEPTION 'Unexpected employee data after regression tests';
    END IF;

    RAISE NOTICE 'Experiment 8 regression tests passed';
END;
$$;

ROLLBACK;
