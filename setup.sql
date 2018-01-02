set echo on 
spool D:setup.txt


create table Customers(
	CNum varchar2(5) primary key,
	CLName varchar2(25),
	CFName varchar2(25),
	CSAddress varchar2(50),
	CCity varchar2(20),
	CState varchar2(2),
	CZip varchar2(5),
	CPhone varchar2(10)
);

create table Products(
	PNum varchar2(3) primary key,
	PDesc varchar2(12),
	PPrice number(5,2)
);

create table Warehouses(
	WNum varchar2(3) primary key,
	WSAddress varchar2(100),
	WCity varchar2(30),
	WState varchar2(2),
	WZip varchar2(5),
	WPhone varchar2(10)
); 

create table Inventory(
	WNum varchar2(3),
	PNum varchar2(3),
	PQuan number(3,0),
	primary key (WNum, PNum),
	constraint fk_Inventory_WNum foreign key(WNum) references Warehouses(WNum),
	constraint fk_Inventory_PNum foreign key(PNum) references Products(PNum)
);

create table Orders(
	ONum number(5,0) primary key,
	ODate date,
	OStatus varchar2(10),
	CNum varchar2(5),
	PNum varchar2(3),
	WNum varchar2(3), 
	PQuan number(3,0),
	PPrice number(5,2),
	OAmount number(5,2),
	OShipDate date,
	OShipQTY number(5,2),
	OShipAmount number(5,2),
	constraint fk_Orders_CNum foreign key(CNum) references Customers(CNum),
	constraint fk_Orders_PNum foreign key(Pnum) references Products(PNum),
	constraint fk_Orders_WNum foreign key(WNum) references Warehouses(WNum)
);

create table Counter(
	Maxnum number (5,0) primary key
);

insert into Customers values('101','Mirzakhani', 'Maryam','1234 Main St','Pasadena','CA','90623','5623885810');
insert into Customers values('102','Adams', 'Samuel','9785 La Palma Ave','Boston','MA','02130','7145689523');
insert into Customers values('103','Hopper', 'Grace','2369 Beverly Blvd','New York City','NY','10001','3102123656');
insert into Customers values('104','Rogan', 'Joe','5667 Beach Dr', 'Woodland Hills','CA','91367','3235217848');
insert into Customers values('105','Namajunas', 'Rose','3411 Lambert Rd', 'Milwaukee', 'WI', '53172', '9498563214');

insert into Products values ('p1', 'Pencil', 1.00);
insert into Products values ('p2', 'Pen', 2.00);
insert into Products values ('p3', 'Paper', 1.00);
insert into Products values ('p4', 'Folder', 2.00);
insert into Products values ('p5', 'Eraser', 3.00);

insert into Warehouses values('w1', '3280 E Foothill Blvd','Pasadena', 'CA','90660','8009548000');
insert into Warehouses values('w2', '410 Terry Ave','Seattle','WA','41254','2062661000');
insert into Warehouses values('w3', '1600 Amphitheatre Parkway','Mountain View','CA','21312','6263239889');
insert into Warehouses values('w4', '161 Rush Ave','New York City','NY','65258','6465175223');
insert into Warehouses values('w5', '500 LaSalle Dr','Chicago','IL','41754','3128360499');

insert into Inventory values('w1','p1',999);
insert into Inventory values('w1','p2',158);
insert into Inventory values('w1','p3',962);
insert into Inventory values('w1','p4',145);
insert into Inventory values('w1','p5',212);

insert into Inventory values('w2','p1',131);
insert into Inventory values('w2','p2',962);
insert into Inventory values('w2','p3',412);
insert into Inventory values('w2','p4',452);
insert into Inventory values('w2','p5',254);

insert into Inventory values('w3','p1',965);
insert into Inventory values('w3','p2',258);
insert into Inventory values('w3','p3',752);
insert into Inventory values('w3','p4',624);
insert into Inventory values('w3','p5',412);

insert into Inventory values('w4','p1',747);
insert into Inventory values('w4','p2',562);
insert into Inventory values('w4','p3',313);
insert into Inventory values('w4','p4',323);
insert into Inventory values('w4','p5',626);

insert into Inventory values('w5','p1',412);
insert into Inventory values('w5','p2',743);
insert into Inventory values('w5','p3',347);
insert into Inventory values('w5','p4',852);
insert into Inventory values('w5','p5',102);

insert into Counter values(1);

commit;

spool off