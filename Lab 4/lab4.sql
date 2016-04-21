--Cristian Hernandez
--Database Management
--Professor Rivas
-- Lab 4

--1) Get the cities of agents booking an order for a customer whose cid is ‘c002’.

Select city
from agents
Where aid in (select aid
	      from orders
	      where cid = 'c002'
	      );

--2) Get the ids of products ordered through any agent who takes at least one order from a customer in
--Dallas, sorted by pid from highest to lowest. (This is not the same as asking for ids of products ordered
--by customers in Dallas.)

select distinct pid
from orders
where aid in (select aid
              from orders 
              where cid in (select cid
			    from customers
			    where city = 'Dallas'
			    )
	      )
Order by pid desc; 

--3) Get the ids and names of customers who did not place an order through agent a01

select cid, name
from customers 
where cid not in (select cid
		  from orders 
		  where aid = 'a01');

--4) Get the ids of customers who ordered both product p01 and p07.

select cid 
from customers 
where cid in (select cid 
	      from orders 
	      where pid = 'p01'
	      )
And cid in (select cid
	    from orders 
	    where pid = 'p02'
	    );

--5) Get the ids of products not ordered by any customers who placed any order through agent a07 in pid
--order from highest to lowest.

select pid 
from products 
where pid not in (select pid 
		  from orders 
		  where aid = 'a07'
		  )
order by pid desc; 

--6) Get the name, discounts, and city for all customers who place orders through agents in London or New
--York.           

Select name, discount, city 
from customers 
where cid in(select cid
	     from orders 
	     where aid in (select aid
			   from agents 
			   where city in ('New York', 'London')
			   )
	    ); 

--7) Get the name, discounts, and city for all customers who place orders through agents in London or New
--York.

select *
from customers 
where discount in (select discount
		   from customers 
		   where city in ('London', 'New York')
		   );

--8) Tell me about check constraints: What are they? What are they good for? What is the advantage of
--putting that sort of thing inside the database? Make up some examples of good uses of check constraints
--and some examples of bad uses of check constraints. Explain the differences in your examples and argue
--your case.

-- A check constraint is an requirement that has to be met in each row of a database.  They are good to make sure that you do not leave any 
-- blank or null values in the tables created.  The advantage of having check contsraints is when creating the tables, a value in a table 
-- would be filled in automatically if there is nothing there.
