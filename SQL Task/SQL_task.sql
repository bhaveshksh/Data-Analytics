CREATE TABLE CUSTOMERS(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50),
city VARCHAR(50)
);
DROP TABLE CUSTOMERS
INSERT INTO CUSTOMERS
VALUES
(1,'Aarav Mehta','Delhi'),
(2,'Riya Sharma','Mumbai'),
(3,'Kabir Jain','Delhi'),
(4,'Neha Verma','Pune')

CREATE TABLE ORDERS
(order_id INT primary key,
customer_id INT,
order_date DATE,
total_amount INT,
status VARCHAR(50),
FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
);
drop table orders
select * from ORDERS
INSERT INTO orders (order_id, customer_id, order_date, total_amount, status)
VALUES
    (1001, 1, '2023-06-01', 4500, 'Delivered'),
    (1002, 1, '2023-06-03', 5200, 'Delivered'),
    (1003, 2, '2023-06-02', 3000, 'Delivered'),
	(1004, 2, '2023-06-10', 3000, 'Cancelled'),
	(1005, 3, '2023-06-05', 5200, 'Delivered'),
	(1006, 3, '2023-06-06', 7000, 'Delivered'),
	(1007, 4, '2023-06-09', 4000, 'Delivered');

CREATE TABLE PAYMENTS
(
    payment_id VARCHAR(50) PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_amount INT,
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id)
);

drop table PAYMENTS
INSERT INTO PAYMENTS (payment_id, order_id, payment_date, payment_amount)
VALUES
    ('P01', 1001, '2023-06-02', 4500),
    ('P02', 1003, '2023-06-03', 3000),
    ('P03', 1005, '2023-06-06', 5200),
    ('P04', 1006, '2023-06-07', 7000),
    ('P05', 1007, '2023-06-10', 4000);

-- 1. Find orders where payment was done before the order date
SELECT 
FROM ORDERS AS O
JOIN
PAYMENTS AS P ON O.order_id = P.order_id
where 
P.payment_date < O.order_date;

insert into ORDERS
VALUES
(1008, 4, '2023-06-15', 1000, 'Delivered')

insert into PAYMENTS
VALUES
('P06', 1008, '2023-06-14', 1000)