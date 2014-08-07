# Problem 1:
# IN operator
# Find students who have applied to 'CS'

# Which of these two queries give correct data

select 	student.sid, sname
from	student, apply
where 	student.sid = apply.sid and
		apply.major = 'CS';

Select 	sID, sName
from 	Student
where 	sid in
	(select sid
	 from 	apply
	 where	major = 'CS');

# which of the two below queries give you correct data

Select 	GPA
from 	Student
where 	sid in
	(select sid
	 from 	apply
	 where	major = 'CS');

# --------------
# Problem 2:
# NOT IN operator
# Find the students who have applied to 'CS' but not to 'EE'

select 	sid, sname
from	student
where	sid in (select sid 
				from	apply
				where	major = 'CS') AND
		sid not in (select	sid
					from	apply
					where 	major = 'EE');

# -----------------------
# EXISTS Operator
# Correlated Subqueries
# Find all colleges such that some other college is in the same state

select	cname, state  
from	college c1
where	exists (select	*
				from	college c2
				where	c2.state = c1.state );

select	cname, state
from	college c1
where	exists (select	*
				from	college c2
				where	c2.state = c1.state AND
						c2.cname <> c1.cname);

# Problem: Find college that has largest enrollment

select 	cname
from	college c1
where	NOT EXISTS (select	*
					from	college c2
					where	c1.enrollment < c2.enrollment );

select 	sname, gpa
from	student c1
where	NOT EXISTS (select	*
					from	student c2
					where	c2.gpa > c1.gpa);

# what is wrong with this Query
select s1.sname, s1.gpa
from	student 
s1, student s2
where 	s1.gpa > s2.gpa;

# ALL Operator
select 	sname, gpa
from	student
where	gpa >= ALL (select	gpa
					from	student); 

select 	sname
from	student s1
where	gpa > all (select 	gpa
					from	student s2
					where 	s2.sid <> s1.sid);
# works only if students have unique gpa.

# --------
# College with highest enrollment
select	cname
from 	college s1
where	enrollment > all (select	enrollment
							from	college s2
							where	s2.cname <> s1.cname);

# Operator ANY
select	cname
from 	college s1
where	NOT enrollment <= ANY (select	enrollment
							from	college s2
							where	s2.cname <> s1.cname);
# this one works

# ANY operator
select	sid, sname, sizehs
from	student
where 	sizehs > any (select sizehs 
						from student);
# students not from the smallest high school

# same as above query without using ANY operator
select	sid, sname, sizehs
from	student s1
where	exists (select * 
				from 	student s2
				where s2.sizehs < s1.sizehs);

# students who applied to CS but not to EE
select 	student.sid, student.sname
from	student, apply
where	student.sid = any (select sid from apply where major = 'CS' and
		student.sid <> any (select sid from apply where major = 'EE');
# what is wrong here?

select 	sid, sname
from	student
where	sid = any (select sid from apply where major = 'CS' and
		NOT sid = any (select sid from apply where major = 'EE');
# correct query