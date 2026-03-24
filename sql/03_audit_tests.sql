-- =====================================================
-- Audit Analytics Tests
-- Project: Financial Transactions Audit
-- =====================================================

-- =====================================================
-- Test 1: Transactions Exceeding Approval Limits
-- Description: Identify transactions where employees
-- approved amounts greater than their authorization limit
-- =====================================================

SELECT
t.transaction_id,
t.amount,
e.employee_name,
e.approval_limit,
(t.amount - e.approval_limit) AS exceeded_amount
FROM transactions t
JOIN employees e
ON t.employee_id = e.employee_id
WHERE t.amount > e.approval_limit;

-- =====================================================
-- Test 2: Duplicate Invoice Payments
-- Description: Identify duplicate invoice numbers which
-- may indicate duplicate payments
-- =====================================================

SELECT
vendor_id,
invoice_number,
COUNT(*) AS duplicate_count,
SUM(amount) AS total_paid
FROM transactions
GROUP BY vendor_id, invoice_number
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;

-- =====================================================
-- Test 3: Transactions Outside Business Hours
-- Description: Identify transactions that occurred outside
-- normal business hours (08:00 - 18:00)
-- =====================================================

SELECT
transaction_id,
transaction_date,
transaction_time,
employee_id,
amount
FROM transactions
WHERE EXTRACT(HOUR FROM transaction_time) < 8
   OR EXTRACT(HOUR FROM transaction_time) >= 18
ORDER BY transaction_time;

-- =====================================================
-- Test 4: High-Risk Vendor Payments
-- Description: Identify all transactions involving vendors
-- classified as 'High' risk
-- =====================================================

SELECT
t.transaction_id,
t.transaction_date,
t.amount,
v.vendor_name,
v.risk_level
FROM transactions t
JOIN vendors v
ON t.vendor_id = v.vendor_id
WHERE v.risk_level = 'High'
ORDER BY amount DESC;

-- =====================================================
-- Test 5: Split Payments / Large Transactions
-- Description: Identify transactions over a high threshold
-- and detect potential multiple payments that might be
-- split to bypass approval limits
-- =====================================================

-- Large transactions over a certain threshold (e.g., 10,000)
SELECT
transaction_id,
transaction_date,
employee_id,
amount
FROM transactions
WHERE amount >= 10000
ORDER BY amount DESC;

-- Potential split payments: same employee, same vendor, same date, multiple transactions
SELECT
employee_id,
vendor_id,
transaction_date,
COUNT(*) AS transaction_count,
SUM(amount) AS total_amount
FROM transactions
GROUP BY employee_id, vendor_id, transaction_date
HAVING COUNT(*) > 1 AND SUM(amount) >= 10000
ORDER BY total_amount DESC;
