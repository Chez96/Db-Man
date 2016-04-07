Select ordno, dollars
from orders;

Select *
From Agents
Where name = 'Smith';

Select pid, name, priceUSD
From Products
Where quantity > 208000;

Select name, city 
From Customers
Where city = 'Dallas';

Select name
From Agents
Where city NOT in ('New York' , 'Tokyo');

Select *
From Products
Where city NOT in ('Dallas' , 'Duluth') AND priceUSD >= 1;

Select *
From Orders
Where mon in ('jan', 'mar');

Select *
From Orders
Where mon in ('feb') AND dollars < 500;

Select * 
From Orders
Where cid = 'C005';

-- Cristian Hernandez
-- Database Management 
-- Professor Rivas 
-- February 11, 2016
