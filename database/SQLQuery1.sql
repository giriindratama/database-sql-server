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
	VendorEmail varchar(30) not null check(VendorEmail like '%@%' and VendorEmail like '%.co.id'),
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
	CustomerAddress varchar(30) not null,
	CustomeName varchar(30),
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


 -- insert Staff
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

--insert Vendor
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
select * from Vendor

--insert Ingredient
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


	
-- 
	
-- insert Customer
go
	create procedure insertingcustomer
@custid varchar(10),
@custaddress varchar(50),
@custname varchar(30),
@custdob date,
@custphone varchar(30),
@custemail varchar(30)
as
	begin
		insert into Customer values(@custid,@custaddress,@custname,@custdob,@custphone,@custemail)

		print 'success'
	end

	exec insertingcustomer 'CUS001','Jalan hope valley','Jacob seed','1970-04-02',087658376767,'underbos1@gmail.co.id'
	exec insertingcustomer 'CUS002','Jalan montana valley','Joseph seed','1972-04-02',08765887878787,'bos1@gmail.co.id'
	exec insertingcustomer 'CUS003','Jalan norhtern valley','John seed','1986-04-02',087658376576,'underbos2@gmail.co.id'
	exec insertingcustomer 'CUS004','Jalan hope valley 2','Faith','1992-04-02',0876589987966,'underbos3@gmail.co.id'
	exec insertingcustomer 'CUS005','Jalan norhtern kyrat','ajay ghale','1982-04-02',0876589090090,'palay1@gmail.co.id'
	exec insertingcustomer 'CUS006','Jalan southern kyrat','Pagan min','1960-04-02',08765839806987,'bos1@gmail.co.id'
	exec insertingcustomer 'CUS007','Jalan Kemang raya 2','Joko susanto','1970-05-02',0876583456764,'joko@gmail.co.id'
	exec insertingcustomer 'CUS008','Jalan Kemang raya 3','habib habibu','1948-12-02',08765887988766,'habibers1@gmail.co.id'
	exec insertingcustomer 'CUS009','Jalan Kemang raya 4','Yanny sumanti','1970-04-02',0876598098097,'yanny1@gmail.co.id'
	exec insertingcustomer 'CUS010','Jalan Kemang raya 5','Laurel','1970-04-02',087658309807,'laurel1@gmail.co.id'
	exec insertingcustomer 'CUS011','Jalan greenville 1','samuel l jackson','1948-04-02',0876580080987,'nickfury@gmail.co.id'
	exec insertingcustomer 'CUS012','Jalan greenville 2','Keith david','1970-04-02',087658098099709,'Keithdavid@gmail.co.id'
	exec insertingcustomer 'CUS013','Jalan greenville 3','ian gallagher','1991-04-02',087658398798098,'iangall@gmail.co.id'
	exec insertingcustomer 'CUS014','Jalan greenville 4','lip gallagher','1993-04-02',0876583987759,'lipshameless@gmail.co.id'
	exec insertingcustomer 'CUS015','Jalan greenville 5','carl gallagher','1999-04-02',0876583749869587,'carlls@gmail.co.id'

	select * from Customer


-- insert productType
	go
	create procedure insertproductype
	@productid char(9),
	@productname varchar(30)
	as
		begin
		insert into ProductType values(@productid,@productname)
		print 'success';

		end

		exec insertproductype 'TYP001','Dessert'
		exec insertproductype 'TYP002','Main Course'
		exec insertproductype 'TYP003','Beverages'
		exec insertproductype 'TYP004','Appetizer'
		
		select * from ProductType

-- insert Type Product		
	select * from ProductType

	go
	create procedure insertproduct
		@prodid char(10),
		@prodname varchar(30),
		@prodprice int,
		@prodtypedata char(9)
		as
		begin
			insert into Product values(@prodid,@prodname,@prodprice,@prodtypedata)

			print 'success'
		end

	exec insertproduct 'PRO001','burger',13000,'TYP001'


-- insert Product
	Insert Into Product values('PRO001', 'burger', 130000, (Select ProductTypeData from ProductType where ProductTypeData = 'TYP002'))
	Insert Into Product values('PRO002', 'Spicy Chicken', 130000, (Select ProductTypeData from ProductType where ProductTypeData = 'TYP002'))
	Insert Into Product values('PRO003', 'Fried Chicken', 100000, (Select ProductTypeData from ProductType where ProductTypeData = 'TYP002'))
	Insert Into Product values('PRO004', 'French fries', 80000, (Select ProductTypeData from ProductType where ProductTypeData = 'TYP002'))
	Insert Into Product values('PRO005', 'Jelly', 60000, (Select ProductTypeData from ProductType where ProductTypeData = 'TYP001'))
	Insert Into Product values('PRO006', 'Mcclurry', 130000, (Select ProductTypeData from ProductType where ProductTypeData = 'TYP001'))
	Insert Into Product values('PRO007', 'Waffle ice cream', 130000, (Select ProductTypeData from ProductType where ProductTypeData = 'TYP001'))
	Insert Into Product values('PRO008', 'Ice cream', 130000, (Select ProductTypeData from ProductType where ProductTypeData = 'TYP001'))
	Insert Into Product values('PRO009', 'Rolls ice cream', 130000, (Select ProductTypeData from ProductType where ProductTypeData = 'TYP001'))
	Insert Into Product values('PRO010', 'red velvet cake', 130000, (Select ProductTypeData from ProductType where ProductTypeData = 'TYP001'))
	Insert Into Product values('PRO011', 'ice cake', 130000, (Select ProductTypeData from ProductType where ProductTypeData = 'TYP001'))
	Insert Into Product values('PRO012', 'Rootbeer', 130000, (Select ProductTypeData from ProductType where ProductTypeData = 'TYP003'))
	Insert Into Product values('PRO013', 'Milkshake', 130000, (Select ProductTypeData from ProductType where ProductTypeData = 'TYP003'))
	Insert Into Product values('PRO014', 'Cola', 130000, (Select ProductTypeData from ProductType where ProductTypeData = 'TYP003'))
	Insert Into Product values('PRO015', 'melted cake', 130000, (Select ProductTypeData from ProductType where ProductTypeData = 'TYP004'))

	select * from Product

	--insert salestransaction
	Insert Into SalesTransaction values('SAL001',(Select StaffID from Staff where StaffID = 'STF001'),(Select ProductID from Product where ProductID = 'PRO002'),
	(Select CustomerID from Customer where CustomerID = 'CUS001'),'2018/01/01',3)
	Insert Into SalesTransaction values('SAL002',(Select StaffID from Staff where StaffID = 'STF001'),(Select ProductID from Product where ProductID = 'PRO001'),
	(Select CustomerID from Customer where CustomerID = 'CUS002'),'2018/01/03',3)
	Insert Into SalesTransaction values('SAL003',(Select StaffID from Staff where StaffID = 'STF001'),(Select ProductID from Product where ProductID = 'PRO003'),
	(Select CustomerID from Customer where CustomerID = 'CUS003'),'2018/01/03',3)
	Insert Into SalesTransaction values('SAL004',(Select StaffID from Staff where StaffID = 'STF001'),(Select ProductID from Product where ProductID = 'PRO004'),
	(Select CustomerID from Customer where CustomerID = 'CUS004'),'2018/01/03',3)
	Insert Into SalesTransaction values('SAL005',(Select StaffID from Staff where StaffID = 'STF001'),(Select ProductID from Product where ProductID = 'PRO005'),
	(Select CustomerID from Customer where CustomerID = 'CUS005'),'2018/01/03',1)
	Insert Into SalesTransaction values('SAL006',(Select StaffID from Staff where StaffID = 'STF004'),(Select ProductID from Product where ProductID = 'PRO006'),
	(Select CustomerID from Customer where CustomerID = 'CUS006'),'2018/01/04',2)
	Insert Into SalesTransaction values('SAL007',(Select StaffID from Staff where StaffID = 'STF004'),(Select ProductID from Product where ProductID = 'PRO007'),
	(Select CustomerID from Customer where CustomerID = 'CUS007'),'2018/01/04',2)
	Insert Into SalesTransaction values('SAL008',(Select StaffID from Staff where StaffID = 'STF004'),(Select ProductID from Product where ProductID = 'PRO008'),
	(Select CustomerID from Customer where CustomerID = 'CUS008'),'2018/01/04',2)
	Insert Into SalesTransaction values('SAL009',(Select StaffID from Staff where StaffID = 'STF004'),(Select ProductID from Product where ProductID = 'PRO009'),
	(Select CustomerID from Customer where CustomerID = 'CUS009'),'2018/01/04',5)
	Insert Into SalesTransaction values('SAL010',(Select StaffID from Staff where StaffID = 'STF004'),(Select ProductID from Product where ProductID = 'PRO010'),
	(Select CustomerID from Customer where CustomerID = 'CUS010'),'2018/01/05',1)
	Insert Into SalesTransaction values('SAL011',(Select StaffID from Staff where StaffID = 'STF007'),(Select ProductID from Product where ProductID = 'PRO011'),
	(Select CustomerID from Customer where CustomerID = 'CUS011'),'2018/01/05',1)
	Insert Into SalesTransaction values('SAL012',(Select StaffID from Staff where StaffID = 'STF007'),(Select ProductID from Product where ProductID = 'PRO012'),
	(Select CustomerID from Customer where CustomerID = 'CUS012'),'2018/01/05',2)
	Insert Into SalesTransaction values('SAL013',(Select StaffID from Staff where StaffID = 'STF007'),(Select ProductID from Product where ProductID = 'PRO013'),
	(Select CustomerID from Customer where CustomerID = 'CUS013'),'2018/01/05',4)
	Insert Into SalesTransaction values('SAL014',(Select StaffID from Staff where StaffID = 'STF007'),(Select ProductID from Product where ProductID = 'PRO014'),
	(Select CustomerID from Customer where CustomerID = 'CUS014'),'2018/01/05',5)
	Insert Into SalesTransaction values('SAL015',(Select StaffID from Staff where StaffID = 'STF007'),(Select ProductID from Product where ProductID = 'PRO015'),
	(Select CustomerID from Customer where CustomerID = 'CUS0015'),'2018/01/06',2)
	Insert Into SalesTransaction values('SAL016',(Select StaffID from Staff where StaffID = 'STF007'),(Select ProductID from Product where ProductID = 'PRO015'),
	(Select CustomerID from Customer where CustomerID = 'CUS014'),'2018/01/06',1)
	Insert Into SalesTransaction values('SAL017',(Select StaffID from Staff where StaffID = 'STF007'),(Select ProductID from Product where ProductID = 'PRO015'),
	(Select CustomerID from Customer where CustomerID = 'CUS012'),'2018/01/06',4)
	Insert Into SalesTransaction values('SAL018',(Select StaffID from Staff where StaffID = 'STF007'),(Select ProductID from Product where ProductID = 'PRO015'),
	(Select CustomerID from Customer where CustomerID = 'CUS005'),'2018/01/06',2)
	Insert Into SalesTransaction values('SAL019',(Select StaffID from Staff where StaffID = 'STF007'),(Select ProductID from Product where ProductID = 'PRO015'),
	(Select CustomerID from Customer where CustomerID = 'CUS006'),'2018/01/06',1)
	Insert Into SalesTransaction values('SAL020',(Select StaffID from Staff where StaffID = 'STF007'),(Select ProductID from Product where ProductID = 'PRO015'),
	(Select CustomerID from Customer where CustomerID = 'CUS004'),'2018/01/06',1)
	
	select * from Customer

-- insert purchaseTransaction
	insert into purchaseTransaction values('PUR001', ( select StaffID from Staff Where StaffID = 'STF001'), 
	(select IngredientID from Ingredient Where IngredientID = 'ING001'),
	(select VendorID from Vendor Where VendorID = 'VEN001'), '2018/01/05', 6 ) 
insert into purchaseTransaction values('PUR002', ( select StaffID from Staff Where StaffID = 'STF002'), 
	(select IngredientID from Ingredient Where IngredientID = 'ING002'),
	(select VendorID from Vendor Where VendorID = 'VEN002'), '2018/01/10', 2 ) 
insert into purchaseTransaction values('PUR003', ( select StaffID from Staff Where StaffID = 'STF003'), 
	(select IngredientID from Ingredient Where IngredientID = 'ING003'),
	(select VendorID from Vendor Where VendorID = 'VEN003'), '2018/02/02', 7 ) 
insert into purchaseTransaction values('PUR004', ( select StaffID from Staff Where StaffID = 'STF004'), 
	(select IngredientID from Ingredient Where IngredientID = 'ING004'),
	(select VendorID from Vendor Where VendorID = 'VEN004'), '2018/01/05', 12 ) 
insert into purchaseTransaction values('PUR005', ( select StaffID from Staff Where StaffID = 'STF005'), 
	(select IngredientID from Ingredient Where IngredientID = 'ING005'),
	(select VendorID from Vendor Where VendorID = 'VEN005'), '2018/01/06', 10 ) 
insert into purchaseTransaction values('PUR006', ( select StaffID from Staff Where StaffID = 'STF006'), 
	(select IngredientID from Ingredient Where IngredientID = 'ING006'),
	(select VendorID from Vendor Where VendorID = 'VEN006'), '2018/01/07', 9 ) 
insert into purchaseTransaction values('PUR007', ( select StaffID from Staff Where StaffID = 'STF007'), 
	(select IngredientID from Ingredient Where IngredientID = 'ING007'),
	(select VendorID from Vendor Where VendorID = 'VEN007'), '2018/01/11', 10 ) 
insert into purchaseTransaction values('PUR008', ( select StaffID from Staff Where StaffID = 'STF008'), 
	(select IngredientID from Ingredient Where IngredientID = 'ING008'),
	(select VendorID from Vendor Where VendorID = 'VEN008'), '2018/01/13', 12 ) 
insert into purchaseTransaction values('PUR009', ( select StaffID from Staff Where StaffID = 'STF009'), 
	(select IngredientID from Ingredient Where IngredientID = 'ING009'),
	(select VendorID from Vendor Where VendorID = 'VEN009'), '2018/01/15', 20 ) 
insert into purchaseTransaction values('PUR010', ( select StaffID from Staff Where StaffID = 'STF010'), 
	(select IngredientID from Ingredient Where IngredientID = 'ING010'),
	(select VendorID from Vendor Where VendorID = 'VEN010'), '2018/01/17', 19 ) 
insert into purchaseTransaction values('PUR011', ( select StaffID from Staff Where StaffID = 'STF011'), 
	(select IngredientID from Ingredient Where IngredientID = 'ING011'),
	(select VendorID from Vendor Where VendorID = 'VEN011'), '2018/01/19', 10 ) 
insert into purchaseTransaction values('PUR012', ( select StaffID from Staff Where StaffID = 'STF012'), 
	(select IngredientID from Ingredient Where IngredientID = 'ING012'),
	(select VendorID from Vendor Where VendorID = 'VEN012'), '2018/01/20', 1 ) 
insert into purchaseTransaction values('PUR013', ( select StaffID from Staff Where StaffID = 'STF013'), 
	(select IngredientID from Ingredient Where IngredientID = 'ING013'),
	(select VendorID from Vendor Where VendorID = 'VEN013'), '2018/01/21', 14 ) 
insert into purchaseTransaction values('PUR014', ( select StaffID from Staff Where StaffID = 'STF014'), 
	(select IngredientID from Ingredient Where IngredientID = 'ING014'),
	(select VendorID from Vendor Where VendorID = 'VEN014'), '2018/01/24', 18 ) 
insert into purchaseTransaction values('PUR015', ( select StaffID from Staff Where StaffID = 'STF015'), 
	(select IngredientID from Ingredient Where IngredientID = 'ING015'),
	(select VendorID from Vendor Where VendorID = 'VEN015'), '2018/01/25', 16 ) 
insert into purchaseTransaction values('PUR016', ( select StaffID from Staff Where StaffID = 'STF004'), 
	(select IngredientID from Ingredient Where IngredientID = 'ING004'),
	(select VendorID from Vendor Where VendorID = 'VEN001'), '2018/01/26', 3 ) 
insert into purchaseTransaction values('PUR017', ( select StaffID from Staff Where StaffID = 'STF008'), 
	(select IngredientID from Ingredient Where IngredientID = 'ING001'),
	(select VendorID from Vendor Where VendorID = 'VEN004'), '2018/01/27', 14 ) 
insert into purchaseTransaction values('PUR018', ( select StaffID from Staff Where StaffID = 'STF001'), 
	(select IngredientID from Ingredient Where IngredientID = 'ING013'),
	(select VendorID from Vendor Where VendorID = 'VEN006'), '2018/01/28', 17 ) 
insert into purchaseTransaction values('PUR019', ( select StaffID from Staff Where StaffID = 'STF014'), 
	(select IngredientID from Ingredient Where IngredientID = 'ING006'),
	(select VendorID from Vendor Where VendorID = 'VEN012'), '2018/01/29', 19 ) 
insert into purchaseTransaction values('PUR020', ( select StaffID from Staff Where StaffID = 'STF007'), 
	(select IngredientID from Ingredient Where IngredientID = 'ING009'),
	(select VendorID from Vendor Where VendorID = 'VEN015'), '2018/01/30', 15 )

delete  from purchaseTransaction


-- nomer 4
--insert name 
insert into purchaseTransaction values('PUR021', (select StaffID from Staff Where StaffName = 'Giri'), 
	(select IngredientID from Ingredient Where IngredientName = 'chili sauce'),
	(select VendorID from Vendor Where VendorName = 'Aneka Makmur'), '2018/02/01', 2 )

	
insert into purchaseTransaction values('PUR022', (select StaffID from Staff Where StaffName = 'Kaleb'), 
	(select IngredientID from Ingredient Where IngredientName = 'onion'),
	(select VendorID from Vendor Where VendorName = 'PT Pangansari Utama Food'), '2018/02/02', 12 )

	
insert into purchaseTransaction values('PUR023', (select StaffID from Staff Where StaffName = 'Ekho'), 
	(select IngredientID from Ingredient Where IngredientName = 'tomato sauce'),
	(select VendorID from Vendor Where VendorName = 'PD Betani'), '2018/02/04', 14 )

	
insert into purchaseTransaction values('PUR024', (select StaffID from Staff Where StaffName = 'Topan'), 
	(select IngredientID from Ingredient Where IngredientName = 'bun'),
	(select VendorID from Vendor Where VendorName = 'PT Kiat Sukses'), '2018/02/05', 20 )

	
insert into purchaseTransaction values('PUR025', (select StaffID from Staff Where StaffName = 'Patrick'), 
	(select IngredientID from Ingredient Where IngredientName = 'chili'),
	(select VendorID from Vendor Where VendorName = 'PT Tata Adhis Thana'), '2018/02/07', 4 )

	select * from purchaseTransaction

Insert Into SalesTransaction values('SAL0',(Select StaffID from Staff where StaffID = 'STF014'),(Select ProductID from Product where ProductID = 'PRO015'),
	(Select CustomerID from Customer where CustomerID = 'CUS015'),'2018/03/05',1)
	
Insert Into SalesTransaction values('SAL020',(Select StaffID from Staff where StaffName = 'Giri'),(Select ProductID from Product where ProductName = ''),
	(Select CustomerID from Customer where CustomerID = 'CUS004'),'2018/01/06',1)
