-- Cristian Hernandez
-- Database Management
-- Professor Rivas
-- March 2, 2016
-- Lab 6

-- 1)Display the name and city of customers who live in any city that makes the most different kinds of
--products. (There are two cities that make the most different products. Return the name and city of
--customers from either one of those.)

select name, city 
from customers 
Where city In (Select city 
		  from products 
		  Group by city
		  having count(city) = (select count(city)
					from products
					group by city
					order by count(city) desc
					limit 1)

					);

-- 2) Display the names of products whose priceUSD is strictly above the average priceUSD, in reverse alphabetical
--order.

select name 
from products 
where priceUSD > (select avg(priceUSD)
		  From products 
		  )
Order by name DESc;

--3) Display the customer name, pid ordered, and the total for all orders, sorted by total from high to low.

select c.name, o.pid, sum(o.dollars)
from customers c INNER join orders o on c.cid = o.cid
group by c.name, o.pid
order by sum(o.dollars) desc; 	

-- 4) Display all customer names (in alphabetical order) and their total ordered, and nothing more. Use
--coalesce to avoid showing NULLs.  

Select c.name, coalesce(sum(o.dollars), 0.00)
from customers c left outer join orders o on c.cid = o.cid
group by c.name;

-- 5) Display the names of all customers who bought products from agents based in Tokyo along with the
-- of the products they ordered, and the names of the agents who sold it to them.

select c.name, p.name, a.name
from customers c inner join orders o on c.cid = o.cid
inner join products p on o.pid = p.pid
inner join agents a on a.aid = o.aid
where a.city = 'Tokyo';

-- 6) Write a query to check the accuracy of the dollars column in the Orders table. This means calculating
--Orders.totalUSD from data in other tables and comparing those values to the values in Orders.totalUSD.
--Display all rows in Orders where Orders.totalUSD is incorrect, if any.

Select *
From (Select o.*, o.qty*p.priceusd*(1-(discount/100)) as truedollars
      from orders o
      inner join products p on o.pid = p.pid
      inner join customers c on o.cid = c.cid) as tmptable
Where dollars != truedollars;

-- 7) What is the difference between a LEFT OUTER JOIN and a RIGHT OUTER JOIN? Give example
--queries in SQL to demonstrate. (Feel free to use the CAP2 database to make your points here.)
 
-- A LEFT OUTER JOIN will join two tables together based on the column of each table, including that every row in the left table is displayed.  If the the left table does not have a 
-- corresponding row from the right table, it will produce a NULL value.  For example, the query below will show a customer named Weyland, who has never made an order will have a NULL
-- value for the rest of the tables.
Select *
from customers left outer join orders on customers.cid = orders.cid;

-- A RIGHT OUTER JOIN serves the same purpose as a LEFT OUTER JOIN except it displays all the values from the right table. The query below does not show Weyland since he has never made
-- an order, it will exclude him and produce the rest of the values below.

Select *
From customers right outer join orders on customers.cid = orders.cid;
