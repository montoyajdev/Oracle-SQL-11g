# oraclesql_example
>Included is a relational database (Entity Relationship Diagram and normalized tables) for a company, along with five programs to process    orders and to produce sales related reports for the management. 


## order.sql
>To place an order, the user runs the order.sql program. The system first prompts the greeting message and automatically displays today’s date. The system then prompts the user to enter the customer number. Customer name (last name first, comma, then first name), address and phone are displayed. The system then prompts for the item number. Item description and unit price is displayed. The system then asks for the quantity ordered. All warehouses that currently carry this product, along with the inventory level, are displayed. The user then chooses one warehouse from the list. At this point, the system updates the sales order data to the database, and assigned a unique order number to this order. The order status is ‘OPEN’. The order number and order status is displayed for the user. </p>

## shipped.sql
>The order information is transmitted to the warehouse and the warehouse prepares for the shipping. The warehouse notifies us when the actual shipping is completed. The user runs the shipped.sql program to update this information to the system.  The system first asks the user to enter the order number, and displays all details of that order. The system then asks for the actual shipping date and shipping quantity (which may be different from the order quantity as a result of “short sale). The program then updates the shipping date and order status to "SHIPPED".  The inventory level of the corresponding warehouse/product is updated.

## query.sql
>When the user needs to look up the most recent details of an order, he/she runs the query.sql program. The user first enters the order number, then all details of the order is displayed.

## aging.sql
>This report displays orders that have been opened for x number of days and have not been closed.  The report is sorted by the longest DaysOpen first. 

## salesreport.sql
>This program displays number of orders, total units and amount according to each product and the month/year of the order open date.  For each product and each month/year, the management will see the number of orders, total quantity ordered, and total amount ordered.
