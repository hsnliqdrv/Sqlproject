-- Make a list that shows each Customers with its Orders. Show the Orders name and the Customers name. Only show active rows. Sort by Orders name.
select (c.FirstName + " " + c.LastName) as Customer, s.ServiceName as Service from Customers as c
inner join Orders as o on o.CustomerID = c.CustomerID
inner join Services as s on o.ServiceID = s.ServiceID;

-- Find all Cars that do not have any Customers. We want to contact them. Show Cars name and ID.
select c.* from Cars as c left join Orders as o on o.CarID = c.CarID where o.OrderID is null;

-- Show all Customers that are not connected to any Services. Include Customers name. Sort by newest first if you have a date column.
select * from Customers as c where not exists
(select 1 from Orders as o where (o.ServiceID is not null) and o.CustomerID = c.CustomerID);

-- Make a full report for Orders and Customers. Show all rows from both tables and mark where there is no match. Use this to check data problems.
select c.*, o.* from Customers as c 
full join Orders as o on c.CustomerID = o.CustomerID;

-- Find rows in Customers that look like duplicates. Show pairs of rows that have the same name but different IDs.
select c1.CustomerID, c2.CustomerID from Customers as c1 inner join Customers as c2 on
(c1.CustomerID < c2.CustomerID and c1.FirstName = c2.FirstName and c1.LastName = c2.LastName);
