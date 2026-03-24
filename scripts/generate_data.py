import pandas as pd
import random
import os
from datetime import datetime, timedelta

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DATA_FOLDER = os.path.join(BASE_DIR, "data")

employees = []

for i in range(1, 21):
    employees.append({
        "employee_id": i,
        "employee_name": f"Employee_{i}",
        "department": random.choice(["Finance", "Procurement", "Operations"]),
        "approval_limit": random.choice([1000, 5000, 10000])
    })

employees_df = pd.DataFrame(employees)

vendors = []

for i in range(1, 31):
    vendors.append({
        "vendor_id": i,
        "vendor_name": f"Vendor_{i}",
        "country": random.choice(["USA", "UK", "UAE", "Germany", "Jordan"]),
        "risk_level": random.choice(["Low", "Medium", "High"])
    })

vendors_df = pd.DataFrame(vendors)

transactions = []

start_date = datetime(2024, 1, 1)

for i in range(1, 1001):

    date = start_date + timedelta(days=random.randint(0, 365))

    transactions.append({
        "transaction_id": i,
        "transaction_date": date.date(),
        "transaction_time": f"{random.randint(0,23)}:{random.randint(0,59)}",
        "amount": random.randint(100, 20000),
        "vendor_id": random.randint(1, 30),
        "employee_id": random.randint(1, 20),
        "payment_method": random.choice(["Bank Transfer", "Cash", "Credit Card"]),
        "invoice_number": random.randint(10000, 20000)
    })

transactions_df = pd.DataFrame(transactions)

employees_df.to_csv(os.path.join(DATA_FOLDER, "employees.csv"), index=False)
vendors_df.to_csv(os.path.join(DATA_FOLDER, "vendors.csv"), index=False)
transactions_df.to_csv(os.path.join(DATA_FOLDER, "transactions.csv"), index=False)

print("Dataset generated successfully")