# Audit Analytics Findings
**Project:** Financial Transactions Audit  
**Author:** Muslim Qatu  
**Date:** 2026-03-14 

---

## Overview
This project demonstrates analysis of financial transaction data to identify potential risks and anomalies. The dataset is randomized but simulates realistic scenarios such as:

- Transactions exceeding approval limits  
- Duplicate invoice payments  
- Transactions outside normal business hours  
- Payments to high-risk vendors  
- Split or unusually large transactions  

The goal of this project is to showcase practical SQL skills and the ability to analyze transactional data effectively.

---

## 1. Transactions Exceeding Approval Limits

**Objective:**  
Detect transactions approved by employees that exceed their assigned approval limits.

**Approach:**  
Joined transactions with employees and compared transaction amounts with approval limits.

**Findings:**  
- Identified transactions where the approved amount exceeded employee authorization limits.
- These cases may indicate control violations or lack of proper approval processes.

---

## 2. Duplicate Invoice Payments

**Objective:**  
Identify duplicate invoice numbers which may indicate duplicate or erroneous payments.

**Approach:**  
Grouped transactions by vendor and invoice number and filtered cases with multiple occurrences.

**Findings:**  
- Duplicate invoice records were detected.
- This may indicate duplicate payments or data entry errors.

---

## 3. Transactions Outside Business Hours

**Objective:**  
Detect transactions processed outside standard business hours (08:00 – 18:00).

**Approach:**  
Filtered transactions based on extracted hour from transaction time.

**Findings:**  
- Some transactions occurred outside normal working hours.
- These transactions may require further investigation as they could indicate unusual or unauthorized activity.

---

## 4. High-Risk Vendor Payments

**Objective:**  
Identify payments made to vendors classified as high risk.

**Approach:**  
Joined transactions with vendor data and filtered based on risk level.

**Findings:**  
- Transactions involving high-risk vendors were identified.
- These payments carry increased financial and compliance risk.

---

## 5. Large and Potentially Split Transactions

**Objective:**  
Detect large transactions and identify possible split payments used to bypass approval limits.

**Approach:**  
- Identified transactions exceeding a high-value threshold.
- Grouped transactions by employee, vendor, and date to detect multiple smaller payments.

**Findings:**  
- High-value transactions were identified.
- Potential split payments were detected where multiple transactions occurred on the same day between the same entities.

---

## Conclusion

This project demonstrates how SQL can be effectively used for audit analytics by:
- Detecting anomalies and unusual patterns
- Identifying control violations
- Supporting data quality and financial integrity checks

The analysis highlights the importance of data validation and monitoring in financial systems.