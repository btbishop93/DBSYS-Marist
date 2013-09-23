
CREATE TABLE students (
  sid      char(4) not null,
  name     varchar(16),
  primary key(sid)
);


CREATE TABLE teachers (
  tid     char(3) not null,
  name    varchar(16),
 primary key(tid)
);        


CREATE TABLE subjects (
  subid      char(3) not null,
  name       varchar(16),
 primary key(subid)
);


CREATE TABLE grades (
  sid     char(4) not null references students(sid),
  tid     char(3) not null references teachers(tid),
  subid   char(3) not null references subjects(subid),
  grade   text
);

INSERT INTO students (sid, name)
	values ('s001', 'Simon');

INSERT INTO students (sid, name)
	values ('s002', 'Alvin');

INSERT INTO students (sid, name)
	values ('s003', 'Theo');

INSERT INTO students (sid, name)
	values ('s004', 'Brittany');

INSERT INTO students (sid, name)
	values ('s005', 'Janette');

INSERT INTO students (sid, name)
	values ('s006', 'Elena');

INSERT INTO students (sid, name)
	values ('s007', 'Stu');

-- Teachers --
INSERT INTO teachers (tid, name)
	values ('t01', 'Washington');

INSERT INTO teachers (tid, name)
	values ('t02', 'Adams');

INSERT INTO teachers (tid, name)
	values ('t03', 'Jefferson');

INSERT INTO teachers (tid, name)
	values ('t04', 'Lincoln');

--Subjects--

INSERT INTO subjects (subid, name)
	values ('s01', 'History');

INSERT INTO subjects (subid, name)
	values ('s02', 'Biology');

INSERT INTO subjects (subid, name)
	values ('s03', 'SF');

--Grades--

INSERT INTO grades (sid, tid, subid, grade)
	values ('s001', 't02', 's01', 'A');

INSERT INTO grades (sid, tid, subid, grade)
	values ('s001', 't02', 's02', 'B');

INSERT INTO grades (sid, tid, subid, grade)
	values ('s007', 't04', 's03', 'C++');

INSERT INTO grades (sid, tid, subid, grade)
	values ('s007', 't03', 's02', 'F');

INSERT INTO grades (sid, tid, subid, grade)
	values ('s006', 't02', 's01', 'B+');

INSERT INTO grades (sid, tid, subid, grade)
	values ('s002', 't04', 's03', 'C');

INSERT INTO grades (sid, tid, subid, grade)
	values ('s003', 't04', 's03', 'B');

