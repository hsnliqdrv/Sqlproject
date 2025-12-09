-- Task: Create an index on Orders table to speed up queries by CustomerID and OrderDate
CREATE INDEX idx_Orders_CustomerID_OrderDate
ON Orders (CustomerID, OrderDate);
