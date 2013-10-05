---1---
select distinct city 
from agents
where aid in (select aid from orders
		where cid = 'c002');
		
---2---
select distinct city
from agents
inner join orders
on agents.aid = orders.aid 
and orders.cid = 'c002';

---3---
select distinct pid
from orders where aid in (select aid from orders
			where cid in (select cid from customers
					where city = 'Kyoto'));
---4---
select distinct o2.pid
from orders o1
	join orders o2
	on o2.aid = o1.aid 
	inner join customers
	on customers.cid = o1.cid 
	and customers.city = 'Kyoto'
order by o2.pid asc;

---5---
select distinct name
from customers 
where cid not in (select cid from orders);

---6---

select distinct name
from customers
left outer join orders
on customers.cid = orders.cid 
where orders.cid is null;

---7---

select distinct customers.name, agents.name
from customers
join orders
on customers.cid = orders.cid
join agents
on agents.aid = orders.aid
and customers.city = agents.city
order by customers.name asc;

---8---

select distinct customers.name, agents.name, customers.city
from customers
join agents
on customers.city = agents.city
order by customers.city asc;

---9---

select distinct customers.name, customers.city
from customers
where customers.city in(select city from (select p2.city, count(*) as city_count
	from products p2
	group by p2.city) as city_count
	order by city_count asc
	limit 1);













