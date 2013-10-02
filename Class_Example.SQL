create table FY (
	fiscalYear int 		not null check (fiscalYear > 1904),
	startDate  timestamp 	not null unique ,
	endDate	   timestamp 	not null unique check (endDate > startDate),
       primary key(fiscalYear)
     );

select name
from students
where sid in (select sid from grades
		   where subid = 's01'
		intersect
		   select sid from grades
			where subid = 's01'
		union
			select sid from grades
			    where subid = 's02'
			intersect
			    select sid from grades
				where subid = 's02'
		union
			select sid from grades
			   where subid = 's03'
		intersect
			   select sid from grades
				where subid = 's03');

select name
from students, teachers
where sid in (select sid
		from grades g1
		where (select count(*)
			from grades g2
			where g1.subid = g2.subid
			and g1.tid = g2.tid) > 1
		order by subid
		);

select distinct t.name, sub.name, s.name, g1.grade
from students s, grades g1, teachers t, subjects sub, grades g2
where g1.sid = s.sid
	and g1.tid = t.tid
	and g1.subid = sub.subid
	and g1.tid = g2.tid
	and g1.subid = g2.subid
	and g1.sid <> g2.sidss
order by t.name, sub.name, s.name;



