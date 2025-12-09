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
