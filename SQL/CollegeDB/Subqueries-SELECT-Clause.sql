# Colleges paired with the highest GPA of their applicatns.

SELECT 	college.cname, state, GPA
from 	college, Apply, Student
where	college.cname = apply.cname
	and	apply.sid = student.sid
	and GPA >= all
			(select GPA
			 from	student, apply
			 where	student.sid = apply.sid and
					apply.cname = college.cname);

# Rewrite the query using a subquery in SELECT clause

SELECT	cname, state, 
	(SELECT distinct GPA
	from 	Apply, Student
	where	college.cname = apply.cname
		and	apply.sid = student.sid
		and GPA >= all
				(select GPA
				from	student, apply
				where	student.sid = apply.sid and
						apply.cname = college.cname))
FROM College;

# Now list the same result with student name

SELECT	cname, state, 
	(SELECT distinct sname
	from 	Apply, Student
	where	college.cname = apply.cname
		and	apply.sid = student.sid) as sname
FROM College;

# Explain what the error is