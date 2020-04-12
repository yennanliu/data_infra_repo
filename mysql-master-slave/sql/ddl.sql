/*
### table 1 : Trips 
*/
Create table Trips (Id int, Client_Id int, Driver_Id int, City_Id int, Status varchar(30), Request_at varchar(50)); 
Truncate table Trips;
insert into Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('1', '1', '10', '1', 'completed', '2013-10-01'); 
insert into Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('2', '2', '11', '1', 'cancelled_by_driver', '2013-10-01');
insert into Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('3', '3', '12', '6', 'completed', '2013-10-01');
insert into Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('4', '4', '13', '6', 'cancelled_by_client', '2013-10-01'); 
insert into Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('5', '1', '10', '1', 'completed', '2013-10-02');
insert into Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('6', '2', '11', '6', 'completed', '2013-10-02');
insert into Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('7', '3', '12', '6', 'completed', '2013-10-02');
insert into Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('8', '2', '12', '12', 'completed', '2013-10-03');
insert into Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('9', '3', '10', '12', 'completed', '2013-10-03');
insert into Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('10', '4', '13', '12', 'cancelled_by_driver', '2013-10-03'); 

/*
### table 2 : Users
*/
Create table  Users (Users_Id int, Banned varchar(50), Role varchar(10));
Truncate table Users;
insert into Users (Users_Id, Banned, Role) values ('1', 'No', 'client');
insert into Users (Users_Id, Banned, Role) values ('2', 'Yes', 'client');
insert into Users (Users_Id, Banned, Role) values ('3', 'No', 'client');
insert into Users (Users_Id, Banned, Role) values ('4', 'No', 'client');
insert into Users (Users_Id, Banned, Role) values ('10', 'No', 'driver');
insert into Users (Users_Id, Banned, Role) values ('11', 'No', 'driver');
insert into Users (Users_Id, Banned, Role) values ('12', 'No', 'driver');
insert into Users (Users_Id, Banned, Role) values ('13', 'No', 'driver'); 

/*
### table 3 : Drivers
*/
Create table If Not Exists Drivers (Driver_Id int, Status varchar(50) , Role varchar(50));
Truncate table Drivers;
insert into Drivers (Driver_Id, Status, Role) values ('1', 'active', 'driver');
insert into Drivers (Driver_Id, Status, Role) values ('29', 'blocked', 'driver');
insert into Drivers (Driver_Id, Status, Role) values ('3', 'blocked', 'driver');
insert into Drivers (Driver_Id, Status, Role) values ('2', 'active', 'driver');
insert into Drivers (Driver_Id, Status, Role) values ('5', 'blocked', 'driver');
insert into Drivers (Driver_Id, Status, Role) values ('13', 'pending', 'driver');
insert into Drivers (Driver_Id, Status, Role) values ('98', 'active', 'driver');
insert into Drivers (Driver_Id, Status, Role) values ('7', 'pending', 'driver'); 

/* 
Add index and foreign key on tables 
-- ALTER TABLE Trips ADD INDEX Driver_Id (Driver_Id);
-- ALTER TABLE Users ADD INDEX Users_Id (Users_Id);
-- ALTER TABLE Drivers ADD INDEX Driver_Id (Driver_Id);
-- ALTER TABLE Trips ADD FOREIGN KEY (Client_Id) REFERENCES Users(Users_Id);
*/