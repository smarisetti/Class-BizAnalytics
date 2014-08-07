# Min, Max, Sum, Avg, Count
# Group By <column>
# Having <condition> - applies to the group

select *
from	student;

select 	avg(gpa)
from	student;

select avg(gpa)
from 	student, apply
where	student.sid = apply.sid and
		major = 'CS';

# if student has applied more than one college, their
# GPA is counted twice. We need to count it only once

# correct query
select	avg(gpa)
from 	student
where	sid IN (select sid
			 from 	apply
			 where major = 'CS');

select	*
from 	student
where	sid IN (select sid
			 from 	apply
			 where major = 'CS');

# COUNT operator

select 	count(*)
from	apply
where 	cname = 'Cornell';
# if student applied to cornell three times, there is a problem

select count(distinct sid)
from	apply
where 	cname = 'Cornell';
# correct output

# Students such that number of other students with same GPA
# is equal to number of other students with same sizehs

select	*
from	student s1
where	(select count(*) from student s2
		 where s2.sid <> s1.sid and s2.gpa = s1.gpa)
		 =
		(select count(*) from student s2
		 where s2.sid <> s1.sid and s2.sizehs = s1.sizehs);

# Amount by which average GPA of stuents applying to CS
# Exceeds average of students not applying to CS

select distinct (select avg(GPA) as avgGPA from student
		where sid in (
			select sid from apply where major = 'CS') ) 
		-
		(select avg(GPA) as avgGPA from student
		 where sid NOT IN (
			select sid from apply where major = 'CS') ) AS D
from 	student;

# Group by

# number of applications per college:
select *
from apply
order by cname;

select	cname, count(*)
from 	apply
group by cname;

# College enrollments by state
select	state, sum(enrollment)
from	college
group by state;

select 	cname, major, gpa
from	student, apply
where	student.sid = apply.sid
order by cname, major;

select cname, major, min(GPA), Max(GPA), max(gpa)-min(gpa) as spread
from	student, apply
where	student.sid = apply.sid
group by cname, major;

#Min and max GPAs of applicatns to each college and major

select max(mx-mn)
from (select cname, major, min(GPA) mn, Max(GPA) mx
	 from	student, apply
	 where	student.sid = apply.sid
group by cname, major) M;

# Number of colleges applied to by each student
select	student.sid, sname, count(distinct cname)
from	student, apply
where	student.sid = apply.sid
group by 	student.sid;

select	student.sid, sname, count(distinct cname), cname
from	student, apply
where	student.sid = apply.sid
group by student.sid;	
# It should not work but it does.

select	student.sid, sname, cname
from	student, apply
where	student.sid = apply.sid
order by 	student.sid;

select	student.sid, count(distinct cname)
from 	student, apply
where	student.sid = apply.sid
group by student.sid;

select	student.sid, count(distinct cname)
from	student, apply
where	student.sid = apply.sid
group by student.sid
UNION
select 	sid, 0
from 	student
where 	sid not in (select sid from apply);
# check those students who have not applied at the end of the list.

select	cname
from	apply
group by cname
having 	count(*) < 5;

select	cname
from	apply
group by cname
having 	count(distinct sid) < 5;

select 	major
from	student, apply
where 	student.sid = apply.sid
group by major
having max(gpa) < (select avg(gpa) from student);

