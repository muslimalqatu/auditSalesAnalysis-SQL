CREATE TABLE employees(
employee_id INT PRIMARY KEY,
employee_name TEXT,
department TEXT,
approval_limit INT
);

CREATE TABLE vendors(
vendor_id INT PRIMARY KEY,
vendor_name TEXT,
country TEXT,
risk_level TEXT
);

CREATE TABLE transactions(
transaction_id INT PRIMARY KEY,
transaction_date DATE,
transaction_time TIME,
amount INT,
vendor_id INT,
employee_id INT,
payment_method TEXT,
invoice_number INT
);