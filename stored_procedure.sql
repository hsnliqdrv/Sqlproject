-- Task: Create a stored procedure to get all orders for a given customer along with car and service details
CREATE PROCEDURE GetCustomerOrders
    @CustomerID INT
AS
BEGIN
    SELECT 
        o.OrderID,
        o.OrderDate,
        o.FinishDate,
        c.Brand AS CarBrand,
        c.Model AS CarModel,
        s.ServiceName,
        s.Cost AS ServiceCost
    FROM Orders o
    INNER JOIN Cars c ON o.CarID = c.CarID
    INNER JOIN Services s ON o.ServiceID = s.ServiceID
    WHERE o.CustomerID = @CustomerID
    ORDER BY o.OrderDate DESC;
END;
