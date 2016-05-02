-- Cristian Hernandez
-- Database Management
-- February 24, 2016
-- Lab 3 

-- 1) Show the cities of agents booking an order for a customer whose id is 'c002'. 

Select city
From agents
INNER JOIN orders
ON agents.aid=orders.aid
AND orders.cid = 'c002'; 

--2) Show the ids of products ordered through any agents who makes at least one order for a customer in Dallas, sorted by pid from highest to lowest.

Select DISTINCT o2.pid
FROM orders o1
INNER JOIN customers
ON o1.cid=customers.cid AND customers.city='Dallas'
INNER JOIN orders o2
ON o1.aid = o2.aid
ORDER BY pid DESC;

--3) Show the names of customers whi have never placed an order. Use a subquery.

Select name
From customers 
Where cid NOT IN (Select cid
		  From orders);

--4) Show the names of customers who have never placed an order. Use an Outer Join.

Select name
From customers
LEFT OUTER JOIN orders
On customers.cid=orders.cid
Where orders.cid IS NULL;

--5) Show the names of customers who placed at least one order through an agent in their own city, along with those agent(s') names.

Select DISTINCT customers.name, agents.name 
From customers 
INNER JOIN agents
On customers.city=agents.city
INNER JOIN orders
On customers.cid = orders.cid
AND agents.aid=orders.aid;

--6) Show the names of customers and agents living in the same city, along with the name of the shared city regardless of whether or not the customer has ever paced an order with that agent

Select c.name, a.name
From Customers c, agents a 
where c.city = a.city;

--7) Show the name and city of customers who live in the city that makes the fewest different kinds of products. 

Select c.name, c.city 
From customers c 
Where c.city IN (Select city 
		 From products 
		 Group By City 
		 Order By count(pid) ASC
		 Limit 1);
