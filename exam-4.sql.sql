
-- ตารางสำหรับจัดการผู้ใช้
CREATE TABLE Admin (
  admin_id INT PRIMARY KEY AUTO_INCREMENT,,
  username VARCHAR(50),
  password VARCHAR(20),
  role VARCHAR(255)
);

-- ตารางสำหรับจัดการลูกค้า
CREATE TABLE Customers (
  customer_id INT PRIMARY KEY AUTO_INCREMENT,,
  name VARCHAR(50),
  email VARCHAR(50),
  address VARCHAR(255),
  phone VARCHAR(20)
);

-- ตารางสำหรับจัดการสินค้า
CREATE TABLE Products (
  poducts_id INT PRIMARY KEY AUTO_INCREMENT,,
  name VARCHAR(50),
  price DECIMAL(10, 2),
  quantity INT
);

-------------------------------------------------------
-- ตารางสำหรับจัดการตะกร้าสินค้าของลูกค้า
CREATE TABLE Carts (
  cart_id INT PRIMARY KEY AUTO_INCREMENT,,
  customer_id INT,
  product_id INT,
  quantity INT,
  price DECIMAL(10, 2),
  discount DECIMAL(10, 2),
  total_price DECIMAL(10, 2),
  cart_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (customer_id) REFERENCES customers(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
);

-- ตารางสำหรับใบเสร็จเมมื่อจ่ายเงิน
CREATE TABLE Carts_Receipts (
  receipt_id INT PRIMARY KEY AUTO_INCREMENT,
  cart_id INT,
  purchase_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (cart_id) REFERENCES Carts(cart_id)
);