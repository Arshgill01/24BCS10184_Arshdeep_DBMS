# DBMS Experiments

Name: Arshdeep Singh

UID: 24BCS10184

## Experiment Index and Coverage Audit

Compared on **2026-10-09** against [RICH-KEED/24BCS10039_ABHINEET_ADBMS](https://github.com/RICH-KEED/24BCS10039_ABHINEET_ADBMS/tree/9d579d352a3d9ae6eae24cc03ff01babf52893d0), pinned to commit `9d579d352a3d9ae6eae24cc03ff01babf52893d0`.

Coverage is based on question content, not matching directory names: several earlier experiments combine multiple reference tasks in one README. This reference is not an official assignment specification, so this comparison cannot establish whether the instructor assigned additional tasks.

| Experiment | Documentation | Coverage against reference |
| --- | --- | --- |
| 1 | [Insert and retrieve records](experiment1/experiment.md) | Both insertion and retrieval sections present. Retrieval explicitly selects ID 1 rather than relying on unordered `LIMIT 1`. |
| 2 | [Set operations](experiment2/README.md) | All 4 tasks present; local `EXCEPT` and `INTERSECT` section order differs from reference task order. |
| 3 | [Aggregate functions and CASE](experiment3/README.md) | All 4 tasks covered after correcting the salary `HAVING` condition and adding the student count/average question appended to reference Task 2. |
| 4 | [JOIN operations](experiment4/README.md) | All 6 reference task intents covered, including the explicit two-column customer-name/order-date query. Additional local join exercises retained. |
| 5 | [Filtering and aggregates](experiment5/README.md), [Task 3](experiment5/task3/Experiment.md) | All 3 tasks present; Task 3 is now linked from the summary. |
| 6 | [Task 1](experiment6/task1/Experiment.md), [Task 2](experiment6/task2/Experiment.md) | Both view/materialized-view tasks present. |
| 7 | [Task 1](experiment7/TASK-1/Experiment.md) | The reference contains **only Task 1**. No additional task is missing relative to that commit. Requires Oracle PL/SQL. |
| 8 | [Task 1](experiment8/TASK-1/Experiment.md) | The reference contains **only Task 1**. Procedure, reference screenshot, and local regression tests added. Requires PostgreSQL 14+. |

## Audit Corrections

- Corrected copied name/UID headers in Experiment 5 Task 3, both Experiment 6 tasks, and Experiment 7 Task 1.
- Corrected Experiment 3's salary condition from **exactly one** qualifying employee to **at least one**, restoring Bangalore alongside Mumbai for the supplied employee dataset.
- Added the missing student count and average marks query grouped by city to Experiment 3.
- Replaced three broken Experiment 3 image embeds with explicit screenshot-pending notices. No output images were fabricated or substituted.
- Linked the existing Experiment 4 screenshots and documented the exact projection required by reference Task 1.
- Added Experiment 8 from the pinned reference, with attribution and an explanation that a missing employee raises an exception rather than returning a status row.

## Validation Performed

- Ran [Experiment 8 regression tests](experiment8/TASK-1/tests.sql) on an isolated PostgreSQL **14.19** cluster. Checked the sample salary update, returned parameters, repeated/decimal increments, zero increment, unaffected rows, and the missing-employee exception. The test transaction rolls back all objects/data; the temporary cluster was stopped and removed after validation.
- Saved [actual local PostgreSQL test output](experiment8/TASK-1/validation-output.txt). This is separate from the borrowed reference screenshot.
- Ran Experiment 3's employee setup and corrected `HAVING` query in an in-memory SQLite database: qualifying cities were Bangalore and Mumbai.
- Checked the added student aggregate and two-column customer/order join using synthetic SQLite fixtures. These checks validate those queries, not the original classroom datasets or screenshot outputs.
- Checked experiment Markdown local links and documented Experiment 8 SQL against `task.sql`; all resolved/matched. Checked whitespace with `git diff --check`.
- Experiment 7 was reviewed statically only: no Oracle runtime is available here. Earlier exercises were compared for task coverage, not comprehensively re-executed.

## Remaining Evidence / Environment Limitations

- **Experiment 1:** a screenshot exists in its folder but is not embedded in the write-up.
- **Experiment 2 §2.2:** actual source rows, output, and screenshot are still pending; the query/task is present.
- **Experiment 3:** screenshots `3.1.png`, `3.3.png`, and `3.4.png` are absent. §3.2 also lacks classroom execution output/screenshots. The student query requires the existing `students(city, marks)` dataset.
- **Experiment 5 Task 3:** the supplied screenshot shows code, not the emitted notice. Only positive sample input `4` is documented; the inherited `ELSE` misclassifies zero/negative inputs as greater than 20, so the exercise assumes positive input.
- **Experiment 7:** cursor fetch order is unspecified without `ORDER BY`, and the zero-salary exception stops further processing rather than skipping the row. Enable DBMS output in Oracle to see the message.
- Screenshots inherited from the reference in Experiments 5 Task 3, 6, 7, and 8 are credited as reference material, not claimed as new executions under this student's account.
- Practice/normalization files and unrelated homework were not changed or included in the experiment update.
