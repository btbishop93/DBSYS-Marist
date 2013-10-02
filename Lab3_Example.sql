
drop table if exists Departments;

create table Departments(
	Did		varchar(4) not null,
	name		varchar(20) not null,
	dateFound	date not null,
	primary key(Did)
      );

drop table if exists People;

create table People(
	pid 		varchar(4) not null,
	firstName 	varchar(20),
	lastName	varchar(20) not null,
	hireDate	date not null,
	Did		varchar(4) not null references Departments(Did),
	primary key(pid)
      );

drop table if exists Fy;

create table Fy (
	year 		int not null,
	startDate	date not null,
	endDate		date not null,
	primary key(year)
      );


----Departments Data----

insert into Departments( Did, name, dateFound)
		  values('A', 'CS', '6/30/2010');

insert into Departments( Did, name, dateFound)
		  values('B', 'IT', '1/1/2013');

insert into Departments( Did, name, dateFound)
		  values('C', 'IS', '7/4/2014');

---People Data---

insert into People( pid, firstName, lastName, hireDate, Did)
	      values('1', 'Thomas', 'Moran', '1/23/2008', 'A');

insert into People( pid, firstName, lastName, hireDate, Did)
	      values('2', 'Jimmy', 'Foote', '9/28/2006', 'A');

insert into People( pid, firstName, lastName, hireDate, Did)
	      values('3', 'Taylor', 'Allen', '4/4/2012', 'B');

insert into People( pid, firstName, lastName, hireDate, Did)
	      values('4', 'Adam', 'Jones', '11/11/2013', 'B');

insert into People( pid, firstName, lastName, hireDate, Did)
	      values('5', 'Katie', 'Smith', '11/11/2014', 'B');

----FiscalYear Data-----

insert into fy( year, startDate, endDate )
	values('2012','7/1/11', '6/30/2012');
		  	

insert into fy( year, startDate, endDate )
	values('2013','7/1/12', '6/30/2013');


insert into fy( year, startDate, endDate )
	values('2014','7/1/13', '6/30/2014');


insert into fy( year, startDate, endDate )
	values('2015','7/1/14', '6/30/2015');


---QUERIES---

--1. List all people, the fiscal year in which they were hired, and their dept.---
--2. List all the depts and the number of people in each.---
--3. List all the fiscal years and the number of people hired in that time span---
--4. List all the fiscal years and the number of depts founded in that time span---
--5. List all the depts with no people.---
--6. List all the people with no dept---
--7. List all people hired before the dept was founded.

select distinct firstName, lastName, hireDate, departments.name, year
from people, fy, departments
	where (hireDate > fy.startDate) and (hireDate < fy.endDate) 
		and people.Did = departments.Did
	order by fy.year;

select distinct departments.name, count(people.Did)
from departments, people
where people.Did = departments.Did;






 