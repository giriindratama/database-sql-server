Create Table Staff (
	StaffID char(9) primary key not null check(StaffID like 'STF[0-9][0-9][0-9]'),
	StaffName varchar(30) not null,
	StaffAddress varchar(30) not null,
	StaffDOB date not null check(StaffDOB between'1985/01/01' and '2000/12/31'),
	StaffNumber varchar(30) not null,
	StaffEmail varchar(30) not null,
	StaffSalary int not null, 
	StaffPosition varchar(30) not null
)


Create table Vendor (
	VendorID char(9) primary key not null check(VendorID like 'VEN[0-9][0-9][0-9]'),
	VendorName varchar(30) not null,
	VendorAddress varchar(30) not null,
	VendorEmail varchar(30) not null check(VendorEmail like '%@%' and VendorEmail like '%.com'),
	VendorPhoneNumber varchar(30) not null
)

Create table Ingredient(
	IngredientID char(9) primary key not null check(IngredientID like 'ING[0-9][0-9][0-9]'),
	IngredientName varchar(30) not null,
	IngredientPrice int not null,
)

Create Table purchaseTransaction (
	PurchaseTransactionID char(9) primary key not null check(PurchaseTransactionID like 'PUR[0-9][0-9][0-9]'),
	StaffID char(9) not null foreign key(StaffID) references Staff(StaffID),
	IngredientID char(9) not null foreign key(IngredientID) references Ingredient(IngredientID),
	VendorID char(9) not null foreign key(VendorID) references Vendor(VendorID),
	TransactionDate date not null,
	QuantityIngredient int not null check(QuantityIngredient > 0)
)

Create table ProductType(
	ProductTypeData char(9) not null primary key check(ProductTypeData like 'TYP[0-9][0-9][0-9]'),
	ProductTypeDataName varchar(30) not null check(ProductTypeDataName = 'Dessert' or ProductTypeDataName='Main Course' or ProductTypeDataName='Beverages' or ProductTypeDataName='Appetizer'),
)

Create table Product(
	ProductID char(9)  not null primary key check(ProductID like 'PRO[0-9][0-9][0-9]'),
	ProductName varchar(30) not null,
	ProductPrice int not null,
	ProductTypeData char(9) not null foreign key(ProductTypeData) references ProductType(ProductTypeData)
)

Create table Customer(
	CustomerID char(9) primary key not null check(CustomerId like 'CUS[0-9][0-9][0-9]'),
	CustomerName varchar(30) not null,
	CustomerAddress varchar(30) not null,
	CustomerDOB date not null,
	CustomerPhone varchar(30) check(LEN(CustomerPhone) > 10),
	CustomerEmail varchar(30) check(CustomerEmail like '%@%' and CustomerEmail like '%.co.id')
)

Create table SalesTransaction (
SalesTransactionID char(9) primary key not null check(SalesTransactionId like 'SAL[0-9][0-9][0-9]'),
StaffID char(9) not null foreign key(StaffID) references Staff(StaffID),
ProductID char(9) not null foreign key(ProductID) references Product(ProductID),
CustomerID char(9) not null foreign key(CustomerId) references Customer(CustomerID),
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
 
 --Staff
Insert into Staff values('STF001', 'Giri', 'Jalan U', '1997/02/21', '0877328132', 'made@mail.com', 2000000, 'Desser')
Insert into Staff values('STF002', 'Patrick', 'Jalan Samping', '1992/11/01', '0877234158', 'patrick@mail.com', 2300000, 'Main Curse')
Insert into Staff values('STF003', 'Tommy', 'Jalan Sandung', '1990/12/21', '0877612456', 'tommy@mail.com', 3600000, 'Finnacial Officer')
Insert into Staff values('STF004', 'Andrew', 'Jalan Selatan', '1997/01/01', '0877545236', 'andrew@mail.com', 2500000, 'Beverages')
Insert into Staff values('STF005', 'Topan', 'Jalan Angin', '1995/05/08', '0877541523', 'topan@mail.com', 2000000, 'Desser')
Insert into Staff values('STF006', 'Ekho', 'Jalan Raya', '1992/07/11', '08773124523', 'ekho@mail.com', 3600000, 'Financial Officer')
Insert into Staff values('STF007', 'Brily', 'Jalan Utara', '1998/01/30', '08778475423', 'brily@mail.com', 2300000, 'Main Curse')
Insert into Staff values('STF008', 'Chris', 'Jalan Temang', '1995/09/04', '08774950434', 'chris@mail.com', 2000000, 'Desser')
Insert into Staff values('STF009', 'Bram', 'Jalan Selatan', '1993/12/30', '08773421456', 'bram@mail.com', 2800000, 'Branch Appetizer')
Insert into Staff values('STF010', 'Samuel', 'Jalan Kecil', '1994/05/28', '08773571356', 'samuel@mail.com', 2800000, 'Branch Appetizer')
Insert into Staff values('STF011', 'Yasir', 'Jalan Selempang', '1996/08/11', '08773451234', 'yasir@mail.com', 2000000, 'Desser')
Insert into Staff values('STF012', 'Alvin', 'Jalan Rakyat', '1989/07/09', '08776331634', 'alvin@mail.com', 3600000, 'Finnacial Officer')
Insert into Staff values('STF013', 'Tamara', 'Jalan Shydan', '1998/12/03', '08773425463', 'tamara@mail.com', 2500000, 'Beverages')
Insert into Staff values('STF014', 'Kaleb', 'Jalan Keluarga', '1992/07/29', '08773451235', 'kaleb@mail.com', 2500000, 'Beverages')
Insert into Staff values('STF015', 'Bianka', 'Jalan Salak', '1993/06/09', '08770948239', 'bianka@mail.com', 2300000, 'Main Curse')


--Vendor
Insert into Vendor values('VEN001', 'Bintang21', 'Jalan Menteng Raya no 33', 'bintang21@mail.com', '08173849383')
Insert into Vendor values('VEN002', 'Diantara', 'JL. Batas Dukusari No 5', 'diantara@mail.com', '08173829345')
Insert into Vendor values('VEN003', 'Mandailing', 'Ruko Permai No 3 Block E', 'mandailing@mail.com', '08183720912')
Insert into Vendor values('VEN004', 'PT Gitaswara Indonesia', 'Jalan Jend Sudirman no 9 ', 'gitaswaraIndo@mail.com', '0814418537')
Insert into Vendor values('VEN005', 'PT Gubah Bumi Selaras', 'Jl Jend Sudirman Kompl no 24C', 'bumiGubah@mail.com', '08177645623')
Insert into Vendor values('VEN006', 'PT Pangansari Utama Food', 'Jl Jend Sudirman 880', 'Utamafood@mail.com', '0817761551')
Insert into Vendor values('VEN007', 'PT Kiat Sukses', 'Jl Syarifudin Yose 5', 'suksesKia@mail.com', '0817876723')
Insert into Vendor values('VEN008', 'PT Resa Kalimantan Sakti', 'Jl Letjen Suprapto 1', 'Sakti004@mail.com', '0817424386')
Insert into Vendor values('VEN009', 'PT Tata Adhis Thana', 'Jl Mulawarman 12', 'tata_adhis@mail.com', '0817743138')
Insert into Vendor values('VEN010', 'Aneka Makmur', 'Jl Peta Lingkar no 41', 'aneka_makmur49@mail.com', '08176035001')
Insert into Vendor values('VEN011', 'PT Arta Boga Cemerlang', 'Jl Soekarno Hatta 70', 'cermelang33@mail.com', '08177300791')
Insert into Vendor values('VEN012', 'PD Betani', 'Jl Kopo 104', 'betani@mail.com', '08176010173')
Insert into Vendor values('VEN013', 'Cahaya Mulya Mandiri', 'Jl Papanggungan 36', 'mulyaMandiri@mail.com', '08177300203')
Insert into Vendor values('VEN014', 'CV Cemerlang Abadi', 'Jl Zamrud 11', 'Abadijaya@mail.com', '08177307635')
Insert into Vendor values('VEN015', 'PT Di-Marta', 'Jl Rebana 2', 'Martadinata@mail.com', '08177305121')

go
create procedure insertingredient
@ingredientid varchar(10),
@ingredientname varchar(30),
@ingredientprice int
as
	begin
		insert into Ingredient values(@ingredientid,@ingredientname,@ingredientprice)

		print 'success'
	end

	exec insertingredient 'ING001','breadcrumbs',30000
	exec insertingredient 'ING002','bun',10000
	exec insertingredient 'ING003','chicken breast',25000
	exec insertingredient 'ING004','beef',40000
	exec insertingredient 'ING005','egg',10000
	exec insertingredient 'ING006','onion',5000
	exec insertingredient 'ING007','milk',8000
	exec insertingredient 'ING008','cabbage',10000
	exec insertingredient 'ING009','tomato',3000
	exec insertingredient 'ING010','chili',3000
	exec insertingredient 'ING011','tomato sauce',2500
	exec insertingredient 'ING012','chili sauce',2500
	exec insertingredient 'ING013','flour',5000
	exec insertingredient 'ING014','cream',4000
	exec insertingredient 'ING015','Sesame seed',1500

	select * from Ingredient


select * from Staff 
select * from Vendor