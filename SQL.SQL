-- แบบฝึกหัดคำสั่ง SQL ใช้ฐานข้อมูล Northwind
--1. ต้องการรหัสพนักงาน คำนำหน้า ชื่อ นามสกุล ของพนักงานที่อยู่ในเมือง London
--2. ต้องการข้อมูลสินค้าที่มีรหัสประเภท 1,2,4,8 และมีราคา ช่วง 50-100$
--3. ต้องการประเทศ เมือง ชื่อบริษัทลูกค้า ชื่อผู้ติดต่อ เบอร์โทร ของลูกค้าทั้งหมด
--4. ข้อมูลของสินค้ารหัสประเภทที่ 1 ราคาไม่เกิน 50 หรือสินค้ารหัสประเภทที่ 8 ราคาไม่เกิน 75
--5. ชื่อบริษัทลูกค้า ที่อยู่ใน ประเทศ USA ที่ไม่มีหมายเลข FAX  เรียงตามลำดับชื่อบริษัท 
--6. ต้องการรหัสลูกค้า ชื่อบริษัท และ ชื่อผู้ติดต่อ เฉพาะ ชื่อบริษัทมีคำว่า'con'
SELECT EmployeeID,FirstName,LastName,City FROM Employees
WHERE City = 'london'

SELECT * FROM Products
WHERE CategoryID IN (1,2,4,8) and UnitPrice BETWEEN 50 and 100

SELECT Country,City,CompanyName,ContactName,Phone FROM Customers
ORDER by 1 ASC

SELECT * FROM Products
WHERE (CategoryID=1 and UnitPrice <=50) or (CategoryID=8 and UnitPrice <=70)
ORDER by CategoryID

SELECT CompanyName FROM Customers
WHERE Fax IS NULL and Country = 'USA'

SELECT CustomerID,CompanyName,ContactName FROM Customers
WHERE CompanyName LIKE '%con%'

--มูลค่าคงเหลือต่อรายกาาร
SELECT ProductID,ProductName,UnitPrice,UnitsInStock,Unitprice + UnitsInStock as Stockvalue
FROM Products
----------

SELECT ProductID as รหัส, ProductName as สินค้า,UnitsInStock + UnitsOnOrder as จำนวนคงเหลือทั้งหมด,
    ReorderLevel as จุดสั่งซื้อ FROM Products
WHERE (UnitsInStock * UnitsOnOrder) < ReorderLevel

--------
SELECT ProductID, ProductName,UnitPrice, ROUND(UnitPrice *0.07, 2) as VAT
FROM Products

----

SELECT EmployeeID,
    TitleOfCourtesy + FirstName + ' ' + LastName as FullName
    FROM Employees

------คำนวณสินค้าในรายการขายที่มีรหัส 10250
SELECT * FROM [Order Details] WHERE OrderID = 10250

-- ราคา * จำนวน*(1-ส่วนลด)

--คำนวณรายการขายสินค้าในรายการที่ 10250 ใช้ตาราง [order details]
SELECT orderID, ProductID, UnitPrice,Quantity,Discount,UnitPrice * Quantity * (1-Discount) as NetPrice
FROM [Order Details]
WHERE orderID = 10250

SELECT orderID, ProductID, UnitPrice,Quantity,Discount,ROUND(UnitPrice * Quantity * (1-Discount),2) as NetPrice
FROM [Order Details]
WHERE orderID = 10250
