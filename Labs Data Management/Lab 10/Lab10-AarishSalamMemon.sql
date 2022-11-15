--DROP TABLE SUPPLIERS;
CREATE TABLE SUPPLIERS
(SUPPLIER_ID INT PRIMARY KEY,
SUPPLIER_NAME VARCHAR(25),
LOCATION_CODE INT,
CONTACT_PERSON VARCHAR(25),
OTHER_DETAILS VARCHAR(50));

-- DESC SUPPLIERS;

-- DROP TABLE PRODUCTS;
CREATE TABLE PRODUCTS
(PRODUCT_ID INT PRIMARY KEY,
PRODUCT_NAME VARCHAR2(25),
PRODUCT_DESCRIPTION VARCHAR2(30),
PRICE NUMBER,
SUPPLIER_ID INT CONSTRAINT FK_SUPPLIER_ID REFERENCES SUPPLIERS (SUPPLIER_ID),
STATUS VARCHAR2(20));

-- DESC PRODUCTS;

-- DROP TABLE CUSTOMERS;
CREATE TABLE CUSTOMERS
(CUSTOMER_ID INT PRIMARY KEY,
CUST_NAME VARCHAR2(50),
CUST_LOCALE INT,
PAYMENT_CODE INT,
CUST_DETAILS VARCHAR2(50));

-- DESC CUSTOMERS;

-- DROP TABLE SALES;
CREATE TABLE SALES
(SALES_ID INT PRIMARY KEY,
SALEPERSON VARCHAR2(50),
ORDER_STATUS VARCHAR2(25));

-- DESC SALES;

-- DROP TABLE ORDER_ITEMS;
CREATE TABLE ORDER_ITEMS
(ORDERS_ITEMS_ID INT PRIMARY KEY,
INVOICE_ID INT CONSTRAINT FK_INVOICE_ID1 REFERENCES INVOICES(INVOICE_ID),
PRODUCT_ID INT CONSTRAINT FK_PRODUCT_ID1 REFERENCES PRODUCTS(PRODUCT_ID),
QUANTITY INT);

-- DESC ORDER_ITEMS;

-- DROP TABLE SHIPPERS;
CREATE TABLE SHIPPERS
(SHIPPER_ID NUMBER PRIMARY KEY,
SHIPPER_NAME VARCHAR2(50));

-- DESC SHIPPERS;

-- DROP TABLE ORDERS;
CREATE TABLE ORDERS
( ORDER_ID INT PRIMARY KEY,
CUSTOMER_ID INT CONSTRAINT FK_CUSTOMER_ID REFERENCES CUSTOMERS(CUSTOMER_ID),
ORDER_STATUS VARCHAR2(25),
SALES_ID INT CONSTRAINT FK_SALES REFERENCES SALES(SALES_ID));

-- DESC ORDERS;

-- DROP TABLE INVOICES;
CREATE TABLE INVOICES
( INVOICE_ID INT PRIMARY KEY,
CUSTOMER_ID INT CONSTRAINT FK_CUSTOMER_ID1 REFERENCES CUSTOMERS(CUSTOMER_ID),
INVOICE_AMT NUMBER,
Inv_Date Date);



INSERT INTO suppliers Values (15, 'Mary Supplies', 60645,'Johnny','N/A');
INSERT INTO suppliers Values (25, 'Devon Traders', 60616,'Marcus','N/A');
INSERT INTO products Values(901, 'JohnProd', 'Wires', 1000, 15, 'Ready');
INSERT INTO products Values(903, 'Skull Candy', 'Headphones', 300, 25, 'Not Ready');
INSERT INTO customers Values(619, 'Dr Mysterio', 17, 2, 'Pro Wrestler');
INSERT INTO customers Values(719, 'Aarish Memon', 13, 3, 'Programmer');
INSERT INTO sales Values(100, 619, 'Ready');
INSERT INTO sales Values(101, 719, 'Not Ready');
INSERT INTO invoices Values(200, 619, 100, '14-Dec-2021');
INSERT INTO invoices Values(300, 719, 101, '29-Dec-2021');
INSERT INTO order_items Values(699, 200, 901,619);
INSERT INTO order_items Values(399, 300, 903,719);
INSERT INTO shippers Values(511, 'UPS');
INSERT INTO shippers Values(611, 'USPS');
INSERT INTO orders Values(350, 619, 'Ready', 100);
INSERT INTO orders Values(450, 719, 'Not Ready', 101);

SELECT * FROM orders;

insert into products values(905, 'Desk', 'Office Supplies', 7000, 25, 'Ready');
insert into products values(907, 'Laptops', 'Office Supplies', 24000, 25, 'Ready');
insert into customers values(819, 'Aarish Memon', 11, 4, 'Vice-President');
insert into orders values(550, 819, 'Ready', 102);
insert into sales values(102, 763, 'Ready');

SELECT * FROM orders;

INSERT INTO invoices Values(400, 819, 31000, '12-Dec-2021');
insert into order_items values(199, 400, 905,15);
insert into order_items values(198, 400, 907,45);
insert into shippers values(711, 'USPS');

SELECT * FROM order_items;
rollback;

SELECT * FROM productstock;


ALTER TABLE Products
ADD Quantity INTEGER;


UPDATE Products
SET Quantity = 70
WHERE Product_ID = 903;

UPDATE Products
SET Quantity = 30
WHERE Product_ID = 905;

UPDATE Products
SET Quantity = 95
WHERE Product_ID = 907;

SELECT * FROM PRODUCTS;

DROP TABLE TOTAL_QUANTITY;

CREATE TABLE TOTAL_QUANTITY (Product_ID CONSTRAINT Fk_Product_ID2 REFERENCES Products(Product_ID), QuantityAll INTEGER);

INSERT INTO TOTAL_QUANTITY VALUES (901,170);
INSERT INTO TOTAL_QUANTITY VALUES (903,600);
INSERT INTO TOTAL_QUANTITY VALUES (905,30);
INSERT INTO TOTAL_QUANTITY VALUES (907,120);

SELECT * FROM total_quantity;

SELECT * FROM order_items;
SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER QOH_Trigger
BEFORE UPDATE ON TOTAL_QUANTITY FOR EACH ROW
DECLARE
QOH INTEGER;
BEGIN
IF (TOTAL_QUANTITY.QuantityAll > Order_Items.Quantity)
THEN 
UPDATE Total_Quantity 
SET quantityAll = Order_Items.Quantity - TOTAL_QUANTITY.QuantityAll WHERE quantityAll.product_id = order_items.product_id;
dbms_output. put_line('Order is successful');
END IF;
END;

DROP TABLE CUSTOMER_SERVICE;

CREATE TABLE CUSTOMER_SERVICE (CS_ID VARCHAR2(10) PRIMARY KEY, 
Customer_ID INTEGER CONSTRAINT fk_customer_id2 references Customers(Customer_ID),
Experience INTEGER, CustomerStatus VARCHAR2(20));

INSERT INTO CUSTOMER_SERVICE VALUES ('A101', 619, 5, 'Ready');
INSERT INTO CUSTOMER_SERVICE VALUES ('A102', 719, 3, 'Not Ready');
INSERT INTO CUSTOMER_SERVICE VALUES ('A103', 819, 12, 'Ready');

SELECT * FROM Products;

ALTER TABLE SALES DROP COLUMN Order_Status;

ALTER TABLE ORDERS ADD Shipper_ID CONSTRAINT Fk_Shipping_ID1 REFERENCES Shippers (Shipper_ID); 
SELECT * FROM ORDERS;

ALTER TABLE ORDERS
ADD CONSTRAINT Order_Status CHECK (Order_status IN ('Ready to Ship', 'Shipping in Process', 'Delivered'));
    
CREATE TABLE Invoice_Details (Invoice_ID Integer PRIMARY KEY CONSTRAINT Fk_Invoice_ID4 REFERENCES Invoices(Invoice_ID),
Product_ID INTEGER CONSTRAINT Fk_Product_ID4 REFERENCES Products(Product_ID),
QuantityofProduct INTEGER , Amount INTEGER, Discount INTEGER);

INSERT INTO invoice_details VALUES (200,905,30,7000,0);
INSERT INTO invoice_details VALUES (300,901,150,1000,50);
INSERT INTO invoice_details VALUES (400,907,30,24000,1500);

SELECT * FROM Invoices;

SELECT Invoice_ID, Inv_Date, LAG(Inv_Date, 1)
OVER (Order By Inv_Date) AS PreviousOrderDate
FROM Invoices;

SELECT Invoice_ID, Inv_Date, LEAD(Inv_Date, 1)
OVER (Order By Inv_Date) AS NextOrderDate
FROM Invoices;



SELECT * FROM Orders;