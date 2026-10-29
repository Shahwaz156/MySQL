DROP DATABASE IF EXISTS Retail_Management;

CREATE DATABASE Retail_Management;

USE Retail_Management;

CREATE TABLE customers (
    Customer_Id INT PRIMARY KEY AUTO_INCREMENT,
    Customer_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone_Number CHAR(10) NOT NULL UNIQUE,
    Age TINYINT UNSIGNED NOT NULL CHECK (Age > 0),
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    Country VARCHAR(50) DEFAULT 'India',
    City VARCHAR(50) NOT NULL,
    Pincode CHAR(6) DEFAULT '302001',
    Registration_Date DATE DEFAULT (CURRENT_DATE),
    Registration_Time TIME DEFAULT (CURRENT_TIME),
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Address VARCHAR(250),
    Customer_Status ENUM('Active', 'Inactive', 'Blocked')
        DEFAULT 'Active',
    Customer_Notes VARCHAR(1000)
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


INSERT INTO customers
(Customer_Name, Email, Phone_Number, Age, Gender,
 City, Address, Customer_Notes)
VALUES
('Rahul', 'rahulmehta@example.com', '9123456780', 26,
 'Male', 'Jaipur', '12, Vaishali Nagar, Jaipur',
 'Regular buyer; prefers UPI payments.'),

('Priya', 'priyaverma@example.com', '9234567891', 23,
 'Female', 'Lucknow', 'B-16, Gomti Nagar, Lucknow',
 'Looks for festive discounts.'),

('Karan', 'karanmalhotra@example.com', '9345678902', 28,
 'Male', 'Mumbai', '45, Andheri West, Mumbai',
 'Prefers express delivery.'),

('Neha', 'nehagupta@example.com', '9456789013', 22,
 'Female', 'Pune', 'C-27, Baner Road, Pune',
 'Recently registered customer.'),

('Rohit', 'rohitsingh@example.com', '9567890124', 30,
 'Male', 'Chandigarh', '18, Sector 22, Chandigarh',
 'Interested in electronics offers.'),

('Pooja', 'poojashah@example.com', '9678901235', 25,
 'Female', 'Indore', 'D-14, Vijay Nagar, Indore',
 'Requests delivery updates through SMS.');


CREATE TABLE orders (
    Order_Id INT PRIMARY KEY AUTO_INCREMENT,
    Customer_Id INT NOT NULL,
    Order_Date DATE DEFAULT (CURRENT_DATE),
    Order_Amount DECIMAL(10,2) NOT NULL,

    Order_Status ENUM(
        'Pending', 'Processing', 'Shipped',
        'Delivered', 'Cancelled'
    ) DEFAULT 'Pending',

    Payment_Method ENUM(
        'Cash', 'Card', 'UPI', 'Net Banking'
    ) NOT NULL,

    Payment_Status ENUM(
        'Pending', 'Paid', 'Failed'
    ) DEFAULT 'Pending',

    Shipping_Address VARCHAR(250) NOT NULL,
    Delivery_Pincode CHAR(6) NOT NULL,
    Quantity TINYINT UNSIGNED NOT NULL CHECK (Quantity > 0),
    Discount_Amount DECIMAL(10,2) DEFAULT 0.00,
    Delivery_Date DATE NULL,
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Tracking_Number VARCHAR(30) UNIQUE,

    Delivery_Status ENUM(
        'Not Dispatched', 'In Transit',
        'Delivered', 'Returned'
    ) DEFAULT 'Not Dispatched',

    Order_Notes VARCHAR(1000) NULL,

    FOREIGN KEY (Customer_Id)
        REFERENCES Customers(Customer_Id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


INSERT INTO orders
(Customer_Id, Order_Amount, Payment_Method,
 Shipping_Address, Delivery_Pincode, Quantity,
 Tracking_Number, Order_Notes)
VALUES

(1, 1850.00, 'Card', '12, Vaishali Nagar, Jaipur',
 '302021', 2, 'PKG20001',
 'Order confirmed; payment received.'),

(3, 2750.50, 'UPI', '45, Andheri West, Mumbai',
 '400053', 1, 'PKG20002',
 'Package delivered to the registered address.'),

(2, 4100.00, 'Net Banking', 'B-16, Gomti Nagar, Lucknow',
 '226010', 3, 'PKG20003',
 'Order is awaiting dispatch.'),

(4, 1250.75, 'Cash', 'C-27, Baner Road, Pune',
 '411045', 1, 'PKG20004',
 'Customer confirmed successful delivery.'),

(5, 3650.25, 'UPI', '18, Sector 22, Chandigarh',
 '160022', 4, 'PKG20005',
 'Customer asked for delivery on a later date.');


DESCRIBE customers;
DESCRIBE orders;

SELECT * FROM customers;
SELECT * FROM orders;