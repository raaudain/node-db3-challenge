-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select prod.ProductName as "Product Name",
    cat.CategoryName as "Category Name"
from Product as prod
join Category as cat on prod.CategoryId = cat.id;


-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select ord.id, 
    ord.ShippedDate, 
    shpr.CompanyName as "Company Name"
from [Order] as ord
join Shipper as shpr on ord.ShipVia = shpr.id
where ord.OrderDate < "2012-08-09";


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select ord_d.OrderId,
    prod.ProductName,
    ord_d.Quantity
from OrderDetail as ord_d
join Product as prod on ord_d.ProductId = prod.id
where ord_d.OrderId = 10251
order by prod.ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select o.id as "Order Id",
    cust.companyname as "Company Name",
    em.lastname as "Order Taken By"
from [Order] as o
join Customer as cust on o.CustomerID = cust.ID
join Employee as em on o.EmployeeId = em.id;