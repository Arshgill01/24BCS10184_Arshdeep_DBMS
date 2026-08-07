# Experiment 5 — SQL Filtering and Aggregate Calculations

## Objective

To write SQL queries that filter records using string-length conditions and calculate a percentage contribution from aggregate values.

> **Evidence:** The supplied screenshots show an accepted LeetCode submission for **5.1** and a successful CodeChef result for **5.2**.

## Summary

| Subpart | SQL concepts | Purpose |
| --- | --- | --- |
| 5.1 | `SELECT`, `WHERE`, `LENGTH()` | Find tweet IDs whose content exceeds 15 characters. |
| 5.2 | `SUM()`, `CASE`, `ROUND()` | Calculate the percentage of total order revenue contributed by American cuisine. |

---

## 5.1 — Invalid Tweets

### Objective

Find the IDs of tweets whose content is strictly longer than 15 characters.

### Task

Given the `Tweets` table, return the `tweet_id` of each invalid tweet. A tweet is invalid when the number of characters in `content` is greater than `15`.

### Input columns

| Table | Relevant columns |
| --- | --- |
| `Tweets` | `tweet_id`, `content` |

### Sample input

| tweet_id | content |
| ---: | --- |
| 1 | Let us Code |
| 2 | More than fifteen chars are here! |

### SQL Query

```sql
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;
```

### Output

| tweet_id |
| ---: |
| 2 |

### Result

`LENGTH(content)` returns the number of characters in each tweet. The `WHERE` clause retains only content longer than 15 characters, so tweet `2` is returned. The submitted MySQL solution was accepted with all 22 test cases passing.

---

## 5.2 — American Cuisine Revenue Percentage

### Objective

Find the percentage of total order revenue contributed by American cuisine, rounded to two decimal places.

### Task

Use the `Orders` table to calculate the percentage of the total `price` value for rows where `cuisine` is `American`. Alias the calculated value as `American_Revenue`.

### Input columns

| Table | Relevant columns |
| --- | --- |
| `Orders` | `order_id`, `item_name`, `cuisine`, `category`, `price`, `status` |

### SQL Query

```sql
SELECT
    ROUND(
        100.0 * SUM(CASE WHEN cuisine = 'American' THEN price ELSE 0 END) / SUM(price),
        2
    ) AS American_Revenue
FROM Orders;
```

### Output

| American_Revenue |
| ---: |
| 27.75 |

### Result

The `CASE` expression includes prices only for American-cuisine orders in the numerator, while `SUM(price)` calculates the revenue across all orders. Multiplying by `100.0` converts the ratio to a percentage, and `ROUND(..., 2)` produces the required two-decimal-place result.

---

## Overall Result

Both Experiment 5 queries produced the expected results: invalid tweet ID `2` was identified in 5.1, and the American cuisine revenue contribution was calculated as `27.75%` in 5.2.
