-- Find all Cars where the price is the highest price inside their own Orders. Show the Cars name and the price.
select c.CarID, c.Brand + " " + c.Model as CarName, c.Price, s.ServiceName from Cars as c
left join Orders as o on o.CarID = c.CarID
inner join Services as s on s.ServiceID = o.ServiceID
where c.Price = (
select max(c.Price) from Orders as o
inner join Cars as c on o.CarID = c.CarID
where o.ServiceID = s.ServiceID
);

-- Show all Orders that have at least one Cars with status = 'Discontinued' or 'Inactive'. We need this list to plan new items.
select s.ServiceName from Services as s
where exists (
select o.OrderID from Orders as o
join Cars as c on c.CarID = o.CarID
where c.Status = "Discontinued" or c.Status = 'Inactive'
);

-- Find Cars where the price is higher than the price of all other Cars in the same Orders. These are top items in each group.
select c.Brand + " " + c.Model as CarName, s.ServiceName from Cars as c
left join Orders as o on o.CarID = c.CarID
inner join Services as s on s.ServiceID = o.ServiceID
where c.Price = (
select max(c.Price) from Orders as o
inner join Cars as c on o.CarID = c.CarID
where o.ServiceID = s.ServiceID
);
