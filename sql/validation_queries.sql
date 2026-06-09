-- SQL validation queries for the Power BI Payments KPI Dashboard
-- These queries are written as if the CSV had been loaded into a table called Payments.

-- 1. Total payments
SELECT COUNT(*) AS total_payments
FROM Payments;

-- 2. Payments by status
SELECT
    Status,
    COUNT(*) AS payment_count
FROM Payments
GROUP BY Status
ORDER BY payment_count DESC;

-- 3. Failed payments and failure rate
SELECT
    COUNT(*) AS total_payments,
    SUM(CASE WHEN Status = 'Failed' THEN 1 ELSE 0 END) AS failed_payments,
    1.0 * SUM(CASE WHEN Status = 'Failed' THEN 1 ELSE 0 END) / COUNT(*) AS failure_rate
FROM Payments;

-- 4. Total amount
SELECT
    SUM(Amount) AS total_amount
FROM Payments;

-- 5. Failure rate by channel
SELECT
    Channel,
    COUNT(*) AS total_payments,
    SUM(CASE WHEN Status = 'Failed' THEN 1 ELSE 0 END) AS failed_payments,
    1.0 * SUM(CASE WHEN Status = 'Failed' THEN 1 ELSE 0 END) / COUNT(*) AS failure_rate
FROM Payments
GROUP BY Channel
ORDER BY failure_rate DESC;

-- 6. Errors by type
SELECT
    ErrorType,
    COUNT(*) AS payment_count
FROM Payments
WHERE ErrorType <> 'None'
GROUP BY ErrorType
ORDER BY payment_count DESC;

-- 7. SLA breach rate
SELECT
    COUNT(*) AS total_payments,
    SUM(CASE WHEN SLAStatus = 'Breached SLA' THEN 1 ELSE 0 END) AS sla_breaches,
    1.0 * SUM(CASE WHEN SLAStatus = 'Breached SLA' THEN 1 ELSE 0 END) / COUNT(*) AS sla_breach_rate
FROM Payments;

-- 8. Monthly trend
SELECT
    SUBSTR(PaymentDate, 1, 7) AS payment_month,
    COUNT(*) AS total_payments,
    SUM(CASE WHEN Status = 'Failed' THEN 1 ELSE 0 END) AS failed_payments,
    SUM(Amount) AS total_amount
FROM Payments
GROUP BY SUBSTR(PaymentDate, 1, 7)
ORDER BY payment_month;
