SELECT * FROM Employees
SELECT EmployeeID,FirstName,LastName FROM Employees
-- หาเมือง
SELECT * FROM Employees
WHERE City = 'london'
--แสดงชื่อเมือง และประเทศทั้งหมดของลูกค้า
SELECT City, Country FROM Customers
--DISTINCT ข้อมูลที่แสดงออกมาซ้ากันจะแสดงเพียง 1 แถว
SELECT DISTINCT City, Country FROM Customers
--แสดงข้อมูลสินค้าที่มีราคาสูงกว่า 200
SELECT * FROM Products WHERE UnitPrice >200
--แสดงข้อมูลสินค้าที่มีราคาสูงกว่า 5
SELECT * FROM Products WHERE UnitPrice >5
--แสดงข้อมูลลูกค้าที่ตั้งอยู่ใน London หรือVancouver
SELECT * FROM Customers WHERE City ='London' OR City ='Vancouver'
--แสดงข้อมูลลูกค้าที่อยู่ในเมือง Usa  หรือ เมือง vancouver
SELECT * FROM Customers WHERE not(City ='Usa' OR City ='Vancouver')
--แสดงข้อมูลสินค้าที่มีราคาตั้งแต่ 50 $ ขึ้นไปและจำนวนคงเหลือน้อยกว่า 20 ชิ้น
SELECT * FROM Products
WHERE UnitPrice >= 50
AND UnitsInStock < 20
--แสดงข้อมูลสินค้าที่มีราคาตั้งแต่ 50-100 $
SELECT *
FROM Products
WHERE UnitPrice BETWEEN 50 AND 100
--แสดงข้อมูลลูกค้าที่อยู่ในประเทศ Brazil, Argentina, Mexico
SELECT * FROM Customers
WHERE Country IN ('Brazil','Argentina','Mexico');
--เลือกเฉพาะ
SELECT * FROM Customers
WHERE Country = 'brazill' or Country = 'Argentina' or Country = 'Maxico'

--is null ไม่ใช่  = null
SELECT * FROM Customers WHERE not Fax is NULL

--แสดงข้อมูลพนักงานมีชื่อขึ้นต้นด้วยตัวอักษร N
SELECT * FROM Employees
WHERE FirstName LIKE 'N%'
--ชื่อประเทศที่ลงท้ายด้วย land
SELECT * FROM Customers WHERE Country LIKE '%land'
--ต้องการข้อมูลลูกค้าที่ชื่อบริษัทมีคำว่า chi
SELECT * FROM Customers WHERE CompanyName LIKE '%chi%'
-- ต้องข้อมูลลูกค้า ที่ชื่อบริษัท หรือ ชื่อผู้ติดต่อ มีตัวอักษร ny
SELECT * FROM Customers WHERE CompanyName LIKE '%ny%' or ContactName LIKE '%ny%'
--แสดงข้อมูลพนักงานที่มีชื่อประกอบด้วยตัวอักษร 5 ตัว
SELECT * FROM Employees WHERE FirstName LIKE'_____'
--ต้องการพนักงานที่มีอักษรในชื่อตัวที่ 2 เป็น a 
SELECT * FROM Employees WHERE FirstName LIKE'_a%t'
--ต้องข้อมูลพนักงานที่มีอักษรขึ้นต้นด้วย a,r,s
SELECT * FROM Employees WHERE FirstName LIKE '[A-M]%'
--เรียกตัวที่ใช้แทนตัวอักษรทั้งหลายว่า wid
--การจัดเรียงข้อมูล(ORDER BY) แสดงข้อมูลรหัสสินค้า, ชื่อสินค้า และราคาโดยเรียงลำดับผลลัพธ์จากราคาสูงที่สุดไปต่ำที่สุด
SELECT ProductID,ProductName,UnitPrice FROM Products ORDER BY UnitPrice DESC
--การจัดเรียงข้อมูล โดยใช้ ORDER BY , ASC แสดงข้อมูลชื่อบริษัทที่เป็นลูกค้า และชื่อผู้ติดต่อ โดยเรียงลำดับชื่อผู้ติดต่อตามลำดับตัวอักษร
SELECT CompanyName, ContactName FROM Customers ORDER BY ContactName ASC
--การจัดเรียงข้อมูล โดยใช้ORDER BY, ASC/DESC
SELECT CategoryID, ProductName, UnitPrice FROM Products
ORDER BY CategoryID ASC , UnitPrice DESC