SELECT
    u.user_id,
    u.user_name
FROM friends AS fk
JOIN users AS k
    ON fk.user_id = k.user_id
JOIN friends AS fh
    ON fk.friend_id = fh.friend_id
JOIN users AS h
    ON fh.user_id = h.user_id
JOIN users AS u
    ON fk.friend_id = u.user_id
WHERE k.user_name = 'Karl'
  AND h.user_name = 'Hans';
