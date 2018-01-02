set echo off
set heading off
set verify off
set feedback off

spool D:salesreport.txt

prompt ****** SALES REPORT ******

set heading on

select Products.PNum as ProdNo, PDesc as ProductName,TO_CHAR(trunc(ODate),'mm-yyyy') as OrderMonth, count(ONum) as NoOfOrders, sum(PQuan) as TotalUnits, '$' ||TO_CHAR(sum(OAmount)*sum(Products.PPrice),'9999.99') as TotalAmount 
from Orders,Products where Orders.PNum=Products.PNum 
group by Products.PNum,PDesc,TO_CHAR(trunc(ODate),'mm-yyyy') 
order by Products.PNum;

set heading off

commit;
spool off