Create Table staff (
	StaffID char(9) primary key not null check(StaffID like 'STF[0-9][0-9][0-9]'),
	StaffName varchar(30) not null,
	StaffAddress varchar(30) not null,
	StaffDOB date not null check(StaffDOB between'1985/01/01' and '2000/12/31'),
	StaffNumber varchar(30) not null,
	StaffEmail varchar(30) not null,
	StaffSalary int not null, 
	StaffPosition varchar(30) not null
)


Create table vendor (
	VendorID char(9) primary key not null check(VendorID like 'VEN[0-9][0-9][0-9]'),
	VendorName varchar(30) not null,
	VendorAddress varchar(30) not null,
	VendorEmail varchar(30) not null check(VendorEmail like '%@%' and VendorEmail like '%.co.id'),
	VendorPhoneNumber varchar(30) not null
)

Create table ingredient(
	IngredientID char(9) primary key not null check(IngredientID like 'ING[0-9][0-9][0-9]'),
	IngredientName varchar(30) not null,
	IngredientPrice int not null,
)

Create Table purchaseTransaction (
	PurchaseTransactionID char(9) primary key not null check(PurchaseTransactionID like 'PUR[0-9][0-9][0-9]'),
	StaffID char(9) not null foreign key(StaffID) references staff(StaffID),
	IngredientID char(9) not null foreign key(IngredientID) references ingredient(IngredientID),
	VendorID char(9) not null foreign key(VendorID) references vendor(VendorID),
	TransactionDate date not null,
	QuantityIngredient int not null check(QuantityIngredient > 0)
)

Create table productType(
	ProductTypeData char(9) not null primary key check(ProductTypeData like 'TYP[0-9][0-9][0-9]'),
	ProductTypeDataName varchar(30) not null check(ProductTypeDataName = 'Dessert' or ProductTypeDataName='Main Course' or ProductTypeDataName='Beverages' or ProductTypeDataName='Appetizer'),
)

Create table product(
	ProductID char(9)  not null primary key check(ProductID like 'PRO[0-9][0-9][0-9]'),
	ProductName varchar(30) not null,
	ProductPrice int not null,
	ProductTypeData char(9) not null foreign key(ProductTypeData) references productType(ProductTypeData)
)

Create table customer(
	CustomerID char(9) primary key not null check(CustomerId like 'CUS[0-9][0-9][0-9]'),
	CustomerAddress varchar(30) not null,
	CustomerDOB date not null,
	CustomerPhone varchar(30) check(LEN(CustomerPhone) > 10),
	CustomerEmail varchar(30) check(CustomerEmail like '%@%' and CustomerEmail like '%.co.id')
)

Create table salesTransaction (
SalesTransactionID char(9) primary key not null check(SalesTransactionId like 'SAL[0-9][0-9][0-9]'),
StaffID char(9) not null foreign key(StaffID) references staff(StaffID),
ProductID char(9) not null foreign key(ProductID) references product(ProductID),
CustomerID char(9) not null foreign key(CustomerId) references customer(CustomerID),
TransactionDate date not null,
QuantityProduct int not null check(QuantityProduct > 0)
)

drop table ingredient
drop table productType
drop table staff
drop table purchaseTransaction
drop table vendor
drop table product
drop table salesTransaction
drop table customer
 
Insert into staff values('STF001', 'Giri', 'Jalan U', '1997/02/21', '0877328132', 'made@mail.com', 2000000, 'Desser')
Insert into staff values('STF002', 'Patrick', 'Jalan Samping', '1992/11/01', '0877234158', 'patrick@mail.com', 2300000, 'Main Curse')
Insert into staff values('STF003', 'Tommy', 'Jalan Sandung', '1990/12/21', '0877612456', 'tommy@mail.com', 3000000, 'Finnacial Officer')
Insert into staff values('STF004', 'Andrew', 'Jalan Selatan', '1997/01/01', '0877545236', 'andrew@mail.com', 2500000, 'Beverages')
Insert into staff values('STF005', 'Topan', 'Jalan Angin', '1995/05/08', '0877541523', 'topan@mail.com', 2000000, 'Desser')
Insert into staff values('STF006', 'Ekho', 'Jalan ', '1997/02/21', '0877328132', 'made@mail.com', 2000000, 'Desser')
Insert into staff values('STF007', 'Giri', 'Jalan U', '1997/02/21', '0877328132', 'made@mail.com', 2000000, 'Desser')
Insert into staff values('STF008', 'Giri', 'Jalan U', '1997/02/21', '0877328132', 'made@mail.com', 2000000, 'Desser')
Insert into staff values('STF009', 'Giri', 'Jalan U', '1997/02/21', '0877328132', 'made@mail.com', 2000000, 'Desser')
Insert into staff values('STF010', 'Giri', 'Jalan U', '1997/02/21', '0877328132', 'made@mail.com', 2000000, 'Desser')
Insert into staff values('STF011', 'Giri', 'Jalan U', '1997/02/21', '0877328132', 'made@mail.com', 2000000, 'Desser')
Insert into staff values('STF012', 'Giri', 'Jalan U', '1997/02/21', '0877328132', 'made@mail.com', 2000000, 'Desser')
Insert into staff values('STF013', 'Giri', 'Jalan U', '1997/02/21', '0877328132', 'made@mail.com', 2000000, 'Desser')
Insert into staff values('STF014', 'Giri', 'Jalan U', '1997/02/21', '0877328132', 'made@mail.com', 2000000, 'Desser')
Insert into staff values('STF015', 'Giri', 'Jalan U', '1997/02/21', '0877328132', 'made@mail.com', 2000000, 'Desser')
select * from staff