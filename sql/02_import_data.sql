COPY employees
FROM '../data/employees.csv'
DELIMITER ','
CSV HEADER;

COPY vendors
FROM '../data/vendors.csv'
DELIMITER ','
CSV HEADER;

COPY transactions
FROM '../data/transactions.csv'
DELIMITER ','
CSV HEADER;