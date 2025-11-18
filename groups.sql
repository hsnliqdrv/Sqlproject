-- For each Customers, count how many Orders they have. Show only Customers with 5 or more Orders. Sort by this number from big to small.
select min(c.FirstName+" "+c.LastName) as Name, count(o.OrderID) as OrderCount from Customers as c
left join Orders as o on c.CustomerID = o.CustomerID group by c.CustomerID
having count(o.OrderID) > 5 order by count(o.OrderID) desc;

-- Show the total amount for each Customers for rows on or after :from_date. Only keep Customers where the total is bigger than :min_total.
select min(c.FirstName+" "+c.LastName) as Name, count(o.OrderID) as OrderCount from Customers as c
left join Orders as o on c.CustomerID = o.CustomerID
where o.OrderDate >= '2024-10-01'
group by c.CustomerID having count(o.OrderID) > 0;

-- Find the average amount for each Customers, but only for rows where status = 'Completed'. Show only Customers where the average is bigger than :target.
select min(c.FirstName+" "+c.LastName) as Name, avg(s.Cost) as AvgCost from Customers as c
left join Orders as o on c.CustomerID = o.CustomerID
inner join Services as s on o.ServiceID = s.ServiceID
where o.FinishDate is not null and o.FinishDate <= getdate()
group by c.CustomerID having avg(s.Cost) > 50.0;

-- For each Customers, count how many different types or categories of Orders they have. Show only Customers with 3 or more different types.
select min(c.FirstName+" "+c.LastName) as Name, count(o.ServiceID) as DifferentServices from Customers as c
left join Orders as o on c.CustomerID = o.CustomerID group by c.CustomerID
having count(o.ServiceID) >= 3;

-- Make a summary for each Customers with total amount, and also add a final row that shows the grand total for all Customers together (like a rollup).
select
case when (grouping(c.CustomerID) = 1) then 'Total' else min(c.FirstName+" "+c.LastName) end
as Name, sum(s.Cost) as TotalCost from Customers as c
left join Orders as o on c.CustomerID = o.CustomerID
inner join Services as s on o.ServiceID = s.ServiceID
group by c.CustomerID with rollup;
