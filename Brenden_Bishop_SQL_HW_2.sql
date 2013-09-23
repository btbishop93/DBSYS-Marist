select distinct city 
from agents
where aid in (select aid from orders
		where cid = 'c002');

select distinct pid
from orders
where aid in (select aid from orders 
		where cid in (select cid from customers
				where city = 'Kyoto')
		);

select distinct cid, name
from customers
where cid not in (select cid from orders
		where aid in (select aid from orders
					where aid = 'a03')
		);

select distinct cid, name
from customers
where cid in (select cid from orders
		where pid = 'p01's
		intersect
		select cid from orders
			where pid = 'p07');

select distinct pid
from orders
where cid in (select cid from orders
		where aid in (select aid from orders
			where aid = 'a03')
		);

select distinct name, discount
from customers
where cid in (select cid from orders
		where aid in (select aid from agents
				where city = 'Dallas' or city = 'Duluth')
		);

select distinct cid, name 
from customers
where discount in (select discount from customers
		where city = 'Dallas' or city = 'Kyoto');