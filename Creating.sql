USE master;
GO
DROP DATABASE IF EXISTS Online_Store;
GO
CREATE DATABASE Online_Store;
GO
USE Online_Store;
GO



CREATE TABLE [Customers] (
	customer_id int NOT NULL,
	first_name varchar(255) NOT NULL,
	last_name varchar(255) NOT NULL,
	gender varchar(255),
	email varchar(255) NOT NULL UNIQUE,
	phone_number varchar(20),
	address_line_1 varchar(255),
	address_line_2 varchar(255),
	city varchar(100) NOT NULL,
	state varchar(100) NOT NULL,
	postal_code varchar(20) NOT NULL,
	country varchar(100) NOT NULL,
  CONSTRAINT [PK_CUSTOMERS] PRIMARY KEY CLUSTERED
  (
  [customer_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Products] (
	product_id int NOT NULL UNIQUE,
	name varchar(255) NOT NULL,
	price decimal(10,2) NOT NULL CHECK (price > 0),
	unit_of_measurement_id int NOT NULL,
  CONSTRAINT [PK_PRODUCTS] PRIMARY KEY CLUSTERED
  (
  [product_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Regular_Customers] (
	regular_id int NOT NULL UNIQUE,
	customer_id int NOT NULL,
	join_date datetime NOT NULL,
  CONSTRAINT [PK_REGULAR_CUSTOMERS] PRIMARY KEY CLUSTERED
  (
  [regular_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Payments] (
	payment_id int NOT NULL UNIQUE,
	order_id int NOT NULL,
	payment_date datetime NOT NULL,
	payment_method varchar(255) CHECK (payment_method IN ('cash', 'card', 'coupon')) NOT NULL DEFAULT 'cash',
  CONSTRAINT [PK_PAYMENTS] PRIMARY KEY CLUSTERED
  (
  [payment_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Categories] (
	category_id int NOT NULL UNIQUE,
	name varchar(100) NOT NULL UNIQUE,
  CONSTRAINT [PK_CATEGORIES] PRIMARY KEY CLUSTERED
  (
  [category_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Product_Categories] (
	product_id int NOT NULL,
	category_id int NOT NULL
)
GO
CREATE TABLE [Orders] (
	order_id int NOT NULL UNIQUE,
	customer_id int NOT NULL,
	order_date datetime NOT NULL,
	regular_customer_discount INT CHECK (regular_customer_discount IN (0,2)) NOT NULL DEFAULT 0,
  CONSTRAINT [PK_ORDERS] PRIMARY KEY CLUSTERED
  (
  [order_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Order_Items] (
	order_item_id int NOT NULL UNIQUE,
	order_id int NOT NULL,
	product_id int NOT NULL,
	quantity int NOT NULL,
	price decimal(10,2) NOT NULL CHECK (price > 0),
  CONSTRAINT [PK_ORDER_ITEMS] PRIMARY KEY CLUSTERED
  (
  [order_item_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Units_of_Measurement] (
	unit_of_measurement_id int NOT NULL UNIQUE,
	name varchar(50) NOT NULL UNIQUE,
  CONSTRAINT [PK_UNITS_OF_MEASUREMENT] PRIMARY KEY CLUSTERED
  (
  [unit_of_measurement_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Sales] (
	sale_id int NOT NULL UNIQUE,
	customer_id int NOT NULL,
	product_id int NOT NULL,
	quantity int NOT NULL,
	sale_date date NOT NULL,
	delivery_date date NOT NULL,
  CONSTRAINT [PK_SALES] PRIMARY KEY CLUSTERED
  (
  [sale_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO

ALTER TABLE [Products] WITH CHECK ADD CONSTRAINT [Products_fk0] FOREIGN KEY ([unit_of_measurement_id]) REFERENCES [Units_of_Measurement]([unit_of_measurement_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Products] CHECK CONSTRAINT [Products_fk0]
GO

ALTER TABLE [Regular_Customers] WITH CHECK ADD CONSTRAINT [Regular_Customers_fk0] FOREIGN KEY ([customer_id]) REFERENCES [Customers]([customer_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Regular_Customers] CHECK CONSTRAINT [Regular_Customers_fk0]
GO

ALTER TABLE [Payments] WITH CHECK ADD CONSTRAINT [Payments_fk0] FOREIGN KEY ([order_id]) REFERENCES [Orders]([order_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Payments] CHECK CONSTRAINT [Payments_fk0]
GO


ALTER TABLE [Product_Categories] WITH CHECK ADD CONSTRAINT [Product_Categories_fk0] FOREIGN KEY ([product_id]) REFERENCES [Products]([product_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Product_Categories] CHECK CONSTRAINT [Product_Categories_fk0]
GO
ALTER TABLE [Product_Categories] WITH CHECK ADD CONSTRAINT [Product_Categories_fk1] FOREIGN KEY ([category_id]) REFERENCES [Categories]([category_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Product_Categories] CHECK CONSTRAINT [Product_Categories_fk1]
GO

ALTER TABLE [Orders] WITH CHECK ADD CONSTRAINT [Orders_fk0] FOREIGN KEY ([customer_id]) REFERENCES [Customers]([customer_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Orders] CHECK CONSTRAINT [Orders_fk0]
GO

ALTER TABLE [Order_Items] WITH CHECK ADD CONSTRAINT [Order_Items_fk0] FOREIGN KEY ([order_id]) REFERENCES [Orders]([order_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Order_Items] CHECK CONSTRAINT [Order_Items_fk0]
GO
ALTER TABLE [Order_Items] WITH CHECK ADD CONSTRAINT [Order_Items_fk1] FOREIGN KEY ([product_id]) REFERENCES [Products]([product_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Order_Items] CHECK CONSTRAINT [Order_Items_fk1]
GO


ALTER TABLE [Sales] WITH CHECK ADD CONSTRAINT [Sales_fk0] FOREIGN KEY ([customer_id]) REFERENCES [Customers]([customer_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Sales] CHECK CONSTRAINT [Sales_fk0]
GO
ALTER TABLE [Sales] WITH CHECK ADD CONSTRAINT [Sales_fk1] FOREIGN KEY ([product_id]) REFERENCES [Products]([product_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Sales] CHECK CONSTRAINT [Sales_fk1]
GO

