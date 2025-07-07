# SQL Sample Queries for Payment Operations

This document contains sample SQL queries I have used in payment operations work, such as transaction monitoring, SLA monitoring, and incident analysis. These examples show how I analyze payment data to improve service quality, detect issues early, and support business decisions.

---

## 1. Failed Payment Transactions in Last 7 Days

This query counts the number of failed transactions in the last 7 days.

```sql
SELECT COUNT(*) AS failed_txn_count
FROM transactions
WHERE status = 'FAIL'
  AND created_at >= CURRENT_DATE - INTERVAL '7 day';
SELECT error_code, COUNT(*) AS count
FROM transactions
WHERE status = 'FAIL'
GROUP BY error_code
ORDER BY count DESC
LIMIT 5;
SELECT
  DATE(created_at) AS txn_date,
  COUNT(*) AS total_txns,
  SUM(CASE WHEN status = 'SUCCESS' THEN 1 ELSE 0 END) AS success_txns,
  ROUND(
    SUM(CASE WHEN status = 'SUCCESS' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    2
  ) AS success_rate_pct
FROM transactions
WHERE created_at >= CURRENT_DATE - INTERVAL '30 day'
GROUP BY DATE(created_at)
ORDER BY txn_date;
SELECT
  AVG(processing_time_ms) AS avg_processing_time_ms
FROM transactions
WHERE status = 'SUCCESS'
  AND created_at >= CURRENT_DATE - INTERVAL '30 day';
SELECT
  DATE(created_at) AS txn_date,
  ROUND(AVG(processing_time_ms), 2) AS avg_processing_time_ms
FROM transactions
WHERE status = 'SUCCESS'
  AND created_at >= CURRENT_DATE - INTERVAL '30 day'
GROUP BY DATE(created_at)
ORDER BY txn_date;
SELECT
  COUNT(*) AS sla_breach_count
FROM transactions
WHERE status = 'SUCCESS'
  AND processing_time_ms > 2000
  AND created_at >= CURRENT_DATE - INTERVAL '7 day';
SELECT
  DATE(created_at) AS txn_date,
  error_code,
  COUNT(*) AS error_count
FROM transactions
WHERE status = 'FAIL'
  AND created_at >= CURRENT_DATE - INTERVAL '14 day'
GROUP BY DATE(created_at), error_code
ORDER BY txn_date, error_code;
SELECT
  DATE(created_at) AS txn_date,
  COUNT(*) AS total_txns,
  SUM(CASE WHEN status = 'FAIL' THEN 1 ELSE 0 END) AS failed_txns,
  ROUND(
    SUM(CASE WHEN status = 'FAIL' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    2
  ) AS error_rate_pct
FROM transactions
WHERE created_at >= CURRENT_DATE - INTERVAL '30 day'
GROUP BY DATE(created_at)
ORDER BY txn_date;
SELECT
  error_code,
  COUNT(*) AS fail_count
FROM transactions
WHERE status = 'FAIL'
  AND created_at >= CURRENT_DATE - INTERVAL '30 day'
GROUP BY error_code
ORDER BY fail_count DESC
LIMIT 3;
