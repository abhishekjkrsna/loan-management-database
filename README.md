# Loan Management Database

This project provides a database schema and structure designed to effectively track and manage loan information. Do star this project. Created by Abhishek Jhingran: abhishekjhingran7@gmail.com

## Key Features

* **Loan Tracking:** The core functionality is to store comprehensive loan details, including borrower information, loan type, amount, tenure, interest rates, start and end dates, and status.
* **EMI Management:** Stores and tracks individual EMI (Equated Monthly Installment) details – installment number, amount, outstanding balance, due dates, payment status, and associated payments.
* **Borrower Data:** Manages borrower details including name, contact information, address, and banking details.
* **KYC Management:** Facilitates KYC (Know Your Customer) processes, maintaining KYC status, document references, and important details like Aadhar and PAN numbers.
* **Penalty Tracking:** Allows for recording of penalties applied to late payments, including associated amounts and due dates.
* **Payment Records:**  Stores payment information such as amount, mode, bank references, and dates.

## Database Structure

**Tables**

1.  **loan_ticket:**
    *   id (Primary Key) 
    *   borrower_id (Foreign Key to 'borrower' table)
    *   loan_type
    *   loan_amount
    *   loan_tenure_in_months
    *   interest_rate
    *   start_date
    *   end_date
    *   status
    *   remark
    *   created_at

2.  **borrower:**
    *   id (Primary Key)
    *   first_name
    *   last_name
    *   mobile
    *   alternate_mobile
    *   state
    *   district
    *   pincode
    *   address
    *   account_number
    *   ifsc_code
    *   bank_name
    *   branch_name
    *   created_at

3.  **emi:**
    *   id (Primary Key)
    *   loan_ticket_id (Foreign Key to 'loan_ticket' table)
    *   emi_no
    *   emi_amount
    *   outstanding_amount
    *   start_date
    *   end_date
    *   payment_id (Foreign Key to 'payments' table)
    *   status
    *   created_at
    *   remark
    *   penalty_id (Foreign Key to 'penalty' table)

4.  **documents**
    *   id (Primary Key)
    *   document_name
    *   document_folder
    *   created_at

5.  **kyc**
    *   id (Primary Key)
    *   status
    *   borrower_id (Foreign Key to 'borrower' table)
    *   aadhar_number (Unique)
    *   pan_number (Unique)
    *   documents_id (Array of Foreign Keys to 'documents' table)
    *   completion_date
    *   created_at
    *   remark

6.  **penalty**
    *   id (Primary Key)
    *   status
    *   emi_id (Foreign Key to 'emi' table)
    *   amount
    *   payment_id (Foreign Key to 'payments' table)
    *   due_date
    *   remark

7.  **payments**
    *   id (Primary Key)
    *   amount
    *   payment_mode
    *   emi_id (Foreign Key to 'emi' table)
    *   bank_reference_id
    *   payment_date
    *   remark

## Getting Started

* **Requirements:** A relational database management system (RDBMS) such as PostgreSQL, MySQL, or similar.
* **Setup:**
    1.  Create a new database on your RDBMS
    2.  Execute the SQL statements provided to create the tables and relationships

Let me know if you'd like any modifications or have specific aspects you want to highlight! 
