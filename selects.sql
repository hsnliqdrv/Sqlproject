use CarRepairSystem
-- From Customers, retrieve the top 10 customers ordered alphabetically by LastName.
SELECT TOP 10 * FROM Customers ORDER BY LastName;

-- From Cars, list records 11–20 when sorted by Brand.
SELECT * FROM Cars ORDER BY Brand 
OFFSET 11 ROWS FETCH NEXT 10 ROWS ONLY;

-- From Services, show all distinct service names.
SELECT DISTINCT ServiceName FROM Services;

-- From Workers, find those whose Salary between 1000 and 3000 and whose Experience like '%engine%'.
SELECT * FROM Workers WHERE
(Salary BETWEEN 1000 AND 3000) AND
(Experience LIKE '%engine%');

-- From Orders, display orders whose OrderDate between '2024-01-01' and '2024-12-31'.
SELECT * FROM Orders WHERE
(OrderDate BETWEEN '2024-01-01' and '2024-12-31');

-- From Equipments, return items where Quantity not between 5 and 20 or Cost > 500.
SELECT * FROM Equipments WHERE
(Quantity NOT BETWEEN 5 and 20) OR (Cost > 500);

-- From Garages, find all garages whose Capacity greater than or equal to 10 and RoomNumber in (101, 102, 201).
SELECT * FROM Garages WHERE
(Capacity >= 10 AND RoomNumber IN (101, 102, 201));

-- From Buildings, list buildings where City like 'B%' and District not like '%Old%'.
SELECT * FROM Buildings WHERE
(City LIKE 'B%' AND District NOT LIKE '%Old%');

-- From Services, show services whose Cost between 50 and 200 or ServiceName like '%Repair%'.
SELECT * FROM Services WHERE
(Cost BETWEEN 50 and 200 OR ServiceName LIKE '%Repair%');

-- From Workers, retrieve the 5 most recently employed workers ordered by EmploymentDate DESC.
SELECT TOP 5 * FROM Workers ORDER BY EmploymentDate DESC;
