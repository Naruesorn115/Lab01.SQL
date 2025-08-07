--แบบฝึกหัด--
-- 1. สินค้าที่มีราคา 15 บาท --
SELECT * FROM Products
WHERE UnitPrice = 15;
-- 2.สินค้าที่มีจำนวนคงเหลือในสต๊อกต่ำกว่า 250 ---
SELECT * FROM products
WHERE UnitsInStock < 250;

-- 3. รหัสสินคา ชื่อสินค้าที่เลิกจำหน่ายแล้ว --
SELECT * FROM products
WHERE discontinued = 1;

-- 4. รหัสสินค้า ชื่อสินค้า ราคา ของสินค้าที่มีราคามากกว่า 100--
SELECT productID, productName, UnitPrice FROM products
WHERE UnitPrice > 100;

-- 5. รหัสสินค้า และราคาของยางลบ--
SELECT productID, UnitPrice FROM products
WHERE productName ='ยางลบ'


-- 6. หมายเลขใบเสร็จ วันที่ และ ราคารวม ของใบเสร็จที่ออกก่อนวันที่ 15 ก.พ.--
SELECT ReceiptID, ReceiptDate, TotalCash FROM Receipts
WHERE ReceiptDate < '2025-02-15'

-- 7. รหัสสินค้า ชื่อสินค้า ที่มีจำนวนคงเหลือตั้งแต่ 400 ขึ้นไป--
SELECT productID, productName FROM products
WHERE UnitsInStock >= 400;

-- 8. รหัสสินค้า ชื่อสินค้า ราคา และ จำนวนคงเหลือ ของแชมพู,แป้งเด็ก,ดินสอ,ยางลบ--
SELECT productID, productName, UnitPrice, UnitsInStock FROM Products
WHERE productName IN ('แชมพู', 'แป้งเด็ก', 'ดินสอ', 'ยางลบ')

-- 9. รายละเอียดของสินค้าประเภทเครื่องเขียน--
SELECT  [description] FROM Categories
WHERE categoryName = 'เครื่องเขียน'


-- 10. รหัสประเภทสินค้า ชื่อประเภท และรายละเอียดของ สินค้าประเภทเครื่องสำอาง--
SELECT CategoryID,CategoryName, (description) FROM Categories
WHERE CategoryName = 'เครื่องสำอาง'

-- 11.คำนำหน้า ชื่อ นามสกุล ของพนักงานที่เป็น Sale Representative--
SELECT EmployeeID,FirstName,LastName,[Position] FROM employees
WHERE position = 'Sale Representative'


-- 12. รหัสพนักงาน ชื่อพนักงาน ชื่อผู้ใช้ รหัสผ่าน ของพนักงานทุกคน--
SELECT EmployeeID,FirstName, username,[Password] FROM employees


-- 13. ชื่อผู้ใช้ และรหัสผ่านของพนักงานที่ชื่อก้องนิรันดร์--
SELECT EmployeeID,FirstName,[password] FROM Employees
WHERE FirstName = 'ก้องนิรันดร์'


-- 14. รหัสพนักงานที่ออกใบเสร็จหมายเลข 3--
SELECT employeeID FROM Receipts
WHERE ReceiptID = 3;

-- 15. รหัสสินค้า ชื่อสินค้า ราคา ของสินค้าที่มีรหัสประเภท 2, 4--
SELECT productID, productName, UnitPrice FROM products
WHERE categoryID IN (2, 4);









