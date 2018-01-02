set echo off
set heading off
set verify off
set feedback off

spool D:shipped.txt

prompt ******UPDATE SHIPPING*****

accept SVONum prompt 'Please Enter the Order Number: '

select 'Order Number: ' || ONum from Orders where Orders.ONum=&SVONum;
select 'Order Date: ' || ODate from Orders where Orders.ONum=&SVONum;
select 'Customer Number: ' || CNum from Orders where Orders.ONum=&SVONum;
select '     '||CLName || ',' || CFName from Orders,Customers where Orders.ONum=&SVONum and Customers.CNum=Orders.CNum;
select '     '||CSAddress from Orders,Customers where Orders.ONum=&SVONum and Customers.CNum=Orders.CNum;
select '     '||CCity || ',' || CState || ' ' || CZip from Orders,Customers where Orders.ONum=&SVONum and Customers.CNum=Orders.CNum;
select '     '||'(' || substr(CPhone,1,3) || ')' || substr(CPhone,4,3) || '-' || substr(CPhone,-4) from Orders,Customers where Orders.ONum=&SVONum and Customers.CNum=Orders.CNum;

select 'Item Number: ' || PNum from Orders where Orders.ONum=&SVONum;
select '     '||'Item Description: ' || PDesc from Products, Orders where Orders.ONum=&SVONum and Products.PNum=Orders.PNum;
select '     '||'Unit Price: '||'$'|| TO_CHAR(Products.PPrice,'99.99') from Products, Orders where Orders.ONum=&SVONum and Products.PNum=Orders.PNum;

select 'Quanity Ordered: ' || PQuan from Orders where Orders.ONum=&SVONum;
select 'Amount Ordered: ' || '$' || TO_CHAR(OAmount,'999.99') from Orders where Orders.ONum=&SVONum;

prompt

select 'Shipping Warehouse: ' || Warehouses.WNum from Warehouses, Orders where Warehouses.WNum=Orders.WNum and Orders.ONum=&SVONum;
select '     '||WSAddress from Warehouses,Orders where Warehouses.WNum=Orders.WNum and Orders.ONum=&SVONum;
select '     '||WCity || ',' || WState || ' ' || WZip from Warehouses,Orders where Warehouses.WNum=Orders.WNum and Orders.ONum=&SVONum;
select '     '||'(' || substr(WPhone,1,3) || ')' || substr(WPhone,4,3) || '-' || substr(WPhone,-4) from Warehouses, Orders where Warehouses.WNum=Orders.WNum and Orders.ONum=&SVONum;

prompt

accept SOShipDate prompt 'Please enter the shipping date (mm/dd/yyyy): ' 
accept SOShipQTY prompt 'Please enter the shipping quantity: '

update Orders set OStatus ='Shipped' where Orders.ONum=&SVONum;
update Orders set OShipAmount=(&SOShipQTY * (select Products.PPRice from Products,Orders where Products.Pnum=Orders.PNum and Orders.ONum=&SVONum));
update Orders set OShipdate=To_DATE('&SOShipDate','mm/dd/yyyy') where Orders.ONum=&SVONum; 
update Orders set OShipQTY=&SOShipQTY where Orders.ONum=&SVONum;
update Inventory set PQuan=(PQuan-(select OShipQTY from Orders where Orders.Onum=&SVONum)) where Inventory.PNum=(select PNum from Orders where Orders.Onum=&SVONum) and Inventory.WNum=(select WNum from Orders where Orders.Onum=&SVONum);

prompt Order is now ---> SHIPPED
select 'Date Shipped: ' || sysdate from Orders where Orders.ONum=&SVONum;
select 'Quantity Shipped: ' || OShipQTY from Orders where Orders.ONum=&SVONum;
select 'Amount Shipped: ' ||'$'||TO_CHAR(OShipAmount,'999.999') from Orders where Orders.ONum=&SVONum;

spool off;