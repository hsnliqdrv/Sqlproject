create table Customers (CustomerID int primary key, FirstName varchar(50), LastName varchar(50), PhoneNumber varchar(50), Email varchar(50));
create table Orders(OrderID int primary key, CustomerID int, OrderDate date, FinishDate date, ServiceID int, CarID int);
create table Cars(CarID int primary key, Brand varchar(50), Model varchar(50), Price decimal(20, 2), GarageID int, ManufactureDate date, Status varchar(50));
create table Services(ServiceID int primary key, ServiceName varchar(50), Cost decimal(10, 2), CreationDate date);
create table Workers(WorkerID int primary key, WorkerName varchar(50), Salary decimal(10, 2), ServiceID int, EmploymentDate date, Experience text);
create table Garages(GarageID int primary key, BuildingID int, RoomNumber int, Capacity int);
create table Equipments(EquipmentID int primary key, EquipmentName varchar(50), ServiceID int, Quantity int, Cost decimal(10, 2));
create table Buildings(BuildingID int primary key, City varchar(50), District varchar(50), Street varchar(50), FlatCode int);

alter table Orders add foreign key (CustomerID) references Customers(CustomerID);
alter table Orders add foreign key (ServiceID) references Services(ServiceID);
alter table Orders add foreign key (CarID) references Cars(CarID);
alter table Cars add foreign key (GarageID) references Garages(GarageID);
alter table Workers add foreign key (ServiceID) references Services(ServiceID);
alter table Equipments add foreign key (ServiceID) references Services(ServiceID);
alter table Garages add foreign key (BuildingID) references Buildings(BuildingID);

insert into Buildings (BuildingID, City, District, Street, FlatCode)
values
(1, 'Baku', 'Sabunchu', 'Narimanov Street', 12),
(2, 'Ganja', 'Kapaz', 'Heydar Aliyev Ave', 34),
(3, 'Sumqayit', 'Nasimi', 'Azadliq Street', 7);

insert into Garages (GarageID, BuildingID, RoomNumber, Capacity)
values
(1, 1, 101, 5),
(2, 1, 102, 3),
(3, 2, 201, 4);

insert into Services (ServiceID, ServiceName, Cost, CreationDate)
values
(1, 'Engine Repair', 350.00, '2024-05-15'),
(2, 'Oil Change', 50.00, '2024-06-01'),
(3, 'Brake Replacement', 180.00, '2024-07-10'),
(4, 'Car Wash', 25.00, '2024-08-05');

insert into Customers (CustomerID, FirstName, LastName, PhoneNumber, Email)
values
(1, 'Ali', 'Mammadov', '+994501234567', 'ali.mammadov@example.com'),
(2, 'Nigar', 'Hasanova', '+994552223344', 'nigar.hasanova@example.com'),
(3, 'Murad', 'Aliyev', '+994707778899', 'murad.aliyev@example.com'),
(4, 'Aynur', 'Rzayeva', '+994553332211', 'aynur.rzayeva@example.com');

insert into Cars (CarID, Brand, Model, Price, GarageID, ManufactureDate, Status)
values
(1, 'Toyota', 'Corolla', 59000, 1, '2018-03-12', 'Inactive'),
(2, 'BMW', 'X5', 12000, 2, '2020-07-25', 'Discontinued'),
(3, 'Mercedes', 'C200', 80000, 3, '2019-01-10', 'Workinng'),
(4, 'Hyundai', 'Elantra', 20000, 1, '2021-11-15', 'Discontinued');

insert into Workers (WorkerID, WorkerName, Salary, ServiceID, EmploymentDate, Experience)
values
(1, 'Rashad Abbasov', 1200.00, 1, '2021-02-10', '5 years in engine repair'),
(2, 'Tural Huseynov', 900.00, 2, '2022-03-20', '3 years in oil maintenance'),
(3, 'Elvin Karimov', 1100.00, 3, '2020-07-12', '4 years in brake systems'),
(4, 'Kamran Ali', 800.00, 4, '2023-01-15', '2 years in car cleaning');

insert into Equipments (EquipmentID, EquipmentName, ServiceID, Quantity, Cost)
values
(1, 'Hydraulic Jack', 1, 5, 150.00),
(2, 'Oil Filter Wrench', 2, 10, 25.00),
(3, 'Brake Bleeder Kit', 3, 4, 80.00),
(4, 'Pressure Washer', 4, 2, 400.00);

insert into Orders (OrderID, CustomerID, OrderDate, FinishDate, ServiceID, CarID)
values
(1, 1, '2024-10-01', '2024-10-03', 1, 1),
(2, 2, '2024-10-05', '2024-10-05', 2, 2),
(3, 3, '2024-10-10', '2024-10-11', 3, 3),
(4, 4, '2024-10-15', '2024-10-15', 4, 4),
(5, 1, '2024-10-20', '2024-10-22', 3, 1);
