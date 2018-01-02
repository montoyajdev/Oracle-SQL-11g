set echo off
set heading off
set verify off
set feedback off

spool D:aging.txt

prompt ****** AGING REPORT ******

select 'Today''s Date: ' || sysdate from dual;

accept AQuery prompt 'Please enter the number of days to query: '

set heading on
select ONum as OrderNumber, ODate as OrderDate, OStatus as OrderStatus, Orders.PNum as ProdNum, PDesc as ProductDescription, PQuan as OrderQTY, Products.PPrice as UnitPrice, OAmount OrderAmount, (select trunc(sysdate)-trunc(ODate)+1 from dual) as DaysOpen from Orders,Products where Orders.PNum=Products.PNum and trunc(Orders.ODate)<(trunc(sysdate)-&AQuery+1) and lower(OStatus)!=lower('SHIPPED') order by DaysOpen desc; 

commit;

spool off