WITH ranked_customers AS (
    SELECT
        customer_id,
        total_purchase_value,
        DENSE_RANK() OVER (ORDER BY total_purchase_value DESC) AS customer_rank
    FROM customer_purchase
)
SELECT
    customer_id,
    total_purchase_value,
    customer_rank
FROM ranked_customers
WHERE customer_rank <= 5
ORDER BY customer_rank ASC, total_purchase_value DESC;
