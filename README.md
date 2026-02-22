📌 Service Booking and Complaint Tracking System
Database Management System (DBMS) Project

📖 Project Overview
The Service Booking and Complaint Tracking System is a database-driven application developed using MySQL. The system is designed to manage customer service bookings and track complaints efficiently.
It replaces manual record-keeping methods with a structured database system to ensure accuracy, consistency, and data security.
This project demonstrates practical implementation of DBMS concepts such as:

Database creation

Table design
Constraints
SQL queries
Joins
Transactions
Views
Advanced queries

🎯 Objectives

To design a structured relational database system
To implement SQL queries for data management
To maintain data integrity using constraints
To perform data retrieval using JOIN, GROUP BY, HAVING, and Subqueries
To understand transactions and commit/rollback operations

🗂 Database Structure

The system consists of four main tables:

1️⃣ Customer
Stores customer information such as:
Customer ID (Primary Key)
Name
Phone (Unique)
Email
Address

2️⃣ Service

Stores service details:
Service ID (Primary Key)
Service Name
Description
Charges

3️⃣ Booking

Stores booking records:
Booking ID (Primary Key)
Customer ID (Foreign Key)
Service ID (Foreign Key)
Booking Date
Service Date
Status

4️⃣ Complaint

Stores complaint information:
Complaint ID (Primary Key)
Customer ID (Foreign Key)
Booking ID (Foreign Key)
Complaint Date
Description
Status

🔐 Constraints Used

PRIMARY KEY – Ensures unique identification of records
FOREIGN KEY – Maintains relationship between tables
NOT NULL – Prevents empty important fields
UNIQUE – Avoids duplicate entries

🛠 Technologies Used

MySQL Server – Database management
MySQL Workbench – Query execution and database design
SQL – Query language
Operating System – Windows / Linux

💻 Features Implemented

✔ Database creation
✔ Table creation with constraints
✔ Data insertion
✔ Data retrieval using SELECT and JOIN
✔ Grouping and filtering using GROUP BY & HAVING
✔ Subqueries
✔ View creation for reports
✔ Transactions (START TRANSACTION, COMMIT, ROLLBACK)

📊 Sample Query
SELECT Customer.name, Service.service_name, Booking.status
FROM Booking
JOIN Customer ON Booking.customer_id = Customer.customer_id
JOIN Service ON Booking.service_id = Service.service_id;

Purpose:
Displays customer name, service booked, and booking status.

🔄 Transaction Example
START TRANSACTION;

INSERT INTO Booking VALUES
(302, 2, 102, '2026-02-05', '2026-02-07', 'Booked');

INSERT INTO Complaint VALUES
(401, 2, 302, '2026-02-07', 'Service not satisfactory', 'Pending');

COMMIT;

This ensures that both booking and complaint are saved together.

🧪 Testing

Database creation tested successfully
All constraints verified
Join queries tested for correct outpt
Transactions tested using COMMIT an ROLLBACK

🚀 Future Enhancements

Web-based interface integration
Admin login system
Report generation dashboard
Analytics features
Backup and recovery automation

📌 Conclusion

This project successfully demonstrates the implementation of relational database concepts using MySQL. It provides hands-on experience in database design, SQL query execution, and maintaining data integrity.
