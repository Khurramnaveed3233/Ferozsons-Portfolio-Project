
-- Create the Ferozsons Pharmaceuticals Database
CREATE DATABASE FerozsonsPharmaceuticals;
GO

USE FerozsonsPharmaceuticals;
GO

-- Create table for Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(255) NOT NULL,
    Category NVARCHAR(100),
    Price DECIMAL(10, 2),
    ExpiryDate DATE,
    StockQuantity INT,
    Description NVARCHAR(MAX)
);
GO

INSERT INTO Products (ProductName, Category, Price, ExpiryDate, StockQuantity, Description)
VALUES 
('Paracetamol', 'Painkiller', 20.50, '2025-11-19', 100, 'Used for fever and pain relief'),
('Aspirin', 'Painkiller', 15.75, '2026-01-15', 200, 'Anti-inflammatory pain reliever'),
('Metformin', 'Diabetes', 50.00, '2025-12-01', 150, 'Controls blood sugar levels'),
('Cough Syrup', 'Cold', 30.00, '2024-09-30', 75, 'Relief for cold and cough symptoms'),
('Omeprazole', 'Acid Reflux', 40.00, '2025-06-20', 50, 'Reduces stomach acid'),
('Ibuprofen', 'Painkiller', 25.00, '2025-03-05', 120, 'Nonsteroidal anti-inflammatory'),
('Amoxicillin', 'Antibiotic', 60.00, '2024-12-15', 80, 'Treats bacterial infections'),
('Insulin', 'Diabetes', 100.00, '2026-05-10', 50, 'Regulates blood sugar levels'),
('Cetirizine', 'Antihistamine', 10.00, '2025-08-01', 180, 'Used for allergy relief'),
('Azithromycin', 'Antibiotic', 70.00, '2025-10-25', 90, 'Treats bacterial infections');

-- Create table for Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    Position NVARCHAR(100),
    Department NVARCHAR(100),
    HireDate DATE,
    Salary DECIMAL(10, 2),
    Email NVARCHAR(255),
    Phone NVARCHAR(50)
);

INSERT INTO Employees (FirstName, LastName, Position, Department, HireDate, Salary, Email, Phone)
VALUES 
('John', 'Doe', 'Sales Manager', 'Sales', '2021-02-20', 50000, 'john.doe@ferozsons.com', '123-456-7890'),
('Jane', 'Smith', 'Pharmacist', 'Pharmacy', '2020-10-10', 45000, 'jane.smith@ferozsons.com', '234-567-8901'),
('Robert', 'Williams', 'Lab Technician', 'Laboratory', '2019-05-15', 40000, 'robert.w@ferozsons.com', '345-678-9012'),
('Emily', 'Johnson', 'Accountant', 'Finance', '2018-11-30', 48000, 'emily.j@ferozsons.com', '456-789-0123'),
('Michael', 'Brown', 'HR Manager', 'Human Resources', '2021-06-01', 52000, 'michael.b@ferozsons.com', '567-890-1234'),
('Sarah', 'Jones', 'Quality Assurance', 'QA', '2022-03-14', 46000, 'sarah.jones@ferozsons.com', '678-901-2345'),
('David', 'Davis', 'Marketing Manager', 'Marketing', '2020-07-10', 55000, 'david.d@ferozsons.com', '789-012-3456'),
('Sophia', 'Martinez', 'Research Scientist', 'R&D', '2019-08-25', 60000, 'sophia.m@ferozsons.com', '890-123-4567'),
('James', 'Taylor', 'Operations Manager', 'Operations', '2020-12-05', 57000, 'james.t@ferozsons.com', '901-234-5678'),
('Olivia', 'Anderson', 'Sales Executive', 'Sales', '2023-04-19', 47000, 'olivia.a@ferozsons.com', '012-345-6789');


-- Create table for Suppliers
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    SupplierName NVARCHAR(255) NOT NULL,
    ContactName NVARCHAR(100),
    ContactPhone NVARCHAR(50),
    Address NVARCHAR(255),
    City NVARCHAR(100),
    Country NVARCHAR(100),
    Email NVARCHAR(255)
);

INSERT INTO Suppliers (SupplierName, ContactName, ContactPhone, Address, City, Country, Email)
VALUES 
('ABC Pharma', 'Mark Spencer', '123-456-7890', '123 Street A', 'Lahore', 'Pakistan', 'abc@pharma.com'),
('Global Meds', 'David Lee', '234-567-8901', '456 Street B', 'Karachi', 'Pakistan', 'global@meds.com'),
('HealthCorp', 'Emily White', '345-678-9012', '789 Street C', 'Islamabad', 'Pakistan', 'healthcorp@med.com'),
('PharmaTech', 'Sophia Green', '456-789-0123', '101 Street D', 'Lahore', 'Pakistan', 'pharmatech@corp.com'),
('BioSolutions', 'Oliver Brown', '567-890-1234', '202 Street E', 'Multan', 'Pakistan', 'biosol@sol.com'),
('MediPharm', 'Isabella Black', '678-901-2345', '303 Street F', 'Quetta', 'Pakistan', 'medipharm@pharma.com'),
('PharmaCare', 'James Wilson', '789-012-3456', '404 Street G', 'Peshawar', 'Pakistan', 'pharmacare@med.com'),
('WellMed', 'Emma Harris', '890-123-4567', '505 Street H', 'Faisalabad', 'Pakistan', 'wellmed@corp.com'),
('CureMeds', 'Mason Martinez', '901-234-5678', '606 Street I', 'Lahore', 'Pakistan', 'curemeds@med.com'),
('CarePlus', 'Liam Anderson', '012-345-6789', '707 Street J', 'Rawalpindi', 'Pakistan', 'careplus@plus.com');


-- Create table for Sales
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    SaleDate DATE,
    QuantitySold INT,
    SalePrice DECIMAL(10, 2),
    TotalAmount AS (QuantitySold * SalePrice) PERSISTED
);

INSERT INTO Sales (ProductID, SaleDate, QuantitySold, SalePrice)
VALUES 
(1, '2024-11-10', 20, 22.50),
(2, '2024-11-11', 15, 17.00),
(3, '2024-11-12', 10, 55.00),
(4, '2024-11-13', 5, 32.00),
(5, '2024-11-14', 12, 45.00),
(6, '2024-11-15', 8, 27.00),
(7, '2024-11-16', 6, 65.00),
(8, '2024-11-17', 10, 105.00),
(9, '2024-11-18', 25, 12.00),
(10, '2024-11-19', 20, 72.00);


-- Create table for Inventory
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    StockIn INT,
    StockOut INT,
    StockDate DATE,
    RemainingStock AS (StockIn - StockOut) PERSISTED
);

INSERT INTO Inventory (ProductID, StockIn, StockOut, StockDate)
VALUES 
(1, 100, 20, '2024-11-10'),
(2, 150, 15, '2024-11-11'),
(3, 200, 10, '2024-11-12'),
(4, 50, 5, '2024-11-13'),
(5, 120, 12, '2024-11-14'),
(6, 80, 8, '2024-11-15'),
(7, 100, 6, '2024-11-16'),
(8, 60, 10, '2024-11-17'),
(9, 180, 25, '2024-11-18'),
(10, 90, 20, '2024-11-19');


-- Create table for Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    Address NVARCHAR(255),
    City NVARCHAR(100),
    Country NVARCHAR(100),
    Email NVARCHAR(255),
    Phone NVARCHAR(50)
);

INSERT INTO Customers (FirstName, LastName, Address, City, Country, Email, Phone)
VALUES 
('Ali', 'Khan', 'Street 1', 'Lahore', 'Pakistan', 'ali.khan@gmail.com', '0300-1234567'),
('Sara', 'Ahmed', 'Street 2', 'Karachi', 'Pakistan', 'sara.ahmed@gmail.com', '0301-2345678'),
('Hamza', 'Malik', 'Street 3', 'Islamabad', 'Pakistan', 'hamza.malik@gmail.com', '0302-3456789'),
('Ayesha', 'Shaikh', 'Street 4', 'Lahore', 'Pakistan', 'ayesha.shaikh@gmail.com', '0303-4567890'),
('Bilal', 'Butt', 'Street 5', 'Rawalpindi', 'Pakistan', 'bilal.butt@gmail.com', '0304-5678901'),
('Zain', 'Iqbal', 'Street 6', 'Multan', 'Pakistan', 'zain.iqbal@gmail.com', '0305-6789012'),
('Fatima', 'Javed', 'Street 7', 'Quetta', 'Pakistan', 'fatima.javed@gmail.com', '0306-7890123'),
('Usman', 'Raza', 'Street 8', 'Faisalabad', 'Pakistan', 'usman.raza@gmail.com', '0307-8901234')


SELECT * FROM Customers;

-- Create table for Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
    OrderDate DATE,
    ShippingDate DATE,
    ShipperID INT FOREIGN KEY REFERENCES Shippers(ShipperID),
    TotalAmount DECIMAL(10, 2)
);

-- Inserting orders for existing CustomerID values (1 to 8)

INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, ShippingDate, ShipperID, TotalAmount)
VALUES 
(1, 1, '2024-11-10', '2024-11-12', 1, 200.00),
(2, 2, '2024-11-11', '2024-11-13', 2, 150.00),
(3, 3, '2024-11-12', '2024-11-14', 3, 300.00),
(4, 4, '2024-11-13', '2024-11-15', 4, 250.00),
(5, 5, '2024-11-14', '2024-11-16', 5, 180.00),
(6, 6, '2024-11-15', '2024-11-17', 6, 220.00),
(7, 7, '2024-11-16', '2024-11-18', 7, 275.00),
(8, 8, '2024-11-17', '2024-11-19', 8, 320.00);

SELECT * FROM Orders;


-- Create table for Departments
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName NVARCHAR(100) NOT NULL,
    ManagerID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
    Location NVARCHAR(255)
);

INSERT INTO Departments (DepartmentName, ManagerID, Location)
VALUES 
('Sales', 1, 'Head Office - Lahore'),
('Pharmacy', 2, 'Pharmacy Lab - Karachi'),
('Laboratory', 3, 'Research Center - Islamabad'),
('Finance', 4, 'Finance Department - Lahore'),
('Human Resources', 5, 'HR Office - Lahore'),
('Quality Assurance', 6, 'QA Lab - Karachi'),
('Marketing', 7, 'Marketing Office - Lahore'),
('R&D', 8, 'R&D Lab - Islamabad'),
('Operations', 9, 'Operations Hub - Karachi'),
('Sales Support', 10, 'Sales Office - Lahore');



-- Create table for Payments
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    PaymentDate DATE,
    AmountPaid DECIMAL(10, 2),
    PaymentMethod NVARCHAR(100)
);

-- Inserting payments for existing OrderID values (1 to 8)

-- Inserting payments for existing OrderID values (11 to 18)

INSERT INTO Payments (CustomerID, OrderID, PaymentDate, AmountPaid, PaymentMethod)
VALUES 
(1, 11, '2024-11-12', 200.00, 'Credit Card'),
(2, 12, '2024-11-13', 150.00, 'Cash'),
(3, 13, '2024-11-14', 300.00, 'Bank Transfer'),
(4, 14, '2024-11-15', 250.00, 'Credit Card'),
(5, 15, '2024-11-16', 180.00, 'Cash'),
(6, 16, '2024-11-17', 220.00, 'Bank Transfer'),
(7, 17, '2024-11-18', 275.00, 'Credit Card'),
(8, 18, '2024-11-19', 320.00, 'Cash');

-- Create table for Shippers
CREATE TABLE Shippers (
    ShipperID INT PRIMARY KEY IDENTITY(1,1),
    ShipperName NVARCHAR(255) NOT NULL,
    ContactName NVARCHAR(100),
    Phone NVARCHAR(50),
    Address NVARCHAR(255),
    City NVARCHAR(100),
    Country NVARCHAR(100)
);

INSERT INTO Shippers (ShipperName, ContactName, Phone, Address, City, Country)
VALUES 
('Fast Courier', 'Ahmed Ali', '0301-2345678', 'Street 1', 'Lahore', 'Pakistan'),
('Quick Delivery', 'Sara Malik', '0302-3456789', 'Street 2', 'Karachi', 'Pakistan'),
('Safe Movers', 'Bilal Ahmed', '0303-4567890', 'Street 3', 'Islamabad', 'Pakistan'),
('Speed Logistics', 'Fatima Khan', '0304-5678901', 'Street 4', 'Rawalpindi', 'Pakistan'),
('Global Shippers', 'Zain Raza', '0305-6789012', 'Street 5', 'Faisalabad', 'Pakistan'),
('Express Transport', 'Usman Javed', '0306-7890123', 'Street 6', 'Multan', 'Pakistan'),
('Secure Delivery', 'Ayesha Butt', '0307-8901234', 'Street 7', 'Quetta', 'Pakistan'),
('Reliable Cargo', 'Hamza Iqbal', '0308-9012345', 'Street 8', 'Sialkot', 'Pakistan'),
('Trust Courier', 'Hira Zafar', '0309-0123456', 'Street 9', 'Peshawar', 'Pakistan'),
('Nationwide Express', 'Saad Malik', '0310-1234567', 'Street 10', 'Lahore', 'Pakistan');

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


====================================================================================

select * from Customers
select * from Employees
select * from Products
select * from Orders
select * from Departments
select * from Payments
select * from Shippers
select * from Orders
select * from Inventory
select * from Suppliers


========================================================================================
--- 1. Issue: Inaccurate Inventory Records

--- Solution: Update inventory levels in real-time whenever new orders are placed.

--- We can create a trigger to update the Inventory table when an order is placed, ensuring the stock quantity is reduced based on the order.

--- SQL Trigger to Automatically Update Inventory on New Orders:

CREATE TRIGGER trg_UpdateInventory
ON OrderDetails
AFTER INSERT
AS
BEGIN
    -- Update the Inventory table based on the products and quantities in OrderDetails
    UPDATE Inventory
    SET Inventory.stockin = Inventory.Stockin - inserted.Quantity
    FROM Inventory
    INNER JOIN inserted ON Inventory.ProductID = inserted.ProductID;

    -- Optionally, raise an alert if inventory falls below a certain threshold
    IF EXISTS (SELECT * FROM Inventory WHERE stockin < 10)
    BEGIN
        PRINT 'Alert: Low stock levels for one or more products.'
    END
END;

--- This ensures that the stock will only be updated if there is enough quantity in the Inventory to fulfill the order.
-----------------------------------------------------------------------------------
========= 2. Issue: Order Processing Delays

--- Solution: Create a report to identify orders stuck in processing or unpaid orders.
--- We can create a query to fetch orders where payment is either pending or incomplete, so the order processing team can take action.

SQL Query to Find Unpaid or Partially Paid Orders:

SELECT O.OrderID, C.firstname, O.OrderDate, P.PaymentMethod, P.AmountPaid, O.TotalAmount
FROM Orders O
LEFT JOIN Payments P ON O.OrderID = P.OrderID
INNER JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE P.OrderID IS NULL -- Orders with no payments
   OR P.AmountPaid < O.TotalAmount; -- Orders with partial payments

   -- This query identifies orders that are either unpaid or partially paid, so the team can follow up and process these orders.

============== 3. Issue: Supplier and Restocking Inefficiencies

--- Solution: Prioritize suppliers based on delivery times and update stock with incoming supplies.
--- We can create a query that checks which products are running low on stock and identifies the suppliers that can restock these items quickly.
--- SQL Query to Identify Low-Stock Products and Suppliers:

SELECT P.ProductID, P.ProductName, S.SupplierName, I.Stockin, S.ExpectedDeliveryTime
FROM Inventory I
INNER JOIN Products P ON I.ProductID = P.ProductID
INNER JOIN Suppliers S ON P.SupplierID = S.SupplierID
WHERE I.Stockin < 10 -- Threshold for low stock
ORDER BY S.ExpectedDeliveryTime ASC; -- Prioritize suppliers with shorter delivery times

-- This query helps the procurement team identify which products are running low and which suppliers can deliver them the fastest.


============ 4. Issue: Department Coordination Breakdown

-- Solution: Generate a report that highlights pending orders and their associated departments for smoother communication.

-- We can create a query to track the current status of orders and which departments are responsible for handling each stage.

SQL Query to Track Order Status by Department:
SELECT O.OrderID, C.firstname, O.OrderDate, D.DepartmentName, O.ShippingDate
FROM Orders O
INNER JOIN Departments D ON O.EmployeeID = D.DepartmentID
INNER JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE O.ShippingDate IS NULL -- Orders that have not yet been shipped
ORDER BY O.OrderDate ASC; -- Older orders appear first

-- This query lists pending orders along with the department responsible for handling them, helping improve communication between teams to prioritize these orders.

============ 5. Issue: Delayed Payments Impacting Shipping
-- Solution: Notify the finance department of any pending payments that are delaying shipping.

-- We can write a query to alert the finance team about pending payments that are holding up the shipping process.

--- SQL Query to Identify Orders Pending Due to Payment Issues:

SELECT O.OrderID, C.CustomerName, O.OrderDate, P.PaymentMethod, O.ShippingDate, O.TotalAmount, P.AmountPaid
FROM Orders O
LEFT JOIN Payments P ON O.OrderID = P.OrderID
INNER JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE O.ShippingDate IS NULL -- Orders not yet shipped
AND (P.OrderID IS NULL OR P.AmountPaid < O.TotalAmount); -- Pending or incomplete payments

--- This query helps the finance team identify orders that are being held up due to payment delays, allowing them to follow up and resolve the issue to ensure timely shipping.

=== Conclusion:

These SQL queries aim to address the operational inefficiencies at Ferozsons Pharmaceuticals, particularly in inventory management, order processing, supplier coordination, and interdepartmental communication. Implementing these queries can streamline the company's database management processes, resulting in improved performance and customer satisfaction.

