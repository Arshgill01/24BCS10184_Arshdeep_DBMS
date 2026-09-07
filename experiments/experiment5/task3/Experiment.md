# Experiment 5 - Task 3

Name: ABHINEET

UID: 24BCS10039

## Aim

To classify a number into a range using a PL/pgSQL DO block and conditional statements.

## Question

Write a PL/pgSQL block to check the value of `VAL` and display whether it lies between 1 to 10, 11 to 20, or is greater than 20.

## SQL Queries Used

```sql
DO $$
DECLARE
    VAL INT := 4;
BEGIN
    IF VAL > 0 AND VAL <= 10 THEN
        RAISE NOTICE 'YOUR VALUE IS % AND RANGE IS BETWEEN 1 TO 10', VAL;
    ELSIF VAL > 10 AND VAL <= 20 THEN
        RAISE NOTICE 'YOUR VALUE IS % AND RANGE IS BETWEEN 11 TO 20', VAL;
    ELSE
        RAISE NOTICE 'YOUR VALUE IS % AND VALUE IS GREATER THAN 20', VAL;
    END IF;
END;
$$;
```

## Output

```text
YOUR VALUE IS 4 AND RANGE IS BETWEEN 1 TO 10
```

## Output Screenshot

![Experiment 5 Task 3 Output](image.png)

## Image Explanation

The screenshot shows a PL/pgSQL DO block with a declared integer value of 4. The IF statement checks the range of the value and displays the matching notice message for the 1 to 10 range.

## Result

The number was successfully classified using conditional logic, and the appropriate notice message was displayed.
