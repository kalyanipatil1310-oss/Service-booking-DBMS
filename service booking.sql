show databases;
CREATE DATABASE service_booking_db;
USE service_booking_db;
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100),
    address VARCHAR(200)
);
desc Customer;
CREATE TABLE Service (
    service_id INT PRIMARY KEY,
    service_name VARCHAR(100),
    description VARCHAR(200),
    charges DECIMAL(10,2)
);
desc Service;
CREATE TABLE Booking (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    service_id INT,
    booking_date DATE,
    service_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (service_id) REFERENCES Service(service_id)
);
CREATE TABLE Complaint (
    complaint_id INT PRIMARY KEY,
    customer_id INT,
    booking_id INT,
    complaint_date DATE,
    description VARCHAR(255),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);
desc Complaint;
INSERT INTO Customer VALUES
(1, 'Amit Sharma', '9876543210', 'amit@gmail.com', 'Mumbai'),
(2, 'Neha Patil', '9123456780', 'neha@gmail.com', 'Pune'),
(3, 'Rahul Verma', '9988776655', 'rahul@gmail.com', 'Delhi'),
(4, 'Sneha Joshi', '9090909090', 'sneha@gmail.com', 'Nashik'),
(5, 'Karan Mehta', '9567123456', 'karan@gmail.com', 'Thane');
select * from Customer;
INSERT INTO Service VALUES
(101, 'AC Repair', 'Air conditioner servicing', 1500),
(102, 'Washing Machine Repair', 'Washing machine maintenance', 1200),
(103, 'Refrigerator Repair', 'Fridge servicing', 1000),
(104, 'Laptop Repair', 'Laptop hardware repair', 2000),
(105, 'Water Purifier Service', 'RO servicing', 800);
select * from Service;
INSERT INTO Booking VALUES
(201, 1, 101, '2026-01-10', '2026-01-12', 'Booked'),
(202, 2, 102, '2026-01-11', '2026-01-13', 'Completed'),
(203, 3, 103, '2026-01-12', '2026-01-14', 'Booked'),
(204, 4, 104, '2026-01-13', '2026-01-15', 'Cancelled'),
(205, 5, 105, '2026-01-14', '2026-01-16', 'Booked');
select * from Booking;
INSERT INTO Complaint VALUES
(301, 1, 201, '2026-01-13', 'Service delayed', 'Resolved'),
(302, 2, 202, '2026-01-14', 'Technician was late', 'Resolved'),
(303, 3, 203, '2026-01-15', 'Issue not fixed properly', 'Pending'),
(304, 4, 204, '2026-01-16', 'Booking cancelled without notice', 'Resolved'),
(305, 5, 205, '2026-01-17', 'Service charges too high', 'Pending');
select * from Complaint;
UPDATE Complaint
SET status = 'Resolved'
WHERE complaint_id = 301;
SELECT * FROM Complaint;
SELECT Customer.name, Service.service_name, Booking.status
FROM Booking
JOIN Customer ON Booking.customer_id = Customer.customer_id
JOIN Service ON Booking.service_id = Service.service_id;
CREATE VIEW Booking_Report AS
SELECT Customer.name, Service.service_name, Booking.service_date, Booking.status
FROM Booking
JOIN Customer ON Booking.customer_id = Customer.customer_id
JOIN Service ON Booking.service_id = Service.service_id;
SELECT * FROM Booking_Report;
 SELECT * FROM Booking;
 START TRANSACTION;

INSERT INTO Booking VALUES
(302, 2, 102, '2026-02-05', '2026-02-07', 'Booked');

INSERT INTO Complaint VALUES
(401, 2, 302, '2026-02-07', 'Service not satisfactory', 'Pending');

COMMIT;
select * from Booking;
select * from Complaint;
START TRANSACTION;

INSERT INTO Booking VALUES
(303, 99, 101, '2026-02-10', '2026-02-12', 'Booked');

ROLLBACK;
START TRANSACTION;

UPDATE Complaint
SET status = 'Resolved'
WHERE complaint_id = 401;

COMMIT;
select * from Complaint;

SELECT status, COUNT(*) AS total_complaints
FROM Complaint
GROUP BY status;

SELECT status, COUNT(*) AS total
FROM Booking
GROUP BY status
HAVING COUNT(*) > 1;

SELECT name
FROM Customer
WHERE customer_id IN (
    SELECT customer_id FROM Booking
);














