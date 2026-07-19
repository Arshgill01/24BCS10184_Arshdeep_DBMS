WITH transaction_gaps AS (
    SELECT
        transaction_id,
        transaction_timestamp,
        LAG(transaction_timestamp) OVER (
            PARTITION BY merchant_id, credit_card_id, amount
            ORDER BY transaction_timestamp
        ) AS previous_transaction_timestamp
    FROM transactions
)
SELECT
    COUNT(*) AS payment_count
FROM transaction_gaps
WHERE transaction_timestamp <= previous_transaction_timestamp + INTERVAL '10 minutes';
