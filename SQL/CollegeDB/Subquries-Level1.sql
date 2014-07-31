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

select 	gpa
from	student, apply
where 	student.sid = apply.sid and
		apply.major = 'CS';

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
				where	c2.state = c1.state);

select	cname, state
from	college c1
where	exists (select	*
				from	college c2
				where	c2.state = c1.state AND
						c2.cname <> c1.cname);

# Problem: Find college that has largest enrollment

select 	cname
from	college c1
where	not exists (select	*
					from	college c2
					where	c2.enrollment > c1.enrollment);
