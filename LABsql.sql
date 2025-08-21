SELECT p.ProductID, p.ProductName, s.CompanyName, s.Country
FROM Products p JOIN Suppliers s ON p.SupplierID = s.SupplierID

Select p.ProductID, p.ProductName, s.CompanyName, S.Country
FROM Products p , Suppliers s
WHERE p.SupplierID = s.SupplierID;

SELECT CompanyName, OrderID
FROM Orders JOIN Shippers ON Shippers.ShipperID = Orders.ShipVia
WHERE OrderID = 10275

SELECT e.EmployeeID, FirstName, OrderID
FROM Employees e join orders o on e.EmployeeID = o.EmployeeID
ORDER BY e.EmployeeID

--? ต้องการชื่อบริษัท และจำนวนการสั่งซื้อที่เกี่ยวข้อง
SELECT productID, ProductName, City, Country
FROM Products p JOIN Suppliers s ON p.SupplierID = s.SupplierID

--? ต้อวการรหัสสินค้า ชื่อสินค้า และจำนวนทั้งหมดที่ขายได้
SELECT CompanyName, COUNT(*) AS NumberOfOrders
FROM orders o join Shippers s ON o.ShipVia = s.ShipperID
GROUP BY CompanyName

--? ต้องการรหัสสินค้า ชื่อสินค้า และจำนวนทั้งหมดที่ขายได้
SELECT p.ProductID, p.ProductName, SUM(od.Quantity) AS TotalSold
FROM Products p JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY 1

--? ต้องการรหัสสินค้า ชื่อสินค้า ชื่อบริษัท และที่อยู่จัดส่ง
SELECT o.OrderID เลขใบสั่งซื้อ, c.CompanyName ลูกค้า, e.FirstName พนักงาน, o.ShipAddress ส่งไปที่
FROM Orders o, Customers c, Employees e
WHERE o.CustomerID = c.CustomerID
    AND o.EmployeeID = e.EmployeeID;

--? ต้องการรหัสใบสั่งซื้อ ชื่อลูกค้า ชื่อพนักงาน และที่อยู่จัดส่ง
SELECT o.OrderID เลขใบสั่งซื้อ, c.CompanyName ลูกค้า, e.FirstName พนักงาน, o.ShipAddress ส่งไปที่
FROM Orders o
    JOIN Customers c ON o.CustomerID = c.CustomerID
    JOIN Employees e ON o.EmployeeID = e.EmployeeID;

--? ต้องการรหัสสินค้า ชื่อสินค้า และจำนวนทั้งหมดที่ขายได้
SELECT e.EmployeeID, FirstName, COUNT(*) [จำนวน Order], Sum(Freight) [Sum of Freight]
FROM Employees e JOIN Orders o on e.EmployeeID = o.EmployeeID
WHERE YEAR(orderdate) = 1998
GROUP BY e.EmployeeID, FirstName

--? ต้องการรหัสสินค้า ชื่อสินค้า ที่ nancy ขายได้ทั้งหมด เรียงลำดับตามลำดับสินค้า
SELECT DISTINCT p.ProductID, p.ProductName
FROM Employees e 
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
    JOIN [Order Details] od on o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
WHERE e.FirstName = 'Nancy'

--? ต้องการชื่อบริษัทลูกค้าชื่อ Around the Horn ชื่อสินที่มาจากประเทศอะไรบ้าง
SELECT distinct s.Country
FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
    JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE c.CompanyName = 'Around the Horn'

--? บริษัทลูกค้า ชื่อ Around the Horn ซื้อสินค้าอะไรบ้าง จำนวนเท่าไหร่
SELECT p.ProductID, p.productName, SUM(od.Quantity) AS TotalQuantity
FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
WHERE c.CompanyName = 'Around the Horn'
GROUP BY p.ProductID, p.ProductName
ORDER BY p.ProductID,p.ProductName;

--ต้องการหมายเลขสั่งซื้อ ชื่อพนักงาน และยอดขายในใบสั่งซื้อ
SELECT o.OrderID, e.firstName,
        sum((od.quantity * od.Unitprice * (1-od.Discount))) as Totalcash
FROM Orders o JOIN Employees e on o.EmployeeID = e. EmployeeID
              JOIN [Order Details] od on o.OrderID = od.OrderID
GROUP BY o.OrderID, e.FirstName
ORDER BY OrderID

--?ต้องการหมายเลขใบสั่งซื้อ ชื่อพนักงาน และยอดขายในใบสั่งซื้อ
SELECT o.OrderID, e.FirstName + ' ' + e.LastName as FullName, SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS TotalSales
FROM Orders o
    JOIN Employees e ON o.EmployeeID = e.EmployeeID
    JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY o.OrderID, e.FirstName, e.LastName
ORDER BY o.OrderID;


