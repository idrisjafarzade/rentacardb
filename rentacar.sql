--CREATE DATABASE		RentACardb

--USE RentACardb

--CREATE TABLE	CarsTypes(
--	Id int primary key identity,
--	Type nvarchar(50)
--)
--insert into CarsTypes
--Values ('Sport'),
--	   ('Business'),
--	   ('Econom')
	

--CREATE TABLE	Cars(
--	Id int primary key identity,
--	Marka nvarchar (50)not null,
--	Model nvarchar (50)not null,
--	Year int not null,
--	Color nvarchar (50) not null,
--	CarstypeId int references  CarsTypes(Id)
--)

--insert into Cars
--values ('BMW', 'M5', 2021, 'DarkBlue', 1),
--		('Mercedes', 'ClS 63', 2020, 'Black',1),
--		('Toyota', 'Prius', 2018, 'White', 3),
--		('Mercedes', 'S500', 2022, 'Black',2)   
 

 --CREATE TABLE CarsStatuses(
	--Id int primary key identity,
	--Status nvarchar (20) not null,
 --)


  --insert into CarsStatuses
  --values ('Empty'),
		-- ('Full')


--Create Table ServicesTypes(
--	Id int primary key identity,
--	TypeName nvarchar (20) not null,
--)

--insert into ServicesTypes
--values ('CHILD SEAT'),
--		('ADDITIONAL DRIVER'),	
--		('GPS NAVIGATOR')




--Create Table ServicesCharges(
--	Id int primary key identity,
--	Price int not null,
--	ServicesTypeId int references ServicesTypes(Id)
--)

--insert into ServicesCharges
--values (20, 1),
--		(50,2),
--		(20,3)

--Create Table PaymentTypes(
--	Id int primary key identity,
--	Type nvarchar (50) not null,
--)
--insert into PaymentTypes
--values ('Credit cards'),
--		('Cash'),
--		('Debit cards')


--create table Customers(
--  Id int primary key identity,
--  Name  nvarchar(50) not null,
--  Surname  nvarchar(50) not null,
--  PhoneNumber int not null,
--  Email nvarchar (100) not null,

--)

--insert into Customers
--values ('idris', 'Jafarzade',0508858085, 'idrisjj@code.edu.az'),
--		('Alisimran', 'Mammadli', 0506281360, 'alisimranma@code.edu.az')

--create table Reservations(
--	Id int primary key identity,
--	StartDate nvarchar(50) not null,
--	EndDate  nvarchar (50) not null,
--	CustomerId int references Customers(Id),
--	CarId int references Cars(id),
--	CarstatusId  int references CarsStatuses(Id)
--)
--insert into Reservations 
--values ('01.01.2021 09:00','10.01.2021 09:00', 1,1,2),
--		('09.01.2021 09:00','20.01.2021 09:00', 2,2,2)


--create table Payments (
--	Id int primary key identity,
--	Amount int not null,
--	PaymentTypeId int references PaymentTypes(Id),
--	ReservationId int references Reservations(Id),
--	ServicesChargeId int references ServicesCharges(id)
--)

--insert into Payments
--Values (2000, 2, 1, 2),
--		(3000, 1,2,1)



--create table ChangesReservations(
--	Id int primary key identity,
--	StartDate nvarchar(50) not null,
--	EndDate  nvarchar (50) not null,
--	CarId int references Cars(id),
--	CarstatusId  int references CarsStatuses(Id),
--	ReservationId int references Reservations(Id)
--)
--insert into ChangesReservations 
--values
--	('09.01.2021 09:00','15.01.2021 09:00', 3,2,2)

--create view v_GetPaymentsInfo
--as
--SELECT name , surname, phonenumber, Email, Marka, Model, StartDate, EndDate, Amount,pt.Type FROM Payments p

--JOIN PaymentTypes pt
--ON p.PaymentTypeId=pt.Id

--JOIN Reservations r
--ON p.ReservationId=r.Id

--join Customers c
--on r.CustomerId=c.Id

--join Cars Ca
--on r.CarId=ca.Id

--join CarsTypes ct
--on ca.CarstypeId=ct.Id




--Create procedure GetPaymentsInfo @amount int
--as
--select * from v_GetPaymentsInfo
--Where Amount > @amount

--execute GetPaymentsInfo 2000

--create function GetAmountsSum (@Id int)
--returns int
--as
--begin
--	declare @sum int
--	select @sum=sum(Amount) from Payments
--	Where Id>@Id
--	return @sum

--end
select dbo.GetAmountsSum (0)
