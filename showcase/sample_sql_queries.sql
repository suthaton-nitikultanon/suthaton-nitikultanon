-- Query failed transactions grouped by error code
SELECT error_code, COUNT(*) AS failure_count
FROM transaction_logs
WHERE status = 'FAILED'
GROUP BY error_code;

-- Query SLA breaches for transactions exceeding 10 seconds
SELECT transaction_id, processing_time_sec
FROM transaction_logs
WHERE processing_time_sec > 10;
