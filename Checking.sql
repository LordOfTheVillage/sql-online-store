-- ����� ����������� ��������� �������� �� PRIMARY KEY, ������������ ������ ���������� ����� ������

-- �������� ������� ���� ������������� � ���������� ����� email
INSERT INTO Customers (customer_id, first_name, last_name, gender, email, phone_number, address_line_1, address_line_2, city, state, postal_code, country)
VALUES (1, 'John', 'Doe', 'Male', 'john.doe@example.com', '123-456-7890', '123 Main St', 'Apt 1', 'Anytown', 'CA', '12345', 'USA');

INSERT INTO Customers (customer_id, first_name, last_name, gender, email, phone_number, address_line_1, address_line_2, city, state, postal_code, country)
VALUES (2, 'Jane', 'Doe', 'Female', 'john.doe@example.com', '555-555-1212', '456 Elm St', NULL, 'Othertown', 'TX', '67890', 'USA');

-- �������� ������� �������������� �������� ����
INSERT INTO Products (product_id, name, price, unit_of_measurement_id)
VALUES (50, 'Product A', -1.99, 1);

-- �������� ������� � ������� ������ ������������ ������
INSERT INTO Regular_Customers (regular_id, customer_id, join_date)
VALUES (1, 1, '2022-01-01');

INSERT INTO Regular_Customers (regular_id, customer_id, join_date)
VALUES (2, 1, '2022-01-02');

-- �������� ������� � ������� ������������� ������ ������
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method)
VALUES (1, 1, '2022-01-01', 'paypal');

-- �������� ������� ��������� � ���������� ������
INSERT INTO Categories (category_id, name)
VALUES (1, 'Category A');

INSERT INTO Categories (category_id, name)
VALUES (2, 'Category A');

-- ������� � ������������� ������� ������ � ���������� id
INSERT INTO Product_Categories (product_id, category_id)
VALUES (-1, 1);

-- �������� ������� ������������ �������� ������
INSERT INTO Orders (order_id, customer_id, order_date, regular_customer_discount)
VALUES (1, 1, '2022-01-01', 1);

-- �������� ������� ������������� ����
INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, price)
VALUES (1, 1, 1, 2, -1.99);

-- �������� �������� ����� � ���������� �������� ���������
INSERT INTO Units_of_Measurement (unit_of_measurement_id, name)
VALUES (1, 'Unit A');

INSERT INTO Units_of_Measurement (unit_of_measurement_id, name)
VALUES (2, 'Unit A');

-- �������� ������� ������������� id ����������
INSERT INTO Sales (sale_id, customer_id, product_id, quantity, sale_date, delivery_date)
VALUES (1, -1, 1, 2, '2022-01-01', '2022-01-10');
