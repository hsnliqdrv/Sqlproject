-- Task: Create a view that shows the total number of cars and total value of cars in each garage
CREATE VIEW GarageCarSummary AS
SELECT 
    g.GarageID,
    COUNT(c.CarID) AS TotalCars,
    SUM(c.Price) AS TotalCarValue
FROM Garages g
LEFT JOIN Cars c ON g.GarageID = c.GarageID
GROUP BY g.GarageID;
