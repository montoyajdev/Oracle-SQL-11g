set echo off
set heading off
set verify off
set feedback off

spool D:order.txt

prompt
prompt ****** PLACE AN ORDER ******
prompt 

select 'Today''s Date:'|| sysdate from dual;

accept VCNum prompt 'Enter the Customer Number:' 
select	'     '||'Customer Name: ' || CLName || ',' || CFName from Customers where CNum = '&VCNum';	
select	'     '||'Shipping Address: ' || CSAddress from Customers where CNum = '&VCNum';
select	'     '||'City, State Zip: ' || CCity || ',' || CState || ' ' || CZip from Customers where CNum = '&VCNum';
select	'     '||'Phone: ' || '(' || substr(CPhone,1,3) || ')' || substr(CPhone,4,3) || '-' || substr(CPhone,-4) from Customers where CNum = '&VCNum';

accept VPNum prompt 'Enter the Item Number:'
select	'     '||'Item Number: ' || PNum from Products where PNum = '&VPNum';
select 	'     '||'Item Desccription: ' || PDesc from Products where PNum = '&VPNum';
select	'     '||'Unit Price: ' || '$'|| TO_CHAR(PPrice,'0.99') from Products where PNum = '&VPNum';

accept VPQuan prompt 'Enter the quanity ordered:'
select	'     '||'Amount Ordered: ' || '$' || PPrice * &VPQuan from Products where PNum = '&VPNum';

prompt Please choose from the following warehouses:
set heading on
select Warehouses.WNum as Warehouse, WCity||','||WState as CityState,PQuan from Inventory, Warehouses, Products where lower(Inventory.PNum)=lower('&VPNum') and Products.PNum=Inventory.PNum and Warehouses.Wnum=Inventory.WNum; 
set heading off
accept VWNum prompt 'Enter the warehouse code:'	

insert into Orders values((select Maxnum from Counter), (select sysdate from dual), 'OPEN', '&VCNum', '&VPNum', '&VWNum',&VPQuan,(select PPrice from Products where PNum = '&VPNum'),&VPQuan*(select PPrice from Products where PNum = '&VPNum'), null, null, null);

prompt
prompt ***** Order Status: OPEN

select '***** Order number is  ----->' || Maxnum from Counter;

update Counter set Maxnum=Maxnum+1;

commit;

spool off