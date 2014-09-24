# Join Operators

# Natural Join
select	distinct sname, major
from	student, apply
where	student.sid = apply.sid;

# Inner join or Theta join
select 	distinct sname, major
from 	student INNER JOIN apply
ON 		student.sid = apply.sid;

select 	sname, cname
from	student RIGHT OUTER JOIN apply
ON 		student.sid = apply.sid;

select	sname, GPA
from	student JOIN apply
on		student.sid = apply.sid and
		sizeHS < 1000 AND
		major = 'CS' AND
		cname = 'Standford';

# INNER JOIN
select	distinct sname, major
from	student INNER JOIN apply
on		student.sid = apply.sid;

# This is equivalent to following Natural Join# 
select	distinct sname, major
from	student natural JOIN apply;

select	sname, gpa
from	student NATURAL JOIN apply
where	sizehs < 1000 and major = 'CS' and
		cname = 'Stanford';

# USING clause
select	sname, gpa
from	student JOIN apply USING (SID)
where	sizehs < 1000 and major = 'CS' and
		cname = 'Stanford';

# JOIN operator when you have more than one of same tables
select	s1.sid, s1.sname, s1.gpa, s2.sid, s2.sname, s2.gpa
from 	student s1, student s2
where	s1.gpa = s2.gpa and
		s1.sid < s2.sid;

select	s1.sid, s1.sname, s1.gpa, s2.sid, s2.sname, s2.gpa
from 	student s1 JOIN student s2 using(GPA)
where	s1.sid < s2.sid;

# Self Join
select 	*
from 	student s1 natural JOIN student s2;

# Outer Join
select 	sname, sid, cname, major
from	student left  join apply using(sid);

select 	sname, sid, cname, major
from	student natural left  join apply;

# How to write a outer join using simple SQL
select 	sname, student.sid, cname, major
from	student, apply
where	student.sid = apply.sid
UNION
select	sname, sid, NULL, NULL
from	student
where	sid NOT IN (select sid from apply);

# 
select	sname, sid, cname, major
from	apply  natural left outer join student;

select sname, sid, cname, major
from	student natural RIGHT OUTER JOIN apply;

# Full outer join
select 	sname, sid, cname, major
from	student natural outer JOIN apply using (sid);
