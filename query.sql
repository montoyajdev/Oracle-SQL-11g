set echo off
set heading off
set verify off
set feedback off

spool D:query.txt

prompt ******SHOW ORDER DETAILS*****

accept QVONum prompt 'Please Enter the Order Number: ' 

prompt

select 'Order Number: ' || ONum from Orders where Orders.ONum=&QVONum;
select 'Order Status: ' || OStatus from Orders where Orders.ONum=&QVONum;

prompt

select 'Customer Number: ' || CNum from Orders where Orders.ONum=&QVONum;
select '     '||CLName || ',' || CFName from Orders,Customers where Orders.ONum=&QVONum and Customers.CNum=Orders.CNum;
select '     '||CSAddress from Orders,Customers where Orders.ONum=&QVONum and Customers.CNum=Orders.CNum;
select '     '||CCity || ',' || CState || ' ' || CZip from Orders,Customers where Orders.ONum=&QVONum and Customers.CNum=Orders.CNum;
select '     '||'(' || substr(CPhone,1,3) || ')' || substr(CPhone,4,3) || '-' || substr(CPhone,-4) from Orders,Customers where Orders.ONum=&QVONum and Customers.CNum=Orders.CNum;

prompt

select 'Item Number: ' || PNum from Orders where Orders.ONum=&QVONum;
select '     '||'Item Description: ' || PDesc from Products, Orders where Orders.ONum=&QVONum and Products.PNum=Orders.PNum;
select '     '||'Unit Price: '||'$'|| TO_CHAR(Products.PPrice,'99.99') from Products, Orders where Orders.ONum=&QVONum and Products.PNum=Orders.PNum;

select 'Order Date: ' || ODate from Orders where Orders.ONum=&QVONum;
select 'Shipping Date: ' || OShipDate from Orders where Orders.ONum=&QVONum;

prompt

select 'Quanity Ordered: ' || PQuan from Orders where Orders.ONum=&QVONum;
select 'Amount Ordered: ' || '$' || TO_CHAR(OAmount,'999.99') from Orders where Orders.ONum=&QVONum;
select 'Quanitity Shipped: ' || OShipQTY from Orders where Orders.ONum=&QVONum;
select 'Amount Shipped: ' || '$' ||TO_CHAR(OShipAmount,'999.99') from Orders where Orders.ONum=&QVONum;

prompt

select 'Shipping Warehouse: ' || Warehouses.WNum from Warehouses, Orders where Warehouses.WNum=Orders.WNum and Orders.ONum=&QVONum;
select '     '||WSAddress from Warehouses,Orders where Warehouses.WNum=Orders.WNum and Orders.ONum=&QVONum;
select '     '||WCity || ',' || WState || ' ' || WZip from Warehouses,Orders where Warehouses.WNum=Orders.WNum and Orders.ONum=&QVONum;
select '     '||'(' || substr(WPhone,1,3) || ')' || substr(WPhone,4,3) || '-' || substr(WPhone,-4) from Warehouses, Orders where Warehouses.WNum=Orders.WNum and Orders.ONum=&QVONum;


commit; 

spool off; 

